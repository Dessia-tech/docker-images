# docker build . -t dessia/pyinstaller-windows
# https://github.com/cdrx/docker-pyinstaller/blob/master/Dockerfile-py3-win64
# https://askubuntu.com/questions/678277/how-to-install-python3-in-wine
# https://wiki.debian.org/Wine

FROM debian:bullseye

MAINTAINER Dessia Technologies "root@dessia.tech"

RUN apt-get update
RUN apt-get install -y wget gnupg software-properties-common apt-utils xvfb

# Need at least wine 4.14 to install python 3.10
RUN dpkg --add-architecture i386 \
    && add-apt-repository 'deb http://deb.debian.org/debian bullseye main contrib non-free' \
    && apt update
RUN apt install -y \
    wine \
    wine32 \
    wine64 \
    libwine \
    libwine:i386 \
    fonts-wine \
    winetricks \
    unzip

# Dowloading Python 3.10.8
RUN wget https://www.python.org/ftp/python/3.9.13/python-3.9.13-embed-amd64.zip
RUN wget https://bootstrap.pypa.io/get-pip.py

ENV WINEARCH win64
ENV WINEDEBUG fixme-all
ENV WINEPREFIX /wine64

RUN winetricks win10

RUN unzip python-3.9.13-embed-amd64.zip -d Python

ENV PYTHON Z:\\Python\\python.exe

COPY python39._pth /Python/python39._pth

RUN wine $PYTHON get-pip.py

COPY future /future
RUN cp -a /future/. /Python

RUN wine $PYTHON -m pip install pyinstaller

ENV PYINSTALLER Z:\\Python\\Scripts\\pyinstaller.exe

RUN cp Python/python39.zip . \
    && rm Python/python39.zip \
    && unzip python39.zip -d Python/python39.zip

# Copy needed files for tkinter
COPY tcl /Python/tcl
COPY tkinter /Python/tkinter
COPY DLLs /Python

# put the src folder inside wine
RUN mkdir /src/
VOLUME /src/
WORKDIR /src/
RUN mkdir -p /tmp

COPY entrypoint.sh /entrypoint.sh

VOLUME /src/
WORKDIR /src

ENTRYPOINT ["/entrypoint.sh"]
