```bash
(base) tomas@tomas-ubuntu:~$ docker build . -t docker-build
...
Successfully built f285999ae0ff
Successfully tagged docker-build:latest

(base) tomas@tomas-ubuntu:~$ docker run -v /var/run/docker.sock:/var/run/docker.sock docker-build
...
df6ef459672e: Pushed
latest: digest: sha256:7e4760c39f4abf973a9fd5b2d2c1dcc3bb902917acdffeffa04d3447e4636b02 size: 1580
```