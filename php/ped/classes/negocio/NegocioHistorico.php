<?php
include ("classes/repositorio/RepositorioHistorico.php");

class NegocioHistorico {

    private $repHist;

    public function __construct() {
        $this->repHist = new RepositorioHistorico();
    }

	public function consultarHP($idProntuario) {
        return $this->repHist->consultarHP($idProntuario);
    }
	
	public function getVacinas() {
        return $this->repHist->getVacinas();
    }
	
	public function getDoses() {
        return $this->repHist->getDoses();
    }

	public function getVacinasPaciente($pront) {
        return $this->repHist->getVacinasPaciente($pront);
    }
	
	public function inserirVacina($vacinanome, $vacinadose, $datavacina, $dtnasc, $idProntuario){
        $invalido = $this->parametrosInvalidosVacina($vacinanome, $vacinadose, $datavacina, $dtnasc);
        if (!$invalido){
			if (!$this->repHist->vacinaHasDose($vacinanome, $vacinadose, $idProntuario)){
				$this->repHist->inserirVacina($vacinanome, $vacinadose, $datavacina, $idProntuario);
			} else {
            	throw new DoseInvalida();
        	}
        } else {
            throw new CamposInvalidos();
        }
    }
	
	public function removerVacina( $vacina, $dose, $idProntuario){
		$this->repHist->removerVacina($vacina, $dose, $idProntuario);
    }

    function inserirHF($uniaopais, $idademae, $profmae, $idadepai, $profpai, $pais, $avos, $irmaos, 
		$outros, $tiporesid, $ncomodos, $nocupantes, $agua, $saneamento, $luz, $animais, $obs, 
		$idProntuario) {
        $invalido = $this->parametrosInvalidosHF($uniaopais, $idademae, $profmae, $idadepai, $profpai,
			$pais, $avos, $irmaos, $outros, $tiporesid, $ncomodos, $nocupantes, $agua, $saneamento, 
			$luz, $animais);
		if (!$invalido) {
            if ($ncomodos == "0") $ncomodos = "\0";
            if ($nocupantes == "0") $nocupantes = "\0";
            if ($idademae == "0") $idademae = "\0";
            if ($idadepai == "0") $idadepai = "\0";
			$this->repHist->inserirInfoFamiliares($uniaopais, $idademae, $profmae, $idadepai, $profpai,
			$pais, $avos, $irmaos, $outros, $idProntuario);
            $this->repHist->inserirCondDomest($tiporesid, $ncomodos, $nocupantes, $agua, $saneamento, 
				$luz, $animais, $obs, $idProntuario);
        } else {
            throw new CamposInvalidos();
        }
    }

	public function alterarPNHP($acompmed, $consultas, $local, $durgestacao, $sangmae,
        $z21, $a53, $b18, $b58, $imunizmae, $exradion, $medicacoes, $anormalidades, $perdoenccir,
        $textdoenccir, $pesogravidez, $qaliment, $anemia, $obsprenat, $idProntuario)
    {
        $invalido = $this->parametrosInvalidosPNHP($durgestacao, $acompmed, $local, $consultas,
            $z21, $a53, $b18, $b58, $imunizmae, $sangmae, $medicacoes, $anormalidades, $exradion,
            $perdoenccir, $textdoenccir, $pesogravidez, $anemia, $qaliment);
        if (!$invalido)
        {
            if ($pesogravidez == "0") $pesogravidez = "\0";
			$this->repHist->alterarPNatal($acompmed, $consultas, $local, $durgestacao, $sangmae,
                $z21, $a53, $b18, $b58, $imunizmae, $exradion, $medicacoes, $anormalidades, $perdoenccir,
                $textdoenccir, $pesogravidez, $qaliment, $anemia, $obsprenat, $idProntuario);
        } else
        {
            throw new CamposInvalidos();
        }
    }
	
