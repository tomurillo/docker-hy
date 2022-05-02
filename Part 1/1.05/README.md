```bash
(base) tomas@tomas-ubuntu:~$ docker pull devopsdockeruh/simple-web-service:alpine
alpine: Pulling from devopsdockeruh/simple-web-service
[...]

(base) tomas@tomas-ubuntu:~$ docker image ls
REPOSITORY                          TAG       IMAGE ID       CREATED         SIZE
ubuntu                              latest    2b4cba85892a   10 days ago     72.8MB
devopsdockeruh/simple-web-service   ubuntu    4e3362e907d5   12 months ago   83MB
devopsdockeruh/simple-web-service   alpine    fd312adc88e0   12 months ago   15.7MB

(base) tomas@tomas-ubuntu:~$ docker run -d -it fd
5bed4def51597f6797a6e82e37d585f460e345a2fa286918ea279ce8c870c9dc

(base) tomas@tomas-ubuntu:~$ docker exec -it 5b sh
/usr/src/app # tail -f ./text.log 
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
2022-03-14 13:42:49 +0000 UTC
2022-03-14 13:42:51 +0000 UTC
2022-03-14 13:42:53 +0000 UTC
2022-03-14 13:42:55 +0000 UTC
2022-03-14 13:42:57 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
^C
/usr/src/app # exit
```
