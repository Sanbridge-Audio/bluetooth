FROM debian:slim

#COPY entrypoint.sh /entrypoint.sh

#ENTRYPOINT ["/entrypoint.sh"]

FROM debian:stable AS depend
LABEL maintainer="Matt Dickinson <matt.dickinson@outlook.com>"

#Installation of all of the dependencies needed to build Music Player Daemon from source.
RUN apt-get update && apt-get install -y \
	nano
