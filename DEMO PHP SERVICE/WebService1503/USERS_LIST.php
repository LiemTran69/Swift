<?php
require "dbCon.php";

$qr = "SELECT * FROM Users";

$dsUsers = mysql_query($qr);

$mang = array();

while($motUser = mysql_fetch_array($dsUsers)){
  array_push($mang, new USERS(
    $motUser["id"],
    $motUser["HoTen"],
    $motUser["Email"]
  ));
}

echo json_encode($mang);

?>
