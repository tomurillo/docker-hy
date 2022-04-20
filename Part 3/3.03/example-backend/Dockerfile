FROM golang:1.16

# Build backend image, as before
COPY . /usr/src/app
WORKDIR /usr/src/app
ENV GIN_MODE=release
RUN go build

# Switch to non-root
RUN groupadd --gid 1001 backend && \
    useradd --create-home --gid 1001 --uid 1001 backend
RUN chown -R backend:backend .  # Recursively change owner to non-root user
USER backend

ENTRYPOINT ./server
