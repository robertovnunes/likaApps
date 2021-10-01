<?php
	include  $_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/utils.php';
	
	if( !isAdmin() ) 
	{
		header("Location: /ped/index.php?x=naoautorizado");
	} 
?>