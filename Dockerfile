# Selenium + Firefox + python + display virtual + autossh + python-crontab + nginx

FROM alpine:3.7
MAINTAINER lulu "marlluslustosa@gmail.com"

# install alpine
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.7/main" >> /etc/apk/repositories && \
	echo "http://dl-4.alpinelinux.org/alpine/v3.7/community" >> /etc/apk/repositories

RUN apk update && \
	apk add python py-pip curl unzip dbus-x11 ttf-freefont xvfb && \
	apk add firefox=58.0.1-r2 && \
	pip install selenium && \
	pip install pyvirtualdisplay && \
	pip install python-crontab && \
	pip install autossh && \
	pip install nginx

#geckodriver
# https://github.com/mozilla/geckodriver/releases/
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.19.1/geckodriver-v0.19.1-linux64.tar.gz && \
	tar -zxvf geckodriver-v0.19.1-linux64.tar.gz

COPY ./geckodriver /usr/local/bin/
RUN chmod a+x /usr/local/bin/geckodriver

