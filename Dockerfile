FROM debian:stable AS build
LABEL maintainer="Matt Dickinson <matt@sanbridge.org>"
## Website for installing bluetooth.
##https://computingforgeeks.com/connect-to-bluetooth-device-from-linux-terminal/

#Installation of all of the dependencies needed to build Music Player Daemon from source.
RUN apt-get update && apt-get install -y \
	nano \
	bluez \
	bluetooth \
	bluez-tools \
	rfkill \
	xz-utils
#ARG S6_OVERLAY_VERSION=3.1.0.1

#ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
#RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
#ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp
#RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz

#ENTRYPOINT ["/init"]
CMD bluetoothctl
