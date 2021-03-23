FROM python:3.9-slim

ARG DEBIAN_FRONTEND="noninteractive"

ARG DLIB_VERSION="v19.21"

RUN apt-get -y update \
    && apt-get install -y build-essential cmake wget \
    && wget https://github.com/davisking/dlib/archive/refs/tags/${DLIB_VERSION}.tar.gz \
    && tar xvzf ${DLIB_VERSION}.tar.gz && mv dlib-* dlib && cd dlib \
    && python3 setup.py install --no USE_AVX_INSTRUCTIONS --no DLIB_USE_CUDA \
    && cd .. && rm -rf *.tar.gz dlib* \
    && apt-get autoclean
