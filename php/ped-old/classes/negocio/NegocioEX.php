<?php
include_once("classes/repositorio/RepositorioEX.php");

class NegocioEX {

	private $repEX;

	public function __construct() {
		$this->repEX = new repositorioEX();

	}

	public function getEX($idAtendimento) {
        return $this->repEX->getEX($idAtendimento);
    }	
	
	public function getAbasSalvasExame($idAtendimento) {
        return $this->repEX->getAbasSalvasExame($idAtendimento);
    }	

	public function assinarEX($assinar, $idAtendimento, $idAluno) {
        if ($assinar) $this->repEX->assinar($idAtendimento, $idAluno);
    }
	
	public function EXAssinado($idAtendimento) {
        return $this->repEX->EXAssinado($idAtendimento);
    }	

	/*public function assinar($assinar, $idAtendimento, $idAluno,$assinaturaExame ) {
		if ($assinar ){
			$this->repEX->assinar($idAtendimento, $idAluno);
		}
	}
	public function adendo($adendo, $idAtendimento, $idAluno) {
		if ($adendo->getAdendo() != "")
		$adendo->inserirAdendoEX($idAtendimento, $idAluno);
		else
		throw new CamposInvalidos();
	}*/

	public function alterarIEX($estger, $tdoenc, $aspdoenc, $desfis, $nutricao, $coop, $deffis, $anorpt, $obsins, 
		$atend){
		$this->repEX->inspecao($estger, $tdoenc, $aspdoenc, $desfis, $nutricao, $coop, $deffis, $anorpt, $obsins, 
			$atend);
	}

	public function alterarPeEX($corpele, $umidpele, $temppele, $cicatriz, $hemorr, $rash, $circcol, $edemapele,
	$consun,$defun,$mancun,$influn, $obsepele, $atend){
		$this->repEX->pele($corpele, $umidpele, $temppele, $cicatriz, $hemorr, $rash, $circcol, $edemapele,
		$consun, $defun,$mancun,$influn, $obsepele, $atend);
	}

	public function alterarGEX($ganglinf, $obsegang, $atend){
		$this->repEX->ganglios($ganglinf, $obsegang, $atend);
	}

	public function alterarPuEX($ppub, $mamaspub, $voltest, $genit, $obseantrop, $atend){
		$this->repEX->puberal($ppub, $mamaspub, $voltest, $genit, $obseantrop, $atend);
	}

	public function alterarDEX($brvm,$orpp,$paqos,$rscs, $pblco, $scopo,$bcvtc,$bcmlb,$bmfsa,$vrs, $absf,$qeabtl,$bfssa,$cae,$pomo,
	$epd,$rspm,$bpfpca,$bpacda,$pfudp, $cas,$cbld,$qcs,$gehmd,$cfbqc,$ffs,$dtvp,$csde, $pasv,$acxc, $secac, $cpnt,$gboc,$vests,
	$ffcc,$pmpq, $iaaif, $obsdes, $atend){
		$this->repEX->desenvolvimento($brvm,$orpp,$paqos,$rscs, $pblco,$scopo, $bcvtc,$bcmlb,$bmfsa,$vrs,$absf,$qeabtl,$bfssa,$cae,
		$pomo,$epd, $rspm,$bpfpca,$bpacda,$pfudp, $cas,$cbld, $qcs,$gehmd,$cfbqc,$ffs,$dtvp,$csde, $pasv,$acxc, $secac,$cpnt,
		$gboc,$vests, $ffcc, $pmpq,$iaaif, $obsdes, $atend);
	}

	public function alterarCEX($tamcr,$formcr,$fontan,$sutu,$craneo,$cabelo,$lescab,$obscran,$atend){
		$this->repEX->cranio($tamcr,$formcr,$fontan,$sutu,$craneo,$cabelo, $lescab,$obscran,$atend);
	}
	
