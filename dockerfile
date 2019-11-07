FROM docker.pkg.github.com/linuxserver/docker-baseimage-ubuntu/baseimage-ubuntu:arm64v8-bionic

LABEL maintainer="Deanosim"

RUN \
 echo "**** install NodeJS git and npm ****" && \
 apt-get update && \
 apt-get install -y --no-install-recommends \
        nodejs \
        git \
        npm && \
 echo "clone git repo" && \
 mkdir -p \
        /app/TimePlayed \
 cd /app/TimePlayed/ \
 git clone git clone https://github.com/xVaql/TimePlayed.git && \
 echo "install npm packages" \
 npm install discord.js mysql fast-levenshtein \
 echo "**** cleanup ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/* && \
COPY keys.json /app/TimePlayed/