echo "USERNAME: $USERNAME"
echo "PASSWORD: $PASSWORD"
echo "REALM: $REALM"
echo "PORT RANGE: $MIN_PORT-$MAX_PORT"

internalIp="$(ip a | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')"
externalIp="$(dig +short myip.opendns.com @resolver1.opendns.com)"

echo "listening-port=3478
tls-listening-port=5349
min-port=$MIN_PORT
max-port=$MAX_PORT
listening-ip="$internalIp"
relay-ip="$internalIp"
external-ip="$externalIp"
realm=$REALM
server-name=$REALM
lt-cred-mech
userdb=/var/lib/turn/turndb
# use real-valid certificate/privatekey files
cert=/etc/ssl/turn_server_cert.pem
pkey=/etc/ssl/turn_server_pkey.pem
 
no-stdout-log"  | tee /etc/turnserver.conf

turnadmin -a -u $USERNAME -p $PASSWORD -r $REALM

echo "Start TURN server..."

turnserver
