<?php
include_once("classes/negocio/NegocioGeral.php");
include_once("classes/negocio/NegocioPaciente.php");
include_once("classes/negocio/NegocioInformante.php");
include_once("classes/negocio/NegocioQPDHDA.php");
include_once("classes/negocio/NegocioAdendo.php");
include_once("classes/negocio/NegocioIS.php");
include_once("classes/negocio/NegocioHistorico.php");
include_once("classes/negocio/NegocioHDC.php");
include_once("classes/negocio/NegocioEX.php");

class CamposInvalidos extends Exception {}
class ExistePaciente extends Exception {}
class AtendInvalido extends Exception {}
class DoseInvalida extends Exception {}

class Fachada{

    static private $fac;
    private $negPac;
    private $negInfo;
    private $negQPDHDA;
	private $negAdendo;
    private $negIS;
    private $negHist;
    private $negHDC;
	private $negEX;
    private $negGeral;

    public function __construct() {
        $this->negGeral = new NegocioGeral();
        $this->negPac = new NegocioPaciente();
        $this->negInfo = new NegocioInformante();
        $this->negQPDHDA = new NegocioQPDHDA();
		$this->negAdendo = new NegocioAdendo();
        $this->negIS = new NegocioIS();
        $this->negHist = new NegocioHistorico();
        $this->negHDC = new NegocioHDC();
		$this->negEX = new NegocioEX();
    }

    static public function singleton() {
        if (!isset(self::$fac)) {
           self::$fac = new Fachada();
        }
        return self::$fac;
    }

/******************************************* NEGOCIOGERAL *******************************************/	

  	public function openDB() {
       return $this->negGeral->openDB();
    }

	public function closeDB($conn){
		$this->negGeral->closeDB($conn);
	}
	
  	public function autentica($login, $senha) {
       return $this->negGeral->autentica($login, $senha);
    }

	function existeLoginEmail($login, $email){
		return $this->negGeral->existeLoginEmail($login, $email);
	}
	
	function novaSenha($login, $email){
		return $this->negGeral->novaSenha($login, $email);
	}
	
	function editarPerfil($id, $nome, $nsenha, $rsenha, $senhaa, $senha, $email){
		$this->negGeral->editarPerfil($id, $nome, $nsenha, $rsenha, $senhaa, $senha, $email);
	}
	
	function printData($campo){
       return $this->negGeral->printData($campo);
	}

	function msgData($data){
       return $this->negGeral->msgData($data);
	}

	function validaCPF($cpf){
       return $this->negGeral->validaCPF($cpf);
	}
	
	function validaCEP($cep){
       return $this->negGeral->validaCEP($cep);
	}
	
	function printCampo($campo1, $campo2){
       return $this->negGeral->printCampo($campo1, $campo2);
	}

	function printHora($campo){
       return $this->negGeral->printHora($campo);
	}
	
	function validarProntuario($login, $pront){
       return $this->negGeral->validarProntuario($login, $pront);	
	}

	function validarAtendimento($login, $atend){
       return $this->negGeral->validarAtendimento($login, $atend);	
	}

	function getNomeAluno($idAluno) {
        return $this->negGeral->getNomeAluno($idAluno);
    }
	
	function getEquipeAluno($login) {
        return $this->negGeral->getEquipeAluno($login);
    }

	function validaEmail($email){
		return $this->negGeral->validaEmail($email);
	}
	
	function validaHora($hora){
		return $this->negGeral->validaHora($hora);
	}
	
	function checkPOST($id, $value, $field) {
		return $this->negGeral->checkPOST($id, $value, $field);
	}

	function checkOpUF($id, $value, $field) {
		return $this->negGeral->checkOpUF($id, $value, $field);
	}

	function checkOption($id, $value, $field) {
		return $this->negGeral->checkOption($id, $value, $field);
	}


	function checkDisable($id, $field, $value) {
		return $this->negGeral->checkDisable($id, $field, $value);
	}

