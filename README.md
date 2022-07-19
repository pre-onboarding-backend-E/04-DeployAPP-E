## 4주차-Amazon EC2로 Freetier 서버 생성하기

<br />

### :bookmark: 목차

- [4주차-Amazon EC2 서버 배포 💫](#4주차-amazon-ec2로-freetier-서버-생성하기)
  - [:family: 팀원](#family세상에-e런팀e팀원)
  - [:sunny: ​프로젝트 개요](#sunny-프로젝트-개요)
  - [:star2: 배포 주소](#배포-주소)
  - [:key: 구현 방법](#key-구현-방법)
  - [:cd: 기술 스택](#cd-기술-스택)

<br />

#### :family:세상에 e런팀e\_팀원

| 이름   | Github                                            | email               | blog                                                                                   |
| ------ | ------------------------------------------------- | ------------------- | -------------------------------------------------------------------------------------- |
| 염하늘 | [everchloe97](https://github.com/everchloe97)     | star57009@khu.ac.kr | https://velog.io/@everchloe97                                                          |
| 김용민 | [ymink716](https://github.com/ymink716)           | ymink716@gmail.com  | https://velog.io/@calm0_0                                                              |
| 김태영 | [leokim1178](https://github.com/leokim1178)       | leo950906@gmail.com | https://story0tae.tistory.com/                                                         |
| 박신영 | [ParkShinyeong](https://github.com/ParkShinyeong) | syngh503@gmail.com  | [신영의 notion](https://sudsy-action-667.notion.site/5ed77b24085f42b8bd1c9e5c0b37d25d) |
| 김지유 | [kgeeeu](https://github.com/scvgood287)           | kgeeeu@gmail.com    | https://velog.io/@kgeeeu                                                               |

<br />

#### :sunny: 프로젝트 개요

- AWS EC2를 이용하여 Free-Tier 서버를 생성합니다. 웹 애플리케이션 서버는 NginX를 사용하며 80번 포트로 오픈합니다.
- Elastic IP를 통해 변동적인 EC2 퍼블릭 IPv4 주소를 고정합니다
- IP/api/hello로 접속 시 웹브라우저 상에서 Hello를 표시해야 합니다.
  <br />

---

### :star2: 배포 주소

- [http://52.78.174.19/api/hello](http://52.78.174.19/api/hello)

---

#### :key: 구현 방법

**01 프로젝트 생성\***
프로젝트는 `Nest JS`로 생성했습니다.
IP/api/hello 경로로 이동했을 "Hello"를 받을 수 있도록 수정해주었습니다.
<br />

**02 Docker 파일 생성**
Docker compose 사용을 위해 `Docker file`, `docker-compose.yaml`, `.dockerignore`을 작성해주었습니다.
Nginx를 Docker로 띄우기 위해 [docker-compose.yaml](./docker-compose.yaml)에 다음과 같이 코드를 추가하였습니다.

```yaml
proxy:
  image: nginx:latest # nginx 최신 이미지를 사용합니다.
  container_name: proxy # container 이름은 proxy입니다.
  ports:
    - '80:80' # 80번 포트를 host와 container 맵핑
  volumes:
    - ./proxy/nginx.conf:/etc/nginx/nginx.conf # proxy 폴더의 nginx 설정 파일을 volume 맵핑
  restart: 'unless-stopped' # 내부 에러로 container이 죽을 경우 restart 합니다.
```

  <br />

**[03 NginX.conf](./proxy/nginx.conf)**
NginX를 통해 서버의 앞단에서 reverse proxy 역할을 합니다.

```js
upstream docker-backend-server {
  server backend-server:3000;
}
```

`docker-backend-server`라는 이름의 upstream을 정의합니다.
server는 docker-compose.yml에서 정의한 `backend-server`로 명시하였습니다.

```js
location / {
	proxy_http_version 1.1;
  proxy_pass         http://docker-backend-server;
}
```

Client가 Nginx에 / 경로로 들어올 경우 위에서 정의한 `docker-backend-server` upstream으로 포워딩합니다.

  <br />

**04 EC2 인스턴스 생성**
[AWS 콘솔 홈](https://ap-northeast-2.console.aws.amazon.com/console/home?region=ap-northeast-2)에 접속하여, EC2 서비스로 들어갑니다.

- 인스턴스 시작을 누른 뒤, `Ubuntu Server`로 인스턴스를 생성합니다.
- ssh 클라이언트와 key.pem을 통해 인스턴스에 연결합니다.
- 인스턴스 서버에 node.js 등 필요한 의존성을 설치한 뒤, git으로 소스 파일을 clone 받습니다.
- 소스 파일의 docker-compose를 실행합니다. => `docker-compose up`
  (권한 문제로 에러가 발생하면 앞에 sudo를 붙여서 진행해주세요!)
- 인스턴스의 퍼블릭 IPv4 주소로 접속했을 때 서버가 잘 뜨는지 확인합니다.

  - 접속했는데 아무것도 뜨지 않으면, 인바운드 보안 규칙을 아래와 같이 설정해주세요! <br />
    ![인스턴스 인바운드 보안 규칙](https://media.discordapp.net/attachments/879215554379018243/998762888338616360/unknown.png)

- EC2 인스턴스를 통한 배포에 대한 더 자세한 설명은 다음 링크를 참조해주세요 => [(참고링크)](https://sudsy-action-667.notion.site/Day-54-AWS-EC2-S3-f188044031fa46789bdaae9d22d97819)
  <br />

**05 Elastic IP 생성**

- EC2 퍼블릭 주소는 변경될 수 있기 때문에 Elastic IP를 생성합니다.
  - Elastic IP 서비스는 `유료`입니다!
- EC2 서비스의 `네트워크 및 보안` => `탄력적 IP`를 선택합니다.
- 탄력적 IP 주소 할당을 누른 뒤 `Amazon의 IPv4 주소 풀`을 선택한 후 `할당`버튼을 누릅니다.
- 생성된 IP 주소를 선택한 뒤 `탄력적 IP 주소 연결`을 선택합니다.
- 연결할 `인스턴스`와 `프라이빗 IP 주소`를 선택하고, `연결`을 선택합니다. <br />
  ![](https://cdn.discordapp.com/attachments/879215554379018243/998766997494050906/unknown.png)
- 그 후 IP주소로 접속하여, 인스턴스와 연결되는지 확인합니다. => [http://52.78.174.19/api/hello](http://52.78.174.19/api/hello)
  <br />

---

#### :cd: 기술 스택

<img src="https://img.shields.io/badge/Typescript-3178C6?style=flat&logo=typescript&logoColor=white"/>
<img src="https://img.shields.io/badge/NestJS-E0234E?style=flat&logo=nestjs&logoColor=white"/>
<img src="https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white"/>
<img src="https://img.shields.io/badge/NodeJS-339933?style=flat&logo=nodejs&logoColor=white"/>
<img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white"/>
<img src="https://img.shields.io/badge/NGINX-DC382D?style=flat&logo=NGINX&logoColor=white"/>
<img src="https://img.shields.io/badge/EC2-FF9900?style=flat-square&logo=AmazonAWS&logoColor=white"/>

<br><br/>
