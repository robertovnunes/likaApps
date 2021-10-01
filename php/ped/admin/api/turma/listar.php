<?php
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/utils.php');
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/classes/turma.class.php');
	
	if ( isAdmin() )
	{
		$turmas = Turma::gql("ORDER BY turma");
		header('Content-type: application/json');
		echo list_to_json($turmas);
	}
	else
	{
		header('Content-type: application/json');
		header('HTTP/1.1 401 Not Authorized');
		echo "Usuário não autorizado";
	}	
?>