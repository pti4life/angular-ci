FROM node:alpine as builder
WORKDIR '/app'
RUN npm install -g npm@7.24.1
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/dist/frontend /usr/share/nginx/html