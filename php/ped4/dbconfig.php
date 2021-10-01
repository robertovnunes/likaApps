<?php
$host  = "localhost"; //endereço do servidor MySQL
$db = "ped"; // database
$user = "ped"; //login usado no MySQL
$senha1 = "28vFs93Dkr4ddCloa";//"master"; //senha usado no MySQL

$conn = mysql_connect($host, $user, $senha1) or die (mysql_error());
mysql_select_db($db) or die (mysql_error()); 

?>
