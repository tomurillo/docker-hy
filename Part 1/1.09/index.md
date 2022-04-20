```bash
(base) tomas@tomas-ubuntu:~$ touch text.log
(base) tomas@tomas-ubuntu:~$ docker run -v "$(pwd.txt)/text.log:/usr/src/app/text.log" devopsdockeruh/simple-web-service:alpine
Starting log output
Wrote text to /usr/src/app/text.log
Wrote text to /usr/src/app/text.log
[...]
```