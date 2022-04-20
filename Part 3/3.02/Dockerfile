# Run using:
# docker run -v /var/run/docker.sock:/var/run/docker.sock

FROM ubuntu:18.04

WORKDIR /usr/src/app

COPY . .

RUN apt update
RUN apt install -y git

RUN apt install -y docker.io

ENV username=tomurillo
ENV repo=https://github.com/docker-hy/docker-hy.github.io.git
ENV image_name=docker-hy-course

RUN chmod +x build-and-publish.sh

ENTRYPOINT /usr/src/app/build-and-publish.sh; /bin/bash
