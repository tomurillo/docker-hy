FROM node:16-alpine AS build-stage

WORKDIR /usr/src/app

COPY package* ./
RUN npm install
COPY . .

# Build project, prune development modules, install node-prune, prune unnecessary files from ./node_modules
RUN npm run build && \
    npm prune --production && \
    apk update && apk add curl bash && \
    curl -sfL https://install.goreleaser.com/github.com/tj/node-prune.sh | bash -s -- -b /usr/local/bin && \
    /usr/local/bin/node-prune


FROM node:16-alpine

WORKDIR /usr/src/app

# Copy project files
COPY public /usr/src/app/public
COPY src /usr/src/app/src

# Copy built node files
COPY --from=build-stage /usr/src/app/build ./build
COPY --from=build-stage /usr/src/app/node_modules ./node_modules

ENV REACT_APP_BACKEND_URL=http://localhost/api

# Install serve package globally, create non-root user
RUN npm install -g serve && \
    addgroup --gid 1001 frontend && \
    adduser -D -G frontend --uid 1001 frontend && \
    chown -R frontend:frontend .

USER frontend

CMD ["serve", "-s", "-l", "5000", "build"]