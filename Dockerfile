FROM ubuntu:16.04
MAINTAINER Dennis Boldt <info@dennis-boldt.de>

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

EXPOSE 3478

ENV USERNAME=username
ENV PASSWORD=password
ENV REALM=realm
ENV MIN_PORT=65435
ENV MAX_PORT=65535

RUN apt-get update && apt-get install -y \
    dnsutils \
    coturn \
  && rm -rf /var/lib/apt/lists/*
  

ENTRYPOINT ["bash", "deploy-turnserver.sh"]    
