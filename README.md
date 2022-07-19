# 4주차 과제 / Amazon EC2를 이용하여, Free-Tier 서버를 생성합니다.

## AWS와 nginx을 이용한 서버 배포

<br />

### :bookmark: 목차

<br />

#### :family: 세상에 e런팀e\_팀원

| 이름   | Github                                            | email               | blog                                                                                   |
| ------ | ------------------------------------------------- | ------------------- | -------------------------------------------------------------------------------------- |
| 염하늘 | [everchloe97](https://github.com/everchloe97)     | star57009@khu.ac.kr | https://velog.io/@everchloe97                                                          |
| 김용민 | [ymink716](https://github.com/ymink716)           | ymink716@gmail.com  | https://velog.io/@calm0_0                                                              |
| 김태영 | [leokim1178](https://github.com/leokim1178)       | leo950906@gmail.com | https://story0tae.tistory.com/                                                         |
| 박신영 | [ParkShinyeong](https://github.com/ParkShinyeong) | syngh503@gmail.com  | [신영의 notion](https://sudsy-action-667.notion.site/5ed77b24085f42b8bd1c9e5c0b37d25d) |
| 김지유 | [kgeeeu](https://github.com/scvgood287)           | kgeeeu@gmail.com    | https://velog.io/@kgeeeu                                                               |

<br />

#### :full_moon: 프로젝트 실행 및 테스트

**1. 실행 방법** 💡

```
cd 03-BossRaid-E /
docker compose build
docker compose up
```

**2. 테스트 방법** 💡

```
 - localhost/api/docs
 - http://3.39.69.233/api/hello 배포 서버 링크
```

**3. Swagger 테스트 방법** 💡

```
  - localhost/api/docs 접속 - local
  - http://3.39.69.233/api/docs 접속 - 배포 서버 링크 ( 스웨거 )
```

#### 배포 과정

```
- EC2 micro 사용
- docker container로 hello-api 와 nginx 프록시 서버를 분리하여 사용
- elastic IP를 이용해 EC2 인스턴스에 관한 IP 주소를 3.39.69.233로 고정
```
