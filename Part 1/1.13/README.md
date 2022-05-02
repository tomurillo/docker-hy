```bash
(base) tomas@tomas-ubuntu:~$ docker build . -t example-backend && docker run -p 8080:8080 example-backend
[...]
[GIN] 2022/03/18 - 15:50:26 | 200 |       9.856µs |      172.17.0.1 | GET      "/ping"
```