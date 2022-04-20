FROM node:16

# Build frontend image, as before
WORKDIR /usr/src/app
RUN npm install -g serve
COPY package* ./
RUN npm install
COPY . .
ENV REACT_APP_BACKEND_URL=http://localhost/api
RUN npm run build

# Switch to non-root
RUN groupadd --gid 1001 frontend && \
    useradd --create-home --gid 1001 --uid 1001 frontend
RUN chown -R frontend:frontend .  # Recursively change owner to non-root user
USER frontend

ENTRYPOINT serve -s -l 5000 build