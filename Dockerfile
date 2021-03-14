FROM python:3.9-slim

ARG DEBIAN_FRONTEND="noninteractive"

RUN apt-get -y update \
    && apt-get install -y build-essential cmake \
    && pip install dlib
