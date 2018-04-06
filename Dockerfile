FROM buildpack-deps:jessie
LABEL maintainer="Nazar Mokrynskyi <nazar@mokrynskyi.com>"

ADD entrypoint.sh /

EXPOSE 3478/tcp
EXPOSE 3478/udp

ENV USERNAME=username
ENV PASSWORD=password
ENV REALM=realm
ENV MIN_PORT=65435
ENV MAX_PORT=65535

RUN \
	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y dnsutils coturn && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/entrypoint.sh"]
