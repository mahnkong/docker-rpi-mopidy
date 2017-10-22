#!/bin/bash

ASOUND_PCM_CARD_ID=${ASOUND_PCM_CARD_ID:="hw:1,0"}

sed -i -e "s|%ASOUND_PCM_CARD_ID%|${ASOUND_PCM_CARD_ID}|g" /etc/asound.conf

echo "Starting mopidy"
mopidy
