#!/bin/bash

# Setup dummy screen
Xvfb :0 -screen 0 1024x768x16 &
jid=$!

echo "------ Install python ------"
DISPLAY=:0.0 wine cmd /c \
    python-3.10.8-amd64.exe \
    /quiet \
    PrependPath=1 \
    && wine cmd /c where python \
    && echo "Python Installation complete!"
# Display=:0.0 redirects wine graphical output to the dummy display.  
# This is to avoid docker errors as the python installer requires a display, 
# even when quiet install is specified.

