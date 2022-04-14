FROM golang:1.16

# Do not expose port anymore
# EXPOSE 8080

COPY . /usr/src/app
WORKDIR /usr/src/app

ENV GIN_MODE=release

# Request origin now handled internally
# ENV REQUEST_ORIGIN=http://localhost:5000

RUN go build

CMD ["./server"]
