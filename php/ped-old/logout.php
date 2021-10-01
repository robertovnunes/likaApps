<?php
include_once("controllers/ControllerGeral.php");
$_SESSION = array();
session_destroy();
$fachada->closeDB($conn);
header("Location: index.php?x=saiu");
?>

