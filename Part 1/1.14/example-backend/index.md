```bash
(base) tomas@tomas-ubuntu:~$ docker build . -t example-backend && docker run -p 8080:8080 example-backend
[...]
[GIN] 2022/03/18 - 16:24:52 | 200 |    5.681905ms |      172.17.0.1 | GET      "/ping"
```