	function checkDisable2($id, $field, $value, $value2) {
		return $this->negGeral->checkDisable2($id, $field, $value, $value2);
	}

	function checkDisable3($id, $field, $value, $value2, $value3) {
		return $this->negGeral->checkDisable3($id, $field, $value, $value2, $value3);
	}
	function checkDisable4($id, $field, $value, $value2, $value3, $value4) {
		return $this->negGeral->checkDisable4($id, $field, $value, $value2, $value3, $value4);
	}

	function printOBS($field, $value) {
		return $this->negGeral->printOBS($field, $value);
	}

	function checkAssinado($assinado) {
		return $this->negGeral->checkAssinado($assinado);
	}

	function verPreenchimento($ctrlaba,$valor){
		return $this->negGeral->verPreenchimento($ctrlaba,$valor);
	}

	function printMsg($msg1, $msg2){
		return $this->negGeral->printMsg($msg1, $msg2);
	}

	function getCBO(){
       return $this->negGeral->getCBO();
	}
/*****************************************************************************************************/	

/******************************************* NEGOCIOPAC **********************************************/	

	public function listarPacientes($login){
		return $this->negPac->listarPacientes($login);
	}

	public function listarPacientesLimit($login, $inicio, $tam){
		return $this->negPac->listarPacientesLimit($login, $inicio, $tam);
	}
	
	public function getUltimoAtendimento($idPront){
		return $this->negPac->getUltimoAtendimento($idPront);
	}

	public function getProntuarioAtendimento($idAtend){
		return $this->negPac->getProntuarioAtendimento($idAtend);
	}
	
    public function cadastrarPaciente($paciente, $login) {
       return $this->negPac->cadastrar($paciente, $login);
    }

    public function alterarPaciente($paciente, $idProntuario) {
        $this->negPac->alterar($paciente, $idProntuario);
    }

	function obterPacientePr($pront){
       return $this->negPac->obterPacientePr($pront);	
	}

	function obterPacienteAt($atend){
       return $this->negPac->obterPacienteAt($atend);	
	}

	public function novoAtendimento($idAluno, $idProntuario, $sexo) {
        return $this->negPac->novoAtendimento($idAluno, $idProntuario, $sexo);
    }
	
	function listaAtendimentos($idPront) {
        return $this->negPac->listaAtendimentos($idPront);
    }

	function consultarPacientes($valor, $tipo, $idAluno){
        return $this->negPac->consultar($valor, $tipo, $idAluno);
    }

	function getValuesTablePr($valor, $pront){
        return $this->negPac->getValuesTablePr($valor, $pront);
    }

	function getValuesTableAt($valor, $pront){
        return $this->negPac->getValuesTableAt($valor, $pront);
    }

	function getGrupoSanguineo(){
        return $this->negPac->getGrupoSanguineo();
    }
	
	function consultaInformante($idAtend) {
		return $this->negPac->consultaInformante($idAtend);
    }

	function consultaParentesco() {
		return $this->negPac->consultaParentesco();
    }

    function consultaEscolaridade() {
		return $this->negPac->consultaEscolaridade();
    }
	
	public function existePaciente($paciente){
		return $this->negPac->existePaciente($paciente);	
	}
/*****************************************************************************************************/	

/*	public function existe($paciente){
		$existe = false;
		if($paciente->getCpf() != ""){
			if(buscaPacienteCpf($paciente->getCpf())->cpf != "")  $existe = true;
		}else {
			if(buscaPacienteHash($paciente->getHashNome())->hashnome !="") $existe = true;
		}
		
		return $existe;
	}
*/


    public function inserirInformante($informante, $idAtendimento) {
        $this->negInfo->alterar($informante, $idAtendimento);
    }

    public function inserirQPDHDA($qpdhda, $idAtendimento, $assinar, $idAluno) {
        $this->negQPDHDA->alterar($qpdhda, $idAtendimento, $assinar, $idAluno);
    }

