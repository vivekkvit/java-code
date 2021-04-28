FROM node:8.11.2-alpine as build
RUN set -x \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
    udev \
    ttf-freefont \
    bash \
    python \
    make \
    g++ \
    vim
WORKDIR /webapp
COPY ./package.json .
RUN npm install
COPY . .
RUN rm .env -f

FROM nginx:alpine
COPY /webapp/ /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 8443
CMD ["nginx", "-g", "daemon off;"]
