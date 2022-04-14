FROM golang:1.16

EXPOSE 8080

COPY . /usr/src/app
WORKDIR /usr/src/app

ENV GIN_MODE=release
ENV REQUEST_ORIGIN=http://localhost:5000

RUN go build

CMD ["./server"]
