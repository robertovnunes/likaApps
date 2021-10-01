<?php

include ("negocios/negocioPaciente.php");
include ("negocios/negocioInformante.php");
include ("negocios/negocioQPDHDA.php");
include ("negocios/negocioIS.php");
include ("negocios/negocioHP.php");
include ("negocios/negocioHF.php");
include ("negocios/negocioCH.php");
include ("negocios/negocioEX.php");

class CamposInvalidos extends Exception {}
class DoseInvalida extends Exception {}

class Fachada {

    private $negPaciente;
    private $negInformante;
    private $negQPDHDA;
    private $negIS;
    private $negHP;
    private $negHF;
    private $negCD;
	private $negEX;

    public function __construct() {
        $this->negPaciente = new negocioPaciente();
        $this->negInformante = new negocioInformante();
        $this->negQPDHDA = new negocioQPDHDA();
        $this->negIS = new negocioIS();
        $this->negHP = new negocioHP();
        $this->negHF = new negocioHF();
        $this->negCH = new negocioCH();
		$this->negEX = new negocioEX();
    }

    public function cadastrarPaciente($paciente, $login) {
       return  $this->negPaciente->cadastrar($paciente, $login);
    }

    public function alterarPaciente($paciente, $idProntuario) {
        $this->negPaciente->alterar($paciente, $idProntuario);
    }

	public function existe($paciente){
		$existe = false;
		if($paciente->getCpf() != ""){
			if(buscaPacienteCpf($paciente->getCpf())->cpf != "")  $existe = true;
		}else {
			if(buscaPacienteHash($paciente->getHashNome())->hashnome !="") $existe = true;
		}
		
		return $existe;
	}

    public function novoAtendimento($idAluno, $idProntuario, $sexo) {
        $this->negPaciente->novoAtendimento($idAluno, $idProntuario, $sexo);
    }

    public function inserirInformante($informante, $idAtendimento) {
        $this->negInformante->alterar($informante, $idAtendimento);
    }

    public function inserirQPDHDA($qpdhda, $idAtendimento, $assinar, $idAluno) {
        $this->negQPDHDA->alterar($qpdhda, $idAtendimento, $assinar, $idAluno);
    }

    public function adendoQH($adendo, $idAtendimento, $idAluno) {
        $this->negQPDHDA->adendo($adendo, $idAtendimento, $idAluno);
    }

    public function adendoIS($adendo, $idAtendimento, $idAluno) {
        $this->negIS->adendo($adendo, $idAtendimento, $idAluno);
    }

    public function assinarIS($assinar, $idAtendimento, $idAluno) {
        $this->negIS->assinarIS($assinar, $idAtendimento, $idAluno);
    }

	public function inserirMedindEX($peso,$pesoin, $altura,$alturain, $permcef, $permtora, $permab, $pregatric, $pregasubesc, $atend){
		$this->negEX->alterarMedind($peso,$pesoin, $altura,$alturain, $permcef, $permtora, $permab, $pregatric, $pregasubesc, $atend);
	}

    public function inserirGeralIS($febre, $altpeso, $atividade, $apetite, $obsgeral,
        $idAtendimento) {
        $this->negIS->alterarGIS($febre, $altpeso, $atividade, $apetite, $obsgeral, $idAtendimento);
    }

    public function inserirPeleIS($rash, $ictericia, $infecrep, $obspele, $idAtendimento) {
        $this->negIS->alterarPIS($rash, $ictericia, $infecrep, $obspele, $idAtendimento);
    }

    public function inserirOlhosIS($fotofobia, $lacrim, $edemapalp, $secrecaool, $dorolho,
        $acuidvis, $obsolho, $idAtendimento) {
        $this->negIS->alterarOLIS($fotofobia, $lacrim, $edemapalp, $secrecaool, $dorolho,
            $acuidvis, $obsolho, $idAtendimento);
    }

    public function inserirOuvidosIS($inffreq, $secrecaoou, $dorouvido, $acuidaud, $obsouvido,
        $idAtendimento) {
        $this->negIS->alterarOUIS($inffreq, $secrecaoou, $dorouvido, $acuidaud, $obsouvido,
            $idAtendimento);
    }

    public function inserirRespIS($corrnasal, $sufocacao, $epistaxe, $tosse, $difresp,
        $durtosse, $tipotosse, $pertosse, $resffreq, $dortorac, $hemoptise, $obsresp, $idAtendimento) {
        $this->negIS->alterarRIS($corrnasal, $sufocacao, $epistaxe, $tosse, $difresp, $durtosse,
            $tipotosse, $pertosse, $resffreq, $dortorac, $hemoptise, $obsresp, $idAtendimento);
    }

