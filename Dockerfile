FROM armv7/armhf-debian:jessie

MAINTAINER Andreas Mahnke <mahnkong@gmx.de>

COPY qemu-arm-static /usr/bin/qemu-arm-static

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y wget

RUN apt-get install -y gstreamer1.0-plugins-ugly gstreamer1.0-plugins-good gstreamer1.0-plugins-bad 

RUN wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add - && \
    wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/jessie.list && \
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mopidy python-pip && \
    apt-get autoremove -y && \
    pip install Mopidy-YouTube && \
    pip install Mopidy-Local-SQLite && \
    pip install Mopidy-Iris && \
    pip install mopidy-musicbox-webclient

COPY entrypoint.sh /entrypoint.sh
COPY asound.conf /etc/asound.conf
COPY mopidy.conf /root/.config/mopidy/mopidy.conf
EXPOSE 6600 6680

ENTRYPOINT ["/entrypoint.sh"]