	public function alterarNHP($tipograv, $tipoparto, $tipoapres, $durtrabparto, $anestesia,
        $analgesia, $compparto, $textcompparto, $obsnatal, $idProntuario)
    {
        $invalido = $this->parametrosInvalidosNHP($tipograv, $tipoparto, $tipoapres, $durtrabparto,
            $anestesia, $analgesia, $compparto, $textcompparto);
        if (!$invalido)
        {
			$this->repHist->alterarNatal($tipograv, $tipoparto, $tipoapres, $durtrabparto, $anestesia,
                $analgesia, $compparto, $textcompparto, $obsnatal, $idProntuario);
        } else
        {
            throw new CamposInvalidos();
        }
    }

   public function alterarNNHP($apgar1, $apgar5, $permnasal, $idadegest, $sangrn, $sinalorto,
        $pesoalta, $comprimento, $percef, $pertorac, $pesonasc, $vpesonasc, $testepe, $fenilcet, $hipotiroid,
        $anemiafalc, $triaaud, $PEATE, $EOA, $reanimacao, $ictericia, $rash, $sangramentos,
        $vomitos, $infeccoes, $anomcong, $paralisias, $coriza, $convulsoes, $obsneonat,$pesoAtual,$spesoat,$alturaAtual,
        $idProntuario)
    {
        $invalido = $this->parametrosInvalidosNNHP($apgar1, $apgar5, $permnasal, $idadegest,
            $sangrn, $sinalorto, $pesoalta, $comprimento, $percef, $pertorac, $pesonasc, $vpesonasc, $testepe,
            $fenilcet, $hipotiroid, $anemiafalc, $triaaud, $PEATE, $EOA, $reanimacao, $ictericia,
            $rash, $sangramentos, $vomitos, $infeccoes, $anomcong, $paralisias, $coriza, $convulsoes);
        if (!$invalido)
        {
			if ($vpesonasc == 0) $vpesonasc = "\0";
			$this->repHist->alterarNeoNatal($apgar1, $apgar5, $permnasal, $idadegest, $sangrn, $sinalorto, 
				$pesoalta, $comprimento, $percef, $pertorac, $pesonasc, $vpesonasc, $testepe, $fenilcet, 
				$hipotiroid, $anemiafalc, $triaaud, $PEATE, $EOA, $reanimacao, $ictericia, $rash, $sangramentos,
				$vomitos, $infeccoes, $anomcong, $paralisias, $coriza, $convulsoes, $obsneonat, $pesoAtual,$spesoat,
				$alturaAtual, $idProntuario);
        } else
        {
            throw new CamposInvalidos();
        }
    }


    public function alterarAHP($alimmatexc, $alimcomp, $alimpast, $alimfam, $dietatu,
        $refdiarias, $horaref, $usomam, $colher, $copo, $alimpastliq, $chantafet, $brincref,
        $obsaliment, $idProntuario)
    {
        $invalido = $this->parametrosInvalidosAHP($alimmatexc, $alimcomp, $alimpast, $alimfam,
            $dietatu, $refdiarias, $horaref, $usomam, $colher, $copo, $alimpastliq, $chantafet,
            $brincref);
        if (!$invalido){
            $this->repHist->alterarAliment($alimmatexc, $alimcomp, $alimpast, $alimfam, $dietatu,
                $refdiarias, $horaref, $usomam, $colher, $copo, $alimpastliq, $chantafet, $brincref,
                $obsaliment, $idProntuario);
        } else {
            throw new CamposInvalidos();
        }
    }

    public function alterarCDHP($relirmaos, $idadeescola, $aprendizado, $repetano, $relacol,
        $particfala, $muddent, $obscrescdes, $idProntuario)
    {
       /* $invalido = $this->parametrosInvalidosCDHP($relirmaos, $idadeescola, $aprendizado,
            $repetano, $relacol, $particfala, $muddent);
        if (!$invalido)
        {*/
            $this->repHist->alterarCrescDes($relirmaos, $idadeescola, $aprendizado, $repetano,
                $relacol, $particfala, $muddent, $obscrescdes, $idProntuario);
        /*} else
        {
            throw new CamposInvalidos();
        }*/
    }

