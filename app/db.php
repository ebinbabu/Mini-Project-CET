<?php
    // Create Database Connection
   $dbhost = "172.17.0.2";
   $dbport = "3306";
   $dbuser = "admin";
   $dbpass = "redhat@123";
   $dbname = "housekeeping";
   $db = @mysqli_connect($dbhost,$dbuser,$dbpass,$dbname);

//$db = new PDO('mysql:host=172.17.0.2;port=3306;dbname=housekeeping', 'admin', 'redhat@123');

  
   
    // Check Database Connection
    if (!$db) {
      die("Connection failed: " . mysqli_connect_error());
    }
 //  echo "Connected successfully";
?>
