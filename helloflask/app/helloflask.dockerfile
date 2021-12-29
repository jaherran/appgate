FROM alpine:3.15.0
LABEL maintainer="jorgeherran@yahoo.com"
RUN apk add py3-pip build-base python3-dev libffi-dev openssl-dev
RUN mkdir -p /app/src
WORKDIR /app/src
COPY src/requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY src/app.py .
COPY ./docker-entrypoint.sh /bin/docker-entrypoint
RUN chmod u+x /bin/docker-entrypoint

EXPOSE 5000
#ENV FLASK_APP="src.app:flask_app()"
CMD [ "/bin/docker-entrypoint" ]