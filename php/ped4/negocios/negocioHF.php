<?php
include ("classes/repositorioHF.php");

class negocioHF {

    private $repHF;

    public function __construct() {
        $this->repHF = new repositorioHF();
    }

    function inserirHF($uniaopais, $idademae, $profmae, $idadepai, $profpai, $pais, $avos, $irmaos, $outros, $tiporesid, $ncomodos, $nocupantes, $agua, $saneamento, $luz, $animais, $obs, $idProntuario) {
        $invalido = $this->parametrosInvalidosHF($uniaopais, $idademae, $profmae, $idadepai, $profpai, $pais, $avos, $irmaos, $outros, $tiporesid, $ncomodos, $nocupantes, $agua, $saneamento, $luz, $animais);

        if (!$invalido) {
            $this->repHF->inserirInfoFamiliares($uniaopais, $idademae, $profmae, $idadepai, $profpai, $pais, $avos, $irmaos, $outros, $obs, $idProntuario);
            $this->repHF->inserirCondDomest($tiporesid, $ncomodos, $nocupantes, $agua, $saneamento, $luz, $animais, $idProntuario);
        } else {
            throw new CamposInvalidos();
        }
    }

    private function parametrosInvalidosHF($uniaopais, $idademae, $profmae, $idadepai, $profpai, $pais, $avos, $irmaos, $outros, $tiporesid, $ncomodos, $nocupantes, $agua, $saneamento, $luz, $animais) {
        //$uniaopais  == "0" || 
		if (!is_numeric($idademae) || $idademae <= 0 || $profmae  == "" || $idadepai  == "" || !is_numeric($idadepai)  || $idadepai <= 0 || $profpai  == "" ||  tiporesid == "0" || (!is_numeric($ncomodos) && $ncomodos != "" )|| ( !is_numeric($nocupantes) && $nocupantes!="") || $agua == "" || $saneamento == "0" || $luz == "" || $animais == "")
            return true;
        return false;
    }

    public function __destruct() {}
}
?>