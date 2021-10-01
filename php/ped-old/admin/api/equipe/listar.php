<?php
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/utils.php');
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/classes/equipe.class.php');
	
	if ( isAdmin() )
	{
		$equipes = Equipe::gql("ORDER BY equipe");
		
		header('Content-type: application/json');
		echo list_to_json($equipes);
	}
	else
	{
		header('Content-type: application/json');
		header('HTTP/1.1 401 Not Authorized');
		echo "Usuário não autorizado";
	}
?>