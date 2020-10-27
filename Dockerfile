FROM node:14.14.0-alpine3.12 AS builder
COPY ./frontend /app
WORKDIR /app
RUN npm ci && npm run build

FROM nginx:latest
COPY --from=builder /app/build/ /public
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d
CMD ["nginx", "-g", "daemon off;"]

