Secret message: `You can find the source code here: https://github.com/docker-hy`.

Commands:

```bash
(base) tomas@tomas-ubuntu:~$ docker run -d -it devopsdockeruh/simple-web-service:ubuntu
[...]

(base) tomas@tomas-ubuntu:~$ docker ps
CONTAINER ID   IMAGE                                      COMMAND                 CREATED          STATUS          PORTS     NAMES
bb1a22c91b06   devopsdockeruh/simple-web-service:ubuntu   "/usr/src/app/server"   34 seconds ago   Up 32 seconds             strange_morse

(base) tomas@tomas-ubuntu:~$ docker exec -it bb bash
root@bb1a22c91b06:/usr/src/app# tail -f ./text.log 
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
2022-03-14 12:37:48 +0000 UTC
2022-03-14 12:37:50 +0000 UTC
2022-03-14 12:37:52 +0000 UTC
2022-03-14 12:37:54 +0000 UTC
2022-03-14 12:37:56 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
^C
root@bb1a22c91b06:/usr/src/app# exit
exit
```