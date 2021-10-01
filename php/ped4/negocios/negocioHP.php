<?php
include ("classes/repositorioHP.php");

class NegocioHP
{

    private $repHP;

    public function __construct(){
        $this->repHP = new repositorioHP();
    }

    public function assinarHP($assinatura, $idProntuario){
        if ($assinatura)
            $this->repHP->assinar($idProntuario);
    }

	public function adendo($adendo, $idProntuario, $idAluno){
		if ($adendo->getAdendo() != ""){
			$adendo->inserirAdendoHP($idProntuario, $idAluno);
		} else {
			throw new CamposInvalidos();
		}
	}

    public function inserirVacina($vacinanome, $vacinadose, $datavacina, $dtnasc, $idProntuario){
        $invalido = $this->parametrosInvalidosVacina($vacinanome, $vacinadose, $datavacina, $dtnasc);

        if (!$invalido){
			if (!$this->repHP->vacinaHasDose($vacinanome, $vacinadose, $idProntuario)){
				$data = substr($datavacina, 6, 4)."-".substr($datavacina, 3, 2)."-".substr($datavacina, 0, 2);
				$this->repHP->inserirVacina($vacinanome, $vacinadose, $data, $idProntuario);
			} else {
            	throw new DoseInvalida();
        	}
        } else {
            throw new CamposInvalidos();
        }
    }
	
	public function removerVacina( $vacina, $dose, $idProntuario){
       
        
				
				$this->repHP->removerVacina($vacina, $dose, $idProntuario);
		
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
            $this->repHP->alterarPNatal($acompmed, $consultas, $local, $durgestacao, $sangmae,
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
            $this->repHP->alterarNatal($tipograv, $tipoparto, $tipoapres, $durtrabparto, $anestesia,
                $analgesia, $compparto, $textcompparto, $obsnatal, $idProntuario);
        } else
        {
            throw new CamposInvalidos();
        }
    }

