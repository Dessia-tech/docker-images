#!/bin/bash

# Allow the workdir to be set using an env var.
# Useful for CI pipiles which use docker for their build steps
# and don't allow that much flexibility to mount volumes

WORKDIR=/src

cd $WORKDIR

pwd

if [ -f requirements.txt ]; then
    "python-3.9\Scripts\pip.exe" install -r requirements.txt
fi # [ -f requirements.txt ]

echo "$@"

if [[ "$@" == "" ]]; then
    "python-3.9\Scripts\pyinstaller.exe" --clean -y --dist ./dist/windows --workpath /tmp *.spec
    chown -R --reference=. ./dist/windows
else
    sh -c "$@"
fi # [[ "$@" == "" ]]
