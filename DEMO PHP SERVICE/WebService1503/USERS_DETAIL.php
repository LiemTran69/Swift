<?php
require("dbCon.php");
$id = $_POST["id"];
$qr = " SELECT * FROM Users
        WHERE id=$id            ";

$mang = array();

if ( $rows = mysql_query($qr) ){
  if( mysql_num_rows($rows)==1 ){
    $u = mysql_fetch_array($rows);
    $mang = array(
      "kq"   => "1",
      "ID"   => $u["id"],
      "HOTEN"=> $u["HoTen"],
      "EMAIL"=> $u["Email"]
    );
  }else{
    $mang = array("kq"=>"0");
  }
}else{
  $mang = array("kq"=>"-1");
}

echo json_encode($mang);
?>