	public function alterarMedind($peso, $pesoin, $altura, $alturain, $permcef, $permtora, $permab, 
		$pregatric, $pregasubesc, $atend){
        $invalido = $this->parametrosInvalidosMD($peso, $pesoin, $altura, $alturain, $permcef, $permtora, $permab, 
			$pregatric, $pregasubesc);
        if (!$invalido) {
            if ($pesoin == "0") $pesoin = "\0";
			if ($alturain == "0") $alturain = "\0";
            if ($permcef == "0") $permcef = "\0";
			if ($permtora == "0") $permtora = "\0";
            if ($permab == "0") $permab = "\0";
			if ($pregatric == "0") $pregatric = "\0";
            if ($pregasubesc == "0") $pregasubesc = "\0";
			$this->repEX->alterarMedind($peso, $pesoin, $altura, $alturain, $permcef, $permtora, $permab, $pregatric, 
				$pregasubesc, $atend);
        } else {
            throw new CamposInvalidos();
        }
	}
	
    private function parametrosInvalidosMD($peso, $pesoin, $altura, $alturain, $permcef, $permtora, $permab, 
		$pregatric, $pregasubesc) {
        if (($peso == "AV" && !is_numeric($pesoin)) || ($altura == "AV" && !is_numeric($alturain)) || 
			!is_numeric($permcef) || !is_numeric($permtora) || !is_numeric($permab) || !is_numeric($pregatric) ||
			!is_numeric($pregasubesc))
            return true;
        return false;
    }
	
	public function alterarOEX($ptose,$edpalp,$corol,$hemorol,$secrol,$inflol,$cilios,$movocan,$pupila,$acvis,$obsolho,$atend){
		$this->repEX->olhos($ptose,$edpalp,$corol,$hemorol,$secrol, $inflol, $cilios, $movocan,$pupila,$acvis,$obsolho,$atend);
	}

	public function alterarSOEX($posorel, $formorel, $dororel, $edmast, $caudex, $secrorel, $otoscop,
	$batnariz, $secrna, $tumorna, $rinosc, $corlab, $umidlab, $eruplab, $fislab, $maslab, $corgeng, $hemorge, $corli, $umidli,
	$exsuli,$tremli,$tumorac, $numdent, $impldent, $consdent, $corfar, $exsufar, $obsotor, $atend){
		$this->repEX->sistotor($posorel, $formorel, $dororel, $edmast, $caudex, $secrorel, $otoscop, $batnariz,
		$secrna, $tumorna, $rinosc, $corlab, $umidlab, $eruplab, $fislab, $maslab, $corgeng, $hemorge, $corli, $umidli,$exsuli,
		$tremli, $tumorac, $numdent, $impldent, $consdent, $corfar, $exsufar, $obsotor, $atend);
	}

	public function alterarPsEX($retrpesc, $torcpesc, $clavpesc,$tirepesc,$mastum, $fistpesc, $rigidpesc, $fosspesc, $obspesc,
	$atend){
		$this->repEX->pescoco($retrpesc, $torcpesc, $clavpesc,$tirepesc,$mastum, $fistpesc, $rigidpesc, $fosspesc, $obspesc,$atend);
	}

	public function alterarRpEX($formtor, $simtor, $contorn, $proem, $masanorrsp, $mamasrsp, $tresp, $tirint,$freqresp, $fremtrvc,
	$frembronq, $frempleu, $submac, $macic, $timpan, $murves,$estert,$estrid, $sibilos, $atpleu, $obsresp, $atend){
		$this->repEX->respiratorio($formtor, $simtor, $contorn, $proem, $masanorrsp, $mamasrsp, $tresp, $tirint,$freqresp,$fremtrvc,
		$frembronq, $frempleu, $submac, $macic, $timpan, $murves,$estert, $estrid, $sibilos, $atpleu, $obsresp, $atend);
	}

	public function alterarCVEX($precord, $ictcrdi, $ictcrdp, $artper, $bulhas, $sopros,$pressaoart, $pressaoartin, 
		$freqcard, $freqcardin, $obscdvs, $atend){
        $invalido = $this->parametrosInvalidosCV($pressaoart, $pressaoartin, $freqcard, $freqcardin);
        if (!$invalido) {
			//if($pressaoartin == "0") $pressaoartin == "\0";
			if($freqcardin == "0") $freqcardin == "\0";
			$this->repEX->cardVasc($precord, $ictcrdi, $ictcrdp, $artper, $bulhas, $sopros, $pressaoart, 
				$pressaoartin, $freqcard, $freqcardin, $obscdvs, $atend);
		} else {
            throw new CamposInvalidos();
        }
		
	}

