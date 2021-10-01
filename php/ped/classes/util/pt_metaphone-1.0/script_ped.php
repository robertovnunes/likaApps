<?php
include_once("pt_metaphone.php");
mysql_connect("localhost", "root", "");
mysql_select_db("ped2010");

$result = mysql_query("SELECT idPront, nome FROM paciente");

echo mysql_num_rows($result);

while($a = mysql_fetch_object($result)){
	mysql_query("UPDATE paciente SET nome_metaphone = '".pt_metaphone($a->nome)."' WHERE idPront = ".$a->idPront);	
}

?>