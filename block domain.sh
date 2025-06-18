
# blockdomain: adds a domain to /etc/hosts pointing to 127.0.0.1

if [ -z "$1" ]; then
  echo "Usage: blockdomain <domain>"
  exit 1
fi

DOMAIN=$1
HOSTS_LINE="127.0.0.1    $DOMAIN"

if grep -qE "^[^#]*[[:space:]]$DOMAIN" /etc/hosts; then
  echo "Entry for '$DOMAIN' already exists in /etc/hosts"
else
  echo "Adding: $HOSTS_LINE"
  echo "$HOSTS_LINE" | sudo tee -a /etc/hosts > /dev/null
  echo "Done."
fi
