
1. docker run & localhost:5050 setting

`docker run -d -p 5050:8080 --name jenkinsdocker -u 0 -v //var/run/docker.sock:/var/run/docker.sock  jenkinsci/blueocean`

```text
docker 기반으로 자동으로 이미지를 다운받고 컨테이너를 생성

-d : 백그라운드 run

-p 8080:8080 : 왼쪽(host port), 오른쪽(컨테이너안에서 설정한 port) Port 포워딩

--name : 컨테이너 이름

-u 0 : root라는 권한를 부여

-v //var/run/docker.sock:/var/run/docker.sock : 컨테이너 안에서 docker 명령어를 쓰기 위한 sock 연결
```

2. read docker container & docker exec

`docker ps -> docker exec -it 컨테이너아이디 /bin/bash`


3. confirm password

`cat /var/jenkins_home/secrets/initialAdminPassword`