<?php
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/utils.php');
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/classes/modulo.class.php');
	
	if ( isAdmin() )
	{
		$id = 0;
		$nome = substr($_POST['nome'],0,30);
		$objetivo = substr($_POST['objetivo'],0,30);
		$descricao = substr($_POST['descricao'],0,60);
		
		$modulo = new Modulo($id, $nome, $objetivo, $descricao);
		$success = $modulo -> insert();	
		
		if( $success )
		{
			header('Content-type: application/json');
			$array = $modulo -> to_array();
			$list = Modulo::find($array);
			echo to_json($list[0]);
		}
		else
		{
			header('Content-type: application/json');
			header('HTTP/1.1 400 Bad Request');
			echo "Modulo já existente!";
		}
	}
	else
	{
		header('Content-type: application/json');
		header('HTTP/1.1 401 Not Authorized');
		echo "Usuário não autorizado";
	}
?>