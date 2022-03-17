FROM ubuntu:20.04

WORKDIR /usr/src/app

RUN apt update -y
RUN apt upgrade -y
RUN apt install curl -y

COPY myscript.sh .
RUN chmod +x myscript.sh

CMD ./myscript.sh