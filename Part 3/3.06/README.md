## Images Size Comparison

### Frontend

Images created in Part 3 of the course:

```bash
(base) tomas@tomas-ubuntu:~$ docker image ls | grep frontend
306_frontend  latest   f19a7aafdcb2   About an hour ago   412MB
305_frontend  latest   167ab911a646   24 hours ago        600MB
304_frontend  latest   e6839a5fb3c4   27 hours ago        497MB
303_frontend  latest   bc0583b39b98   29 hours ago        1.4GB
```

* The non optimized image (ex. 3.3) has a size of **1.4 GB**
* Using alpine as base image (ex. 3.5) resulted in an image of **600 MB** (**57%** smaller)
* Using ubuntu as base image (ex. 3.4) and an optimized Dockerfile we obtained an image of **497 MB** (**64.5%** smaller)
* In this exercise, using a multi-stage build and some further optimizations, the image weights **412 MB** (**70.6%** smaller)

### Backend

Images created in Part 3 of the course:

```bash
(base) tomas@tomas-ubuntu:~$ docker image ls | grep backend
306_backend  latest   0a93c7ca0cca   About an hour ago   18.5MB
305_backend  latest   3ac77a015ab7   24 hours ago        447MB
304_backend  latest   466d69cc69a2   27 hours ago        256MB
303_backend  latest   7cd8bdc2f9ab   29 hours ago        1.08GB
```
* The non optimized image (ex. 3.3) has a size of **1.08 GB**
* Using alpine as base image (ex. 3.5) resulted in an image of **447 MB** (**58.6%** smaller)
* Using ubuntu as base image (ex. 3.4) and an optimized Dockerfile we obtained an image of **256 MB** (**76.3%** smaller)
* In this exercise, using a multi-stage build with a scratch base, the image weights only **18.5 MB** (**98.3%** smaller)
