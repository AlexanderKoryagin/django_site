FROM python:3

ARG http_proxy
ARG https_proxy

ENV PYTHONUNBUFFERED 1
ENV http_proxy ${http_proxy}
ENV https_proxy ${https_proxy}

RUN mkdir /site
WORKDIR /site

ADD *.txt /site/
RUN pip install -r requirements_web.txt
