FROM lsiobase/ubuntu as buildstage

LABEL maintainer="Deanosim"

ENV DEBIAN_FRONTEND="noninteractive"

RUN \
 echo "**** install NodeJS git and npm ****" && \
 apt-get update && \
 apt-get install -y --no-install-recommends \
        nodejs \
        git \
        npm && \
 echo "**** cleanup ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

COPY root/ /