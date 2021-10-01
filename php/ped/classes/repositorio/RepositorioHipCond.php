<?php
class RepositorioHipCond
{

    public function __construct(){}

	public function listaHD($atend){
		$sqlhd = mysql_query("SELECT * FROM hipotdiagnost WHERE idAtend = '".$atend."'");
        $tabela = array();
		while ($dados =  mysql_fetch_array($sqlhd)){
			array_push($tabela, $dados);
		}
		return $tabela;
	}
    
	function preencherHipDiag($hip, $idAtendimento, $assinar, $idAluno){
		$data = date(Y) . "-" . date(m) . "-" . date(d) . " " . date("H:i:s");
    	$query = mysql_query("SHOW TABLE STATUS LIKE 'hipotdiagnost'");
        $data1 = mysql_fetch_array($query);
		$idHipotese = $data1['Auto_increment'];
		mysql_query("INSERT INTO hipotdiagnost (idHipotese, idAtend, hipotese, ass, dthr, idAluno) VALUES ('" . 
			$idHipotese . "', '" . $idAtendimento . "', '" . $hip . "', '" . $assinar . "', '" . $data . "', '" . 
			$idAluno . "')");
    }

	function alterarHipDiag($hip, $idHip, $idAluno){
        mysql_query("UPDATE hipotdiagnost SET hipotese = '" . $hip . "', dthr = SYSDATE(), idAluno='" . $idAluno . 
			"' WHERE idHipotese = '" . $idHip . "'") or die("ERRO no comando SQL:" . mysql_error());
    }
    
    function confirmarHip($idHip, $idAluno){
    	mysql_query("UPDATE hipotdiagnost SET HipConfirmada = '" . 1 . "', dthr = SYSDATE(), idAluno='" . $idAluno . 
			"' WHERE idHipotese = '" . $idHip . "'") or die("ERRO no comando SQL:" . mysql_error());
		//$hipConfirmada = mysql_query("SELECT HipConfirmada from hipotdiagnost WHERE idAluno='" . $idAluno . "' AND idHipotese ='" . $idHip . "'");
    }
		
	function assinarHD($idAtend, $assinar, $idAluno){
        mysql_query("UPDATE hipotdiagnost SET ass = '" . $assinar . "', dthr = SYSDATE(), idAluno='" . $idAluno . 
			"' WHERE idAtend = '" . $idAtend . "'") or die("ERRO no comando SQL:" . mysql_error());
    }

    function preencherConduta($cond, $idAtendimento, $assinar, $idAluno){
        mysql_query("UPDATE conduta SET conduta = '" . $cond . "', ass = '" . $assinar . "', dthr = SYSDATE(), idAluno='" . 
			$idAluno . "' WHERE idHipotese='" . $idAtendimento . "'") or die("ERRO no comando SQL:" . mysql_error());
    }

	function removerHD($idhip) { 
		mysql_query("DELETE FROM hipotdiagnost WHERE idHipotese = '" . $idhip . "'") or 
			die("ERRO no comando SQL : " . mysql_error());
    }
	
    function consultarHD($idhip) {
        $sqlhd = mysql_query("SELECT * FROM hipotdiagnost where idHipotese = '" . $idhip . "'") or 
			die("ERRO no comando SQL:" . mysql_error());
        return mysql_fetch_object($sqlhd);
    }

    function getAssHD($idAtend) {
        $sqlhd = mysql_query("SELECT * FROM hipotdiagnost where idAtend = '" . $idAtend . "' LIMIT 1") or 
			die("ERRO no comando SQL:" . mysql_error());
        return mysql_fetch_object($sqlhd);
    }
	
    function consultarCD($idAtend){
        $sqlcond = mysql_query("SELECT * FROM conduta where idHipotese = '" . $idAtend . "'") or 
			die("ERRO no comando SQL:" . mysql_error());
        return mysql_fetch_object($sqlcond);
    }

    function HDAssinado($idAtend) {
        $sqlhd = mysql_query("SELECT ass FROM hipotdiagnost WHERE idAtend = '".$idAtend."'");
        $linhahd = mysql_fetch_object($sqlhd);
        return ($linhahd->ass);
    }

    function CondAssinado($idAtend) {
        $sqlcd = mysql_query("SELECT ass FROM conduta WHERE idHipotese = '" . $idAtend . "'");
        $linhacd = mysql_fetch_object($sqlcd);
        return ($linhacd->ass);
    }
	
    public function __destruct(){}

}
?>
