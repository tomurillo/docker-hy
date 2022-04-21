# Base image changed to alpine for smaller size
FROM golang:1.16-alpine

# Build backend image, as in exercise 3.03
COPY . /usr/src/app
WORKDIR /usr/src/app
ENV GIN_MODE=release

# Modified RUN commands (alpine) and grouped together
RUN go build && \
    addgroup --gid 1001 backend && \
    adduser -D -G backend --uid 1001 backend && \
    chown -R backend:backend .

USER backend

ENTRYPOINT ./server
