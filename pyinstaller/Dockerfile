FROM python:3.9

MAINTAINER Dessia Technologies "root@dessia.tech"

RUN apt update && apt-get install -y --no-install-recommends\
    	python3-tk \
     && apt-get clean \
     && apt-get autoremove \
     && rm -rf /var/lib/apt/lists/*

RUN pip install pyinstaller

COPY entrypoint.sh /entrypoint.sh

VOLUME /src/
WORKDIR /src

ENTRYPOINT ["/entrypoint.sh"]
