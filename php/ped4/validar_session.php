<?php
@session_start();

if (isset($_SESSION['usuario'])) 
{
	$usuario = unserialize($_SESSION['usuario']);
	if($usuario->getTipo() != 'a')
	{
		mysql_close($conn);
		header("Location: index.php?x=naoautorizado");
	}
} 
else
{
	mysql_close($conn);
	header("Location: index.php?x=naoautorizado");
}
?>