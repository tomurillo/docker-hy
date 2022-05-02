```bash
(base) tomas@tomas-ubuntu:~$ docker run -p 3436:8080 web-server
[GIN-debug] [WARNING] Creating an Engine instance with the Logger and Recovery middleware already attached.

[GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
 - using env:   export GIN_MODE=release
 - using code:  gin.SetMode(gin.ReleaseMode)

[GIN-debug] GET    /*path                    --> server.Start.func1 (3 handlers)
[GIN-debug] Listening and serving HTTP on :8080
[GIN] 2022/03/17 - 14:43:02 | 200 |      24.284µs |      172.17.0.1 | GET      "/"
```