    public function alterarHHP($chupeta, $chupadedo, $roiunhas, $tiques, $altalim, $geofagia,
        $enurese, $pertsono, $dormepais, $obshabito, $idProntuario)
    {
        $invalido = $this->parametrosInvalidosHHP($chupeta, $chupadedo, $roiunhas, $tiques,
            $altalim, $geofagia, $enurese, $pertsono, $dormepais);
        if (!$invalido)
        {
            $this->repHist->alterarHabitos($chupeta, $chupadedo, $roiunhas, $tiques, $altalim,
                $geofagia, $enurese, $pertsono, $dormepais, $obshabito, $idProntuario);
        } else
        {
            throw new CamposInvalidos();
        }
    }

    public function alterarIHP($efeitcol, $testmantoux, $obsimun, $idProntuario)
    {
/*        $invalido = $this->parametrosInvalidosIHP($efeitcol, $testmantoux);
        if (!$invalido)
        {*/
            $this->repHist->alterarImuniz($efeitcol, $testmantoux, $obsimun, $idProntuario);
/*        } else
        {
            throw new CamposInvalidos();
        }*/
    }

    public function alterarDAHP($coqueluche, $sarampo, $varicela, $parotide, $difteria,
        $tetano, $diarreia, $pneumonia, $meningite, $febrereum, $nefropatia, $tuberculose,
        $asma, $eczema, $alergia, $textalergias, $rinite, $cirurgia, $transfusoes, $hospitalizacoes,
        $tratamentos, $obsdoencasant, $idProntuario)
    {
        $invalido = $this->parametrosInvalidosDAHP($coqueluche, $sarampo, $varicela, $parotide,
            $difteria, $tetano, $diarreia, $pneumonia, $meningite, $febrereum, $nefropatia,
            $tuberculose, $asma, $eczema, $alergia, $textalergias, $rinite, $cirurgia, $transfusoes,
            $hospitalizacoes, $tratamentos);
        if (!$invalido)
        {
            $this->repHist->alterarDoencAnt($coqueluche, $sarampo, $varicela, $parotide, $difteria,
                $tetano, $diarreia, $pneumonia, $meningite, $febrereum, $nefropatia, $tuberculose,
                $asma, $eczema, $alergia, $textalergias, $rinite, $cirurgia, $transfusoes, $hospitalizacoes,
                $tratamentos, $obsdoencasant, $idProntuario);
        } else
        {
            throw new CamposInvalidos();
        }
    }

    public function alterarOIHP($doenchag, $doenesq, $expagtox, $textexpagtox, $alergmed,
        $textalergmed, $conttuberc, $obsoutinfo, $idProntuario)
    {
        $invalido = $this->parametrosInvalidosOIHP($doenchag, $doenesq, $expagtox, $textexpagtox,
            $alergmed, $textalergmed, $conttuberc);
        if (!$invalido)
        {
            $this->repHist->alterarOutrasInfo($doenchag, $doenesq, $expagtox, $textexpagtox, $alergmed,
                $textalergmed, $conttuberc, $obsoutinfo, $idProntuario);
        } else
        {
            throw new CamposInvalidos();
        }
    }
	
    private function parametrosInvalidosHF($uniaopais, $idademae, $profmae, $idadepai, $profpai, $pais, $avos, 
		$irmaos, $outros, $tiporesid, $ncomodos, $nocupantes, $agua, $saneamento, $luz, $animais) {
        //$uniaopais  == "0" || $idadepai  == "" || !is_numeric($idadepai)  || $idadepai <= 0 ||
		if ($tiporesid == "0" || (!is_numeric($nocupantes) && $nocupantes  != "") || !$agua 
			|| $saneamento == "0" || !$luz || !$animais)
            return true;
        return false;
    }

