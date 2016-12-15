#!/bin/bash

LASTAUTOSAVE=$(ls --sort=time ~/.openttd/save/autosave/ | tail -n 1)
if [ -z "$LASTAUTOSAVE" ];
then
    /usr/games/openttd -D
else
    /usr/games/openttd -D -g ~/.openttd/save/autosave/$LASTAUTOSAVE
fi
