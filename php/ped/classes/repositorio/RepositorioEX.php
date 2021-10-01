<?php
class repositorioEX
{

    function assinar($idAtendimento, $idAluno){
		$data = date(Y) . "-" . date(m) . "-" . date(d) . " " . date("H:i:s");
        mysql_query("UPDATE examefisico SET ass = '1', dthr = '" . $data . "', idAluno = '" . $idAluno . "' WHERE 
			idAtend = '" . $idAtendimento . "'") or die("ERRO no comando SQL:" . mysql_error());
    }

    function getEX($idAtend) {
        $sqlex = mysql_query("SELECT * FROM examefisico WHERE idAtend = '" . $idAtend . "'") or 
			die("ERRO no comando SQL:" . mysql_error());
        return mysql_fetch_object($sqlex);
    }

    function EXAssinado($idAtend) {
        $sqlex = mysql_query("SELECT ass FROM examefisico WHERE idAtend = '" . $idAtend . "'");
        $linhaex = mysql_fetch_object($sqlex);
        return ($linhaex->ass);
    }

    function getAbasSalvasExame($idAtend) {
        $consulta = mysql_query("select * from abasexame WHERE idAtend = '" . $idAtend . "'");
       	return mysql_fetch_object($consulta);
    }

    function inspecao($estger, $tdoenc, $aspdoenc, $desfis, $nutricao, $coop, $deffis, $anorpt, $obs, $id){
		mysql_query("UPDATE inspecao SET estgeral  = '" . $estger . "', tdoenca = '" . $tdoenc . "', aspdoenca = '" . 
			$aspdoenc . "', desenvfis = '" . $desfis . "', nutricao = '" . $nutricao . "', coop = '" . $coop . 
			"', deformfis = '" . $deffis . "', anormpost = '" . $anorpt . "', obs = '" . $obs . "' WHERE 
			idAtend = '" . $id . "'") or die("ERRO no comando SQL : " . mysql_error());
    }

    function pele($cor, $umid, $temp, $cicatriz, $hemorr, $rash, $circcol, $edema, $consun, $defun, 
		$mancun, $influn, $obs, $id){
		mysql_query("UPDATE examepele SET corpele = '" . $cor . "', umidpele = '" . $umid . 
			"', temppele = '" . $temp . "', cicatriz = '" . $cicatriz . "', hemor = '" . $hemorr . 
			"', rash = '" . $rash . "', circcol = '" . $circcol . "', edemapele = '" . $edema . 
			"', manchasun='" . $mancun . "', consistun = '" . $consun . "', inflamun = '" . $influn . 
			"', deformun = '" . $defun . "', obs = '" . $obs . "' WHERE idAtend = '" . $id . "'") 
			or die("ERRO no comando SQL : " . mysql_error());
    }

    function ganglios($ganglinf, $obs, $id){
		mysql_query("UPDATE exameganglinf SET ganglios = '" . $ganglinf . "', obs = '" . $obs . "' WHERE idAtend = 
			'" . $id . "'") or die("ERRO no comando SQL : " . mysql_error());
	}	
	
    function puberal($ppub, $mamas, $voltest, $genit, $obs, $id){
		mysql_query("UPDATE antroestpuberal SET voltest = '" . $voltest . "', genitais = '" . $genit . "', pelospub = '" .
			$ppub . "', mamas = '" . $mamas . "', obs = '" . $obs . "' WHERE idAtend = '" . $id . "'") or 
			die("ERRO no comando SQL : " . mysql_error());
    }
	
    function desenvolvimento($brvm, $orpp, $paqos, $rscs, $pblco, $scopo, $bcvtc, $bcmlb, $bmfsa, $vrs, $absf, 
		$qeabtl, $bfssa, $cae, $pomo, $epd, $rspm, $bpfpca, $bpacda, $pfudp, $cas, $cbld, $qcs, $gehmd, $cfbqc, 
		$ffs, $dtvp, $csde, $pasv, $acxc, $secac, $cpnt, $gboc, $vests, $ffcc, $pmpq, $iaaif, $obs, $id){
		mysql_query("UPDATE desenvneuropsicomotor SET brvm = '" . $brvm . "', orpp = '" . $orpp . "', paqos = '" . 
			$paqos . "', rscs = '" . $rscs . "', pblco = '" . $pblco . "', scopo = '" . $scopo . "', bcvtc = '" . 
			$bcvtc . "', bcmlb = '" . $bcmlb . "', bmfsa = '" . $bmfsa . "', vrs = '" . $vrs . "', absf = '" . 
			$absf . "', qeabtl = '" . $qeabtl . "', bfssa = '" . $bfssa . "', cae = '" . $cae . "', pomo = '" . 
			$pomo . "', epd = '" . $epd . "', rspm = '" . $rspm . "', bpfpca = '" . $bpfpca . "', bpacda = '" . 
			$bpacda . "', pfudp = '" . $pfudp . "', cas = '" . $cas . "', cbld = '" . $cbld . "', qcs = '" . $qcs .
			"', gehmd = '" . $gehmd . "',cfbqc = '" . $cfbqc . "', ffs = '" . $ffs . "', dtvp = '" . $dtvp . 
			"', csde = '" . $csde . "', pasv = '" . $pasv . "', acxc='" . $acxc . "', secac = '" . $secac . 
			"', cpnt = '" . $cpnt . "', gboc = '" . $gboc . "', vests = '" . $vests . "', ffcc = '" . $ffcc . 
			"', pmpq = '" . $pmpq. "', iaaif = '" . $iaaif . "', obs = '" . $obs . "' WHERE idAtend = '" . $id . 
			"'") or die("ERRO no comando SQL : " . mysql_error());    
	}

    function cranio($tam, $form, $fontan, $sutu, $craneo, $cabelo, $lescab, $obs, $id){
		mysql_query("UPDATE examecranio SET tamcranio = '" . $tam . "', formacranio = '" . $form . "', fontanelas = '" . $fontan . 
			"', suturas = '" . $sutu . "', craneo = '" . $craneo . "', cabelo = '" . $cabelo . "', lescab = '" . 
			$lescab . "', obs = '" . $obs . "' WHERE idAtend = '" . $id . "'") or 
			die("ERRO no comando SQL : ".mysql_error());
    }
	
	function alterarMedind($peso, $pesoin, $altura, $alturain, $permcef, $permtora, $permab, $pregatric, 
		$pregasubesc, $atend){
		mysql_query("UPDATE medind SET pesoin = '" . $pesoin . "', peso = '" . $peso . "', altura = '" . $altura . 
			"', alturain = '" . $alturain . "', permcef = '" . $permcef . "', permtora = '" . $permtora . 
			"', permab = '" . $permab . "', pregatric = '" . $pregatric . "', pregasubesc = '" . $pregasubesc . 
			"'  WHERE idAtend = '" . $atend . "'") or die("ERRO no comando SQL : " . mysql_error());
	}

    function olhos($ptose, $edpalp, $cor, $hemor, $secr, $infl, $cilios, $movocan, $pupila, $acvis, $obs, $id){
		mysql_query("UPDATE exameolhos SET ptose = '" . $ptose . "', edemapalp = '" . $edpalp . "', corescle = '" . $cor . 
			"', hemorragias = '" . $hemor . "', secrecao = '" . $secr . "', inflamacao = '" . $infl . "', cilios = '" . $cilios . 
			"', movoc = '" . $movocan . "', pupila = '" . $pupila . "', acuidvis = '" . $acvis . "', obs = '" . $obs . 
			"' WHERE idAtend = '" . $id . "'") or die("ERRO no comando SQL : " . mysql_error());
    }

    function sistOtor($posorel, $formorel, $dororel, $edmast, $caudex, $secrorel, $otoscop, $batnariz, $secrna, 
		$tumorna, $rinosc, $corlab, $umidlab, $eruplab, $fislab, $maslab, $corgeng, $hemorge, $corli, $umidli, 
		$exsuli, $tremli, $tumorac, $numdent, $impldent, $consdent, $corfar, $exsufar, $obs, $id){
		mysql_query("UPDATE examesistotorrin SET posorelha = '" . $posorel . "', formorelha = '" . $formorel . 
			"', dorouvido = '" . $dororel . "', edemamast = '" . $edmast . "', canaudext = '" . $caudex . "', secrouvido = '" 
			. $secrorel . "', otoscopia = '" . $otoscop . "', batasanariz = '" . $batnariz . "', secrnariz = '" . $secrna . 
			"', tumornariz = '" . $tumorna . "', rinscopia = '" . $rinosc . "', corlabios = '" . $corlab . "', umidlabios = '" . 
			$umidlab . "', eruplabios = '" . $eruplab . "', fisslabios = '" . $fislab . "', masslabios = '" . $maslab . "', corgeng = 
			'" . $corgeng . "', hemorrgeng = '" . $hemorge . "', corlingua = '" . $corli . "', umidlingua = '" . $umidli . 
			"', exsudatol = '" . $exsuli . "', tremlingua = '" . $tremli . "', tumoracoes = '" . $tumorac . "', numdentes = '" . 
			$numdent . "', impldentes = '" . $impldent . "', consdentes = '" . $consdent . "', corfaringe = '" . $corfar . 
			"', exsudatof = '" . $exsufar . "', obs = '" . $obs . "' WHERE idAtend = '" . $id . "'") or 
			die("ERRO no comando SQL : " . mysql_error());		
    }

	function pescoco($retr, $torc, $clav, $tire, $mastum, $fist, $rigid, $foss, $obs, $id){
		mysql_query("UPDATE examepescoco SET retracoesp = '" . $retr . "', torcicolo = '" . $torc . "', claviculas = '" . $clav . 
			"', tireoide = '" . $tire . "',massastum = '" . $mastum . "', fistulas = '" . $fist . "', rigidez = '" . $rigid . 
			"', fosspesc = '" . $foss . "', obs = '" . $obs . "' WHERE idAtend = '" . $id . "'") or 
			die("ERRO no comando SQL : " . mysql_error());
	}
	
	function respiratorio($formtor, $simtor, $contorn, $proem, $masanor, $mamas, $tresp, $tirint, $freqresp, 
		$fremtrvc, $frembronq, $frempleu, $submac, $macic, $timpan, $murves, $estert, $estrid, $sibilos, $atpleu, 
		$obs, $id){
		mysql_query("UPDATE exameresp SET formtorax = '" . $formtor . "', simtorax = '" . $simtor . "', contornos = '" . 
			$contorn . "', proemi = '" . $proem . "', massasanorm = '" . $masanor . "', mamas = '" . $mamas . 
			"', tresp = '" . $tresp . "', tirinterc = '" . $tirint . "', freqresp = '" . $freqresp . "', fremtv = '" 
			. $fremtrvc . "', frembronq = '" . $frembronq . "', frempleur = '" . $frempleu . "', submacicez = '" . 
			$submac . "', macicez = '" . $macic . "', timpanico = '" . $timpan . "', murmvesic = '" . $murves . 
			"', estertores = '" . $estert . "', estridores = '" . $estrid . "', sibilos = '" . $sibilos . "', atritopleur = '" . 
			$atpleu . "', obs = '" . $obs . "' WHERE idAtend = '" . $id . "'") or 
			die("ERRO no comando SQL : " . mysql_error());		
	}
	
	function cardVasc($precord, $ictcrdi, $ictcrdp, $artper, $bulhas, $sopros, $pressaoart, $pressaoartin, 
		$freqcard, $freqcardin, $obs, $id){
		mysql_query("UPDATE examecardvasc SET precord = '" . $precord . "', ictuscordi = '" . $ictcrdi . "', 
			ictuscordp = '" . $ictcrdp . "', artperif = '" . $artper . "', bulhas = '" . $bulhas . "', sopros = '" . 
			$sopros . "', pressaoart = '" . $pressaoart . "', pressaoartin = '" . $pressaoartin . "',  freqcard = '" 
			. $freqcard . "', freqcardin = '" . $freqcardin . "', obs = '" . $obs . "' WHERE idAtend = '" . $id . 
			"'") or die("ERRO no comando SQL : " . mysql_error());	
	}
	
	function gastInt($formabd, $cicumb, $peristal, $distens, $tumor, $ondfluid, $timp, $parmusc, $espasmo, $rigid, 
		$dor, $estomago, $figado, $baco,$rins, $mastum, $hernias, $rhidaer, $obs, $id){
		mysql_query("UPDATE examegastint SET formabd = '" . $formabd . "', cicatumb = '" . $cicumb . "', peristal = '" .
			$peristal . "', distensao = '" . $distens . "', tumorgt = '" . $tumor . "', ondfluidas = '" . $ondfluid . 
			"', timpangt = '" . $timp . "', paredesmusc = '" . $parmusc . "', espasmos = '" . $espasmo . "', rigidez = '" . 
			$rigid . "', dor = '" . $dor . "', estomago = '" . $estomago . "', figado = '" . $figado . "', baco = '" . 
			$baco . "', rins = '" . $rins . "', massastum = '" . $mastum . "', hernias = '" . $hernias . "', ruidosha = '" . 
			$rhidaer . "', obs = '" . $obs . "' WHERE idAtend = '" . $id . "'") or 
			die("ERRO no comando SQL : " . mysql_error());			
	}
	
	function genUrin($secruret, $pelos, $lojren, $bexiga, $asp, $anus, $obs, $id){
		mysql_query("UPDATE examegenurin SET secruret = '" . $secruret . "', pelos = '" . $pelos . "', lojrenais = '" .
			$lojren . "', bexiga = '" . $bexiga . "', aspectogu = '" . $asp . "', anus = '" . $anus . "', obs = '" . $obs 
			. "' WHERE idAtend = '" . $id . "'") or die("ERRO no comando SQL : " . mysql_error());	
	}
	
	function genUrinM($fimose, $circunc, $hidroc, $varic, $testic, $secruret, $pelos, $lojren,$bexiga, $asp, $anus, 
		$obs, $id){
		$this->genUrin($secruret, $pelos, $lojren, $bexiga, $asp, $anus, $obs, $id);
		mysql_query("UPDATE examegenmasc SET fimose = '" . $fimose . "', circuncisao = '" . $circunc . "', hidrocele = '" . 
			$hidroc . "', varicocele = '" . $varic . "', testiculos = '" . $testic . "' WHERE idAtend = '" . $id . "'") or 
			die("ERRO no comando SQL : " . mysql_error());	
	}
	
	function genUrinF($peqlab, $himen, $secrvag, $secruret, $pelos, $lojren, $bexiga, $asp, $anus, $obs, $id){
		$this->genUrin($secruret, $pelos, $lojren, $bexiga, $asp, $anus, $obs, $id);
		mysql_query("UPDATE examegenfem SET peqlabios = '" . $peqlab . "', himen = '" . $himen . "', secrvag = '" . 
			$secrvag . "' WHERE idAtend = '" . $id . "'") or die("ERRO no comando SQL : " . mysql_error());	
	}
	
	function muscEsq($anom, $deform, $edema, $tumo, $forc, $dorossea, $movativ, $movpas, $escoliose, $lordose, 
		$cifose, $curvfr, $espmusc, $dorloc, $dorref, $obs, $id){
		mysql_query("UPDATE examemuscesq SET anomalias = '" . $anom . "', deformidades = '" . $deform . "', edemas = '" . 
			$edema . "', tumoracoes = '" . $tumo . "', forcamusc = '" . $forc . "', dorossea = '" . $dorossea . 
			"', movativa = '" . $movativ . "', movpassiva = '" . $movpas . "', escoliose = '" . $escoliose . "', lordose = '" 
			. $lordose . "', cifose = '" . $cifose . "', curvfrente = '" . $curvfr . "', espmusc = '" . $espmusc . 
			"', dorlocal = '" . $dorloc . "', dorreflexa = '" . $dorref . "', obs = '" . $obs . "' WHERE idAtend = '" . 
			$id . "'") or die("ERRO no comando SQL : " . mysql_error());			
	}
	
	function nervoso($avnivconsc, $orientnerv, $sinfocc, $obs, $id){
		mysql_query("UPDATE examenervoso SET nivconsc = '" . $avnivconsc . "', orientacao = '" . $orientnerv . 
			"', sinfocais = '" . $sinfocc . "', obs = '" . $obs . "' WHERE idAtend = '" . $id . "'") or 
			die("ERRO no comando SQL : " . mysql_error());	
	}
	
    public function __destruct(){}

}
?>
