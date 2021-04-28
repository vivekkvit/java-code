FROM nginx:alpine
WORKDIR /webapp
COPY /webapp/ /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./package.json .
COPY . .
EXPOSE 8443
CMD ["nginx", "-g", "daemon off;"]
