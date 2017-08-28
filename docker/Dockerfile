FROM alpine:latest
LABEL authors "Darknet Villain <supervillain@riseup.net>"

ARG GIT_TAG=""
ENV GIT_TAG=${GIT_TAG}

RUN adduser -S i2psnark

RUN apk --no-cache add git gettext apache-ant openjdk8 \
    && git clone https://github.com/i2p/i2p.i2p.git /src \
    && cd /src \
    && if [ -n "${GIT_TAG}" ]; then git checkout tags/${GIT_TAG}; fi \
    && ant i2psnark \
    && mkdir /snark \
    && unzip -d /snark /src/apps/i2psnark/java/i2psnark-standalone.zip \
    &&  sed -i 's/<Set name="host">127.0.0.1<\/Set>/<Set name="host">0.0.0.0<\/Set>/' /snark/i2psnark/jetty-i2psnark.xml \
    && chown -R i2psnark:nobody /snark \
    && cd / && rm -rf /src && apk --purge del git gettext apache-ant

VOLUME /snark/i2psnark/downloads

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

EXPOSE 8002

USER i2psnark

ENTRYPOINT [ "/entrypoint.sh" ]

