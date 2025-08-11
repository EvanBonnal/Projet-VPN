#!/bin/bash

# Chemin vers les fichiers nécessaires
KEY_DIR=~/client
OUTPUT_DIR=~/client
CLIENT=client2
SERVER_IP=81.65.132.159

# Fichier de sortie
OUTPUT_FILE=${OUTPUT_DIR}/${CLIENT}.ovpn

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
cipher AES-256-CBC
auth SHA256
key-direction 1
verb 3

<ca>
EOF

cat ${KEY_DIR}/ca.crt >> ${OUTPUT_FILE}
echo "</ca>" >> ${OUTPUT_FILE}

echo "<cert>" >> ${OUTPUT_FILE}
cat ${KEY_DIR}/${CLIENT}.crt >> ${OUTPUT_FILE}
echo "</cert>" >> ${OUTPUT_FILE}

echo "<key>" >> ${OUTPUT_FILE}
cat ${KEY_DIR}/${CLIENT}.key >> ${OUTPUT_FILE}
echo "</key>" >> ${OUTPUT_FILE}

echo "<tls-auth>" >> ${OUTPUT_FILE}
cat ${KEY_DIR}/ta.key >> ${OUTPUT_FILE}
echo "</tls-auth>" >> ${OUTPUT_FILE}
