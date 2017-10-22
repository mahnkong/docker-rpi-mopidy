# docker-rpi-mopidy - Docker image for Mopidy on a raspberrypi
![Travis build status](https://api.travis-ci.org/mahnkong/docker-rpi-mopidy.svg?branch=master)

## Usage

A typical invocation of the container would be:
```
docker run --privileged -v /path/to/music:/music -v /path/to/mopidydata:/mopidy -p 6600:6600 -p 6680:6680 mahnkong/docker-rpi-mopidy
```

## Environment Variables

The following environment variables can be set to configure the instance:

```
ASOUND_PCM_CARD_ID: ID of the sound card for the asound.conf file (Defaults to: "hw:1,0")
```
