#!/bin/bash

ASOUND_PCM_CARD_ID=${ASOUND_PCM_CARD_ID:="hw:1,0"}
MPD_PROTOCOL=${MPD_PROTOCOL:="0.17.0"}

sed -i -e "s|%ASOUND_PCM_CARD_ID%|${ASOUND_PCM_CARD_ID}|g" /etc/asound.conf
sed -i -e "s|'0.19.0'|'${MPD_PROTOCOL}'|g" /usr/lib/python2.7/dist-packages/mopidy/mpd/protocol/__init__.py

echo "Starting mopidy"
mopidy
