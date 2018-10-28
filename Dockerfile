FROM node:alpine as builder

WORKDIR '/home/app/webapp'
COPY package.json .
COPY . .
RUN npm install
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html