	private function parametrosInvalidosCV($pressaoart, $pressaoartin, $freqcard, $freqcardin) {
        if (($pressaoart == "AV" && !ereg("^([0-2][0-9])/([0-9])$", $pressaoartin)) || ($freqcard == "AV" && 
			!is_numeric($freqcardin)))
            return true;
        return false;
    }
	
	public function alterarGIEX($formabd, $cicumb, $peristal, $distens, $tumorgt, $ondfluid,$timpgt,$parmusc,$espasmo,$rigidgt,
	$dorgt, $estomago, $figado, $baco,$rins, $mastumgt,$hernias,$rhidaer, $obsgtint, $atend){
		$this->repEX->gastInt($formabd, $cicumb, $peristal, $distens, $tumorgt, $ondfluid, $timpgt, $parmusc, $espasmo,$rigidgt,
		$dorgt, $estomago, $figado, $baco,$rins, $mastumgt, $hernias, $rhidaer, $obsgtint, $atend);
	}
	
	public function alterarMedEX($permcef, $permtora, $permab, $pregatric,$pregasubesc,$atend){
		$this->repEX->medind($permcef, $permtora, $permab, $pregatric,$pregasubesc,$atend);
	}

	public function alterarGUEX($sexo, $peqlab, $himen, $secrvag, $fimose, $circunc, $hidroc,$varic,$testic,$secruret,$pelos,
	$lojren, $bexiga, $aspgen,$anus,$obsgen,$atend){
		if ($sexo == "M"){
			$this->repEX->genUrinM($fimose, $circunc, $hidroc,$varic,$testic,$secruret,$pelos, $lojren, $bexiga, $aspgen,$anus,
			$obsgen,$atend);
		} else if ($sexo == "F"){ 
			$this->repEX->genUrinF($peqlab, $himen, $secrvag, $secruret,$pelos, $lojren, $bexiga, $aspgen,$anus,$obsgen,$atend);
		}
	}

	public function alterarMEEX($anommusc,$deformmusc, $edemamusc, $tumomusc, $forcmusc,$dorossea,$movativ,$movpas,$escoliose,
	$lordose, $cifose, $curvfr, $espmusc, $dorlocmusc,$dorrefmusc,$obsmusc,$atend){
		$this->repEX->muscEsq($anommusc, $deformmusc, $edemamusc, $tumomusc, $forcmusc, $dorossea, $movativ, $movpas,$escoliose,
		$lordose, $cifose, $curvfr, $espmusc, $dorlocmusc,$dorrefmusc,$obsmusc,$atend);
	}

	public function alterarNEX($avnivconsc, $orientnerv, $sinfocc, $obsnerv, $atend){
		$this->repEX->nervoso($avnivconsc, $orientnerv, $sinfocc, $obsnerv, $atend);
	}

