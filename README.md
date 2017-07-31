# Docker image for TURN server

A Docker container with the [Coturn TURN server](https://github.com/coturn/coturn).

# Build the container

```
sudo docker build -t zolochevska/turn-server .
```

# Run the container

```
# The make sure, that the minimum port is the same for the -p and as the last argurment
export COTURN_MIN_PORT=65435
sudo docker run \
  -d \
  -p 3478:3478 \
  -p 3478:3478/udp \
  -p ${COTURN_MIN_PORT}-65535:${COTURN_MIN_PORT}-65535/udp \
  --restart=always \
  --name coturn \
  zolochevska/turn-server username password realm ${COTURN_MIN_PORT}
```
