#!/bin/bash

set -e

# Allow the workdir to be set using an env var.
# Useful for CI pipiles which use docker for their build steps
# and don't allow that much flexibility to mount volumes

WORKDIR=/src

cd $WORKDIR

pwd

if [ -f requirements.txt ]; then
    $PYTHON -m pip install -r requirements.txt
fi # [ -f requirements.txt ]

echo "$@"

if [[ "$@" == "" ]]; then
    $PYINSTALLER --clean -y --dist ./dist/windows --workpath /tmp *.spec
    chown -R --reference=. ./dist/windows
else
    sh -c "$@"
fi # [[ "$@" == "" ]]