    public function inserirCardVascIS($dispneia, $cianose, $palpitacao, $taquicardia,
        $obscardvasc, $idAtendimento) {
        $this->negIS->alterarCVIS($dispneia, $cianose, $palpitacao, $taquicardia, $obscardvasc,
            $idAtendimento);
    }

    public function inserirGastIntIS($nauseas, $dorabdom, $vomitos, $tenesmo, $evacuacao,
        $aspfezes, $nfezes, $obsgastint, $idAtendimento) {
        $this->negIS->alterarGIIS($nauseas, $dorabdom, $vomitos, $tenesmo, $evacuacao, $aspfezes,
            $nfezes, $obsgastint, $idAtendimento);
    }
	
	

    public function inserirGenUriIS($sexo, $qtdurina, $jatourina, $corurina, $odorurina,
        $frequrina, $urgurina, $coorure, $corcorrure, $odorcorrure, $disuria, $atsexual,
        $voltestic, $tampenis, $pubarcah, $polucoes, $erecao, $corrvag, $corcorrvag, $odorcorrvag,
        $prucorrvag, $telarca, $pubarcam, $histmenst, $menarca, $regularidade, $fluxo, $obsgenuri,
        $idAtendimento) {
        $this->negIS->alterarGUIS($sexo, $qtdurina, $jatourina, $corurina, $odorurina, $frequrina,
            $urgurina, $coorure, $corcorrure, $odorcorrure, $disuria, $atsexual, $voltestic,
            $tampenis, $pubarcah, $polucoes, $erecao, $corrvag, $corcorrvag, $odorcorrvag, $prucorrvag,
            $telarca, $pubarcam, $histmenst, $menarca, $regularidade, $fluxo, $obsgenuri, $idAtendimento);
    }

    public function inserirMuscEsqIS($deform, $tumefacoes, $fraqmusc, $dorossea, $obsmuscesq,
        $idAtendimento) {
        $this->negIS->alterarMEIS($deform, $tumefacoes, $fraqmusc, $dorossea, $obsmuscesq,
            $idAtendimento);
    }

    public function inserirNervIS($cefaleia, $tonturas, $convulsoes, $conv1, $conv2,
        $traumacran, $sincopes, $paresias, $paralisias, $retneurpsi, $obssistnerv, $idAtendimento) {
        $this->negIS->alterarNIS($cefaleia, $tonturas, $convulsoes, $conv1, $conv2, $traumacran,
            $sincopes, $paresias, $paralisias, $retneurpsi, $obssistnerv, $idAtendimento);
    }

	public function inserirInspecaoEX($estger, $tdoenc, $aspdoenc, $desfis,$nutricao, $coop,$facies,$deffis,$anorpt,$obsins,$atend){
		$this->negEX->alterarIEX($estger, $tdoenc, $aspdoenc, $desfis, $nutricao, $coop,$facies,$deffis,$anorpt,$obsins, $atend);
	}							
	
	public function inserirPeleEX($corpele, $textpele, $umidpele, $temppele, $cicatriz, $descam, $hemorr,$rash,$circcol, $edemapele,
		$consun,$defun,$mancun,$influn, $obsepele, $atend){
		$this->negEX->alterarPeEX($corpele, $textpele, $umidpele, $temppele, $cicatriz, $descam, $hemorr, $rash,$circcol,$edemapele,
			$consun, $defun,$mancun,$influn, $obsepele, $atend);
	}
	
	public function inserirGangliosEX($ganglinf, $obsegang, $atend){
		$this->negEX->alterarGEX($ganglinf, $obsegang, $atend);
	}
	
	
	
	public function inserirPuberalEX($ppub, $mamaspub, $voltest, $genit, $obseantrop, $atend){
		$this->negEX->alterarPuEX($ppub, $mamaspub, $voltest, $genit, $obseantrop, $atend);
	}
	