	public function getQPDHDA($idAtendimento) {
        return $this->negQPDHDA->getQPDHDA($idAtendimento);
    }
	
	public function EXAssinado($idAtendimento) {
        return $this->negEX->EXAssinado($idAtendimento);
    }	

/*****************************************************************************************************/	
/*****************************************************************************************************/	
/**************************************** NEGOCIOADENDO **********************************************/	

    public function adendoQH($adendo, $idAtendimento, $idAluno) {
        $this->negAdendo->inserirAdendo($adendo, $idAtendimento, $idAluno, "adendoqh");
    }
	
    public function adendoHD($adendo, $idAtendimento, $idAluno) {
        $this->negAdendo->inserirAdendo($adendo, $idAtendimento, $idAluno, "adendohd");
    }

    public function adendoCD($adendo, $idAtendimento, $idAluno) {
        $this->negAdendo->inserirAdendo($adendo, $idAtendimento, $idAluno, "adendocd");
    }

	public function adendoIS($adendo, $idAtendimento, $idAluno) {
        $this->negAdendo->inserirAdendo($adendo, $idAtendimento, $idAluno, "adendois");
    }
	
	public function adendoEX($adendo, $idAtendimento, $idAluno) {
        $this->negAdendo->inserirAdendo($adendo, $idAtendimento, $idAluno, "adendoex");
    }
	
	function getAdendoQH($idAtendimento){
        return $this->negAdendo->getAdendoQH($idAtendimento);
	}
	
	function getAdendoIS($idAtendimento){
        return $this->negAdendo->getAdendoIS($idAtendimento);
	}

	function getAdendoEX($idAtendimento){
        return $this->negAdendo->getAdendoEX($idAtendimento);
	}

	function getAdendoHD($idAtendimento){
        return $this->negAdendo->getAdendoHD($idAtendimento);
	}

	function getAdendoCD($idAtendimento){
        return $this->negAdendo->getAdendoCD($idAtendimento);
	}
	
/*****************************************************************************************************/	
/*****************************************************************************************************/	
/******************************************* NEGOCIOIS ***********************************************/	
	
	public function getIS($idAtendimento) {
        return $this->negIS->getIS($idAtendimento);
    }	

	public function getSalvosAbasIS($idAtendimento) {
        return $this->negIS->getSalvosAbasIS($idAtendimento);
    }
	
    public function assinarIS($assinar, $idAtendimento, $idAluno) {
        $this->negIS->assinarIS($assinar, $idAtendimento, $idAluno);
    }