    public function alterarNNHP($apgar1, $apgar5, $permnasal, $idadegest, $sangrn, $sinalorto,
        $pesoalta, $comprimento, $percef, $pertorac, $pesonasc, $testepe, $fenilcet, $hipotiroid,
        $anemiafalc, $triaaud, $PEATE, $EOA, $reanimacao, $ictericia, $rash, $sangramentos,
        $vomitos, $infeccoes, $anomcong, $paralisias, $coriza, $convulsoes, $obsneonat,$pesoAtual,$alturaAtual,
        $idProntuario)
    {
        $invalido = $this->parametrosInvalidosNNHP($apgar1, $apgar5, $permnasal, $idadegest,
            $sangrn, $sinalorto, $pesoalta, $comprimento, $percef, $pertorac, $pesonasc, $testepe,
            $fenilcet, $hipotiroid, $anemiafalc, $triaaud, $PEATE, $EOA, $reanimacao, $ictericia,
            $rash, $sangramentos, $vomitos, $infeccoes, $anomcong, $paralisias, $coriza, $convulsoes);
        if (!$invalido)
        {
			    $this->repHP->alterarNeoNatal($apgar1, $apgar5, $permnasal, $idadegest, $sangrn,
                $sinalorto, $pesoalta, $comprimento, $percef, $pertorac, $pesonasc, $testepe, $fenilcet,
                $hipotiroid, $anemiafalc, $triaaud, $PEATE, $EOA, $reanimacao, $ictericia, $rash,
                $sangramentos, $vomitos, $infeccoes, $anomcong, $paralisias, $coriza, $convulsoes,
                $obsneonat,$pesoAtual,$alturaAtual, $idProntuario);
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
        if (!$invalido)
        {
            $this->repHP->alterarAliment($alimmatexc, $alimcomp, $alimpast, $alimfam, $dietatu,
                $refdiarias, $horaref, $usomam, $colher, $copo, $alimpastliq, $chantafet, $brincref,
                $obsaliment, $idProntuario);
        } else
        {
            throw new CamposInvalidos();
        }
    }

    public function alterarCDHP($relirmaos, $idadeescola, $aprendizado, $repetano, $relacol,
        $particfala, $muddent, $obscrescdes, $idProntuario)
    {
        $invalido = $this->parametrosInvalidosCDHP($relirmaos, $idadeescola, $aprendizado,
            $repetano, $relacol, $particfala, $muddent);
        if (!$invalido)
        {
            $this->repHP->alterarCrescDes($relirmaos, $idadeescola, $aprendizado, $repetano,
                $relacol, $particfala, $muddent, $obscrescdes, $idProntuario);
        } else
        {
            throw new CamposInvalidos();
        }
    }

    public function alterarHHP($chupeta, $chupadedo, $roiunhas, $tiques, $altalim, $geofagia,
        $enurese, $pertsono, $dormepais, $obshabito, $idProntuario)
    {
        $invalido = $this->parametrosInvalidosHHP($chupeta, $chupadedo, $roiunhas, $tiques,
            $altalim, $geofagia, $enurese, $pertsono, $dormepais);
        if (!$invalido)
        {
            $this->repHP->alterarHabitos($chupeta, $chupadedo, $roiunhas, $tiques, $altalim,
                $geofagia, $enurese, $pertsono, $dormepais, $obshabito, $idProntuario);
        } else
        {
            throw new CamposInvalidos();
        }
    }

    public function alterarIHP($efeitcol, $testmantoux, $obsimun, $idProntuario)
    {
        $invalido = $this->parametrosInvalidosIHP($efeitcol, $testmantoux);
        if (!$invalido)
        {
            $this->repHP->alterarImuniz($efeitcol, $testmantoux, $obsimun, $idProntuario);
        } else
        {
            throw new CamposInvalidos();
        }
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
            $this->repHP->alterarDoencAnt($coqueluche, $sarampo, $varicela, $parotide, $difteria,
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
            $this->repHP->alterarOutrasInfo($doenchag, $doenesq, $expagtox, $textexpagtox, $alergmed,
                $textalergmed, $conttuberc, $obsoutinfo, $idProntuario);
        } else
        {
            throw new CamposInvalidos();
        }
    }

    private function parametrosInvalidosVacina($vacinanome, $vacinadose, $datavacina, $dtnasc)
    {
        if ($vacinanome == "0" || $vacinadose == "0")
            return true;
		if (validaDataVac($datavacina, $dtnasc) != "")
            return true;
        return false;
    }

    private function parametrosInvalidosPNHP($duracaogest, $acompmed, $localam, $consultasam,
        $z21, $a53, $b18, $b58, $imunizmae, $sangmae, $medic, $anorm, $exion, $perdoencir,
        $cirurgias, $pesograv, $anemia, $alimgrav)
    {
        if ($duracaogest == "0" || $acompmed == "" || $z21 == "0" || $a53 == "0" || $b18 ==
            "0" || $b58 == "0" || $imunizmae == "0" || $sangmae == "0"  || $exion == "0" || $perdoencir == "0"
            || $anemia == "" || $alimgrav == "0")
            return true;
        if ($acompmed == "S" && ($localam == "" || $consultasam == "0"))
            return true;
        if ($perdoencir != "0" && $perdoencir != "NA"&& $perdoencir != "NT" && $cirurgias == "")
            return true;
        return false;
    }

    private function parametrosInvalidosNNHP($apgar1, $apgar5, $permnasal, $idadegest,
        $sangrn, $sinalorto, $pesoalta, $comprimento, $percef, $pertorac, $pesonasc, $testepe,
        $fenilcet, $hipotiroid, $anemiafalc, $triaaud, $PEATE, $EOA, $reanimacao, $ictericia,
        $rash, $sangramentos, $vomitos, $infeccoes, $anomcong, $paralisias, $coriza, $convulsoes)
    {
        if ($apgar1 == "0" || $apgar5 == "0" || $permnasal == "" || $idadegest == "0" ||
            $sangrn == "" || $pesoalta == "0" || $sinalorto == "" || $comprimento == "0" ||
            $testepe == "" || $percef == "0" || $triaaud == "" || $pertorac == "0" || $reanimacao ==
            "" || $pesonasc == "0" || $permnasal == "" || $ictericia == "0" || $rash == "" ||
            $sangramentos == "" || $vomitos == "" || $infeccoes == "" || $anomcong == "" ||
            $paralisias == "" || $coriza == "" || $convulsoes == "")
            return true;
        if ($testepe == "S" && ($fenilcet == "" || $hipotiroid == "" || $anemiafalc ==
            ""))
            return true;
        if ($triaaud == "S" && ($PEATE == "" || $EOA == ""))
            return true;
        return false;
    }

    private function parametrosInvalidosNHP($tipograv, $tipoparto, $tipoapres, $durtrabparto,
        $anestesia, $analgesia, $compparto, $textcompparto)
    {
        if ($tipograv == "0" || $tipoparto == "0" || $tipoapres == "0" || $anestesia == "" || $compparto == "")
            return true;
		if (!validaHora($durtrabparto))
			return true;
        if ($compparto == "S" && $textcompparto == "")
            return true;
        return false;
    }

    private function parametrosInvalidosIHP($efeitcol, $testmantoux)
    {
        if ($testmantoux == "") return true;
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

    private function parametrosInvalidosCDHP($relirmaos, $idadeescola, $aprendizado,
        $repetano, $relacol, $particfala, $muddent)
    {
/*        if ($idadeescola == "0")
            return true;*/
        return false;
    }

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
        if ($alergia == "SP" && $textalergias == "")
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

    public function __destruct()
    {
    }

} ?>