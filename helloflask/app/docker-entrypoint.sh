#!/bin/sh
echo "Starting gunicorn..."
# The parameters are pretty much self-explanatory: We are telling Gunicorn to spawn 2 worker processes, running 2 threads each. We are also accepting connections from outside, and overriding Gunicorn's default port (8000).

gunicorn --preload -w 2 --threads 2 -b 0.0.0.0:5000 "app:flask_app(testing=False)" 