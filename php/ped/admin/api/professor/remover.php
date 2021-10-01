<?php
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/classes/professor.class.php');
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/utils.php');

	if ( isAdmin() )
	{
		$id = $_POST['id'];
		$nome = "";
		$cpf = "";
		$login = "";
		$senha = "";
		$professor = new Professor($id, $nome, $cpf, $login, $senha);
		$success = $professor -> delete();
		
		if( $success )
		{
			header('Content-type: application/json');
			header('HTTP/1.1 200 OK');
			echo "[]";
		}
		else
		{
			header('Content-type: application/json');
			header('HTTP/1.1 400 Bad Request');
			echo "Error";
		}
	}
	else
	{
		header('Content-type: application/json');
		header('HTTP/1.1 401 Not Authorized');
		echo "Usuário não autorizado";
	}
?>