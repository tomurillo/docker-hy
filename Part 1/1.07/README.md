```bash
(base) tomas@tomas-ubuntu:~$ docker build . -t web-server
Sending build context to Docker daemon   2.56kB
Step 1/2 : FROM devopsdockeruh/simple-web-service:alpine
 ---> fd312adc88e0
Step 2/2 : CMD server
 ---> Running in 65fcb561bafc
Removing intermediate container 65fcb561bafc
 ---> 3657e838c8d8
Successfully built 3657e838c8d8
Successfully tagged web-server:latest

(base) tomas@tomas-ubuntu:~$ docker run web-server
[GIN-debug] [WARNING] Creating an Engine instance with the Logger and Recovery middleware already attached.

[GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
 - using env:   export GIN_MODE=release
 - using code:  gin.SetMode(gin.ReleaseMode)

[GIN-debug] GET    /*path                    --> server.Start.func1 (3 handlers)
[GIN-debug] Listening and serving HTTP on :8080
```