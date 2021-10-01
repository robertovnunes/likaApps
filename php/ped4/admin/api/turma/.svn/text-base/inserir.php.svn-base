<?php
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/utils.php');
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/classes/turma.class.php');
	
	if ( isAdmin() )
	{
		$id = 0;
		$nome = substr($_POST['nome'],0,30);
		$periodo = substr($_POST['periodo'],0,20);
		
		$turma = new Turma($id, $nome, $periodo);
		$success = $turma -> insert();	
		
		if( $success )
		{
			header('Content-type: application/json');
			$array = $turma -> to_array();
			$list = Turma::find($array);
			echo to_json($list[0]);
		}
		else
		{
			header('Content-type: application/json');
			header('HTTP/1.1 400 Bad Request');
			echo "Turma já existente!";
		}
	}
	else
	{
		header('Content-type: application/json');
		header('HTTP/1.1 401 Not Authorized');
		echo "Usuário não autorizado";
	}
?>