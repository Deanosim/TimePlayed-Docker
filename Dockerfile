FROM lsiobase/ubuntu

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
 git clone git clone https://github.com/ExplodingPineapple/TimePlayed.git && \
 echo "install npm packages" \
 npm install discord.js mysql fast-levenshtein \
 echo "**** cleanup ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

COPY keys.json /app/TimePlayed/