	private function parametrosInvalidosPNHP($duracaogest, $acompmed, $localam, $consultasam,
        $z21, $a53, $b18, $b58, $imunizmae, $sangmae, $medic, $anorm, $exion, $perdoencir,
        $cirurgias, $pesograv, $anemia, $alimgrav)
    {
        if ($duracaogest == "0" || $acompmed == "" || $z21 == "0" || $a53 == "0" || $b18 ==
            "0" || $b58 == "0" || $imunizmae == "0" || $sangmae == "0"  || $exion == "0" || $perdoencir == "0"
            || (!is_numeric($pesograv) && $pesograv) || $anemia == "" || $alimgrav == "0")
            return true;
        /*if ($medic == "")
            return true;*/
        if ($acompmed == "S" && ($localam == "" || $consultasam == "0"))
            return true;
        if ($perdoencir != "0" && $perdoencir != "NA"&& $perdoencir != "NT" && $cirurgias == "")
            return true;
        return false;
    }
	
	private function parametrosInvalidosNHP($tipograv, $tipoparto, $tipoapres, $durtrabparto,
        $anestesia, $analgesia, $compparto, $textcompparto)
    {
        if ($tipograv == "0" || $tipoparto == "0" || $tipoapres == "0" || $anestesia == "" || $compparto == "")
            return true;
		if (!$this->validaHora($durtrabparto))
			return true;
        if ($compparto == "S" && $textcompparto == "")
            return true;
        return false;
    }

    private function parametrosInvalidosNNHP($apgar1, $apgar5, $permnasal, $idadegest,
        $sangrn, $sinalorto, $pesoalta, $comprimento, $percef, $pertorac, $pesonasc, $vpesonasc, $testepe,
        $fenilcet, $hipotiroid, $anemiafalc, $triaaud, $PEATE, $EOA, $reanimacao, $ictericia,
        $rash, $sangramentos, $vomitos, $infeccoes, $anomcong, $paralisias, $coriza, $convulsoes)
    {
        if ($apgar1 == "0" || $apgar5 == "0" || !$permnasal || $idadegest == "0" ||
            !$sangrn || $pesoalta == "0" || !$sinalorto || $comprimento == "0" ||
            !$testepe || $percef == "0" || $triaaud == "" || $pertorac == "0" || $reanimacao ==
            "" || $permnasal == "" || $ictericia == "0" || $rash == "" ||
            $sangramentos == "" || $vomitos == "" || $infeccoes == "" || $anomcong == "" ||
            $paralisias == "" || $coriza == "" || $convulsoes == "")
            return true;
        if ($testepe == "S" && ($fenilcet == "" || $hipotiroid == "" || $anemiafalc ==
            ""))
            return true;
		if ($pesonasc == "AV" && !is_numeric($vpesonasc))
			return true;
        if ($triaaud == "S" && ($PEATE == "" || $EOA == ""))
            return true;
        return false;
    }
	
	private function parametrosInvalidosAHP($alimmatexc, $alimcomp, $alimpast, $alimfam,
        $dietatu, $refdiarias, $horaref, $usomam, $colher, $copo, $alimpastliq, $chantafet,
        $brincref)
    {
        if ($alimmatexc == "0" || $alimcomp == "0" || $alimpast == "0" || $alimfam ==
            "0" || $dietatu == "0" || $refdiarias == "0" || $horaref == "0" || $usomam == "" ||
            $colher == "" || $copo == "" || $alimpastliq == "" || $chantafet == "" || $brincref ==
            "")
            return true;
        return false;
    }

/*    private function parametrosInvalidosCDHP($relirmaos, $idadeescola, $aprendizado,
        $repetano, $relacol, $particfala, $muddent)
    {
        if ($idadeescola == "0")
            return true;
        return false;
    }*/

