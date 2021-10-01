<?php
	
	include "../classes/repositorio/RepositorioGeral.php";

	$repositorioGeral = new RepositorioGeral();
	$db = $repositorioGeral->openDB(true);
	mysql_set_charset ("utf8",$db);
	
	if(!$db) {
		echo 'ERROR: Could not connect to the database.';
	} else {
		if(isset($_POST['queryString'])) {
			$queryString = $db->real_escape_string($_POST['queryString']);
			if(strlen($queryString) >0) {
				$query = $db->query("SELECT descricao, cid FROM cid10 WHERE descricao LIKE '$queryString%' limit 10");
				if($query) {
					while ($result = $query->fetch_object()) {
	         			echo '<li id="autoCid" onClick="fill(\''.$result->cid.'-'.$result->descricao.'\');">'.$result->cid.'-'.$result->descricao.'</li>';
	         		}
				} else {
					echo 'ERROR: There was a problem with the query.';
				}
			}
		} else {
			echo 'There should be no direct access to this script!';
		}
	}
?>