	public function inserirDesenvolvimentoEX($brvm,$orpp,$paqos,$rscs, $pblco, $scopo,$bcvtc,$bcmlb,$bmfsa,$vrs, $absf,$qeabtl, 
		$bfssa,$cae,$pomo,$epd,$rspm,$bpfpca,$bpacda,$pfudp, $cas,$cbld,$qcs,$gehmd,$cfbqc,$ffs,$dtvp,$csde, $pasv,$acxc, $secac,
		$cpnt,$gboc,$vests,$ffcc,$pmpq,	$iaaif, $obsdes, $atend){
		$this->negEX->alterarDEX($brvm,$orpp,$paqos,$rscs, $pblco,$scopo, $bcvtc,$bcmlb,$bmfsa,$vrs,$absf,$qeabtl,$bfssa,$cae,$pomo,
			$epd, $rspm,$bpfpca,$bpacda,$pfudp, $cas,$cbld, $qcs,$gehmd,$cfbqc,$ffs,$dtvp,$csde, $pasv,$acxc, $secac,$cpnt,$gboc,
			$vests, $ffcc, $pmpq,$iaaif, $obsdes, $atend);
	}
	
	public function inserirCranioEX($tamcr,$formcr,$fontan,$sutu,$craneo,$cabelo,$lescab,$obscran,$atend){
		$this->negEX->alterarCEX($tamcr,$formcr,$fontan,$sutu,$craneo,$cabelo, $lescab,$obscran,$atend);
	}
	
	public function inserirOlhosEX($ptose,$edpalp,$corol,$hemorol,$secrol,$inflol,$cilios,$movocan,$pupila,$acvis,$obsolho,$atend){
		$this->negEX->alterarOEX($ptose,$edpalp,$corol,$hemorol,$secrol, $inflol, $cilios, $movocan,$pupila,$acvis,$obsolho,$atend);
	}

	public function inserirSistOtorEX($posorel, $formorel, $dororel, $edmast, $caudex, $secrorel, $otoscop, 
		$batnariz, $secrna, $tumorna, $rinosc, $corlab, $umidlab, $eruplab, $fislab, $maslab, $corgeng, $hemorge, $corli, $umidli,
		$exsuli,$tremli,$tumorac, $numdent, $impldent, $consdent, $corfar, $exsufar, $obsotor, $atend){
		$this->negEX->alterarSOEX($posorel, $formorel, $dororel, $edmast, $caudex, $secrorel, $otoscop, $batnariz, 
			$secrna, $tumorna, $rinosc, $corlab, $umidlab, $eruplab, $fislab, $maslab, $corgeng, $hemorge, $corli, $umidli,$exsuli,
			$tremli, $tumorac, $numdent, $impldent, $consdent, $corfar, $exsufar, $obsotor, $atend);
	}
	
	public function inserirPescocoEX($retrpesc, $torcpesc, $clavpesc,$tirepesc,$mastum, $fistpesc, $rigidpesc, $fosspesc, $obspesc,
		$atend){
		$this->negEX->alterarPsEX($retrpesc, $torcpesc, $clavpesc,$tirepesc,$mastum, $fistpesc, $rigidpesc, $fosspesc, $obspesc,
			$atend);
	}
	
	public function inserirRespEX($formtor, $simtor, $contorn, $proem, $masanorrsp, $mamasrsp, $tresp, $tirint,$freqresp, $fremtrvc,
		$frembronq, $frempleu, $submac, $macic, $timpan, $murves,$estert,$estrid, $sibilos, $atpleu, $obsresp, $atend){
		$this->negEX->alterarRpEX($formtor, $simtor, $contorn, $proem, $masanorrsp, $mamasrsp, $tresp, $tirint, $freqresp,$fremtrvc,
			$frembronq, $frempleu, $submac, $macic, $timpan, $murves,$estert, $estrid, $sibilos, $atpleu, $obsresp, $atend);
	}
		
	public function inserirCardVascEX($precord, $ictcrdi, $ictcrdp, $artper, $bulhas, $sopros, $pressaoart, $pressaoartin, $freqcard, $freqcardin, $obscdvs, $atend){
		$this->negEX->alterarCVEX($precord, $ictcrdi, $ictcrdp, $artper, $bulhas, $sopros, $pressaoart, $pressaoartin, $freqcard, $freqcardin, $obscdvs, $atend);	
	}
	
	public function inserirGastIntEX($formabd, $cicumb, $peristal, $distens, $tumorgt, $ondfluid,$timpgt,$parmusc,$espasmo,$rigidgt,
		$dorgt, $estomago, $figado, $baco,$rins, $mastumgt,$hernias,$rhidaer, $obsgtint, $atend){
		$this->negEX->alterarGIEX($formabd, $cicumb, $peristal, $distens, $tumorgt, $ondfluid, $timpgt, $parmusc, $espasmo,$rigidgt,	
			$dorgt, $estomago, $figado, $baco,$rins, $mastumgt, $hernias, $rhidaer, $obsgtint, $atend);	
	}
	
