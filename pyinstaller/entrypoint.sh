#!/bin/bash

# Allow the workdir to be set using an env var.
# Useful for CI pipiles which use docker for their build steps
# and don't allow that much flexibility to mount volumes

WORKDIR=/src

cd $WORKDIR

pwd

if [ -f requirements.txt ]; then
    pip install -r requirements.txt
fi # [ -f requirements.txt ]

echo "$@"

if [[ "$@" == "" ]]; then
    pyinstaller --clean -y --dist ./dist/linux --workpath /tmp *.spec
    echo Testing the app...
    export DISPLAY=:1.0
    Xvfb :1 -screen 0 1600x1200x16  & 
    ./dist/linux/dessia_desktop --debug
    chown -R --reference=. ./dist/linux
else
    sh -c "$@"
fi # [[ "$@" == "" ]]
