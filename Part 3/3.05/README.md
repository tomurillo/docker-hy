## Images Size Comparison

Before:

```bash
(base) tomas@tomas-ubuntu:~$ docker container ls -as
...
5b0b68c38468 305_backend  "/bin/sh -c ./server"  [...] ex-3.05-backend    0B (virtual 1.08GB)
...
17ca97c712cf 305_frontend "/bin/sh -c 'serve -…" [...] ex-3.05-frontend   46B (virtual 1.4GB)
...
```

After changing base images to alpine versions (see Dockerfiles):

```bash
(base) tomas@tomas-ubuntu:~$ docker container ls -as
...
f83a6675c746 305_backend  "/bin/sh -c ./server"  [...] ex-3.05-backend    0B (virtual 447MB)
...
730f05a3e65c 305_frontend "/bin/sh -c 'serve -…" [...] ex-3.05-frontend   46B (virtual 600MB)
...
```

The alpine-based images have been reduced in size by 57.1% (frontend) and 58.6% (backend).
