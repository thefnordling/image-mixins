if [ -n "$VAULT_ADDR" ]; then
    echo "VAULT_ADDR not set, cannot download certificates"
    exit 1
fi
curl -X 'GET' \
  "${VAULT_ADDR}/v1/pki_int/ca/pem" \
  -H 'accept: application/json' \
  -o /usr/local/share/ca-certificates/home.arpa.intermediate.crt
curl -X 'GET' \
  "${VAULT_ADDR}/v1/pki/ca/pem" \
  -H 'accept: application/json' \
  -o /usr/local/share/ca-certificates/home.arpa.root.crt  
  update-ca-certificates