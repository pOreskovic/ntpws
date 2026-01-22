<?php
$host = "localhost";
$dbname = "gg";
$username = "gg_db_admin";       
$password = "ggadminpass1$";           

$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}

?>
