FROM debian:buster

ENV METEORD_DIR /opt/meteord
COPY scripts $METEORD_DIR

RUN apt-get update -y && apt-get install -y curl bzip2 build-essential python git && apt-get autoremove -y && rm -rf /usr/share/doc /usr/share/doc-base /usr/share/man /usr/share/locale /usr/share/zoneinfo && rm -rf /var/lib/cache /var/lib/log && rm -rf /tmp/*
RUN bash $METEORD_DIR/lib/install_node.sh
RUN npm cache clear --force


EXPOSE 80
ENTRYPOINT bash $METEORD_DIR/run_app.sh