	/*    private function parametrosInvalidosGIS($febre, $peso, $atividade, $apetite) {
	 if ($febre == "" || $peso == "0" || $atividade == "" || $apetite == "0")
	 return true;
	 return false;
	 }

	 private function parametrosInvalidosPIS($rash, $ictericia, $infeccoes) {
	 if ($rash == "0" || $ictericia == "0" || $infeccoes == "")
	 return true;
	 return false;
	 }

	 private function parametrosInvalidosOLIS($fotofobia, $lacrimejamento, $edema, $secrecao, $dor, $acuidade) {
	 if ($fotofobia == "" || $lacrimejamento == "" || $edema == "" || $secrecao == "" || $dor == "0" || $acuidade ==
	 "0")
	 return true;
	 return false;
	 }

	 private function parametrosInvalidosOUIS($infeccoes, $secrecao, $dor, $acuidade) {
	 if ($infeccoes == "" || $secrecao == "" || $dor == "0" || $acuidade == "0")
	 return true;
	 return false;
	 }

	 private function parametrosInvalidosRIS($epistaxe, $resfriados, $dortoracica, $dificresp, $hemoptise, $sufocacao, $corrnasal,
	 $tosse, $durtosse, $tipotosse, $pertosse) {
	 if ($epistaxe == "" || $resfriados == "" || $dortoracica == "" || $dificresp == "" || $hemoptise == "" || $sufocacao ==
	 "" || $corrnasal == "" || $tosse == "")
	 return true;
	 if ($tosse == "P" && ($durtosse == "" || $tipotosse == "" || $pertosse == ""))
	 return true;
	 return false;
	 }

	 private function parametrosInvalidosCVIS($dispneia, $palpitacao, $taquicardia, $cianose) {
	 if ($dispneia == "" || $palpitacao == "" || $taquicardia == "" || $cianose == "0")
	 return true;
	 return false;
	 }

	 private function parametrosInvalidosGIIS($dorabdominal, $vomitos, $nauseas, $tenesmo, $evacuacao, $aspfezes, $nfezes) {
	 if ($dorabdominal == "" || $vomitos == "" || $nauseas == "" || $tenesmo == "" || $evacuacao == "")
	 return true;
	 if ($evacuacao != "NA" && ($durtosse == "0" || $nfezes == "" || !is_numeric($nfezes)))
	 return true;
	 return false;
	 }

	 private function parametrosInvalidosGUISM($qtdurina, $jatourina, $corurina, $odorurina, $frequrina, $urgurina, $corruretral,
	 $corcorruretral, $odorcorruretral, $disuria, $ativsexual, $pubarca, $voltesticular, $tampenis, $polucoes, $erecoes) {
	 if ($qtdurina == "0" || $jatourina == "0" || $corurina == "0" || $odorurina == "0" || $frequrina == "0" || $urgurina ==
	 "" || $corruretral == "" || $disuria == "" || $ativsexual == "" || $pubarca == "0")
	 return true;
	 if ($corruretral == "P" && ($corcorruretral == "0" || $odorcoruretral == "0"))
	 return true;
	 if ($voltesticular == "0" || $tampenis == "0" || $polucoes == "" || $erecoes == "")
	 return true;
	 return false;
	 }

	 private function parametrosInvalidosGUISF($qtdurina, $jatourina, $corurina, $odorurina, $frequrina, $urgurina, $corruretral,
	 $corcorruretral, $odorcorruretral, $disuria, $ativsexual, $pubarca, $corrvaginal, $corcorrvaginal, $odorcorrvaginal,
	 $prucorrvaginal, $telarca, $menstruacao, $menarca, $regularidade, $fluxo) {
	 if ($qtdurina == "0" || $jatourina == "0" || $corurina == "0" || $odorurina == "0" || $frequrina == "0" || $urgurina ==
	 "" || $corruretral == "" || $disuria == "" || $ativsexual == "" || $pubarca == "0")
	 return true;
	 if ($corruretral == "P" && ($corcorruretral == "" || $odorcorruretral == ""))
	 return true;
	 if ($corrvaginal == "" || $telarca == "0" || $menstruacao == "")
	 return true;
	 if ($corrvaginal == "P" && ($corcorrvaginal == "0" || $odorcorrvaginal == "0" || $prucorrvaginal == ""))
	 return true;
	 if ($menstruacao == "P" && ($menarca == "0" || $regularidade == "0" || $fluxo == "0"))
	 return true;
	 return false;
	 }

	 private function parametrosInvalidosMEIS($deformidades, $tumefacoes, $dorossea, $fraqmusc) {
	 if ($deformidades == "" || $tumefacoes == "" || $dorossea == "" || $fraqmusc == "")
	 return true;
	 return false;
	 }

	 private function parametrosInvalidosNIS($cefaleia, $tonturas, $convulsoes, $traumascranianos, $sincopes, $paresias,
	 $paralisias, $retardoneurom, $tipo1, $tipo2) {
	 if ($cefaleia == "" || $tonturas == "" || $convulsoes == "" || $traumascranianos == "" || $sincopes == "" || $paresias ==
	 "" || $paralisias == "" || $retardoneurom == "")
	 return true;
	 if ($convulsoes == "F" && ($tipo1 == "" || $tipo2 == ""))
	 return true;
	 return false;
	 }*/

	public function __destruct() {
	}

} ?>
