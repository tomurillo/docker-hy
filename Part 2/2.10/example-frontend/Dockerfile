FROM node:16

# Do not expose port anymore
# EXPOSE 5000

WORKDIR /usr/src/app

RUN npm install -g serve

COPY package* ./

RUN npm install

COPY . .

# Backend URL now is /api, nginx redirects to backend container
ENV REACT_APP_BACKEND_URL=http://localhost/api

RUN npm run build

CMD ["serve", "-s", "-l", "5000", "build"]
