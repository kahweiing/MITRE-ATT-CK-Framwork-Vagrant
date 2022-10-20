<?php
/* Local Database*/

$servername = "172.24.2.101";
$username = "root";
$password = "password";
$dbname = "clinic_db";


// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}



?> 