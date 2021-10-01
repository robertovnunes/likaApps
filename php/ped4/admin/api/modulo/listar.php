<?php
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/utils.php');
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/classes/modulo.class.php');
	
	if ( isAdmin() )
	{
		$modulos = Modulo::gql("ORDER BY modulo");
		
		header('Content-type: application/json');
		echo list_to_json($modulos);
	}
	else
	{
		header('Content-type: application/json');
		header('HTTP/1.1 401 Not Authorized');
		echo "Usuário não autorizado";
	}
?>