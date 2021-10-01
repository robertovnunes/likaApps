<?php
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/utils.php');
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/classes/aluno.class.php');
	
	if ( isAdmin() )
	{
		$alunos = Aluno::all();
		
		header('Content-type: application/json');
		echo list_to_json($alunos);
	}
	else
	{
		header('Content-type: application/json');
		header('HTTP/1.1 401 Not Authorized');
		echo "Usuário não autorizado";
	}
?>