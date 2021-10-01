<?php
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/utils.php');
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/classes/professor.class.php');
	
	if ( isAdmin() )
	{
		$professores = Professor::all();
		
		header('Content-type: application/json');
		echo list_to_json($professores);
	}
	else
	{
		header('Content-type: application/json');
		header('HTTP/1.1 401 Not Authorized');
		echo "Usuário não autorizado";
	}
?>