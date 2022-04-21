##Images Size Comparison

Before:

```bash
(base) tomas@tomas-ubuntu:~$ docker container ls -as
...
8e15957126f2 304_backend  "/bin/sh -c ./server"  [...] ex-3.04-backend    0B (virtual 1.08GB)
...
92ec7c74b82d 304_frontend "/bin/sh -c 'serve -…" [...] ex-3.04-frontend   46B (virtual 1.4GB)
...
```

After optimizations (see Dockerfiles):

```bash
(base) tomas@tomas-ubuntu:~$ docker container ls -as
...
92092742b999 304_backend  "/bin/sh -c ./server"  [...] ex-3.04-backend    0B (virtual 256MB)
...
a2e5570d87cd 304_frontend "/bin/sh -c 'serve -…" [...] ex-3.04-frontend   46B (virtual 497MB)
...
```

The new images have been reduced in size by 64.5% (frontend) and 76.3% (backend).