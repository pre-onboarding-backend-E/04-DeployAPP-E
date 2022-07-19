## 🚀 AWS와 nginx을 이용한 서버 배포

<br />

### 🔖 목차

- [🚀 AWS와 nginx을 이용한 서버 배포](#-aws와-nginx을-이용한-서버-배포)
  - [🔖 목차](#-목차)
    - [🌕 프로젝트 실행 및 테스트](#-프로젝트-실행-및-테스트)
    - [🧐 배포 과정](#-배포-과정)
    - [💿 기술스택](#-기술스택)

<br />

#### 🌕 프로젝트 실행 및 테스트

**1. 실행 방법** 💡

```
cd 03-BossRaid-E /
docker compose build
docker compose up
```

**2. 테스트 방법** 💡

- local
  - http://localhost/api/docs
- deployed server
  - http://3.39.69.233/api/hello - 배포 서버 링크

**3. Swagger 테스트 방법** 💡

- local
  - http://localhost/api/docs 접속
- deployed server
  - http://3.39.69.233/api/docs 접속 - 배포 서버 링크 ( 스웨거 )

#### 🧐 배포 과정

---

```
- EC2 micro 사용
- docker container로 hello-service와 nginx 프록시 서버를 분리하여 사용
- elastic IP를 이용해 EC2 인스턴스에 관한 IP 주소를 3.39.69.233로 고정
```

#### 💿 기술스택

---

<br>
<div align='center'> 🖥&nbsp&nbsp&nbsp사용한 기술 스택</div>
<br>
<p align="center">
📑&nbsp&nbsp&nbsp구성 언어
  </p>
<p align="center">
<img alt= "icon" wide="80" height="80" src ="https://techstack-generator.vercel.app/ts-icon.svg">
  </p>
 <p align="center">
🏠&nbsp&nbsp&nbsp 배포
  </p>
<p align="center">
<img alt= "icon" wide="65" height="65" src ="https://techstack-generator.vercel.app/aws-icon.svg">
  </p>
<p align="center">
🏖&nbsp&nbsp&nbsp 서버
  </p>
<p align="center">
<img alt= "icon" wide="65" height="65" src ="https://techstack-generator.vercel.app/nginx-icon.svg">
&nbsp&nbsp
<img alt= "icon" wide="60" height="60" src ="https://symbols.getvecta.com/stencil_89/37_nestjs-icon.a67daec196.svg">
&nbsp&nbsp
<img alt= "icon" wide="65" height="65" src ="https://techstack-generator.vercel.app/restapi-icon.svg">
&nbsp&nbsp
<img alt= "icon" wide="65" height="65" src ="https://techstack-generator.vercel.app/docker-icon.svg">
&nbsp&nbsp
<img alt= "icon" wide="60" height="60" src ="https://upload.wikimedia.org/wikipedia/commons/a/ab/Swagger-logo.png">
</p>

---
