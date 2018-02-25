<?php
require("dbCon.php");

$id    = $_POST["ID"] ;

$qr = " DELETE FROM Users
        WHERE id='$id'
 ";

$mang = array();

if(mysql_query($qr)){
  $mang = array("kq"=>"1");
}else{
  $mang = array("kq"=>"0");
}

echo json_encode($mang);

?>
