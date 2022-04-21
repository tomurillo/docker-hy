# Base image has been changed to ubuntu due to smaller size
FROM ubuntu:18.04

WORKDIR /usr/src/app
COPY . .
ENV REACT_APP_BACKEND_URL=http://localhost/api

# Combine all RUNs together to reduce image size
RUN apt update && apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_14.x -o /tmp/nodesource_setup.sh && \
    bash /tmp/nodesource_setup.sh && \
    apt install -y nodejs && \
    npm install -g serve && \
    npm install && npm run build && \
    apt-get purge -y --auto-remove curl python && \
    npm prune --production && \
    rm -rf /var/cache/apk/* && \
    groupadd --gid 1001 frontend && \
    useradd --create-home --gid 1001 --uid 1001 frontend && \
    chown -R frontend:frontend .

# Change to non-root user
USER frontend

ENTRYPOINT serve -s -l 5000 build