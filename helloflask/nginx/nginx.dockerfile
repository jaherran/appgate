FROM nginx:1.20.2-alpine
LABEL maintainer="jorgeherran@yahoo.com"
COPY nginx.conf /etc/nginx/conf.d/
COPY /html/* /usr/share/nginx/html/