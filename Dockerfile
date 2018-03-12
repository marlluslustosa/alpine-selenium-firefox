# Selenium + Firefox + python + display virtual + autossh + python-crontab + nginx

FROM alpine:3.7
MAINTAINER lulu "marlluslustosa@gmail.com"

# install alpine
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.7/main" >> /etc/apk/repositories && \
	echo "http://dl-4.alpinelinux.org/alpine/v3.7/community" >> /etc/apk/repositories

RUN apk update && \
	apk add python py-pip curl unzip dbus-x11 ttf-freefont xvfb && \
	pip install selenium && \
	pip install pyvirtualdisplay && \
	pip install python-crontab && \
	pip install autossh && \
	pip install nginx

# firefox 58 testing
apk add firefox=58.0.1-r2 --update-cache --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
#apk add --allow-untrusted http://dl-4.alpinelinux.org/alpine/edge/testing/x86_64/firefox-58.0.1-r2.apk

#geckodriver
# https://github.com/mozilla/geckodriver/releases/
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.19.1/geckodriver-v0.19.1-linux64.tar.gz && \
	tar -zxvf geckodriver-v0.19.1-linux64.tar.gz

COPY ./geckodriver /usr/local/bin/
RUN chmod a+x /usr/local/bin/geckodriver