	public function inserirGenitoEX($sexo, $peqlab, $himen, $secrvag, $fimose, $circunc, $hidroc,$varic,$testic,$secruret,$pelos, 
		$lojren, $bexiga, $aspgen,$anus,$obsgen,$atend){
		$this->negEX->alterarGUEX($sexo, $peqlab, $himen, $secrvag, $fimose, $circunc, $hidroc,$varic,$testic,$secruret,$pelos, 
			$lojren,$bexiga, $aspgen,$anus,$obsgen,$atend);
	}

	public function inserirMuscEsqEX($anommusc,$deformmusc, $edemamusc, $tumomusc, $forcmusc,$dorossea,$movativ,$movpas,$escoliose, 
		$lordose, $cifose, $curvfr, $espmusc, $dorlocmusc,$dorrefmusc,$obsmusc,$atend){
		$this->negEX->alterarMEEX($anommusc, $deformmusc, $edemamusc, $tumomusc, $forcmusc, $dorossea, $movativ, $movpas,$escoliose,
			$lordose, $cifose, $curvfr, $espmusc, $dorlocmusc,$dorrefmusc,$obsmusc,$atend);
	}
	
	public function inserirNervEX($avnivconsc, $orientnerv, $sinfocc, $obsnerv, $atend){
		$this->negEX->alterarNEX($avnivconsc, $orientnerv, $sinfocc, $obsnerv, $atend);
	}
	
    public function adendoEX($adendo, $idAtendimento, $idAluno) {
        $this->negEX->adendo($adendo, $idAtendimento, $idAluno);
    }
	
	public function assinarEX($assinar, $idAtendimento, $idAluno, $assinatura) {
		
		$this->negEX->assinar($assinar, $idAtendimento, $idAluno, $assinatura);
    }
   
	
	public function preencherHipDiag($hip, $idAtendimento, $assinar, $idAluno){
		$this->negCH->preencherHipDiag($hip, $idAtendimento, $assinar, $idAluno);
	}

    public function adendoHD($adendo, $idAtendimento, $idAluno) {
        $this->negCH->adendoHD($adendo, $idAtendimento, $idAluno);
    }

	public function preencherConduta($cond, $idAtendimento, $assinar, $idAluno){
		$this->negCH->preencherConduta($cond, $idAtendimento, $assinar, $idAluno);
	}

    public function adendoCD($adendo, $idAtendimento, $idAluno) {
        $this->negCH->adendoCD($adendo, $idAtendimento, $idAluno);
    }

    public function inserirVacinaPaciente($vacinanome, $vacinadose, $datavacina, $dtnasc, $idProntuario) {
        $this->negHP->inserirVacina($vacinanome, $vacinadose, $datavacina, $dtnasc, $idProntuario);
    }
  	public function removerVacinaPaciente($vacina, $dose,  $idProntuario) {
        $this->negHP->removerVacina($vacina, $dose, $idProntuario);
    }
    public function inserirPreNatalHP($acompmed, $nconsacompmed, $localacompmed, $durgestacao, $sangmae, $z21, $a53, $b18, $b58, 
		$imunizmae, $exradion, $medicacoes, $anormalidades, $perdoenccir, $textdoenccir, $pesogravidez, $qaliment, $anemia, 
		$obsprenat, $idProntuario) {
        $this->negHP->alterarPNHP($acompmed, $nconsacompmed, $localacompmed, $durgestacao, $sangmae, $z21, $a53, $b18, $b58, 
			$imunizmae, $exradion, $medicacoes, $anormalidades, $perdoenccir, $textdoenccir, $pesogravidez, $qaliment, $anemia, 
			$obsprenat, $idProntuario);
    }

    public function inserirNatalHP($tipograv, $tipoparto, $tipoapres, $durtrabparto,
        $anestesia, $analgesia, $compparto, $textcompparto, $obsnatal, $idProntuario) {
        $this->negHP->alterarNHP($tipograv, $tipoparto, $tipoapres, $durtrabparto, $anestesia,
            $analgesia, $compparto, $textcompparto, $obsnatal, $idProntuario);
    }

