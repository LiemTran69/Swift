<?php
require("dbCon.php");

$id    = $_POST["ID"] ;
$hoten = $_POST["HOTEN"] ;
$email = $_POST["EMAIL"] ;

$qr = " UPDATE Users SET
          HoTen = '$hoten', Email = '$email'
        WHERE id = '$id'
 ";

$mang = array();

if(mysql_query($qr)){
  $mang = array("kq"=>"1");
}else{
  $mang = array("kq"=>"0");
}

echo json_encode($mang);

?>
