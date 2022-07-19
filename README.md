## AWS와 nginx을 이용한 서버 배포 🚀

<br />

### :bookmark: 목차

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
 - http://3.39.69.233/api/hello - 배포 서버 링크
```

**3. Swagger 테스트 방법** 💡

```
  - localhost/api/docs 접속 - local
  - http://3.39.69.233/api/docs 접속 - 배포 서버 링크 ( 스웨거 )
```

#### 배포 과정

```
- EC2 micro 사용
- docker container로 hello-service와 nginx 프록시 서버를 분리하여 사용
- elastic IP를 이용해 EC2 인스턴스에 관한 IP 주소를 3.39.69.233로 고정
```