    public function inserirNeoNatalHP($apgar1, $apgar5, $permnasal, $idadegest, $sangrn,
        $sinalorto, $pesoalta, $comprimento, $percef, $pertorac, $pesonasc, $testepe, $fenilcet,
        $hipotiroid, $anemiafalc, $triaaud, $PEATE, $EOA, $reanimacao, $ictericia, $rash,
        $sangramentos, $vomitos, $infeccoes, $anomcong, $paralisias, $coriza, $convulsoes,
        $obsneonat,$pesoAtual,$alturaAtual, $idProntuario) {
        $this->negHP->alterarNNHP($apgar1, $apgar5, $permnasal, $idadegest, $sangrn, $sinalorto,
            $pesoalta, $comprimento, $percef, $pertorac, $pesonasc, $testepe, $fenilcet, $hipotiroid,
            $anemiafalc, $triaaud, $PEATE, $EOA, $reanimacao, $ictericia, $rash, $sangramentos,
            $vomitos, $infeccoes, $anomcong, $paralisias, $coriza, $convulsoes, $obsneonat,$pesoAtual,$alturaAtual,
            $idProntuario);
    }

    public function inserirAlimHP($alimmatexc, $alimcomp, $alimpast, $alimfam, $dietatu,
        $refdiarias, $horaref, $usomam, $colher, $copo, $alimpastliq, $chantafet, $brincref,
        $obsaliment, $idProntuario) {
        $this->negHP->alterarAHP($alimmatexc, $alimcomp, $alimpast, $alimfam, $dietatu,
            $refdiarias, $horaref, $usomam, $colher, $copo, $alimpastliq, $chantafet, $brincref,
            $obsaliment, $idProntuario);
    }

    public function inserirCrescDesHP($relirmaos, $idadeescola, $aprendizado, $repetano,
        $relacol, $particfala, $muddent, $obscrescdes, $idProntuario) {
        $this->negHP->alterarCDHP($relirmaos, $idadeescola, $aprendizado, $repetano, $relacol,
            $particfala, $muddent, $obscrescdes, $idProntuario);
    }

    public function inserirHabitHP($chupeta, $chupadedo, $roiunhas, $tiques, $altalim,
        $geofagia, $enurese, $pertsono, $dormepais, $obshabito, $idProntuario) {
        $this->negHP->alterarHHP($chupeta, $chupadedo, $roiunhas, $tiques, $altalim, $geofagia,
            $enurese, $pertsono, $dormepais, $obshabito, $idProntuario);
    }

    public function inserirImunizHP($efeitcol, $testmantoux, $obsimun, $idProntuario) {
        $this->negHP->alterarIHP($efeitcol, $testmantoux, $obsimun, $idProntuario);
    }

    public function inserirDoenAntHP($coqueluche, $sarampo, $varicela, $parotide, $difteria,
        $tetano, $diarreia, $pneumonia, $meningite, $febrereum, $nefropatia, $tuberculose,
        $asma, $eczema, $alergia, $textalergias, $rinite, $cirurgia, $transfusoes, $hospitalizacoes,
        $tratamentos, $obsdoencasant, $idProntuario) {
        $this->negHP->alterarDAHP($coqueluche, $sarampo, $varicela, $parotide, $difteria,
            $tetano, $diarreia, $pneumonia, $meningite, $febrereum, $nefropatia, $tuberculose,
            $asma, $eczema, $alergia, $textalergias, $rinite, $cirurgia, $transfusoes, $hospitalizacoes,
            $tratamentos, $obsdoencasant, $idProntuario);
    }

    public function inserirOutInfoHP($doenchag, $doenesq, $expagtox, $textexpagtox,
        $alergmed, $textalergmed, $conttuberc, $obsoutinfo, $idProntuario) {
        $this->negHP->alterarOIHP($doenchag, $doenesq, $expagtox, $textexpagtox, $alergmed,
            $textalergmed, $conttuberc, $obsoutinfo, $idProntuario);
    }

    public function assinarHP($assinatura, $idProntuario) {
        $this->negHP->assinarHP($assinatura, $idProntuario);
    }

    public function adendoHP($adendo, $idProntuario, $idAluno) {
        $this->negHP->adendo($adendo, $idProntuario, $idAluno);
    }

	public function inserirHistFamiliar($uniaopais, $idademae, $profmae, $idadepai, $profpai, $pais, $avos, $irmaos, $outros ,$tiporesid, $ncomodos, $nocupantes, $agua, $saneamento, $luz, $animais, $obs, $idProntuario){
        $this->negHF->inserirHF($uniaopais, $idademae, $profmae, $idadepai, $profpai, $pais, $avos, $irmaos, $outros, $tiporesid, $ncomodos, $nocupantes, $agua, $saneamento, $luz, $animais, $obs, $idProntuario);
    }
    
    public function adendoHF($adendo, $idProntuario, $idAluno) {
        $this->negHF->adendo($adendo, $idProntuario, $idAluno);
    }

	public function __destruct() {}

}

?>
