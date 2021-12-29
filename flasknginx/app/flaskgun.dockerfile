FROM python:3.9-slim
LABEL maintainer="jorgeherran@yahoo.com"
RUN mkdir -p /app
WORKDIR /app
COPY src/* .
RUN pip3 install --no-cache-dir -r requirements.txt
EXPOSE 5000

ENTRYPOINT [ "gunicorn","--bind","0.0.0.0:5000","wsgi:app" ]