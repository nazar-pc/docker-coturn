FROM buildpack-deps:jessie
LABEL maintainer="Nazar Mokrynskyi <nazar@mokrynskyi.com>"

EXPOSE 3478/tcp
EXPOSE 3478/udp

ENV ANONYMOUS=0
ENV USERNAME=username
ENV PASSWORD=password
ENV REALM=realm
ENV LISTEN_PORT=3478
ENV TLS_LISTEN_PORT=5349
ENV MIN_PORT=65435
ENV MAX_PORT=65535

RUN \
	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y dnsutils coturn && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
