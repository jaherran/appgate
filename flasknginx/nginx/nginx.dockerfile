FROM nginx:1.21.4
LABEL maintainer="jorgeherran@yahoo.com"
COPY ./nginx.conf /etc/nginx/conf.d/
COPY ./html/* /usr/share/nginx/html/