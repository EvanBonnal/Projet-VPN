#!/bin/bash

KEY_DIR=~/client/
OUTPUT_FILE=~/client/client1.ovpn
SERVER_IP=81.65.132.159

cat > ${OUTPUT_FILE} <<EOF
client
dev tun
proto udp
remote ${SERVER_IP} 1194
resolv-retry infinite
nobind
persist-key
persist-tun
remote-cert-tls server
auth SHA256
auth-nocache
data-ciphers AES-256-CBC:AES-256-GCM:AES-128-GCM
tls-version-min 1.2
tls-cipher TLS-DHE-RSA-WITH-AES-256-GCM-SHA384
verb 3

<ca>
EOF

cat ${KEY_DIR}/ca.crt >> ${OUTPUT_FILE}
echo "</ca>" >> ${OUTPUT_FILE}

echo "<cert>" >> ${OUTPUT_FILE}
cat ${KEY_DIR}/client1.crt >> ${OUTPUT_FILE}
echo "</cert>" >> ${OUTPUT_FILE}

echo "<key>" >> ${OUTPUT_FILE}
cat ${KEY_DIR}/client1.key >> ${OUTPUT_FILE}
echo "</key>" >> ${OUTPUT_FILE}

echo "<tls-crypt>" >> ${OUTPUT_FILE}
cat ${KEY_DIR}/tls-crypt.key >> ${OUTPUT_FILE}
echo "</tls-crypt>" >> ${OUTPUT_FILE}
