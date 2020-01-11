FROM python:3.7-alpine
MAINTAINER atif-adib

# Pythonbuffered dumps logs to a stream instead of buffering which is slow
ENV PYTHONBUFFERED 1

COPY ./requirements.txt /requirements.txt

RUN python3 -m pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Creating a new user and not using root to run the service
# for security reasons. Limiting scopes of attack.
RUN adduser -D user
USER user

