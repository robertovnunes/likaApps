<?php

include "classes/repositorio/RepositorioGeral.php";
include "classes/repositorio/RepositorioCidadeEstado.php";

$repositorioGeral = new RepositorioGeral();
$repositorioGeral->openDB();

$repositorioCidadeEstado = new RepositorioCidadeEstado();

$estado = $_POST['uf'];
$cidade = $_POST['cid'];
$cidades = $repositorioCidadeEstado->listarCidades($estado);

function arruma_acentos($str){
	$str = str_replace(array('ã','á','â','Ã','Á','Â'),'A',$str);
    $str = str_replace(array('é','ê','É','Ê'),'E',$str);
    $str = str_replace(array('í','Í'),'I',$str);
    $str = str_replace(array('õ','ó','Õ','Ó','Ô'),'O',$str);
    $str = str_replace(array('ú','ü','Ú','Ü'),'U',$str);
    $str = str_replace(array('ç,Ç'),'C',$str);
	return strtoupper($str);
}


if(count($cidades) == 0){
		echo '<option value="0">'.htmlentities('Não há cidades cadastradas nesse estado').'</option>';
} else {
	foreach($cidades as $cid){
		if($cid['id'] == $cidade || strtoupper($cid['nome']) == arruma_acentos($cidade))
			echo '<option value="'.$cid['id'].'" selected>'.$cid['nome'].'</option>';
		else
			echo '<option value="'.$cid['id'].'">'.$cid['nome'].'</option>';
	}
}							

?>