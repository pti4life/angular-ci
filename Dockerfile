FROM node:14.18.0-alpine3.14 as builder
WORKDIR '/app'
RUN npm install -g npm@7.24.1
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/dist/frontend /usr/share/nginx/html