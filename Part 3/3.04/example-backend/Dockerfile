# Base image has been changed to ubuntu due to smaller size
FROM ubuntu:18.04

# Copy codebase
COPY . /usr/src/app
WORKDIR /usr/src/app

# Set environment variable
ENV GIN_MODE=release

# Combine all RUNs together to reduce image size
RUN apt-get update && apt-get install -y curl && \
    curl -OL https://golang.org/dl/go1.16.7.linux-amd64.tar.gz && \
    tar -C /usr/local -xf go1.16.7.linux-amd64.tar.gz && \
    rm -f go1.16.7.linux-amd64.tar.gz && \
    export PATH=$PATH:/usr/local/go/bin && \
    go build && \
    apt-get purge -y --auto-remove curl && \
    rm -rf /usr/local/go && \
    groupadd --gid 1001 backend && \
    useradd --create-home --gid 1001 --uid 1001 backend && \
    chown -R backend:backend .

# Change to non-root user
USER backend

ENTRYPOINT ./server
