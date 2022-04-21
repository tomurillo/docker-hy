# Base image changed to alpine for smaller size
FROM node:16-alpine

# Build frontend image, as in exercise 3.03
WORKDIR /usr/src/app
RUN npm install -g serve
COPY package* ./
RUN npm install
COPY . .
ENV REACT_APP_BACKEND_URL=http://localhost/api

# Modified RUN commands (alpine) and grouped together
RUN npm run build && \
    addgroup --gid 1001 frontend && \
    adduser -D -G frontend --uid 1001 frontend && \
    chown -R frontend:frontend .

USER frontend

ENTRYPOINT serve -s -l 5000 build