    public function inserirGeralIS($febre, $altpeso, $atividade, $apetite, $obsgeral, $idAtendimento){
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

/*****************************************************************************************************/	
/*****************************************************************************************************/	
/******************************************* NEGOCIOEX ***********************************************/	

	public function inserirMedindEX($peso, $pesoin, $altura, $alturain, $permcef, $permtora, $permab, 
		$pregatric, $pregasubesc, $atend){
		$this->negEX->alterarMedind($peso, $pesoin, $altura, $alturain, $permcef, $permtora, $permab, 
			$pregatric, $pregasubesc, $atend);
	}

	public function inserirInspecaoEX($estger, $tdoenc, $aspdoenc, $desfis, $nutricao, $coop, $deffis, $anorpt, 
		$obsins,$atend){
		$this->negEX->alterarIEX($estger, $tdoenc, $aspdoenc, $desfis, $nutricao, $coop, $deffis, $anorpt, $obsins, 
			$atend);
	}							
	
	public function inserirPeleEX($corpele, $umidpele, $temppele, $cicatriz, $hemorr, $rash, 
		$circcol, $edemapele, $consun, $defun, $mancun, $influn, $obsepele, $atend){
		$this->negEX->alterarPeEX($corpele, $umidpele, $temppele, $cicatriz, $hemorr, $rash, 
			$circcol, $edemapele, $consun, $defun, $mancun, $influn, $obsepele, $atend);
	}
	
	public function inserirGangliosEX($ganglinf, $obsegang, $atend){
		$this->negEX->alterarGEX($ganglinf, $obsegang, $atend);
	}
	
	public function inserirPuberalEX($ppub, $mamaspub, $voltest, $genit, $obseantrop, $atend){
		$this->negEX->alterarPuEX($ppub, $mamaspub, $voltest, $genit, $obseantrop, $atend);
	}
	
	public function inserirDesenvolvimentoEX($brvm, $orpp, $paqos, $rscs, $pblco, $scopo, $bcvtc, 
		$bcmlb, $bmfsa, $vrs, $absf, $qeabtl, $bfssa, $cae, $pomo, $epd, $rspm, $bpfpca, $bpacda, 
		$pfudp, $cas, $cbld, $qcs, $gehmd, $cfbqc, $ffs, $dtvp, $csde, $pasv, $acxc, $secac, $cpnt, 
		$gboc, $vests, $ffcc, $pmpq, $iaaif, $obsdes, $atend){
		$this->negEX->alterarDEX($brvm, $orpp, $paqos, $rscs, $pblco, $scopo, $bcvtc, $bcmlb, $bmfsa, 
			$vrs, $absf, $qeabtl, $bfssa, $cae, $pomo, $epd, $rspm, $bpfpca, $bpacda, $pfudp, $cas, 
			$cbld, $qcs, $gehmd, $cfbqc, $ffs, $dtvp, $csde, $pasv, $acxc, $secac, $cpnt, $gboc, $vests, 
			$ffcc, $pmpq, $iaaif, $obsdes, $atend);
	}
	
	public function inserirCranioEX($tamcr, $formcr, $fontan, $sutu, $craneo, $cabelo, $lescab, 
		$obscran,$atend){
		$this->negEX->alterarCEX($tamcr, $formcr, $fontan, $sutu, $craneo, $cabelo, $lescab, $obscran, 
			$atend);
	}
	
	public function inserirOlhosEX($ptose, $edpalp, $corol, $hemorol, $secrol, $inflol, $cilios, 
		$movocan, $pupila, $acvis, $obsolho, $atend){
		$this->negEX->alterarOEX($ptose, $edpalp, $corol, $hemorol, $secrol, $inflol, $cilios, 
			$movocan, $pupila, $acvis, $obsolho, $atend);
	}

	public function inserirSistOtorEX($posorel, $formorel, $dororel, $edmast, $caudex, $secrorel, 
		$otoscop, $batnariz, $secrna, $tumorna, $rinosc, $corlab, $umidlab, $eruplab, $fislab, $maslab,
		$corgeng, $hemorge, $corli, $umidli, $exsuli,$tremli,$tumorac, $numdent, $impldent, $consdent, 
		$corfar, $exsufar, $obsotor, $atend){
		$this->negEX->alterarSOEX($posorel, $formorel, $dororel, $edmast, $caudex, $secrorel, $otoscop,
			$batnariz, $secrna, $tumorna, $rinosc, $corlab, $umidlab, $eruplab, $fislab, $maslab, 
			$corgeng, $hemorge, $corli, $umidli, $exsuli, $tremli, $tumorac, $numdent, $impldent, 
			$consdent, $corfar, $exsufar, $obsotor, $atend);
	}
	
	public function inserirPescocoEX($retrpesc, $torcpesc, $clavpesc, $tirepesc, $mastum, $fistpesc, 
		$rigidpesc, $fosspesc, $obspesc, $atend){
		$this->negEX->alterarPsEX($retrpesc, $torcpesc, $clavpesc, $tirepesc, $mastum, $fistpesc, 
			$rigidpesc, $fosspesc, $obspesc, $atend);
	}
	
	public function inserirRespEX($formtor, $simtor, $contorn, $proem, $masanorrsp, $mamasrsp, $tresp, 
		$tirint, $freqresp, $fremtrvc, $frembronq, $frempleu, $submac, $macic, $timpan, $murves, 
		$estert,$estrid, $sibilos, $atpleu, $obsresp, $atend){
		$this->negEX->alterarRpEX($formtor, $simtor, $contorn, $proem, $masanorrsp, $mamasrsp, $tresp, 
			$tirint, $freqresp, $fremtrvc, $frembronq, $frempleu, $submac, $macic, $timpan, $murves, 
			$estert, $estrid, $sibilos, $atpleu, $obsresp, $atend);
	}
		
	public function inserirCardVascEX($precord, $ictcrdi, $ictcrdp, $artper, $bulhas, $sopros, 
		$pressaoart, $pressaoartin, $freqcard, $freqcardin, $obscdvs, $atend){
		$this->negEX->alterarCVEX($precord, $ictcrdi, $ictcrdp, $artper, $bulhas, $sopros, $pressaoart,
			$pressaoartin, $freqcard, $freqcardin, $obscdvs, $atend);	
	}
	
	public function inserirGastIntEX($formabd, $cicumb, $peristal, $distens, $tumorgt, $ondfluid, 
		$timpgt, $parmusc, $espasmo, $rigidgt, $dorgt, $estomago, $figado, $baco, $rins, $mastumgt, 
		$hernias,$rhidaer, $obsgtint, $atend){
		$this->negEX->alterarGIEX($formabd, $cicumb, $peristal, $distens, $tumorgt, $ondfluid, $timpgt,
			$parmusc, $espasmo, $rigidgt, $dorgt, $estomago, $figado, $baco, $rins, $mastumgt, $hernias, 
			$rhidaer, $obsgtint, $atend);	
	}
	
	public function inserirGenitoEX($sexo, $peqlab, $himen, $secrvag, $fimose, $circunc, $hidroc, 
		$varic, $testic, $secruret, $pelos, $lojren, $bexiga, $aspgen, $anus, $obsgen, $atend){
		$this->negEX->alterarGUEX($sexo, $peqlab, $himen, $secrvag, $fimose, $circunc, $hidroc, $varic, 
			$testic, $secruret, $pelos, $lojren, $bexiga, $aspgen, $anus, $obsgen, $atend);
	}

	public function inserirMuscEsqEX($anommusc,$deformmusc, $edemamusc, $tumomusc, $forcmusc, $dorossea, 
		$movativ, $movpas, $escoliose, $lordose, $cifose, $curvfr, $espmusc, $dorlocmusc, $dorrefmusc, 
		$obsmusc,$atend){
		$this->negEX->alterarMEEX($anommusc, $deformmusc, $edemamusc, $tumomusc, $forcmusc, $dorossea, 
			$movativ, $movpas, $escoliose, $lordose, $cifose, $curvfr, $espmusc, $dorlocmusc, 
			$dorrefmusc, $obsmusc, $atend);
	}
	
	public function inserirNervEX($avnivconsc, $orientnerv, $sinfocc, $obsnerv, $atend){
		$this->negEX->alterarNEX($avnivconsc, $orientnerv, $sinfocc, $obsnerv, $atend);
	}
	
	public function getEX($idAtendimento) {
        return $this->negEX->getEX($idAtendimento);
    }	
	
	public function getAbasSalvasExame($idAtendimento) {
        return $this->negEX->getAbasSalvasExame($idAtendimento);
    }	

	public function assinarEX($assinar, $idAtendimento, $idAluno) {
		$this->negEX->assinarEX($assinar, $idAtendimento, $idAluno);
    }
   
/*****************************************************************************************************/	
/*****************************************************************************************************/	
/******************************************* NEGOCIOHDC **********************************************/	

	public function listaHD($atend){
		return $this->negHDC->listaHD($atend);
	}

	public function novaHipDiag($hip, $idAtendimento, $assinar, $idAluno){
		$this->negHDC->novaHipDiag($hip, $idAtendimento, $assinar, $idAluno);
	}
	
	public function alterarHipDiag($hip, $idHip, $idAluno){
		$this->negHDC->alterarHipDiag($hip, $idHip, $idAluno);
	}

	public function assinarHD($idAtend, $assinar, $idAluno){
		$this->negHDC->assinarHD($idAtend, $assinar, $idAluno);
	}
	
	public function alterarConduta($cond, $idAtendimento, $assinar, $idAluno){
		$this->negHDC->alterarConduta($cond, $idAtendimento, $assinar, $idAluno);
	}
	
	public function consultarHD($idhip){
		return $this->negHDC->consultarHD($idhip);
	}

	public function getAssHD($idAtend){
		return $this->negHDC->getAssHD($idAtend);
	}
	
	public function removerHD($idAtend){
		$this->negHDC->removerHD($idAtend);
	}
	
	public function consultarCD($idAtend){
		return $this->negHDC->consultarCD($idAtend);
	}
/*****************************************************************************************************/	
/*****************************************************************************************************/	
/**************************************** NEGOCIOHISTORICO *******************************************/	

    public function inserirVacinaPaciente($vacinanome, $vacinadose, $datavacina, $dtnasc, $idProntuario) {
        $this->negHist->inserirVacina($vacinanome, $vacinadose, $datavacina, $dtnasc, $idProntuario);
    }
	
  	public function removerVacinaPaciente($vacina, $dose,  $idProntuario) {
        $this->negHist->removerVacina($vacina, $dose, $idProntuario);
    }

    public function inserirPreNatalHP($acompmed, $nconsacompmed, $localacompmed, $durgestacao, 
		$sangmae, $z21, $a53, $b18, $b58, $imunizmae, $exradion, $medicacoes, $anormalidades, 
		$perdoenccir, $textdoenccir, $pesogravidez, $qaliment, $anemia, $obsprenat, $idProntuario) {
        $this->negHist->alterarPNHP($acompmed, $nconsacompmed, $localacompmed, $durgestacao, $sangmae, 
			$z21, $a53, $b18, $b58, $imunizmae, $exradion, $medicacoes, $anormalidades, $perdoenccir, 
			$textdoenccir, $pesogravidez, $qaliment, $anemia, $obsprenat, $idProntuario);
    }

    public function inserirNatalHP($tipograv, $tipoparto, $tipoapres, $durtrabparto, $anestesia, 
		$analgesia, $compparto, $textcompparto, $obsnatal, $idProntuario) {
        $this->negHist->alterarNHP($tipograv, $tipoparto, $tipoapres, $durtrabparto, $anestesia,
            $analgesia, $compparto, $textcompparto, $obsnatal, $idProntuario);
    }

    public function inserirNeoNatalHP($apgar1, $apgar5, $permnasal, $idadegest, $sangrn, $sinalorto, 
		$pesoalta, $comprimento, $percef, $pertorac, $pesonasc, $vpesonasc, $testepe, $fenilcet, $hipotiroid, 
		$anemiafalc, $triaaud, $PEATE, $EOA, $reanimacao, $ictericia, $rash, $sangramentos, $vomitos, 
		$infeccoes, $anomcong, $paralisias, $coriza, $convulsoes, $obsneonat, $pesoAtual, $alturaAtual, 
		$idProntuario) {
        $this->negHist->alterarNNHP($apgar1, $apgar5, $permnasal, $idadegest, $sangrn, $sinalorto,
            $pesoalta, $comprimento, $percef, $pertorac, $pesonasc, $vpesonasc, $testepe, $fenilcet, $hipotiroid,
            $anemiafalc, $triaaud, $PEATE, $EOA, $reanimacao, $ictericia, $rash, $sangramentos,
            $vomitos, $infeccoes, $anomcong, $paralisias, $coriza, $convulsoes, $obsneonat, $pesoAtual, 
			$alturaAtual, $idProntuario);
    }

    public function inserirAlimHP($alimmatexc, $alimcomp, $alimpast, $alimfam, $dietatu, $refdiarias, 
		$horaref, $usomam, $colher, $copo, $alimpastliq, $chantafet, $brincref, $obsaliment, 
		$idProntuario) {
        $this->negHist->alterarAHP($alimmatexc, $alimcomp, $alimpast, $alimfam, $dietatu, $Refdiarias, 
			$horaref, $usomam, $colher, $copo, $alimpastliq, $chantafet, $brincref, $obsaliment, 
			$idProntuario);
    }

    public function inserirCrescDesHP($relirmaos, $idadeescola, $aprendizado, $repetano, $relacol, 
		$particfala, $muddent, $obscrescdes, $idProntuario){
        $this->negHist->alterarCDHP($relirmaos, $idadeescola, $aprendizado, $repetano, $relacol,
            $particfala, $muddent, $obscrescdes, $idProntuario);
    }

    public function inserirHabitHP($chupeta, $chupadedo, $roiunhas, $tiques, $altalim, $geofagia, 
		$enurese, $pertsono, $dormepais, $obshabito, $idProntuario){
        $this->negHist->alterarHHP($chupeta, $chupadedo, $roiunhas, $tiques, $altalim, $geofagia,
            $enurese, $pertsono, $dormepais, $obshabito, $idProntuario);
    }

    public function inserirImunizHP($efeitcol, $testmantoux, $obsimun, $idProntuario) {
        $this->negHist->alterarIHP($efeitcol, $testmantoux, $obsimun, $idProntuario);
    }

    public function inserirDoenAntHP($coqueluche, $sarampo, $varicela, $parotide, $difteria, $tetano, 
		$diarreia, $pneumonia, $meningite, $febrereum, $nefropatia, $tuberculose, $asma, $eczema, 
		$alergia, $textalergias, $rinite, $cirurgia, $transfusoes, $hospitalizacoes, $tratamentos, 
		$obsdoencasant, $idProntuario) {
        $this->negHist->alterarDAHP($coqueluche, $sarampo, $varicela, $parotide, $difteria, $tetano, 
			$diarreia, $pneumonia, $meningite, $febrereum, $nefropatia, $tuberculose, $asma, $eczema, 
			$alergia, $textalergias, $rinite, $cirurgia, $transfusoes, $hospitalizacoes, $tratamentos, 
			$obsdoencasant, $idProntuario);
    }

    public function inserirOutInfoHP($doenchag, $doenesq, $expagtox, $textexpagtox, $alergmed, 
		$textalergmed, $conttuberc, $obsoutinfo, $idProntuario) {
        $this->negHist->alterarOIHP($doenchag, $doenesq, $expagtox, $textexpagtox, $alergmed,
            $textalergmed, $conttuberc, $obsoutinfo, $idProntuario);
    }

	public function inserirHistFamiliar($uniaopais, $idademae, $profmae, $idadepai, $profpai, $pais, 
		$avos, $irmaos, $outros ,$tiporesid, $ncomodos, $nocupantes, $agua, $saneamento, $luz, 
		$animais, $obs, $idProntuario){
        $this->negHist->inserirHF($uniaopais, $idademae, $profmae, $idadepai, $profpai, $pais, $avos, 
			$irmaos, $outros, $tiporesid, $ncomodos, $nocupantes, $agua, $saneamento, $luz, $animais, 
			$obs, $idProntuario);
    }

	public function getVacinas() {
        return $this->negHist->getVacinas();
    }
	
	public function getDoses() {
        return $this->negHist->getDoses();
    }

	public function getVacinasPaciente($pront) {
        return $this->negHist->getVacinasPaciente($pront);
    }
	
	function validaDataVac($data, $dtnasc){
       return $this->negHist->validaDataVac($data, $dtnasc);
	}
    
	public function __destruct() {}

}
?>