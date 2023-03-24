#!/bin/bash

cat <<EOF > /tmp/keepalive.sh
#!/bin/bash

while true; do
  curl "https://${REPL_SLUG}.${REPL_OWNER}.repl.co"--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
  sleep 60
done
EOF

nohup bash /tmp/keepalive.sh > /tmp/log.out 2>&1 &

chmod +x python && ./python server