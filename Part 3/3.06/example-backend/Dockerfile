FROM golang:1.16-alpine AS build-stage

# Add user here, commands will not be available in scratch image
RUN addgroup --gid 1001 backend && \
    adduser -D -G backend --uid 1001 backend

WORKDIR /usr/src/app

# Install requirements for build
RUN apk update && apk add make g++ && rm -rf /var/cache/apk/*

# Copy everything and build project statically
COPY . .
RUN CGO_ENABLED=0 go install -ldflags '-extldflags "-static"' -tags timetzdata

# Use scratch base image for greatest size reduction
FROM scratch

WORKDIR /usr/src/app

ENV GIN_MODE=release

# Copy non-root user and group from build stage
COPY --from=build-stage /etc/passwd /etc/passwd
COPY --from=build-stage /etc/group /etc/group

# Copy necessary project files from build-stage image with non-root as owner
COPY --from=build-stage --chown=backend:backend /go/bin/server /server

# Switch to non-root user
USER backend

ENTRYPOINT ["/server"]
