<?php
include ("dbconfig.php");

class repositorioHF {

    function assinar($id) {
        mysql_query("UPDATE historicofamiliar SET ass='1' WHERE idPront='".$id."'") or die("ERRO no comando SQL:".mysql_error());
    }

    function inserirInfoFamiliares($uniaopais, $idademae, $profmae, $idadepai, $profpai, $pais, $avos, $irmaos, $outros, $obs, $id){
        mysql_query("UPDATE familia SET uniaopais ='".$uniaopais."', idademae='".$idademae."', profmae='".$profmae."', idadepai 
			='".$idadepai."', profpai='".$profpai."', pais ='".$pais."', avos ='".$avos."', irmaos='".$irmaos."', outros='".$outros.
			"' WHERE idPront ='".$id."'") or die("ERRO no comando SQL : " . mysql_error());
    }
//obs='" . $obs . "' 
    function inserirCondDomest($tiporesid, $ncomodos, $nocupantes, $agua, $saneamento, $luz, $animais, $id) {
        mysql_query("UPDATE condicoesdomesticas SET resid='" . $tiporesid."', comod='".$ncomodos."', ocup='".$nocupantes."', agua='"
		.$agua."', luz='".$luz."', sanea='".$saneamento."', animdom='".$animais."' WHERE idPront ='".$id."'") or die("ERRO no 
		comando SQL : ".mysql_error());
    }

    public function __destruct() {
    }
}
?>