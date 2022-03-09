<html>
 <head>
  <title>PHP Test</title>
 </head>
 <body>
 <?php  
 $servername = "mysql";
 $username = "admin";
 $password = "redhat@123";
 $dbname = "housekeeping";
 
 try{
    $conn = new PDO("mysql:host=$servername;dbname=$dbname",$username,$password);
    $conn -> setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    echo "Connected succesfully";
 } catch(PDOException $e){
    echo "Connection failed: " . $e -> getMessage();
 }
 ?> 
 </body>
</html>
