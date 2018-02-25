<?php
require("dbCon.php");

$UN = $_POST["UN"];
$EM = $_POST["EM"];

$qr = " INSERT INTO Users
        VALUES( null, '$UN', '$EM' )
";

$mang = array();

if (mysql_query($qr) ){
  $id = mysql_insert_id();
  $mang = array("kq"=>"1", "id"=>"$id");
}else{
  $mang = array("kq"=>"0");
}

echo json_encode($mang);

?>
