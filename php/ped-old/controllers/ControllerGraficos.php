<?php
	/*$sql1 = mysql_query("SELECT idPront FROM atendimento WHERE idAtend = '" . $_GET['at'] . "'") or 
		die("ERRO no comando SQL:" . mysql_error());
	$obj = mysql_fetch_object($sql1);*/
	$pront = $fachada->getProntuarioAtendimento($_GET['at']);
	$sql2 = mysql_query("SELECT md.*, at.* FROM atendimento at, medind md WHERE at.idPront = '" . $pront . 
		"' and at.idAtend = md.idAtend ORDER BY md.idAtend ASC") or die("ERRO no comando SQL:" . mysql_error());
	$table = array();
	$sql3 = mysql_query("SELECT n.vpesonasc as pesoin FROM neonatal n WHERE n.idPront = " . $pront);
	$obj1 = mysql_fetch_array($sql3);
	//$obj1['vpesonasc'];
	if (mysql_num_rows($sql3) > 0){
		if ($obj1['pesoin'] == "\0" || !$obj1['pesoin']) $obj1['pesoin'] = "0";
		array_push($table, $obj1);
		while ($dados =  mysql_fetch_array($sql2)){
			//echo "=== ".$dados['peso'];
			if ($dados['pesoin'] == "\0" || !$dados['pesoin']) $dados['pesoin'] = "0";
			else array_push($table, $dados);
		}
		if ($obj1['pesoin']) $print = 1;
	}


?>