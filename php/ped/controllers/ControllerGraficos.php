<?php
	/*$sql1 = mysql_query("SELECT idPront FROM atendimento WHERE idAtend = '" . $_GET['at'] . "'") or 
		die("ERRO no comando SQL:" . mysql_error());
	$obj = mysql_fetch_object($sql1);*/
	$pront = $fachada->getProntuarioAtendimento($_GET['at']);
	$sql2 = mysql_query("SELECT md.*, at.* FROM atendimento at, medind md WHERE at.idPront = '" . $pront . 
		"' and at.idAtend = md.idAtend ORDER BY md.idAtend ASC") or die("ERRO no comando SQL:" . mysql_error());
	
	$table = array();
	$table2 = array();
	$table3 = array();
	$table4 = array();
	$table5 = array();
	$table6 = array();
	$table7 = array();
	
	$sql3 = mysql_query("SELECT n.vpesonasc as pesoin, n.pesoat as pesoat FROM neonatal n WHERE n.idPront = " . $pront);
	$sql4 = mysql_query("SELECT n.comp as alturain, n.altat as altat FROM neonatal n WHERE n.idPront = " .$pront);
	$sql5 = mysql_query("SELECT n.percef as permcef FROM neonatal n WHERE n.idPront = " .$pront);
	$sql6 = mysql_query("SELECT n.pertorac as permtora FROM neonatal n WHERE n.idPront = " .$pront);
	
	$obj1 = mysql_fetch_array($sql3);
	$obj2 = mysql_fetch_array($sql4);
	$obj3 = mysql_fetch_array($sql5);
	$obj4 = mysql_fetch_array($sql6);
	
	//$obj1['vpesonasc'];
	if (mysql_num_rows($sql3) > 0 || mysql_num_rows($sql4) > 0 || mysql_num_rows($sql5) > 0 || mysql_num_rows($sql6) > 0){
		
		if ($obj1['pesoin'] == "\0" || !$obj1['pesoin']) $obj1['pesoin'] = "0";
		if ($obj2['alturain'] == "\0" || !$obj2['alturain']) $obj2['alturain'] = "0";
		if ($obj3['permcef'] == "\0" || !$obj3['permcef']) $obj3['permcef'] = "0";
		if ($obj4['permtora'] == "\0" || !$obj4['permtora']) $obj4['permtora'] = "0";
		
		
		array_push($table, $obj1);
		array_push($table2, $obj2);
		array_push($table3, $obj3);
		array_push($table4, $obj4);
		array_push($table5, "0");
		array_push($table6, "0");
		array_push($table7, "0");
		
		while ($dados =  mysql_fetch_array($sql2)){
			//echo "=== ".$dados['peso'];
			
			if ($dados['pesoin'] == "\0" || !$dados['pesoin']) $dados['pesoin'] = "0";
			else array_push($table, $dados);
			
			if ($dados['alturain'] == "\0" || !$dados['alturain']) $dados['alturain'] = "0";
			else array_push($table2, $dados);
			
			if ($dados['permcef'] == "\0" || !$dados['permcef']) $dados['permcef'] = "0";
			else array_push($table3, $dados);
			
			if ($dados['permtora'] == "\0" || !$dados['permtora']) $dados['permtora'] = "0";
			else array_push($table4, $dados);
			
			array_push($table5, $dados);
			array_push($table6, $dados);
			array_push($table7, $dados);
			

			
		}
		if ($obj1['pesoin'] != 0 || $obj2['alturain'] != 0 || $obj3['permcef'] != 0  || $obj4['permtora'] != 0 || $obj5['peramab'] !=0 || $obj6['pregatric'] !=0 || $obj7['pregasubesc'] != 0) $print = 1;
	}
	
?>