    private function parametrosInvalidosHHP($chupeta, $chupadedo, $roiunhas, $tiques,
        $altalim, $geofagia, $enurese, $pertsono, $dormepais)
    {
        if ($chupeta == "" || $chupadedo == "" || $roiunhas == "" || $tiques == "" || $altalim ==
            "" || $geofagia == "" || $enurese == "" || $pertsono == "" || $dormepais == "")
            return true;
        return false;
    }
	
	private function parametrosInvalidosDAHP($coqueluche, $sarampo, $varicela, $parotide,
        $difteria, $tetano, $diarreia, $pneumonia, $meningite, $febrereum, $nefropatia,
        $tuberculose, $asma, $eczema, $alergia, $textalergias, $rinite, $cirurgia, $transfusoes,
        $hospitalizacoes, $tratamentos)
    {
        if ($coqueluche == "" || $sarampo == "" || $varicela == "" || $parotide == "" || $difteria == "" || $tetano == "" ||
			$diarreia == "" || $pneumonia == "" || $meningite == "" || $febrereum == "" || $nefropatia == "" || $tuberculose == "" 
			|| $asma == "" || $eczema == "" || $alergia == "" || $rinite == "" || $cirurgia == "" || $transfusoes == "" || 
			$hospitalizacoes == "" )
            	return true;
        if ($alergia == "S" && $textalergias == "")
            return true;
        return false;
    }
	
    private function parametrosInvalidosOIHP($doenchag, $doenesq, $expagtox, $textexpagtox,
        $alergmed, $textalergmed, $conttuberc)
    {
        if ($doenchag == "" || $doenesq == "" || $expagtox == "" || $alergmed == "" || $conttuberc == "")
            return true;
        if ($expagtox == "S" && $textexpagtox == "")
            return true;
        if ($alergmed == "S" && $textalergmed == "")
            return true;
        return false;
    }

    private function parametrosInvalidosVacina($vacinanome, $vacinadose, $datavacina, $dtnasc)
    {
        if ($vacinanome == "0" || $vacinadose == "0")
            return true;
		if ($this->validaDataVac($datavacina, $dtnasc))
            return true;
        return false;
    }

	function validaDataVac($data, $dtnasc){
		if ($data == "") return "Preencha uma data";
		$ano = date(Y);
		if (checkdate(substr($data, 3, 2), substr($data, 0, 2), substr($data, 6, 4))){
			if (substr($data, 6, 4) > $ano)
				return "Voc&ecirc; n&atilde;o pode inserir uma data futura";
			else if (substr($data, 6, 4) == $ano){
				if (substr($data, 3, 2) > date(m))
					return "Voc&ecirc; n&atilde;o pode inserir uma data futura";
				else if ((substr($data, 3, 2) == date(m)) && (substr($data, 0, 2) > date(d)))
					return "Voc&ecirc; n&atilde;o pode inserir uma data futura";
			}
			
			if (substr($data, 6, 4) < substr($dtnasc, 0, 4))
				return "Voc&ecirc; deve inserir datas a partir da data de nascimento do paciente";
			else if (substr($data, 6, 4) == substr($dtnasc, 0, 4)){
				if (substr($data, 3, 2) < substr($dtnasc, 5, 2))
					return "Voc&ecirc; deve inserir datas a partir da data de nascimento do paciente";
				else if ((substr($data, 3, 2) == substr($dtnasc, 5, 2)) && (substr($data, 0, 2) < substr($dtnasc, 8, 2)))
					return "Voc&ecirc; deve inserir datas a partir da data de nascimento do paciente";
			}
			return "";
		} 
		return "Preencha uma data v&aacute;lida";
	}
	
	function validaHora($hora){
		if ($hora == "") return true;
		return preg_match("/([0-1][0-9]|[2][0-3])|([0-9]):[0-5][0-9]$/", $hora);
	}
	
    public function __destruct() {}
}

?>