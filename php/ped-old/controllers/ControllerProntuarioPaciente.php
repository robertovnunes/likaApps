<?php

$atend = $_GET['at'];
$gamb = $_POST['gamb'];
$pront = $fachada->getProntuarioAtendimento($atend);
$paciente = $fachada->obterPacienteAt($atend);
if ($_GET['flag'] == 1){
	$flag = 1;
	$assinatura = 1;
}
if ($_POST['assinar'] == "" ){
	$assinar = false;
}
if($gamb == "true"){
	$assinar = true;
}

$aba = $_GET['aba'];

if($_POST['vhip'] == "Ver Hipótese"){
	$hipotese = $fachada->consultarHD($_POST['idhipot']);
	$txthip = "Atualizar Hipótese";
	$flag = 1;
}

if($_POST['nhip'] == "Nova Hipótese"){
	try{
		$hipotese = $fachada->novaHipDiag($_POST['hipdiag'], $atend, 0, $user->getID());
		$msgi = 1;
	} catch (CamposInvalidos $e) {
		$msge = 1;
	}
	$flag = 1;
}

if($_POST['nhip'] == "Atualizar Hipótese"){
	try{
		$hipotese = $fachada->alterarHipDiag($_POST['hipdiag'], $_POST['idhipot'], $user->getID());
		$txthip = "Atualizar Hipótese";
		$msgi = 1;
	} catch (CamposInvalidos $e) {
		$msge = 1;
	}
	$flag = 1;
}

if (!$txthip)
	$txthip = "Nova Hipótese";

if($_POST['rhip'] == "Remover Hipótese"){
	$fachada->removerHD($_POST['idhipot']);
	$flag = 1;
}

if ($_POST['salvar'] == "Salvar" || $assinar){
	$flag = 1;
	if (!$aba) $aba = "informante";

	switch ($aba){

		case "informante":
			try {
				include_once("classes/basicas/Informante.php");
				$informante = new Informante($_POST['nome'], $_POST['sexo'], $_POST['ende'], 
					$_POST['compl'], $_POST['bairro'], $_POST['cidade'], $_POST['uf'], $_POST['cep'], 
					$_POST['escol'], $_POST['parent'], $_POST['obsinfo']);
				$fachada->inserirInformante($informante, $atend);
			} catch (CamposInvalidos $e) {
				$error = 1;
			}
			break;

		case "qpdhda":
			include_once("classes/basicas/QPDHDA.php");
			$qpdhda = new QPDHDA($_POST['QPD'], $_POST['HDA']);
			$linha = $fachada->getQPDHDA($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirQPDHDA($qpdhda, $atend, $assinar, $user->getID());
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
			} else {
				try {
					$fachada->adendoQH($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=qpdhda&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;

		case "geral":
			$linha = $fachada->getIS($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {	
					$fachada->inserirGeralIS($_POST['febre'], $_POST['altpeso'], $_POST['atividade'], 
						$_POST['apetite'], $_POST['obsgeral'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {	
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarIS(1, $atend, $user->getID());
			} else {
				try {
					$fachada->adendoIS($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=geral&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;
		
		case "pele":
			$linha = $fachada->getIS($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirPeleIS($_POST['rash'], $_POST['ictericia'], $_POST['infecrep'], 
						$_POST['obspele'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarIS(1, $atend, $user->getID());
			} else {
				try {
					$fachada->adendoIS($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=pele&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;	
			
		case "olhos":
			$linha = $fachada->getIS($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirOlhosIS($_POST['fotofobia'], $_POST['lacrim'], $_POST['edemapalp'],
						$_POST['secrecaool'], $_POST['dorolho'], $_POST['acuidvis'], $_POST['obsolho'],
						$atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarIS(1, $atend, $user->getID());
			}else {
				try {
					$fachada->adendoIS($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=olhos&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;		
				
		case "ouvidos":
			$linha = $fachada->getIS($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirOuvidosIS($_POST['infecfreq'], $_POST['secrecaoou'], 
						$_POST['dorouvido'], $_POST['acuidaud'], $_POST['obsouvido'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarIS(1, $atend, $user->getID());
			} else {
				try {
					$fachada->adendoIS($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=ouvidos&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;	
			
		case "respiratorio":
			$linha = $fachada->getIS($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirRespIS($_POST['corrnasal'], $_POST['sufocacao'], $_POST['epistaxe'], 
						$_POST['tosse'], $_POST['difresp'], $_POST['dtosse'], $_POST['ttosse'], 
						$_POST['ptosse'], $_POST['resffreq'], $_POST['dortor'], $_POST['hemoptise'],
						$_POST['obsresp'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e){
					$msge = 1;
				}
			  if (!$msge && $assinar) $fachada->assinarIS(1, $atend, $user->getID());
			}else {
				try {
					$fachada->adendoIS($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=respiratorio&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;
			
			
		case "cardiovascular":
			$linha = $fachada->getIS($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirCardVascIS($_POST['dispneia'], $_POST['cianose'], 
						$_POST['palpitacao'],$_POST['taquicardia'], $_POST['obscv'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
			  if (!$msge && $assinar) $fachada->assinarIS(1, $atend, $user->getID());
			}else {
				try {
					$fachada->adendoIS($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=cardiovascular&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;		
			
			
		case "gastrointestinal":
			$linha = $fachada->getIS($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirGastIntIS($_POST['nauseas'], $_POST['dorabdom'], $_POST['vomitos'], 
						$_POST['tenesmo'], $_POST['evacuacao'], $_POST['aspfezes'], $_POST['nfezes'], 
						$_POST['obsgi'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarIS(1, $atend, $user->getID());
			}else {
				try {
					$fachada->adendoIS($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=gastrointestinal&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;		
			
		case "genitourinario":
			$linha = $fachada->getIS($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirGenUriIS($paciente->getSexo(), $_POST['qtdurina'], 
						$_POST['jatourina'], $_POST['corurina'],$_POST['odorurina'], $_POST['frequrina'], 
						$_POST['urgurina'], $_POST['corruret'], $_POST['corcorruret'], 
						$_POST['odorcorruret'], $_POST['disuria'], $_POST['ativsex'], 
						$_POST['voltest'], $_POST['tampenis'], $_POST['pubarcah'], $_POST['polucoes'], 
						$_POST['erecao'], $_POST['corrvag'], $_POST['corcorrvag'], $_POST['odorcorrvag'], 
						$_POST['prucorrvag'], $_POST['telarca'], $_POST['pubarcam'], $_POST['histmenst'], 
						$_POST['menarca'], $_POST['regularidade'], $_POST['fluxo'], $_POST['obsgu'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarIS(1, $atend, $user->getID());
			}else {
				try {
					$fachada->adendoIS($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=genitourinario&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;			
			
		case "musculoesqueletico":
			$linha = $fachada->getIS($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirMuscEsqIS($_POST['deform'], $_POST['tumefacoes'], 
						$_POST['fraqmusc'], $_POST['dorossea'], $_POST['obsme'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarIS(1, $atend, $user->getID());
			}else {
				try {
					$fachada->adendoIS($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=musculoesqueletico&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;	
			
		case "nervoso":
			$linha = $fachada->getIS($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){		
				try {					
					$fachada->inserirNervIS($_POST['cefaleia'], $_POST['tonturas'], $_POST['convulsoes'], 
						$_POST['conv1'], $_POST['conv2'], $_POST['traumacran'], $_POST['sincopes'], 
						$_POST['paresias'], $_POST['paralisias'], $_POST['retneuropsi'], 
						$_POST['obsnerv'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarIS(1, $atend, $user->getID());
			}else {
				try {
					$fachada->adendoIS($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=nervoso&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;	
			
		case "exame_inspec":
			$linha = $fachada->getEX($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirInspecaoEX($_POST['estgeral'], $_POST['tdoenca'], $_POST['aspdoenca'], 
						$_POST['desenvfis'], $_POST['nutricao'], $_POST['coop'], $_POST['deformfis'], 
						$_POST['anormpost'], $_POST['obsins'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarEX(1, $atend, $user->getID());
				//if ($msge == ""){ $fachada->assinarEX($assinar, $atend, $usuario->getID(), $assinaturaExame); }
			} else {
				try {
					$fachada->adendoEX($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=exame_inspec&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;
		
		case "exame_pele":
			$linha = $fachada->getEX($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirPeleEX($_POST['corpele'], $_POST['umidpele'], $_POST['temppele'], $_POST['cicatriz'], 
						$_POST['hemor'], $_POST['rash'], $_POST['circcol'], $_POST['edemapele'], $_POST['consistun'], 
						$_POST['deformun'],$_POST['manchasun'],$_POST['inflamun'], $_POST['obsepele'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarEX(1, $atend, $user->getID());
			} else{
				try {
					$fachada->adendoEX($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=exame_pele&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;
				
		case "exame_gang":
			$linha = $fachada->getEX($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirGangliosEX($_POST['ganglinf'], $_POST['obsegang'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarEX(1, $atend, $user->getID());
			} else {
				try {
					$fachada->adendoEX($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=exame_gang&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;

		case "exame_estpub":
			$linha = $fachada->getEX($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirPuberalEX($_POST['pelospub'], $_POST['mamas'], $_POST['voltest'], $_POST['genitais'],
						$_POST['obsantrop'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarEX(1, $atend, $user->getID());
			} else {
				try {
					$fachada->adendoEX($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=exame_estpub&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;
			
		case "exame_desneuro":		
			$linha = $fachada->getEX($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirDesenvolvimentoEX($_POST['brvm'],$_POST['orpp'],$_POST['paqos'],$_POST['rscs'],
						$_POST['pblco'],$_POST['scopo'],$_POST['bcvtc'],$_POST['bcmlb'],$_POST['bmfsa'],$_POST['vrs'],
						$_POST['absf'],$_POST['qeabtl'],$_POST['bfssa'],$_POST['cae'],$_POST['pomo'],$_POST['epd'],
						$_POST['rspm'],$_POST['bpfpca'],$_POST['bpacda'],$_POST['pfudp'],$_POST['cas'],$_POST['cbld'],
						$_POST['qcs'],$_POST['gehmd'],$_POST['cfbqc'],$_POST['ffs'],$_POST['dtvp'],$_POST['csde'],
						$_POST['pasv'],$_POST['acxc'], $_POST['secac'],$_POST['cpnt'],$_POST['gboc'],$_POST['vests'],
						$_POST['ffcc'],$_POST['pmpq'],$_POST['iaaif'], $_POST['obsdes'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarEX(1, $atend, $user->getID());
			} else {
				try {
					$fachada->adendoEX($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=exame_desneuro&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;
		
		case "exame_cranio":		
			$linha = $fachada->getEX($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirCranioEX($_POST['tamcranio'], $_POST['formacranio'], $_POST['fontanelas'], $_POST['suturas'], 
						$_POST['craneo'], $_POST['cabelo'], $_POST['lescab'], $_POST['obscran'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarEX(1, $atend, $user->getID());
			} else {
				try {
					$fachada->adendoEX($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=exame_cranio&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;	
		
		case "exame_olhos":		
			$linha = $fachada->getEX($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirOlhosEX($_POST['ptose'], $_POST['edemapalp'], $_POST['corescle'], $_POST['hemorragiasol'], 
						$_POST['secrecaool'], $_POST['inflamacaool'], $_POST['cilios'], $_POST['movocularesa'], $_POST['pupila'], 
						$_POST['acuidvis'], $_POST['obsolho'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarEX(1, $atend, $user->getID());
			} else {
				try {
					$fachada->adendoEX($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=exame_olhos&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;
		
		case "exame_sistotor":		
			$linha = $fachada->getEX($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirSistOtorEX($_POST['posorelha'], $_POST['formorelha'], $_POST['dorouvido'],
						$_POST['edemamast'], $_POST['canaudext'], $_POST['secrouvido'], $_POST['otoscopia'], $_POST['batasanariz'],
						$_POST['secrnariz'], $_POST['tumornariz'], $_POST['rinoscopia'], $_POST['corlabios'], $_POST['umidlabios'],
						$_POST['eruplabios'], $_POST['fisslabios'], $_POST['masslabios'], $_POST['corgeng'], $_POST['hemorrgeng'],
						$_POST['corlingua'], $_POST['umidlingua'], $_POST['exsudatol'], $_POST['tremlingua'], $_POST['tumoracoes'],
						$_POST['numdentes'], $_POST['impldentes'], $_POST['consdentes'], $_POST['corfaringe'], $_POST['exsudatof'],
						$_POST['obsotor'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarEX(1, $atend, $user->getID());
			} else {
				try {
					$fachada->adendoEX($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=exame_sistotor&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;

		case "exame_pescoco":		
			$linha = $fachada->getEX($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirPescocoEX($_POST['retracoesp'], $_POST['torcicolo'], $_POST['claviculas'], $_POST['tireoide'],
						$_POST['massastum'], $_POST['fistulas'], $_POST['rigidez'], $_POST['fosspesc'], $_POST['obspesc'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarEX(1, $atend, $user->getID());
			} else {
				try {
					$fachada->adendoEX($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=exame_pescoco&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;

		case "exame_apresp":		
			$linha = $fachada->getEX($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirRespEX($_POST['formtorax'], $_POST['simtorax'], $_POST['contornos'], $_POST['proemi'],
						$_POST['massasanorm'], $_POST['mamas'], $_POST['tresp'], $_POST['tirinterc'], $_POST['freqresp'],
						$_POST['fremtv'], $_POST['frembronq'], $_POST['frempleur'], $_POST['submacicez'], $_POST['macicez'],
						$_POST['timpanico'], $_POST['murmvesic'], $_POST['estertores'], $_POST['estridores'], $_POST['sibilos'],
						$_POST['atritopl'], $_POST['obsresp'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarEX(1, $atend, $user->getID());
			} else {
				try {
					$fachada->adendoEX($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=exame_apresp&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;
	
		case "exame_cardio":		
			$linha = $fachada->getEX($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirCardVascEX($_POST['precord'], $_POST['ictuscordi'], $_POST['ictuscordp'], $_POST['artperif'],
						$_POST['bulhas'], $_POST['sopros'], $_POST['pressaoart'], $_POST['pressaoartin'], $_POST['freqcard'], 
						$_POST['freqcardin'], $_POST['obscdvs'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarEX(1, $atend, $user->getID());
			} else {
				try {
					$fachada->adendoEX($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=exame_cardio&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;

		case "exame_apgast":		
			$linha = $fachada->getEX($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirGastIntEX($_POST['formabd'], $_POST['cicatumb'], $_POST['peristal'], $_POST['distensao'],
						$_POST['tumorgt'], $_POST['ondfluidas'], $_POST['timpangt'], $_POST['paredesmusc'], $_POST['espasmos'],
						$_POST['rigidezgt'], $_POST['dorgt'], $_POST['estomago'], $_POST['figado'], $_POST['baco'], $_POST['rins'],
						$_POST['massastumgt'], $_POST['hernias'], $_POST['ruidosha'], $_POST['obsgi'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarEX(1, $atend, $user->getID());
			} else {
				try {
					$fachada->adendoEX($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=exame_apgast&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;

		case "exame_genurin":		
			$linha = $fachada->getEX($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirGenitoEX($paciente->getSexo(), $_POST['peqlabios'], $_POST['himen'], $_POST['secrvag'], 
						$_POST['fimose'], $_POST['circuncisao'], $_POST['hidrocele'], $_POST['varicocele'], $_POST['testiculos'], 
						$_POST['secruret'], $_POST['pelos'],$_POST['lojrenais'], $_POST['bexiga'],$_POST['aspectogu'], 
						$_POST['anus'],$_POST['obsgen'], $atend);
						$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarEX(1, $atend, $user->getID());
			} else {
				try {
					$fachada->adendoEX($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=exame_genurin&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;
		
		case "exame_muscesq":		
			$linha = $fachada->getEX($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirMuscEsqEX($_POST['anomaliasme'], $_POST['deformidadesme'], $_POST['edemasme'], 
						$_POST['tumoracoesme'], $_POST['forcamusc'], $_POST['dorossea'], $_POST['movativa'], $_POST['movpassiva'], 
						$_POST['escoliose'], $_POST['lordose'], $_POST['cifose'], $_POST['curvfrente'], $_POST['espmusc'], 
						$_POST['dorlocal'], $_POST['dorreflexa'], $_POST['obsmusc'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarEX(1, $atend, $user->getID());
			} else {
				try {
					$fachada->adendoEX($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=exame_muscesq&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;
			
		case "exame_nervoso":		
			$linha = $fachada->getEX($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirNervEX($_POST['nivconsc'], $_POST['orientacao'], $_POST['sinfocais'], $_POST['obsnerv'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarEX(1, $atend, $user->getID());
			} else {
				try {
					$fachada->adendoEX($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=exame_nervoso&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;

		case "exame_medind":
			$linha = $fachada->getEX($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->inserirMedindEX($_POST['pesomed'], $_POST['pesomedin'], $_POST['alturamed'],
						$_POST['alturamedin'], $_POST['permcef'], $_POST['permtora'], $_POST['permab'], 
						$_POST['pregatric'], $_POST['pregasubesc'], $atend);
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
				if (!$msge && $assinar) $fachada->assinarEX(1, $atend, $user->getID());
			}
			else{
				try {
					$fachada->adendoEX($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=exame_medind&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;

		case "hd":
			$linha = $fachada->getAssHD($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->assinarHD($atend, $assinar, $user->getID());
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
			} else {
				try {
					$fachada->adendoHD($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=hd&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;

		case "conduta":
			$linha = $fachada->consultarCD($atend);
			$ass = $fachada->checkAssinado($linha->ass);
			if (!$ass){
				try {
					$fachada->alterarConduta($_POST['conduta'], $atend, $assinar, $user->getID());
					$msgi = 1;
				} catch (CamposInvalidos $e) {
					$msge = 1;
				}
			} else {
				try {
					$fachada->adendoCD($_POST['adendoNovo'], $atend, $user->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&aba=conduta&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;
	}
}

if($aba == "gastrointestinal" || $aba == "ouvidos" || $aba == "respiratorio" || $aba == "geral" ||
	$aba == "cardiovascular" || $aba == "genitourinario" || $aba == "pele" || $aba == "olhos" ||
	$aba== "musculoesqueletico" || $aba == "nervoso"){
	$linha = $fachada->getIS($atend);
	$ass = $fachada->checkAssinado($linha->ass);
	if ($ass) $adendoad = $fachada->getAdendoIS($atend);
	$dadendo = $fachada->checkAssinado(!$linha->ass);
	$abas = $fachada->getSalvosAbasIS($atend);
	$jsabas = 'onclick="verificarIS(' . $abas->geral . ', ' . $abas->pele . ', ' . $abas->olhos . ', ' . 
		$abas->ouvidos . ', ' . $abas->respiratorio . ', ' . $abas->cardiovascular . ', ' . 
		$abas->gastrointestinal . ', ' . $abas->genitourinario . ', ' . $abas->muscesqueletico . ', ' . 
		$abas->nervoso . ');"'; 
}

if($aba == "hd"){
	$linha = $fachada->getAssHD($atend);
	$ass = $fachada->checkAssinado($linha->ass);
	if ($ass) $adendoad = $fachada->getAdendoHD($atend);
	$dadendo = $fachada->checkAssinado(!$linha->ass);
	$jsabas = 'onclick="verificar();"'; 
}

if($aba == "conduta"){
	$linha = $fachada->consultarCD($atend);
	$ass = $fachada->checkAssinado($linha->ass);
	if ($ass) $adendoad = $fachada->getAdendoCD($atend);
	$dadendo = $fachada->checkAssinado(!$linha->ass);
	$jsabas = 'onclick="verificar();"'; 
}

if($aba == "qpdhda"){
	$linha = $fachada->getQPDHDA($atend);
	$ass = $fachada->checkAssinado($linha->ass);
	if ($ass) $adendoad = $fachada->getAdendoQH($atend);
	$dadendo = $fachada->checkAssinado(!$linha->ass);
	$jsabas = 'onclick="verificar();"'; 
}

if($aba == "exame_inspec" || $aba == "exame_pele" || $aba == "exame_gang" || $aba == "exame_medind" || $aba == "exame_estpub" || 
	$aba == "exame_desneuro" || $aba == "exame_cranio" || $aba == "exame_olhos" || $aba == "exame_sistotor" || 
	$aba == "exame_pescoco" || $aba == "exame_apresp" || $aba == "exame_cardio" || $aba == "exame_apgast" || $aba == "exame_genurin" || 
	$aba == "exame_muscesq" || $aba == "exame_nervoso"){
	$linha = $fachada->getEX($atend);
	$ass = $fachada->checkAssinado($linha->ass);
	if ($ass) $adendoad = $fachada->getAdendoEX($atend);
	$dadendo = $fachada->checkAssinado(!$linha->ass);
	$abas = $fachada->getAbasSalvasExame($atend);
	$jsabas = 'onclick=\'verificarEX("' . $abas->inspecao . '", "' . $abas->pele . '", "' . $abas->ganglios . 
		'", "' . $abas->estadpuberal . '", "' . $abas->desenvneuropsicomotor . '", "' . $abas->cranio . 
		'", "' . $abas->olhos . '", "' . $abas->sistotorrino . '", "' . $abas->pescoco . '", "' . 
		$abas->aprespiratorio . '", "' . $abas->apcardiovascular . '", "' . $abas->apgastroint . '", "' . 
		$abas->apgenitourinario . '", "' . $abas->apmuscesqueletico . '", "' . $abas->sistnervoso . '");\'';
}

$assinatura = $fachada->getNomeAluno($linha->idAluno) . " - " . $fachada->printData($linha->dthr) 
	. " - " . $fachada->printHora($linha->dthr);
$n = "prtp";
$show = "alp";

switch ($aba) {
    case "qpdhda":
        $div = "div_qpdhda";
        $dir = "aba_qpdhda";
		$queix = $fachada->printOBS($linha->queixa, $_POST['QPD']);
		if ($msge && !$_POST['QPD'])
			$lbqpd = "class='erro'";
		$hist = $fachada->printOBS($linha->historico, $_POST['HDA']);
		if ($msge && !$_POST['HDA'])
			$lblhda = "class='erro'";
		$titulopront = "QPD/HDA";

        break;

	case "geral":
        $div = "div_is";
        $dir = "is/aba_geral";
		$lger = $fachada->getValuesTableAt('geral',$atend);
		$altpeso1 = $fachada->checkOption("altpeso", "GP", $lger->altpeso);
		$altpeso2 = $fachada->checkOption("altpeso", "PP", $lger->altpeso);
		$altpeso3 = $fachada->checkOption("altpeso", "NE", $lger->altpeso);
		$altpeso4 = $fachada->checkOption("altpeso", "NA", $lger->altpeso);
		$apetite1 = $fachada->checkOption("apetite", "F", $lger->apetite);
		$apetite2 = $fachada->checkOption("apetite", "E", $lger->apetite);
		$apetite3 = $fachada->checkOption("apetite", "N", $lger->apetite);
		$apetite4 = $fachada->checkOption("apetite", "NA", $lger->apetite);
		$atividade1 = $fachada->checkOption("atividade", "A", $lger->atividade);
		$atividade2 = $fachada->checkOption("atividade", "Q", $lger->atividade);
		$atividade3 = $fachada->checkOption("atividade", "NA", $lger->atividade);
		$febre1 = $fachada->checkPOST("febre", "S", $lger->febre);
		$febre2 = $fachada->checkPOST("febre", "N", $lger->febre);
		$febre3 = $fachada->checkPOST("febre", "NA", $lger->febre);
		$obsgeral = $fachada->printOBS($lger->obs, $_POST['obsgeral']);
		$titulopront = "Interrogat&oacute;rio Sintomatol&oacute;gico > Geral";
        break;
    case "pele":
        $div = "div_is";
        $dir = "is/aba_pele";
		$lpele = $fachada->getValuesTableAt('pele',$atend);
		$rash1 = $fachada->checkOption("rash", "E", $lpele->rash);
		$rash2 = $fachada->checkOption("rash", "M", $lpele->rash);
		$rash3 = $fachada->checkOption("rash", "A", $lpele->rash);
		$rash4 = $fachada->checkOption("rash", "NA", $lpele->rash);
		$ictericia1 = $fachada->checkOption("ictericia", "A", $lpele->ictericia);
		$ictericia2 = $fachada->checkOption("ictericia", "NA", $lpele->ictericia);
		$infecrep1 = $fachada->checkPOST("infecrep", "S", $lpele->infecrep);
		$infecrep2 = $fachada->checkPOST("infecrep", "N", $lpele->infecrep);
		$infecrep3 = $fachada->checkPOST("infecrep", "NA", $lpele->infecrep);
		$obspele = $fachada->printOBS($lpele->obs, $_POST['obspele']);
		$titulopront = "Interrogat&oacute;rio Sintomatol&oacute;gico > Pele";
		break;
    case "olhos":
        $div = "div_is";
        $dir = "is/aba_olhos";
		$lolh = $fachada->getValuesTableAt('olhos',$atend);
		$fotofobia1 = $fachada->checkPOST("fotofobia", "S", $lolh->fotofobia);
		$fotofobia2 = $fachada->checkPOST("fotofobia", "N", $lolh->fotofobia);
		$fotofobia3 = $fachada->checkPOST("fotofobia", "NA", $lolh->fotofobia);
		$lacrim1 = $fachada->checkPOST("lacrim", "S", $lolh->lacrim);
		$lacrim2 = $fachada->checkPOST("lacrim", "N", $lolh->lacrim);
		$lacrim3 = $fachada->checkPOST("lacrim", "NA", $lolh->lacrim);
		$secrecao1 = $fachada->checkPOST("secrecaool", "S", $lolh->secrecaool);
		$secrecao2 = $fachada->checkPOST("secrecaool", "N", $lolh->secrecaool);
		$secrecao3 = $fachada->checkPOST("secrecaool", "NA", $lolh->secrecaool);	
		$edema1 = $fachada->checkPOST("edemapalp", "S", $lolh->edemapalp);
		$edema2 = $fachada->checkPOST("edemapalp", "N", $lolh->edemapalp);
		$edema3 = $fachada->checkPOST("edemapalp", "NA", $lolh->edemapalp);
		$dorolho1 = $fachada->checkOption("dorolho", "OE", $lolh->dorolho);
		$dorolho2 = $fachada->checkOption("dorolho", "OD", $lolh->dorolho);
		$dorolho3 = $fachada->checkOption("dorolho", "AO", $lolh->dorolho);
		$dorolho4 = $fachada->checkOption("dorolho", "N", $lolh->dorolho);
		$dorolho5 = $fachada->checkOption("dorolho", "NA", $lolh->dorolho);
		$acuidvis1 = $fachada->checkOption("acuidvis", "TN", $lolh->acuidvis);
		$acuidvis2 = $fachada->checkOption("acuidvis", "TA", $lolh->acuidvis);
		$acuidvis3 = $fachada->checkOption("acuidvis", "S", $lolh->acuidvis);
		$acuidvis4 = $fachada->checkOption("acuidvis", "N", $lolh->acuidvis);
		$acuidvis5 = $fachada->checkOption("acuidvis", "C", $lolh->acuidvis);
		$acuidvis6 = $fachada->checkOption("acuidvis", "NA", $lolh->acuidvis);
		$obsolho = $fachada->printOBS($lolh->obs, $_POST['obsolho']);
		$titulopront = "Interrogat&oacute;rio Sintomatol&oacute;gico > Olhos";
		break;
    case "ouvidos":
        $div = "div_is";
        $dir = "is/aba_ouvidos";
		$louv = $fachada->getValuesTableAt('ouvidos',$atend);
		$secrecao1 = $fachada->checkPOST("secrecaoou", "S", $louv->secrecaoou);
		$secrecao2 = $fachada->checkPOST("secrecaoou", "N", $louv->secrecaoou);
		$secrecao3 = $fachada->checkPOST("secrecaoou", "NA", $louv->secrecaoou);
		$infecfreq1 = $fachada->checkPOST("infecfreq", "S", $louv->infecfreq);
		$infecfreq2 = $fachada->checkPOST("infecfreq", "N", $louv->infecfreq);
		$infecfreq3 = $fachada->checkPOST("infecfreq", "NA", $louv->infecfreq);
		$dorouv1 = $fachada->checkOption("dorouvido", "OE", $louv->dorouvido);
		$dorouv2 = $fachada->checkOption("dorouvido", "OD", $louv->dorouvido);
		$dorouv3 = $fachada->checkOption("dorouvido", "AO", $louv->dorouvido);
		$dorouv4 = $fachada->checkOption("dorouvido", "N", $louv->dorouvido);
		$dorouv5 = $fachada->checkOption("dorouvido", "NA", $louv->dorouvido);
		$acuidaud1 = $fachada->checkOption("acuidaud", "TN", $louv->acuidaud);
		$acuidaud2 = $fachada->checkOption("acuidaud", "TA", $louv->acuidaud);
		$acuidaud3 = $fachada->checkOption("acuidaud", "S", $louv->acuidaud);
		$acuidaud4 = $fachada->checkOption("acuidaud", "N", $louv->acuidaud);
		$acuidaud5 = $fachada->checkOption("acuidaud", "NA", $louv->acuidaud);
		$obsouvido = $fachada->printOBS($louv->obs, $_POST['obsouvido']);
		$titulopront = "Interrogat&oacute;rio Sintomatol&oacute;gico > Ouvidos";
		break;
    case "respiratorio":
        $div = "div_is";
        $dir = "is/aba_apresp";
		$lrsp = $fachada->getValuesTableAt('aprespiratorio',$atend);
		$sufoca1 = $fachada->checkPOST("sufocacao", "S", $lrsp->sufocacao);
		$sufoca2 = $fachada->checkPOST("sufocacao", "N", $lrsp->sufocacao);
		$sufoca3 = $fachada->checkPOST("sufocacao", "NA", $lrsp->sufocacao);
		$epistaxe1 = $fachada->checkPOST("epistaxe", "S", $lrsp->epistaxe);
		$epistaxe2 = $fachada->checkPOST("epistaxe", "N", $lrsp->epistaxe);
		$epistaxe3 = $fachada->checkPOST("epistaxe", "NA", $lrsp->epistaxe);
		$corrnasal1 = $fachada->checkOption("corrnasal", "CL", $lrsp->corrnasal);
		$corrnasal2 = $fachada->checkOption("corrnasal", "ES", $lrsp->corrnasal);
		$corrnasal3 = $fachada->checkOption("corrnasal", "A", $lrsp->corrnasal);
		$corrnasal4 = $fachada->checkOption("corrnasal", "NA", $lrsp->corrnasal);
		$tosse1 = $fachada->checkPOST("tosse", "P", $lrsp->tosse);
		$tosse2 = $fachada->checkPOST("tosse", "A", $lrsp->tosse);
		$tosse3 = $fachada->checkPOST("tosse", "NA", $lrsp->tosse);
		$dtosse = $fachada->checkDisable("tosse", $lrsp->tosse, "P");
		$ttosse1 = $fachada->checkOption("ttosse", "P", $lrsp->ttosse);
		$ttosse2 = $fachada->checkOption("ttosse", "S", $lrsp->ttosse);
		$ttosse3 = $fachada->checkOption("ttosse", "NA", $lrsp->ttosse);
		$dtosse1 = $fachada->checkOption("dtosse", "-30",$lrsp->dtosse);
		$dtosse2 = $fachada->checkOption("dtosse", "+30",$lrsp->dtosse);
		$dtosse3 = $fachada->checkOption("dtosse", "NA",$lrsp->dtosse);
		$ptosse1 = $fachada->checkOption("ptosse", "N", $lrsp->ptosse);
		$ptosse2 = $fachada->checkOption("ptosse", "M", $lrsp->ptosse);
		$ptosse3 = $fachada->checkOption("ptosse", "NA", $lrsp->ptosse);
		$resffreq1 = $fachada->checkPOST("resffreq", "S", $lrsp->resffreq);
		$resffreq2 = $fachada->checkPOST("resffreq", "N", $lrsp->resffreq);
		$resffreq3 = $fachada->checkPOST("resffreq", "NA", $lrsp->resffreq);
		$dortor1 = $fachada->checkPOST("dortor", "P", $lrsp->dortor);
		$dortor2 = $fachada->checkPOST("dortor", "A", $lrsp->dortor);
		$dortor3 = $fachada->checkPOST("dortor", "NA", $lrsp->dortor);
		$difresp1 = $fachada->checkPOST("difresp", "S", $lrsp->difresp);
		$difresp2 = $fachada->checkPOST("difresp", "N", $lrsp->difresp);
		$difresp3 = $fachada->checkPOST("difresp", "NA", $lrsp->difresp);
		$hemopt1 = $fachada->checkPOST("hemoptise", "P", $lrsp->hemoptise);
		$hemopt2 = $fachada->checkPOST("hemoptise", "A", $lrsp->hemoptise);
		$hemopt3 = $fachada->checkPOST("hemoptise", "NA", $lrsp->hemoptise);
		$obsresp = $fachada->printOBS($lrsp->obs, $_POST['obsresp']);
		$titulopront = "Interrogat&oacute;rio Sintomatol&oacute;gico > Respirat&oacute;rio";
        break;
    case "cardiovascular":
        $div = "div_is";
        $dir = "is/aba_apcardvasc";
		$lapcv = $fachada->getValuesTableAt('apcardiovascular',$atend);
		$dispneia1 = $fachada->checkPOST("dispneia", "S", $lapcv->dispneia); 
		$dispneia2 = $fachada->checkPOST("dispneia", "N", $lapcv->dispneia); 
		$dispneia3 = $fachada->checkPOST("dispneia", "NA", $lapcv->dispneia); 
		$cianose1 = $fachada->checkOption("cianose", "L", $lapcv->cianose);
		$cianose2 = $fachada->checkOption("cianose", "G", $lapcv->cianose);
		$cianose3 = $fachada->checkOption("cianose", "A", $lapcv->cianose);
		$cianose4 = $fachada->checkOption("cianose", "NA", $lapcv->cianose);
		$palpitacao1 = $fachada->checkPOST("palpitacao", "S", $lapcv->palpitacao); 
		$palpitacao2 = $fachada->checkPOST("palpitacao", "N", $lapcv->palpitacao); 
		$palpitacao3 = $fachada->checkPOST("palpitacao", "NA", $lapcv->palpitacao); 
		$taquicardia1 = $fachada->checkPOST("taquicardia", "S", $lapcv->taquicardia); 
		$taquicardia2 = $fachada->checkPOST("taquicardia", "N", $lapcv->taquicardia); 
		$taquicardia3 = $fachada->checkPOST("taquicardia", "NA", $lapcv->taquicardia); 
		$obscv = $fachada->printOBS($lapcv->obs, $_POST['obscv']);
		$titulopront = "Interrogatório Sintomatológico > Cardiovascular";
        break;
    case "gastrointestinal":
        $div = "div_is";
        $dir = "is/aba_apgastint";
		$lgi = $fachada->getValuesTableAt('apgastrointestinal',$atend);
		$nauseas1 = $fachada->checkPOST("nauseas", "S", $lgi->nauseas);
		$nauseas2 = $fachada->checkPOST("nauseas", "N", $lgi->nauseas);
		$nauseas3 = $fachada->checkPOST("nauseas", "NA", $lgi->nauseas);
		$dorabdom1 = $fachada->checkPOST("dorabdom", "P", $lgi->dorabdom);
		$dorabdom2 = $fachada->checkPOST("dorabdom", "A", $lgi->dorabdom);
		$dorabdom3 = $fachada->checkPOST("dorabdom", "NA", $lgi->dorabdom);
		$vomitos1 = $fachada->checkOption("vomitos", "AA", $lgi->vomitos);
		$vomitos2 = $fachada->checkOption("vomitos", "SC", $lgi->vomitos);
		$vomitos3 = $fachada->checkOption("vomitos", "N", $lgi->vomitos);
		$vomitos4 = $fachada->checkOption("vomitos", "NA", $lgi->vomitos);
		$tenesmo1 = $fachada->checkPOST("tenesmo", "S", $lgi->tenesmo);
		$tenesmo2 = $fachada->checkPOST("tenesmo", "N", $lgi->tenesmo);
		$tenesmo3 = $fachada->checkPOST("tenesmo", "NA", $lgi->tenesmo);
		$evacuacao1 = $fachada->checkOption("evacuacao", "N", $lgi->evacuacao);
		$evacuacao2 = $fachada->checkOption("evacuacao", "C", $lgi->evacuacao);
		$evacuacao3 = $fachada->checkOption("evacuacao", "D", $lgi->evacuacao);
		$evacuacao4 = $fachada->checkOption("evacuacao", "NA", $lgi->evacuacao);
		$devacuacao = $fachada->checkDisable3("evacuacao", $lgi->evacuacao, "C", "N", "D");
		$aspfezes1 = $fachada->checkOption("aspfezes", "N", $lgi->aspfezes);
		$aspfezes2 = $fachada->checkOption("aspfezes", "B", $lgi->aspfezes);
		$aspfezes3 = $fachada->checkOption("aspfezes", "E", $lgi->aspfezes);
		$aspfezes4 = $fachada->checkOption("aspfezes", "NA", $lgi->aspfezes);
		if ($errgi && (!$_POST['nfezes'] || !is_numeric($_POST['nfezes']))) 
			$lblnfez = 'class="erro"';
		$nfezes = $fachada->printCampo($lgi->nfezes, $_POST['nfezes']);
		$obsgi = $fachada->printOBS($lgi->obs, $_POST['obsgi']);
		$titulopront = "Interrogat&oacute;rio Sintomatol&oacute;gico > Gastro-Intestinal";
        break;
    case "genitourinario":
        $div = "div_is";
        $dir = "is/aba_apgenurin";
		$lgu = $fachada->getValuesTableAt('apgenitourinario',$atend);
		$qtdur1 = $fachada->checkOption("qtdurina", "N", $lgu->qtdurina);	
		$qtdur2 = $fachada->checkOption("qtdurina", "A", $lgu->qtdurina);	
		$qtdur3 = $fachada->checkOption("qtdurina", "E", $lgu->qtdurina);	
		$qtdur4 = $fachada->checkOption("qtdurina", "NA", $lgu->qtdurina);	
		$odorur1 = $fachada->checkOption("odorurina", "C", $lgu->odorurina);
		$odorur2 = $fachada->checkOption("odorurina", "F", $lgu->odorurina);
		$odorur3 = $fachada->checkOption("odorurina", "NA", $lgu->odorurina);
		$jatour1 = $fachada->checkOption("jatourina", "C", $lgu->jatourina);
		$jatour2 = $fachada->checkOption("jatourina", "P", $lgu->jatourina);
		$jatour3 = $fachada->checkOption("jatourina", "NA", $lgu->jatourina);
		$frequr1 = $fachada->checkOption("frequrina", "N", $lgu->frequrina);
		$frequr2 = $fachada->checkOption("frequrina", "MH", $lgu->frequrina);
		$frequr3 = $fachada->checkOption("frequrina", "NA", $lgu->frequrina);
		$corur1 = $fachada->checkOption("corurina", "C", $lgu->corurina);
		$corur2 = $fachada->checkOption("corurina", "E", $lgu->corurina);
		$corur3 = $fachada->checkOption("corurina", "NA", $lgu->corurina);
		$urgur1 = $fachada->checkPOST("urgurina", "S", $lgu->urgurina);
		$urgur2 = $fachada->checkPOST("urgurina", "N", $lgu->urgurina);
		$urgur3 = $fachada->checkPOST("urgurina", "NA", $lgu->urgurina);
		$curet1 = $fachada->checkPOST("corruret", "P", $lgu->corruret); 
		$curet2 = $fachada->checkPOST("corruret", "A", $lgu->corruret); 
		$curet3 = $fachada->checkPOST("corruret", "NA", $lgu->corruret); 
		$ccuret1 = $fachada->checkOption("corcorruret", "C", $lgu->corcorruret);
		$ccuret2 = $fachada->checkOption("corcorruret", "L", $lgu->corcorruret);
		$ccuret3 = $fachada->checkOption("corcorruret", "NA", $lgu->corcorruret);
		$ocuret1 = $fachada->checkOption("odorcorruret", "I", $lgu->odorcorruret);
		$ocuret2 = $fachada->checkOption("odorcorruret", "F", $lgu->odorcorruret);
		$ocuret3 = $fachada->checkOption("odorcorruret", "NA", $lgu->odorcorruret);
		$disuria1 = $fachada->checkPOST("disuria", "S", $lgu->disuria);
		$disuria2 = $fachada->checkPOST("disuria", "N", $lgu->disuria);
		$disuria3 = $fachada->checkPOST("disuria", "NA", $lgu->disuria);
		$ativsex1 = $fachada->checkPOST("ativsex", "S", $lgu->ativsex);
		$ativsex2 = $fachada->checkPOST("ativsex", "N", $lgu->ativsex);
		$ativsex3 = $fachada->checkPOST("ativsex", "NA", $lgu->ativsex);
		$dcuret = $fachada->checkDisable("corruret", $lgu->corruret, "P");
		if ($paciente->getSexo() == "M"){
			$lsm = $fachada->getValuesTableAt('genmasc',$atend);
			$pubarcah1 = $fachada->checkOption("pubarcah", "-8", $lsm->pubarcah);
			$pubarcah2 = $fachada->checkOption("pubarcah", "814", $lsm->pubarcah);
			$pubarcah3 = $fachada->checkOption("pubarcah", "+14", $lsm->pubarcah);
			$pubarcah4 = $fachada->checkOption("pubarcah", "A", $lsm->pubarcah);
			$pubarcah5 = $fachada->checkOption("pubarcah", "NA", $lsm->pubarcah);
			$voltest1 = $fachada->checkOption("voltest", "N", $lsm->voltest);
			$voltest2 = $fachada->checkOption("voltest", "MA", $lsm->voltest);
			$voltest3 = $fachada->checkOption("voltest", "ME", $lsm->voltest);
			$voltest4 = $fachada->checkOption("voltest", "NA", $lsm->voltest);
			$erecao1 = $fachada->checkPOST("erecao", "P", $lsm->erecao);
			$erecao2 = $fachada->checkPOST("erecao", "A", $lsm->erecao);
			$erecao3 = $fachada->checkPOST("erecao", "NA", $lsm->erecao);
			$tampenis1 = $fachada->checkOption("tampenis", "N", $lsm->tampenis);
			$tampenis2 = $fachada->checkOption("tampenis", "MA", $lsm->tampenis);
			$tampenis3 = $fachada->checkOption("tampenis", "ME", $lsm->tampenis);
			$tampenis4 = $fachada->checkOption("tampenis", "NA", $lsm->tampenis);
			$polucoes1 = $fachada->checkPOST("polucoes", "P", $lsm->polucoes);
			$polucoes2 = $fachada->checkPOST("polucoes", "A", $lsm->polucoes);
			$polucoes3 = $fachada->checkPOST("polucoes", "NA", $lsm->polucoes);
		} else {
			$lsf = $fachada->getValuesTableAt('genfem',$atend);
			$corrvag1 = $fachada->checkPOST("corrvag", "P", $lsf->corrvag);
			$corrvag2 = $fachada->checkPOST("corrvag", "A", $lsf->corrvag);
			$corrvag3 = $fachada->checkPOST("corrvag", "NA", $lsf->corrvag);
			$dcorrvag = $fachada->checkDisable("corrvag", $lsf->corrvag, "P");
			$corcorrvag1 = $fachada->checkOption("corcorrvag", "C", $lsf->corcorrvag);
			$corcorrvag2 = $fachada->checkOption("corcorrvag", "L", $lsf->corcorrvag);
			$corcorrvag3 = $fachada->checkOption("corcorrvag", "E", $lsf->corcorrvag);
			$corcorrvag4 = $fachada->checkOption("corcorrvag", "NA", $lsf->corcorrvag);
			$odorcorrvag1 = $fachada->checkOption("odorcorrvag", "I", $lsf->odorcorrvag);
			$odorcorrvag2 = $fachada->checkOption("odorcorrvag", "F", $lsf->odorcorrvag);
			$odorcorrvag3 = $fachada->checkOption("odorcorrvag", "NA", $lsf->odorcorrvag);
			$prucorrvag1 = $fachada->checkPOST("prucorrvag","P", $lsf->prucorrvag);
			$prucorrvag2 = $fachada->checkPOST("prucorrvag","A", $lsf->prucorrvag);
			$prucorrvag3 = $fachada->checkPOST("prucorrvag","NA", $lsf->prucorrvag);
			$telarca1 = $fachada->checkOption("telarca", "-8", $lsf->telarca);
			$telarca2 = $fachada->checkOption("telarca", "813", $lsf->telarca);
			$telarca3 = $fachada->checkOption("telarca", "+13", $lsf->telarca);
			$telarca4 = $fachada->checkOption("telarca", "A", $lsf->telarca);
			$telarca5 = $fachada->checkOption("telarca", "NA", $lsf->telarca);
			$pubarcam1 = $fachada->checkOption("pubarcam", "-6", $lsf->pubarcam);
			$pubarcam2 = $fachada->checkOption("pubarcam", "613", $lsf->pubarcam);
			$pubarcam3 = $fachada->checkOption("pubarcam", "+13", $lsf->pubarcam);
			$pubarcam4 = $fachada->checkOption("pubarcam", "A", $lsf->pubarcam);
			$pubarcam5 = $fachada->checkOption("pubarcam", "NA", $lsf->pubarcam);
			$histmenst1 = $fachada->checkPOST("histmenst", "P", $lsf->histmenst);
			$histmenst2 = $fachada->checkPOST("histmenst", "A", $lsf->histmenst);
			$histmenst3 = $fachada->checkPOST("histmenst", "NA", $lsf->histmenst);
			$dhistmenst = $fachada->checkDisable("histmenst", $lsf->histmenst, "P");
			$menarca1 = $fachada->checkOption("menarca", "-8", $lsf->menarca);	
			$menarca2 = $fachada->checkOption("menarca", "816", $lsf->menarca);
			$menarca3 = $fachada->checkOption("menarca", "+16", $lsf->menarca);
			$menarca4 = $fachada->checkOption("menarca", "NA", $lsf->menarca);
			$regular1 = $fachada->checkOption("regularidade", "-28", $lsf->regularidade);
			$regular2 = $fachada->checkOption("regularidade", "28", $lsf->regularidade);
			$regular3 = $fachada->checkOption("regularidade", "+28", $lsf->regularidade);
			$regular4 = $fachada->checkOption("regularidade", "NA", $lsf->regularidade);
			$fluxo1 = $fachada->checkOption("fluxo", "N", $lsf->fluxo);
			$fluxo2 = $fachada->checkOption("fluxo", "A", $lsf->fluxo);
			$fluxo3 = $fachada->checkOption("fluxo", "D", $lsf->fluxo);
			$fluxo4 = $fachada->checkOption("fluxo", "NA", $lsf->fluxo);
		}
		$obsgu = $fachada->printOBS($lgu->obs, $_POST['obsgu']);
		$titulopront = "Interrogat&oacute;rio Sintomatol&oacute;gico > Genito-Urin&aacute;rio";
        break;
    case "musculoesqueletico":
        $div = "div_is";
        $dir = "is/aba_sistmuscesq";
		$lme = $fachada->getValuesTableAt('sistmusculoesqueletico',$atend);
		$deform1 = $fachada->checkPOST("deform", "S", $lme->deform);
		$deform2 = $fachada->checkPOST("deform", "N", $lme->deform);
		$deform3 = $fachada->checkPOST("deform", "NA", $lme->deform);
		$tumefacoes1 = $fachada->checkPOST("tumefacoes", "P", $lme->tumefacoes);
		$tumefacoes2 = $fachada->checkPOST("tumefacoes", "A", $lme->tumefacoes);
		$tumefacoes3 = $fachada->checkPOST("tumefacoes", "NA", $lme->tumefacoes);
		$fraqmusc1 = $fachada->checkPOST("fraqmusc", "S", $lme->fraqmusc);
		$fraqmusc2 = $fachada->checkPOST("fraqmusc", "N", $lme->fraqmusc);
		$fraqmusc3 = $fachada->checkPOST("fraqmusc", "NA", $lme->fraqmusc);
		$dorossea1 = $fachada->checkPOST("dorossea", "P", $lme->dorossea);
		$dorossea2 = $fachada->checkPOST("dorossea", "A", $lme->dorossea);
		$dorossea3 = $fachada->checkPOST("dorossea", "NA", $lme->dorossea);
		$obsme = $fachada->printOBS($lme->obs, $_POST['obsme']);
		$titulopront = "Interrogat&oacute;rio Sintomatol&oacute;gico > M&uacute;sculo-Esquel&eacute;tico";
        break;
    case "nervoso":
        $div = "div_is";
        $dir = "is/aba_sistnerv";
		$lnerv = $fachada->getValuesTableAt('sistnervoso',$atend);
		$retneuropsi1 = $fachada->checkPOST("retneuropsi", "S", $lnerv->retneuropsi);
		$retneuropsi2 = $fachada->checkPOST("retneuropsi", "N", $lnerv->retneuropsi);
		$retneuropsi3 = $fachada->checkPOST("retneuropsi", "NA", $lnerv->retneuropsi);
		$cefaleia1 = $fachada->checkPOST("cefaleia", "S", $lnerv->cefaleia);
		$cefaleia2 = $fachada->checkPOST("cefaleia", "N", $lnerv->cefaleia);
		$cefaleia3 = $fachada->checkPOST("cefaleia", "NA", $lnerv->cefaleia);
		$tonturas1 = $fachada->checkPOST("tonturas", "S", $lnerv->tonturas);
		$tonturas2 = $fachada->checkPOST("tonturas", "N", $lnerv->tonturas);
		$tonturas3 = $fachada->checkPOST("tonturas", "NA", $lnerv->tonturas);
		$convulsoes1 = $fachada->checkOption("convulsoes", "F", $lnerv->convulsoes);
		$convulsoes2 = $fachada->checkOption("convulsoes", "AF", $lnerv->convulsoes);
		$convulsoes3 = $fachada->checkOption("convulsoes", "A", $lnerv->convulsoes);
		$convulsoes4 = $fachada->checkOption("convulsoes", "NA", $lnerv->convulsoes);
		$dconvulsoes = $fachada->checkDisable2("convulsoes", $lnerv->convulsoes, "F", "AF");
		$conv11 = $fachada->checkOption("conv1", "T", $lnerv->conv1);
		$conv12 = $fachada->checkOption("conv1", "TC", $lnerv->conv1);
		$conv13 = $fachada->checkOption("conv1", "NA", $lnerv->conv1);
		$conv21 = $fachada->checkOption("conv2", "L", $lnerv->conv2);
		$conv22 = $fachada->checkOption("conv2", "G", $lnerv->conv2);
		$conv23 = $fachada->checkOption("conv2", "NA", $lnerv->conv2);
		$traumacran1 = $fachada->checkPOST("traumacran", "S", $lnerv->traumacran);
		$traumacran2 = $fachada->checkPOST("traumacran", "N", $lnerv->traumacran);
		$traumacran3 = $fachada->checkPOST("traumacran", "NA", $lnerv->traumacran);
		$sincopes1 = $fachada->checkPOST("sincopes", "S", $lnerv->sincopes);
		$sincopes2 = $fachada->checkPOST("sincopes", "N", $lnerv->sincopes);
		$sincopes3 = $fachada->checkPOST("sincopes", "NA", $lnerv->sincopes);
		$paresias1 = $fachada->checkPOST("paresias", "S", $lnerv->paresias);
		$paresias2 = $fachada->checkPOST("paresias", "N", $lnerv->paresias);
		$paresias3 = $fachada->checkPOST("paresias", "NA", $lnerv->paresias);
		$paralisias1 = $fachada->checkPOST("paralisias", "S", $lnerv->paralisias);
		$paralisias2 = $fachada->checkPOST("paralisias", "N", $lnerv->paralisias);
		$paralisias3 = $fachada->checkPOST("paralisias", "NA", $lnerv->paralisias);
		$obsnerv = $fachada->printOBS($lnerv->obs, $_POST['obsnerv']);
		$titulopront = "Interrogat&oacute;rio Sintomatol&oacute;gico > Nervoso";
        break;
    case "exame_inspec":
        $div = "div_exame";
        $dir = "exame/aba_inspecao";
		$leins = $fachada->getValuesTableAt('inspecao',$atend);
		$estgeral1 = $fachada->checkOption("estgeral", "B", $leins->estgeral);
		$estgeral2 = $fachada->checkOption("estgeral", "Rg", $leins->estgeral);
		$estgeral3 = $fachada->checkOption("estgeral", "R", $leins->estgeral);
		$estgeral4 = $fachada->checkOption("estgeral", "G", $leins->estgeral);
		$estgeral5 = $fachada->checkOption("estgeral", "NA", $leins->estgeral);
		$tdoenca1 = $fachada->checkOption("tdoenca", "A", $leins->tdoenca);
		$tdoenca2 = $fachada->checkOption("tdoenca", "C", $leins->tdoenca);
		$tdoenca3 = $fachada->checkOption("tdoenca", "NA", $leins->tdoenca);
		$aspdoenca1 = $fachada->checkOption("aspdoenca", "C", $leins->aspdoenca);
		$aspdoenca2 = $fachada->checkOption("aspdoenca", "S", $leins->aspdoenca);
		$aspdoenca3 = $fachada->checkOption("aspdoenca", "NA", $leins->aspdoenca);
		$desenvfis1 = $fachada->checkOption("desenvfis", "C", $leins->desenvfis);
		$desenvfis2 = $fachada->checkOption("desenvfis", "I", $leins->desenvfis);
		$desenvfis3 = $fachada->checkOption("desenvfis", "NA", $leins->desenvfis);
		$nutricao1 = $fachada->checkOption("nutricao", "N", $leins->nutricao);
		$nutricao2 = $fachada->checkOption("nutricao", "D", $leins->nutricao);
		$nutricao3 = $fachada->checkOption("nutricao", "NA", $leins->nutricao);
		$coop1 = $fachada->checkOption("coop", "B", $leins->coop);
		$coop2 = $fachada->checkOption("coop", "P", $leins->coop);
		$coop3 = $fachada->checkOption("coop", "N", $leins->coop);
		$coop4 = $fachada->checkOption("coop", "NA", $leins->coop);
		$deformfis1 = $fachada->checkPOST("deformfis", "P", $leins->deformfis);
		$deformfis2 = $fachada->checkPOST("deformfis", "A", $leins->deformfis);
		$deformfis3 = $fachada->checkPOST("deformfis", "NA", $leins->deformfis);
		$anormpost1 = $fachada->checkPOST("anormpost", "P", $leins->anormpost);
		$anormpost2 = $fachada->checkPOST("anormpost", "A", $leins->anormpost);
		$anormpost3 = $fachada->checkPOST("anormpost", "NA", $leins->anormpost);
		$obsins = $fachada->printOBS($leins->obs, $_POST['obsins']);
		$titulopront = "Exame F&iacute;sico > Geral > Inspe&ccedil;&atilde;o";
        break;
    case "exame_pele":
        $div = "div_exame";
        $dir = "exame/aba_pele";
		$lepele = $fachada->getValuesTableAt('examepele',$atend);
		$corpele1 = $fachada->checkOption("corpele", "C", $lepele->corpele);
		$corpele2 = $fachada->checkOption("corpele", "P", $lepele->corpele);
		$corpele3 = $fachada->checkOption("corpele", "Ci", $lepele->corpele);
		$corpele4 = $fachada->checkOption("corpele", "I", $lepele->corpele);
		$corpele5 = $fachada->checkOption("corpele", "NA", $lepele->corpele);
		$umidpele1 = $fachada->checkOption("umidpele", "H", $lepele->umidpele);
		$umidpele2 = $fachada->checkOption("umidpele", "U", $lepele->umidpele);
		$umidpele3 = $fachada->checkOption("umidpele", "S", $lepele->umidpele);
		$umidpele4 = $fachada->checkOption("umidpele", "NA", $lepele->umidpele);
		$temppele1 = $fachada->checkOption("temppele", "N", $lepele->temppele);
		$temppele2 = $fachada->checkOption("temppele", "Q", $lepele->temppele);
		$temppele3 = $fachada->checkOption("temppele", "F", $lepele->temppele);
		$temppele4 = $fachada->checkOption("temppele", "NA", $lepele->temppele);
		$cicatriz1 = $fachada->checkPOST("cicatriz", "P", $lepele->cicatriz);
		$cicatriz2 = $fachada->checkPOST("cicatriz", "A", $lepele->cicatriz);
		$cicatriz3 = $fachada->checkPOST("cicatriz", "NA", $lepele->cicatriz);
		$hemor1 = $fachada->checkPOST("hemor", "P", $lepele->hemor);
		$hemor2 = $fachada->checkPOST("hemor", "A", $lepele->hemor);
		$hemor3 = $fachada->checkPOST("hemor", "NA", $lepele->hemor);
		$rash1 = $fachada->checkPOST("rash", "P", $lepele->rash);
		$rash2 = $fachada->checkPOST("rash", "A", $lepele->rash);
		$rash3 = $fachada->checkPOST("rash", "NA", $lepele->rash);
		$circcol1 = $fachada->checkPOST("circcol", "P", $lepele->circcol);
		$circcol2 = $fachada->checkPOST("circcol", "A", $lepele->circcol);
		$circcol3 = $fachada->checkPOST("circcol", "NA", $lepele->circcol);
		$edemapele1 = $fachada->checkOption("edemapele", "A", $lepele->edemapele);
		$edemapele2 = $fachada->checkOption("edemapele", "M", $lepele->edemapele);
		$edemapele3 = $fachada->checkOption("edemapele", "P", $lepele->edemapele);
		$edemapele4 = $fachada->checkOption("edemapele", "An", $lepele->edemapele);
		$edemapele5 = $fachada->checkOption("edemapele", "NA", $lepele->edemapele);
		$consistun1 = $fachada->checkOption("consistun", "N", $lepele->consistun);
		$consistun2 = $fachada->checkOption("consistun", "Q", $lepele->consistun);
		$consistun3 = $fachada->checkOption("consistun", "E", $lepele->consistun);
		$consistun4 = $fachada->checkOption("consistun", "NA", $lepele->consistun);
		$deformun1 = $fachada->checkPOST("deformun", "P", $lepele->deformun);
		$deformun2 = $fachada->checkPOST("deformun", "A", $lepele->deformun);
		$deformun3 = $fachada->checkPOST("deformun", "NA", $lepele->deformun);
		$manchasun1 = $fachada->checkPOST("manchasun", "P", $lepele->manchasun);
		$manchasun2 = $fachada->checkPOST("manchasun", "A", $lepele->manchasun);
		$manchasun3 = $fachada->checkPOST("manchasun", "NA", $lepele->manchasun);
		$inflamun1 = $fachada->checkPOST("inflamun", "P", $lepele->inflamun);
		$inflamun2 = $fachada->checkPOST("inflamun", "A", $lepele->inflamun);
		$inflamun3 = $fachada->checkPOST("inflamun", "NA", $lepele->inflamun);
		$obspele = $fachada->printOBS($lepele->obs, $_POST['obsepele']);
		$titulopront = "Exame F&iacute;sico > Geral > Pele e Mucosas";
        break;
    case "exame_gang":
        $div = "div_exame";
        $dir = "exame/aba_ganglios";
		$legang = $fachada->getValuesTableAt('exameganglinf',$atend);
		$ganglios1 = $fachada->checkOption("ganglinf", "N", $legang->ganglios);
		$ganglios2 = $fachada->checkOption("ganglinf", "A", $legang->ganglios);
		$ganglios3 = $fachada->checkOption("ganglinf", "NA", $legang->ganglios);
		$obsegang = $fachada->printOBS($legang->obs, $_POST['obsegang']);
		$titulopront = "Exame F&iacute;sico > Geral > G&acirc;nglios Linf&aacute;ticos";
        break;
    case "exame_estpub":
        $div = "div_exame";
        $dir = "exame/aba_antropom";
		$lant = $fachada->getValuesTableAt('antroestpuberal',$atend);
		$pelospub1 = $fachada->checkOption("pelospub", "1", $lant->pelospub);
		$pelospub2 = $fachada->checkOption("pelospub", "2", $lant->pelospub);
		$pelospub3 = $fachada->checkOption("pelospub", "3", $lant->pelospub);
		$pelospub4 = $fachada->checkOption("pelospub", "4", $lant->pelospub);
		$pelospub5 = $fachada->checkOption("pelospub", "5", $lant->pelospub);
		$pelospub6 = $fachada->checkOption("pelospub", "NA", $lant->pelospub);
		$mamas1 = $fachada->checkOption("mamas", "1", $lant->mamas);
		$mamas2 = $fachada->checkOption("mamas", "2", $lant->mamas);
		$mamas3 = $fachada->checkOption("mamas", "3", $lant->mamas);
		$mamas4 = $fachada->checkOption("mamas", "4", $lant->mamas);
		$mamas5 = $fachada->checkOption("mamas", "5", $lant->mamas);
		$mamas6 = $fachada->checkOption("mamas", "NA", $lant->mamas);
		$voltest1 = $fachada->checkOption("voltest", "-4", $lant->voltest);
		$voltest2 = $fachada->checkOption("voltest", "4", $lant->voltest);
		$voltest3 = $fachada->checkOption("voltest", "9", $lant->voltest);
		$voltest4 = $fachada->checkOption("voltest", "16", $lant->voltest);
		$voltest5 = $fachada->checkOption("voltest", "20", $lant->voltest);
		$voltest6 = $fachada->checkOption("voltest", "NA", $lant->voltest);
		$genitais1 = $fachada->checkOption("genitais", "1", $lant->genitais);
		$genitais2 = $fachada->checkOption("genitais", "2", $lant->genitais);
		$genitais3 = $fachada->checkOption("genitais", "3", $lant->genitais);
		$genitais4 = $fachada->checkOption("genitais", "4", $lant->genitais);
		$genitais5 = $fachada->checkOption("genitais", "5", $lant->genitais);
		$genitais6 = $fachada->checkOption("genitais", "NA", $lant->genitais);
		$obsantrop = $fachada->printOBS($lant->obs, $_POST['obsantrop']);
		$titulopront = "Exame F&iacute;sico > Antropometria > Estadiamento Puberal";
        break;
    case "exame_desneuro":
        $div = "div_exame";
        $dir = "exame/aba_desneu";
		$ldes = $fachada->getValuesTableAt('desenvneuropsicomotor',$atend);
		$brvm1 = $fachada->checkOption("brvm", "2", $ldes->brvm);
		$brvm2 = $fachada->checkOption("brvm", "2+", $ldes->brvm);
		$brvm3 = $fachada->checkOption("brvm", "NA", $ldes->brvm);
		$orpp1 = $fachada->checkOption("orpp", "2", $ldes->orpp);
		$orpp2 = $fachada->checkOption("orpp", "2+", $ldes->orpp);
		$orpp3 = $fachada->checkOption("orpp", "NA", $ldes->orpp);
		$paqos1 = $fachada->checkOption("paqos", "2", $ldes->paqos);
		$paqos2 = $fachada->checkOption("paqos", "2+", $ldes->paqos);
		$paqos3 = $fachada->checkOption("paqos", "NA", $ldes->paqos);
		$rscs1 = $fachada->checkOption("rscs", "2", $ldes->rscs);
		$rscs2 = $fachada->checkOption("rscs", "2+", $ldes->rscs);
		$rscs3 = $fachada->checkOption("rscs", "NA", $ldes->rscs);
		$pblco1 = $fachada->checkOption("pblco", "24", $ldes->pblco);
		$pblco2 = $fachada->checkOption("pblco", "2-", $ldes->pblco);
		$pblco3 = $fachada->checkOption("pblco", "4+", $ldes->pblco);
		$pblco4 = $fachada->checkOption("pblco", "NA", $ldes->pblco);
		$scopo1 = $fachada->checkOption("scopo", "24", $ldes->scopo);
		$scopo2 = $fachada->checkOption("scopo", "2-", $ldes->scopo);
		$scopo3 = $fachada->checkOption("scopo", "4+", $ldes->scopo);
		$scopo4 = $fachada->checkOption("scopo", "NA", $ldes->scopo);
		$bcvtc1 = $fachada->checkOption("bcvtc", "24", $ldes->bcvtc);
		$bcvtc2 = $fachada->checkOption("bcvtc", "2-", $ldes->bcvtc);
		$bcvtc3 = $fachada->checkOption("bcvtc", "4+", $ldes->bcvtc);
		$bcvtc4 = $fachada->checkOption("bcvtc", "NA", $ldes->bcvtc);
		$bcmlb1 = $fachada->checkOption("bcmlb", "24", $ldes->bcmlb);
		$bcmlb2 = $fachada->checkOption("bcmlb", "2-", $ldes->bcmlb);
		$bcmlb3 = $fachada->checkOption("bcmlb", "4+", $ldes->bcmlb);
		$bcmlb4 = $fachada->checkOption("bcmlb", "NA", $ldes->bcmlb);
		$bmfsa1 = $fachada->checkOption("bmfsa", "46", $ldes->bmfsa);
		$bmfsa2 = $fachada->checkOption("bmfsa", "4-", $ldes->bmfsa);
		$bmfsa3 = $fachada->checkOption("bmfsa", "6+", $ldes->bmfsa);
		$bmfsa4 = $fachada->checkOption("bmfsa", "NA", $ldes->bmfsa);
		$vrs1 = $fachada->checkOption("vrs", "46", $ldes->vrs);
		$vrs2 = $fachada->checkOption("vrs", "4-", $ldes->vrs);
		$vrs3 = $fachada->checkOption("vrs", "6+", $ldes->vrs);
		$vrs4 = $fachada->checkOption("vrs", "NA", $ldes->vrs);
		$absf1 = $fachada->checkOption("absf", "46", $ldes->absf);
		$absf2 = $fachada->checkOption("absf", "4-", $ldes->absf);
		$absf3 = $fachada->checkOption("absf", "6+", $ldes->absf);
		$absf4 = $fachada->checkOption("absf", "NA", $ldes->absf);
		$qeabtl1 = $fachada->checkOption("qeabtl", "46", $ldes->qeabtl);
		$qeabtl2 = $fachada->checkOption("qeabtl", "4-", $ldes->qeabtl);
		$qeabtl3 = $fachada->checkOption("qeabtl", "6+", $ldes->qeabtl);
		$qeabtl4 = $fachada->checkOption("qeabtl", "NA", $ldes->qeabtl);
		$bfssa1 = $fachada->checkOption("bfssa", "69", $ldes->bfssa);
		$bfssa2 = $fachada->checkOption("bfssa", "6-", $ldes->bfssa);
		$bfssa3 = $fachada->checkOption("bfssa", "9+", $ldes->bfssa);
		$bfssa4 = $fachada->checkOption("bfssa", "NA", $ldes->bfssa);
		$cae1 = $fachada->checkOption("cae", "69", $ldes->cae);
		$cae2 = $fachada->checkOption("cae", "6-", $ldes->cae);
		$cae3 = $fachada->checkOption("cae", "9+", $ldes->cae);
		$cae4 = $fachada->checkOption("cae", "NA", $ldes->cae);
		$pomo1 = $fachada->checkOption("pomo", "69", $ldes->pomo);
		$pomo2 = $fachada->checkOption("pomo", "6-", $ldes->pomo);
		$pomo3 = $fachada->checkOption("pomo", "9+", $ldes->pomo);
		$pomo4 = $fachada->checkOption("pomo", "NA", $ldes->pomo);
		$epd1 = $fachada->checkOption("epd", "69", $ldes->epd);
		$epd2 = $fachada->checkOption("epd", "6-", $ldes->epd);
		$epd3 = $fachada->checkOption("epd", "9+", $ldes->epd);
		$epd4 = $fachada->checkOption("epd", "NA", $ldes->epd);
		$rspm1 = $fachada->checkOption("rspm", "69", $ldes->rspm);
		$rspm2 = $fachada->checkOption("rspm", "6-", $ldes->rspm);
		$rspm3 = $fachada->checkOption("rspm", "9+", $ldes->rspm);
		$rspm4 = $fachada->checkOption("rspm", "NA", $ldes->rspm);
		$bpfpca1 = $fachada->checkOption("bpfpca", "9C", $ldes->bpfpca);
		$bpfpca2 = $fachada->checkOption("bpfpca", "9-", $ldes->bpfpca);
		$bpfpca3 = $fachada->checkOption("bpfpca", "C+", $ldes->bpfpca);
		$bpfpca4 = $fachada->checkOption("bpfpca", "NA", $ldes->bpfpca);
		$bpacda1 = $fachada->checkOption("bpacda", "9C", $ldes->bpacda);
		$bpacda2 = $fachada->checkOption("bpacda", "9-", $ldes->bpacda);
		$bpacda3 = $fachada->checkOption("bpacda", "C+", $ldes->bpacda);
		$bpacda4 = $fachada->checkOption("bpacda", "NA", $ldes->bpacda);
		$pfudp1 = $fachada->checkOption("pfudp", "9C", $ldes->pfudp);
		$pfudp2 = $fachada->checkOption("pfudp", "9-", $ldes->pfudp);
		$pfudp3 = $fachada->checkOption("pfudp", "C+", $ldes->pfudp);
		$pfudp4 = $fachada->checkOption("pfudp", "NA", $ldes->pfudp);
		$cas1 = $fachada->checkOption("cas", "CI", $ldes->cas);
		$cas2 = $fachada->checkOption("cas", "C-", $ldes->cas);
		$cas3 = $fachada->checkOption("cas", "I+", $ldes->cas);
		$cas4 = $fachada->checkOption("cas", "NA", $ldes->cas);
		$cbld1 = $fachada->checkOption("cbld", "CI", $ldes->cbld);
		$cbld2 = $fachada->checkOption("cbld", "C-", $ldes->cbld);
		$cbld3 = $fachada->checkOption("cbld", "I+", $ldes->cbld);
		$cbld4 = $fachada->checkOption("cbld", "NA", $ldes->cbld);
		$qcs1 = $fachada->checkOption("qcs", "CI", $ldes->qcs);
		$qcs2 = $fachada->checkOption("qcs", "C-", $ldes->qcs);
		$qcs3 = $fachada->checkOption("qcs", "I+", $ldes->qcs);
		$qcs4 = $fachada->checkOption("qcs", "NA", $ldes->qcs);
		$gehmd1 = $fachada->checkOption("gehmd", "CI", $ldes->gehmd);
		$gehmd2 = $fachada->checkOption("gehmd", "C-", $ldes->gehmd);
		$gehmd3 = $fachada->checkOption("gehmd", "I+", $ldes->gehmd);
		$gehmd4 = $fachada->checkOption("gehmd", "NA", $ldes->gehmd);
		$cfbqc1 = $fachada->checkOption("cfbqc", "CI", $ldes->cfbqc);
		$cfbqc2 = $fachada->checkOption("cfbqc", "C-", $ldes->cfbqc);
		$cfbqc3 = $fachada->checkOption("cfbqc", "I+", $ldes->cfbqc);
		$cfbqc4 = $fachada->checkOption("cfbqc", "NA", $ldes->cfbqc);	
		$ffs1 = $fachada->checkOption("ffs", "I2", $ldes->ffs);
		$ffs2 = $fachada->checkOption("ffs", "I-", $ldes->ffs);
		$ffs3 = $fachada->checkOption("ffs", "2+", $ldes->ffs);
		$ffs4 = $fachada->checkOption("ffs", "NA", $ldes->ffs);		
		$dtvp1 = $fachada->checkOption("dtvp", "I2", $ldes->dtvp);
		$dtvp2 = $fachada->checkOption("dtvp", "I-", $ldes->dtvp);
		$dtvp3 = $fachada->checkOption("dtvp", "2+", $ldes->dtvp);
		$dtvp4 = $fachada->checkOption("dtvp", "NA", $ldes->dtvp);	
		$csde1 = $fachada->checkOption("csde", "I2", $ldes->csde);
		$csde2 = $fachada->checkOption("csde", "I-", $ldes->csde);
		$csde3 = $fachada->checkOption("csde", "2+", $ldes->csde);
		$csde4 = $fachada->checkOption("csde", "NA", $ldes->csde);	
		$pasv1 = $fachada->checkOption("pasv", "I2", $ldes->pasv);
		$pasv2 = $fachada->checkOption("pasv", "I-", $ldes->pasv);
		$pasv3 = $fachada->checkOption("pasv", "2+", $ldes->pasv);
		$pasv4 = $fachada->checkOption("pasv", "NA", $ldes->pasv);	
		$acxc1 = $fachada->checkOption("acxc", "I2", $ldes->acxc);
		$acxc2 = $fachada->checkOption("acxc", "I-", $ldes->acxc);
		$acxc3 = $fachada->checkOption("acxc", "2+", $ldes->acxc);
		$acxc4 = $fachada->checkOption("acxc", "NA", $ldes->acxc);	
		$secac1 = $fachada->checkOption("secac", "23", $ldes->secac);
		$secac2 = $fachada->checkOption("secac", "2-", $ldes->secac);
		$secac3 = $fachada->checkOption("secac", "3+", $ldes->secac);
		$secac4 = $fachada->checkOption("secac", "NA", $ldes->secac);
		$cpnt1 = $fachada->checkOption("cpnt", "23", $ldes->cpnt);
		$cpnt2 = $fachada->checkOption("cpnt", "2-", $ldes->cpnt);
		$cpnt3 = $fachada->checkOption("cpnt", "3+", $ldes->cpnt);
		$cpnt4 = $fachada->checkOption("cpnt", "NA", $ldes->cpnt);
		$gboc1 = $fachada->checkOption("gboc", "23", $ldes->gboc);
		$gboc2 = $fachada->checkOption("gboc", "2-", $ldes->gboc);
		$gboc3 = $fachada->checkOption("gboc", "3+", $ldes->gboc);
		$gboc4 = $fachada->checkOption("gboc", "NA", $ldes->gboc);	
		$vests1 = $fachada->checkOption("vests", "36", $ldes->vests);
		$vests2 = $fachada->checkOption("vests", "3-", $ldes->vests);
		$vests3 = $fachada->checkOption("vests", "6+", $ldes->vests);
		$vests4 = $fachada->checkOption("vests", "NA", $ldes->vests);
		$ffcc1 = $fachada->checkOption("ffcc", "36", $ldes->ffcc);
		$ffcc2 = $fachada->checkOption("ffcc", "3-", $ldes->ffcc);
		$ffcc3 = $fachada->checkOption("ffcc", "6+", $ldes->ffcc);
		$ffcc4 = $fachada->checkOption("ffcc", "NA", $ldes->ffcc);
		$pmpq1 = $fachada->checkOption("pmpq", "36", $ldes->pmpq);
		$pmpq2 = $fachada->checkOption("pmpq", "3-", $ldes->pmpq);
		$pmpq3 = $fachada->checkOption("pmpq", "6+", $ldes->pmpq);
		$pmpq4 = $fachada->checkOption("pmpq", "NA", $ldes->pmpq);
		$iaaif1 = $fachada->checkOption("iaaif", "6A", $ldes->iaaif);
		$iaaif2 = $fachada->checkOption("iaaif", "6-", $ldes->iaaif);
		$iaaif3 = $fachada->checkOption("iaaif", "A+", $ldes->iaaif);
		$iaaif4 = $fachada->checkOption("iaaif", "NA", $ldes->iaaif);
		$obsdes = $fachada->printOBS($ldes->obs, $_POST['obsdes']);
		$titulopront = "Exame F&iacute;sico > Antropometria > Desenvolvimento Neuropsicomotor";
        break;
    case "exame_medind":
        $div = "div_exame";
        $dir = "exame/aba_medind";
		$medind = $fachada->getValuesTableAt('medind',$atend);
		$pesomed1 = $fachada->checkOption("pesomed", "NA", $medind->peso);
		$pesomed2 = $fachada->checkOption("pesomed", "AV", $medind->peso);
		$pesomedin = $fachada->printOBS($medind->pesoin, $_POST['pesomedin']);
		if ($msge && $_POST['pesomed'] == "AV" && !is_numeric($_POST['pesomedin']))
			$lblpeso = "class='erro'";
		$dpesomed = $fachada->checkDisable("pesomed", $medind->peso, "AV");
		$alturamed1 = $fachada->checkOption("alturamed", "NA", $medind->altura);
		$alturamed2 = $fachada->checkOption("alturamed", "AV", $medind->altura);
		$dalturamed = $fachada->checkDisable("alturamed", $medind->altura, "AV");
		$alturamedin = $fachada->printOBS($medind->alturain, $_POST['alturamedin']);
		if ($msge && $_POST['alturamed'] == "AV" && !is_numeric($_POST['alturamedin']))
			$lblaltmed = "class='erro'";
		$permcef = $fachada->printOBS($medind->permcef, $_POST['permcef']);
		if ($msge && !is_numeric($_POST['permcef']))
			$lblpcef = "class='erro'";
		$permtora = $fachada->printOBS($medind->permtora, $_POST['permtora']);
		if ($msge && !is_numeric($_POST['permtora']))
			$lblptor = "class='erro'";
		$permab = $fachada->printOBS($medind->permab, $_POST['permab']);
		if ($msge && !is_numeric($_POST['permab']))
			$lblpmab = "class='erro'";
		$pregatric = $fachada->printOBS($medind->pregatric, $_POST['pregatric']);
		if ($msge && !is_numeric($_POST['pregatric']))
			$lblptric = "class='erro'";
		$pregasubesc = $fachada->printOBS($medind->pregasubesc, $_POST['pregasubesc']);
		if ($msge && !is_numeric($_POST['pregasubesc']))
			$lblpsesc = "class='erro'";		
		$titulopront = "Exame F&iacute;sico > Antropometria > Medidas e &Iacute;ndices";
		break;
    case "exame_cranio":
        $div = "div_exame";
        $dir = "exame/aba_cranio";
		$lcr = $fachada->getValuesTableAt('examecranio',$atend);
		$tamcranio1 = $fachada->checkOption("tamcranio", "N", $lcr->tamcranio);
		$tamcranio2 = $fachada->checkOption("tamcranio", "A", $lcr->tamcranio);
		$tamcranio3 = $fachada->checkOption("tamcranio", "NA", $lcr->tamcranio);
		$formacranio1 = $fachada->checkOption("formacranio", "N", $lcr->formacranio);
		$formacranio2 = $fachada->checkOption("formacranio", "A", $lcr->formacranio);
		$formacranio3 = $fachada->checkOption("formacranio", "NA", $lcr->formacranio);	
		$fontanelas1 = $fachada->checkOption("fontanelas", "N", $lcr->fontanelas);
		$fontanelas1 = $fachada->checkOption("fontanelas", "N", $lcr->fontanelas);
		$fontanelas2 = $fachada->checkOption("fontanelas", "A", $lcr->fontanelas);
		$fontanelas3 = $fachada->checkOption("fontanelas", "NA", $lcr->fontanelas);	
		$suturas1 = $fachada->checkPOST("suturas", "P", $lcr->suturas);
		$suturas2 = $fachada->checkPOST("suturas", "A", $lcr->suturas);
		$suturas3 = $fachada->checkPOST("suturas", "NA", $lcr->suturas);
		$craneo1 = $fachada->checkPOST("craneo", "S", $lcr->craneo);
		$craneo2 = $fachada->checkPOST("craneo", "N", $lcr->craneo);
		$craneo3 = $fachada->checkPOST("craneo", "NA", $lcr->craneo);
		$cabelo1 = $fachada->checkPOST("cabelo", "P", $lcr->cabelo);
		$cabelo2 = $fachada->checkPOST("cabelo", "A", $lcr->cabelo);
		$cabelo3 = $fachada->checkPOST("cabelo", "NA", $lcr->cabelo);
		$lescab1 = $fachada->checkPOST("lescab", "S", $lcr->lescab);
		$lescab2 = $fachada->checkPOST("lescab", "N", $lcr->lescab);
		$lescab3 = $fachada->checkPOST("lescab", "NA", $lcr->lescab);
		$obscran = $fachada->printOBS($lcr->obs, $_POST['obscran']);
		$titulopront = "Exame F&iacute;sico > Especial > Cr&acirc;nio";
        break;
    case "exame_olhos":
        $div = "div_exame";
        $dir = "exame/aba_olhos";
		$leolh = $fachada->getValuesTableAt('exameolhos',$atend);
		$ptose1 = $fachada->checkPOST("ptose", "S", $leolh->ptose);
		$ptose2 = $fachada->checkPOST("ptose", "N", $leolh->ptose);
		$ptose3 = $fachada->checkPOST("ptose", "NA", $leolh->ptose);
		$edemapalp1 = $fachada->checkPOST("edemapalp", "S", $leolh->edemapalp);
		$edemapalp2 = $fachada->checkPOST("edemapalp", "N", $leolh->edemapalp);
		$edemapalp3 = $fachada->checkPOST("edemapalp", "NA", $leolh->edemapalp);
		$corescle1 = $fachada->checkOption("corescle", "B", $leolh->corescle);
		$corescle2 = $fachada->checkOption("corescle", "A", $leolh->corescle);
		$corescle3 = $fachada->checkOption("corescle", "NA", $leolh->corescle);
		$hemorragiasol1 = $fachada->checkPOST("hemorragiasol", "S", $leolh->hemorragias);
		$hemorragiasol2 = $fachada->checkPOST("hemorragiasol", "N", $leolh->hemorragias);
		$hemorragiasol3 = $fachada->checkPOST("hemorragiasol", "NA", $leolh->hemorragias);
		$secrecaool1 = $fachada->checkOption("secrecaool", "N", $leolh->secrecao);
		$secrecaool2 = $fachada->checkOption("secrecaool", "SP", $leolh->secrecao);
		$secrecaool3 = $fachada->checkOption("secrecaool", "SH", $leolh->secrecao);
		$secrecaool4 = $fachada->checkOption("secrecaool", "NA", $leolh->secrecao);
		$inflamacaool1 = $fachada->checkPOST("inflamacaool", "P", $leolh->inflamacao);
		$inflamacaool2 = $fachada->checkPOST("inflamacaool", "A", $leolh->inflamacao);
		$inflamacaool3 = $fachada->checkPOST("inflamacaool", "NA", $leolh->inflamacao);
		$cilios1 = $fachada->checkPOST("cilios", "P", $leolh->cilios);
		$cilios2 = $fachada->checkPOST("cilios", "A", $leolh->cilios);
		$cilios3 = $fachada->checkPOST("cilios", "NA", $leolh->cilios);
		$movocularesa1 = $fachada->checkOption("movocularesa", "A", $leolh->movoc);
		$movocularesa2 = $fachada->checkOption("movocularesa", "E", $leolh->movoc);
		$movocularesa3 = $fachada->checkOption("movocularesa", "N", $leolh->movoc);
		$movocularesa4 = $fachada->checkOption("movocularesa", "NA", $leolh->movoc);
		$pupila1 = $fachada->checkOption("pupila", "NL", $leolh->pupila);
		$pupila2 = $fachada->checkOption("pupila", "OL", $leolh->pupila);
		$pupila3 = $fachada->checkOption("pupila", "NN", $leolh->pupila);
		$pupila4 = $fachada->checkOption("pupila", "LN", $leolh->pupila);
		$pupila5 = $fachada->checkOption("pupila", "NA", $leolh->pupila);
		$acuidvis1 = $fachada->checkOption("acuidvis", "S", $leolh->acuidvis);
		$acuidvis2 = $fachada->checkOption("acuidvis", "NS", $leolh->acuidvis);
		$acuidvis3 = $fachada->checkOption("acuidvis", "NL", $leolh->acuidvis);
		$acuidvis4 = $fachada->checkOption("acuidvis", "NA", $leolh->acuidvis);
		$obsolho = $fachada->printOBS($leolh->obs, $_POST['obsolho']);
		$titulopront = "Exame F&iacute;sico > Especial > Olhos";
        break;
    case "exame_sistotor":
        $div = "div_exame";
        $dir = "exame/aba_sistotor";
		$leot = $fachada->getValuesTableAt('examesistotorrin',$atend);
		$posorelha1 = $fachada->checkOption("posorelha", "N", $leot->posorelha);
		$posorelha2 = $fachada->checkOption("posorelha", "R", $leot->posorelha);
		$posorelha3 = $fachada->checkOption("posorelha", "NA", $leot->posorelha);
		$formorelha1 = $fachada->checkOption("formorelha", "N", $leot->formorelha);
		$formorelha2 = $fachada->checkOption("formorelha", "R", $leot->formorelha);
		$formorelha3 = $fachada->checkOption("formorelha", "NA", $leot->formorelha);
		$dorouvido1 = $fachada->checkPOST("dorouvido", "S", $leot->dorouvido);
		$dorouvido2 = $fachada->checkPOST("dorouvido", "N", $leot->dorouvido);
		$dorouvido3 = $fachada->checkPOST("dorouvido", "NA", $leot->dorouvido);
		$edemamast1 = $fachada->checkPOST("edemamast", "P", $leot->edemamast);
		$edemamast2 = $fachada->checkPOST("edemamast", "A", $leot->edemamast);
		$edemamast3 = $fachada->checkPOST("edemamast", "NA", $leot->edemamast);
		$canaudext1 = $fachada->checkPOST("canaudext", "A", $leot->canaudext);
		$canaudext2 = $fachada->checkPOST("canaudext", "F", $leot->canaudext);
		$canaudext3 = $fachada->checkPOST("canaudext", "NA", $leot->canaudext);
		$secrouv1 = $fachada->checkOption("secrouvido", "N", $leot->secrouvido);
		$secrouv2 = $fachada->checkOption("secrouvido", "P", $leot->secrouvido);
		$secrouv3 = $fachada->checkOption("secrouvido", "NA", $leot->secrouvido);
		$otoscopia1 = $fachada->checkOption("otoscopia", "N", $leot->otoscopia);
		$otoscopia2 = $fachada->checkOption("otoscopia", "A", $leot->otoscopia);
		$otoscopia3 = $fachada->checkOption("otoscopia", "NA", $leot->otoscopia);
		$batasanariz1 = $fachada->checkPOST("batasanariz", "P", $leot->batasanariz);
		$batasanariz2 = $fachada->checkPOST("batasanariz", "A", $leot->batasanariz);
		$batasanariz3 = $fachada->checkPOST("batasanariz", "NA", $leot->batasanariz);
		$tumornariz1 = $fachada->checkPOST("tumornariz", "P", $leot->tumornariz);
		$tumornariz2 = $fachada->checkPOST("tumornariz", "A", $leot->tumornariz);
		$tumornariz3 = $fachada->checkPOST("tumornariz", "NA", $leot->tumornariz);
		$rinoscopia1 = $fachada->checkOption("rinoscopia", "N", $leot->rinoscopia);
		$rinoscopia2 = $fachada->checkOption("rinoscopia", "A", $leot->rinoscopia);
		$rinoscopia3 = $fachada->checkOption("rinoscopia", "NA", $leot->rinoscopia);
		$secrnariz1 = $fachada->checkOption("secrnariz", "H", $leot->secrnariz);
		$secrnariz2 = $fachada->checkOption("secrnariz", "A", $leot->secrnariz);
		$secrnariz3 = $fachada->checkOption("secrnariz", "NA", $leot->secrnariz);
		$corlabios1 = $fachada->checkOption("corlabios", "Co", $leot->corlabios);
		$corlabios2 = $fachada->checkOption("corlabios", "P", $leot->corlabios);
		$corlabios3 = $fachada->checkOption("corlabios", "Ci", $leot->corlabios);
		$corlabios4 = $fachada->checkOption("corlabios", "NA", $leot->corlabios);
		$umidlabios1 = $fachada->checkOption("umidlabios", "H", $leot->umidlabios);
		$umidlabios2 = $fachada->checkOption("umidlabios", "U", $leot->umidlabios);
		$umidlabios3 = $fachada->checkOption("umidlabios", "R", $leot->umidlabios);
		$umidlabios4 = $fachada->checkOption("umidlabios", "NA", $leot->umidlabios);
		$eruplabios1 = $fachada->checkPOST("eruplabios", "P", $leot->eruplabios);
		$eruplabios2 = $fachada->checkPOST("eruplabios", "A", $leot->eruplabios);
		$eruplabios3 = $fachada->checkPOST("eruplabios", "NA", $leot->eruplabios);
		$fisslabios1 = $fachada->checkPOST("fisslabios", "P", $leot->fisslabios);
		$fisslabios2 = $fachada->checkPOST("fisslabios", "A", $leot->fisslabios);
		$fisslabios3 = $fachada->checkPOST("fisslabios", "NA", $leot->fisslabios);
		$masslabios1 = $fachada->checkPOST("masslabios", "P", $leot->masslabios);
		$masslabios2 = $fachada->checkPOST("masslabios", "A", $leot->masslabios);
		$masslabios3 = $fachada->checkPOST("masslabios", "NA", $leot->masslabios);
		$corgeng1 = $fachada->checkOption("corgeng", "N", $leot->corgeng);
		$corgeng2 = $fachada->checkOption("corgeng", "A", $leot->corgeng);
		$corgeng3 = $fachada->checkOption("corgeng", "NA", $leot->corgeng);
		$hemorrgeng1 = $fachada->checkPOST("hemorrgeng", "S", $leot->hemorrgeng);
		$hemorrgeng2 = $fachada->checkPOST("hemorrgeng", "N", $leot->hemorrgeng);
		$hemorrgeng3 = $fachada->checkPOST("hemorrgeng", "NA", $leot->hemorrgeng);
		$corlingua1 = $fachada->checkOption("corlingua", "N", $leot->corlingua);
		$corlingua2 = $fachada->checkOption("corlingua", "A", $leot->corlingua);
		$corlingua3 = $fachada->checkOption("corlingua", "NA", $leot->corlingua);
		$umidlingua1 = $fachada->checkOption("umidlingua", "H", $leot->umidlingua);
		$umidlingua2 = $fachada->checkOption("umidlingua", "S", $leot->umidlingua);
		$umidlingua3 = $fachada->checkOption("umidlingua", "NA", $leot->umidlingua);
		$exsudatol1 = $fachada->checkPOST("exsudatol", "P", $leot->exsudatol);
		$exsudatol2 = $fachada->checkPOST("exsudatol", "A", $leot->exsudatol);
		$exsudatol3 = $fachada->checkPOST("exsudatol", "NA", $leot->exsudatol);
		$tremlingua1 = $fachada->checkPOST("tremlingua", "P", $leot->tremlingua);
		$tremlingua2 = $fachada->checkPOST("tremlingua", "A", $leot->tremlingua);
		$tremlingua3 = $fachada->checkPOST("tremlingua", "NA", $leot->tremlingua);
		$tumoracoes1 = $fachada->checkPOST("tumoracoes", "P", $leot->tumoracoes);
		$tumoracoes2 = $fachada->checkPOST("tumoracoes", "A", $leot->tumoracoes);
		$tumoracoes3 = $fachada->checkPOST("tumoracoes", "NA", $leot->tumoracoes);
		$numdentes1 = $fachada->checkOption("numdentes", "N", $leot->numdentes);
		$numdentes2 = $fachada->checkOption("numdentes", "A", $leot->numdentes);
		$numdentes3 = $fachada->checkOption("numdentes", "NA", $leot->numdentes);
		$consdentes1 = $fachada->checkOption("consdentes", "B", $leot->consdentes);
		$consdentes2 = $fachada->checkOption("consdentes", "R", $leot->consdentes);
		$consdentes3 = $fachada->checkOption("consdentes", "P", $leot->consdentes);	
		$consdentes4 = $fachada->checkOption("consdentes", "NA", $leot->consdentes);
		$corfaringe1 = $fachada->checkOption("corfaringe", "N", $leot->corfaringe);
		$corfaringe2 = $fachada->checkOption("corfaringe", "A", $leot->corfaringe);
		$corfaringe3 = $fachada->checkOption("corfaringe", "NA", $leot->corfaringe);
		$exsudatof1 = $fachada->checkPOST("exsudatof", "P", $leot->exsudatof);
		$exsudatof2 = $fachada->checkPOST("exsudatof", "A", $leot->exsudatof);
		$exsudatof3 = $fachada->checkPOST("exsudatof", "NA", $leot->exsudatof);
		$impldentes1 = $fachada->checkOption("impldentes", "N", $leot->impldentes);
		$impldentes2 = $fachada->checkOption("impldentes", "A", $leot->impldentes);
		$impldentes3 = $fachada->checkOption("impldentes", "NA", $leot->impldentes);
		$obsotor = $fachada->printOBS($leot->obs, $_POST['obsotor']);
		$titulopront = "Exame F&iacute;sico > Especial > Otorrinolaringol&oacute;gico";
        break;
    case "exame_pescoco":
        $div = "div_exame";
        $dir = "exame/aba_pescoco";
		$lepes = $fachada->getValuesTableAt('examepescoco',$atend);
		$retracoesp1 = $fachada->checkPOST("retracoesp", "P", $lepes->retracoesp);
		$retracoesp2 = $fachada->checkPOST("retracoesp", "A", $lepes->retracoesp);
		$retracoesp3 = $fachada->checkPOST("retracoesp", "NA", $lepes->retracoesp);
		$torcicolo1 = $fachada->checkPOST("torcicolo", "P", $lepes->torcicolo);
		$torcicolo2 = $fachada->checkPOST("torcicolo", "A", $lepes->torcicolo);
		$torcicolo3 = $fachada->checkPOST("torcicolo", "NA", $lepes->torcicolo);
		$claviculas1 = $fachada->checkOption("claviculas", "N", $lepes->claviculas);
		$claviculas2 = $fachada->checkOption("claviculas", "Al", $lepes->claviculas);
		$claviculas3 = $fachada->checkOption("claviculas", "Au", $lepes->claviculas);
		$claviculas4 = $fachada->checkOption("claviculas", "NA", $lepes->claviculas);
		$tireoide1 = $fachada->checkOption("tireoide", "N", $lepes->tireoide);
		$tireoide2 = $fachada->checkOption("tireoide", "Al", $lepes->tireoide);
		$tireoide3 = $fachada->checkOption("tireoide", "Au", $lepes->tireoide);
		$tireoide4 = $fachada->checkOption("tireoide", "NA", $lepes->tireoide);
		$massastum1 = $fachada->checkPOST("massastum", "P", $lepes->massastum);
		$massastum2 = $fachada->checkPOST("massastum", "A", $lepes->massastum);
		$massastum3 = $fachada->checkPOST("massastum", "NA", $lepes->massastum);
		$fistulas1 = $fachada->checkPOST("fistulas", "P", $lepes->fistulas);
		$fistulas2 = $fachada->checkPOST("fistulas", "A", $lepes->fistulas);
		$fistulas3 = $fachada->checkPOST("fistulas", "NA", $lepes->fistulas);
		$rigidez1 = $fachada->checkPOST("rigidez", "P", $lepes->rigidez);
		$rigidez2 = $fachada->checkPOST("rigidez", "A", $lepes->rigidez);
		$rigidez3 = $fachada->checkPOST("rigidez", "NA", $lepes->rigidez);
		$fossapesc1 = $fachada->checkOption("fosspesc", "N", $lepes->fosspesc); 
		$fossapesc2 = $fachada->checkOption("fosspesc", "A+", $lepes->fosspesc); 
		$fossapesc3 = $fachada->checkOption("fosspesc", "A", $lepes->fosspesc); 
		$fossapesc4 = $fachada->checkOption("fosspesc", "NA", $lepes->fosspesc); 
		$obspesc = $fachada->printOBS($lepes->obs, $_POST['obspesc']); 
		$titulopront = "Exame F&iacute;sico > Especial > Pesco&ccedil;o";
        break;
    case "exame_cardio":
        $div = "div_exame";
        $dir = "exame/aba_cardvasc";
		$lecdvs = $fachada->getValuesTableAt('examecardvasc',$atend);
		$precrd1 = $fachada->checkOption("precord", "A", $lecdvs->precord);
		$precrd2 = $fachada->checkOption("precord", "R", $lecdvs->precord);
		$precrd3 = $fachada->checkOption("precord", "NA", $lecdvs->precord);
		$ici1 = $fachada->checkOption("ictuscordi", "S", $lecdvs->ictuscordi);
		$ici2 = $fachada->checkOption("ictuscordi", "A", $lecdvs->ictuscordi);
		$ici3 = $fachada->checkOption("ictuscordi", "NA", $lecdvs->ictuscordi);	
		$icp1 = $fachada->checkOption("ictuscordp", "BN", $lecdvs->ictuscordp);
		$icp2 = $fachada->checkOption("ictuscordp", "BA", $lecdvs->ictuscordp);
		$icp3 = $fachada->checkOption("ictuscordp", "NA", $lecdvs->ictuscordp);
		$artper1 = $fachada->checkOption("artperif", "N", $lecdvs->artperif);
		$artper2 = $fachada->checkOption("artperif", "A", $lecdvs->artperif);
		$artper3 = $fachada->checkOption("artperif", "NA", $lecdvs->artperif);
		$bulhas1 = $fachada->checkOption("bulhas", "NF", $lecdvs->bulhas);
		$bulhas2 = $fachada->checkOption("bulhas", "+F", $lecdvs->bulhas);
		$bulhas3 = $fachada->checkOption("bulhas", "-F", $lecdvs->bulhas);
		$bulhas4 = $fachada->checkOption("bulhas", "NA", $lecdvs->bulhas);
		$sopros1 = $fachada->checkPOST("sopros", "P", $lecdvs->sopros);
		$sopros2 = $fachada->checkPOST("sopros", "A", $lecdvs->sopros);
		$sopros3 = $fachada->checkPOST("sopros", "NA", $lecdvs->sopros);
		$presart1 = $fachada->checkOption("pressaoart", "NA", $lecdvs->pressaoart);
		$presart2 = $fachada->checkOption("pressaoart", "AV", $lecdvs->pressaoart);
		$dpresart = $fachada->checkDisable("pressaoart", $lecdvs->pressaoart, "AV");
		$presartin = $fachada->printOBS($lecdvs->pressaoartin, $_POST['pressaoartin']);
		if ($msge && $_POST['pressaoart'] == "AV" && !ereg("^([0-2][0-9])/([0-9])$", $pressaoartin))
			$lblpart = "class='erro'";
		$frqcrd1 = $fachada->checkOption("freqcard", "NA", $lecdvs->freqcard);
		$frqcrd2 = $fachada->checkOption("freqcard", "AV", $lecdvs->freqcard);
		$dfrqcrd = $fachada->checkDisable("freqcard", $lecdvs->freqcard, "AV");
		$frqcrdin = $fachada->printOBS($lecdvs->freqcardin, $_POST['freqcardin']);
		if ($msge && $_POST['freqcard'] == "AV" && !is_numeric($_POST['freqcardin']))
			$lblfqcd = "class='erro'";		
		$obscdvs = $fachada->printOBS($lecdvs->obs, $_POST['obscdvs']);
		$titulopront = "Exame F&iacute;sico > Especial > Cardiovascular";
		break;
    case "exame_apresp":
        $div = "div_exame";
        $dir = "exame/aba_apresp";
		$lersp = $fachada->getValuesTableAt('exameresp',$atend);
		$formtorax1 = $fachada->checkOption("formtorax", "N", $lersp->formtorax);
		$formtorax2 = $fachada->checkOption("formtorax", "B", $lersp->formtorax);
		$formtorax3 = $fachada->checkOption("formtorax", "PP", $lersp->formtorax);
		$formtorax4 = $fachada->checkOption("formtorax", "A", $lersp->formtorax);
		$formtorax5 = $fachada->checkOption("formtorax", "NA", $lersp->formtorax);
		$simtorax1 = $fachada->checkOption("simtorax", "S", $lersp->simtorax);
		$simtorax2 = $fachada->checkOption("simtorax", "N", $lersp->simtorax);
		$simtorax3 = $fachada->checkOption("simtorax", "NA", $lersp->simtorax);
		$contornos1 = $fachada->checkOption("contornos", "N", $lersp->contornos);
		$contornos2 = $fachada->checkOption("contornos", "A", $lersp->contornos);
		$contornos3 = $fachada->checkOption("contornos", "NA", $lersp->contornos);
		$proemi1 = $fachada->checkPOST("proemi", "P", $lersp->proemi);
		$proemi2 = $fachada->checkPOST("proemi", "A", $lersp->proemi);
		$proemi3 = $fachada->checkPOST("proemi", "NA", $lersp->proemi);
		$massasanorm1 = $fachada->checkPOST("massasanorm", "P", $lersp->massasanorm);
		$massasanorm2 = $fachada->checkPOST("massasanorm", "A", $lersp->massasanorm);
		$massasanorm3 = $fachada->checkPOST("massasanorm", "NA", $lersp->massasanorm);
		$mamas1 = $fachada->checkOption("mamas", "N", $lersp->mamas);
		$mamas2 = $fachada->checkOption("mamas", "A", $lersp->mamas);
		$mamas3 = $fachada->checkOption("mamas", "D", $lersp->mamas);
		$mamas4 = $fachada->checkOption("mamas", "PM", $lersp->mamas);
		$mamas5 = $fachada->checkOption("mamas", "NA", $lersp->mamas);
		$tresp1 = $fachada->checkOption("tresp", "N", $lersp->tresp);
		$tresp2 = $fachada->checkOption("tresp", "D", $lersp->tresp);
		$tresp3 = $fachada->checkOption("tresp", "CS", $lersp->tresp);
		$tresp4 = $fachada->checkOption("tresp", "B", $lersp->tresp);
		$tresp5 = $fachada->checkOption("tresp", "K", $lersp->tresp);
		$tresp6 = $fachada->checkOption("tresp", "S", $lersp->tresp);
		$tresp7 = $fachada->checkOption("tresp", "NA", $lersp->tresp);
		$tirinterc1 = $fachada->checkPOST("tirinterc", "P", $lersp->tirinterc);
		$tirinterc2 = $fachada->checkPOST("tirinterc", "A", $lersp->tirinterc);
		$tirinterc3 = $fachada->checkPOST("tirinterc", "NA", $lersp->tirinterc);
		$freqresp1 = $fachada->checkOption("freqresp", "N", $lersp->freqresp);
		$freqresp2 = $fachada->checkOption("freqresp", "D", $lersp->freqresp);
		$freqresp3 = $fachada->checkOption("freqresp", "A", $lersp->freqresp);
		$freqresp4 = $fachada->checkOption("freqresp", "NA", $lersp->freqresp);
		$fremtv1 = $fachada->checkOption("fremtv", "N", $lersp->fremtv);
		$fremtv2 = $fachada->checkOption("fremtv", "PD", $lersp->fremtv);
		$fremtv3 = $fachada->checkOption("fremtv", "PA", $lersp->fremtv);
		$fremtv4 = $fachada->checkOption("fremtv", "A", $lersp->fremtv);
		$fremtv5 = $fachada->checkOption("fremtv", "NA", $lersp->fremtv);
		$frembronq1 = $fachada->checkPOST("frembronq", "P", $lersp->frembronq);
		$frembronq2 = $fachada->checkPOST("frembronq", "A", $lersp->frembronq);
		$frembronq3 = $fachada->checkPOST("frembronq", "NA", $lersp->frembronq);
		$frempleur1 = $fachada->checkPOST("frempleur", "P", $lersp->frempleur);
		$frempleur2 = $fachada->checkPOST("frempleur", "A", $lersp->frempleur);
		$frempleur3 = $fachada->checkPOST("frempleur", "NA", $lersp->frempleur);
		$submacicez1 = $fachada->checkOption("submacicez", "AH", $lersp->submacicez); 
		$submacicez2 = $fachada->checkOption("submacicez", "HD", $lersp->submacicez); 
		$submacicez3 = $fachada->checkOption("submacicez", "HE", $lersp->submacicez); 
		$submacicez4 = $fachada->checkOption("submacicez", "A", $lersp->submacicez); 
		$submacicez5 = $fachada->checkOption("submacicez", "NA", $lersp->submacicez); 
		$macicez1 = $fachada->checkOption("macicez", "AH", $lersp->macicez); 
		$macicez2 = $fachada->checkOption("macicez", "HD", $lersp->macicez); 
		$macicez3 = $fachada->checkOption("macicez", "HE", $lersp->macicez); 
		$macicez4 = $fachada->checkOption("macicez", "A", $lersp->macicez); 
		$macicez5 = $fachada->checkOption("macicez", "NA", $lersp->macicez); 
		$timpanico1 = $fachada->checkOption("timpanico", "AH", $lersp->timpanico); 
		$timpanico2 = $fachada->checkOption("timpanico", "HD", $lersp->timpanico); 
		$timpanico3 = $fachada->checkOption("timpanico", "HE", $lersp->timpanico); 
		$timpanico4 = $fachada->checkOption("timpanico", "A", $lersp->timpanico); 
		$timpanico5 = $fachada->checkOption("timpanico", "NA", $lersp->timpanico); 
		$murmvesic1 = $fachada->checkOption("murmvesic", "AH", $lersp->murmvesic); 
		$murmvesic2 = $fachada->checkOption("murmvesic", "HD", $lersp->murmvesic); 
		$murmvesic3 = $fachada->checkOption("murmvesic", "HE", $lersp->murmvesic); 
		$murmvesic4 = $fachada->checkOption("murmvesic", "A", $lersp->murmvesic); 
		$murmvesic5 = $fachada->checkOption("murmvesic", "NA", $lersp->murmvesic); 
		$atritopl1 = $fachada->checkPOST("atritopl", "P", $lersp->atritopleur);
		$atritopl2 = $fachada->checkPOST("atritopl", "A", $lersp->atritopleur);
		$atritopl3 = $fachada->checkPOST("atritopl", "NA", $lersp->atritopleur);
		$estertores1 = $fachada->checkPOST("estertores", "P", $lersp->estertores);
		$estertores2 = $fachada->checkPOST("estertores", "A", $lersp->estertores);
		$estertores3 = $fachada->checkPOST("estertores", "NA", $lersp->estertores);
		$estridores1 = $fachada->checkPOST("estridores", "P", $lersp->estridores);
		$estridores2 = $fachada->checkPOST("estridores", "A", $lersp->estridores);
		$estridores3 = $fachada->checkPOST("estridores", "NA", $lersp->estridores);
		$sibilos1 = $fachada->checkPOST("sibilos", "P", $lersp->sibilos);
		$sibilos2 = $fachada->checkPOST("sibilos", "A", $lersp->sibilos);
		$sibilos3 = $fachada->checkPOST("sibilos", "NA", $lersp->sibilos);
		$obsresp = $fachada->printOBS($lersp->obs, $_POST['obsresp']);
		$titulopront = "Exame F&iacute;sico > Especial > Respirat&oacute;rio";
        break;
    case "exame_apgast":
        $div = "div_exame";
		$dir = "exame/aba_apgastint";
		$legt = $fachada->getValuesTableAt('examegastint',$atend);
		$formabd1 = $fachada->checkOption("formabd", "N", $legt->formabd);
		$formabd2 = $fachada->checkOption("formabd", "A", $legt->formabd);
		$formabd3 = $fachada->checkOption("formabd", "R", $legt->formabd);
		$formabd4 = $fachada->checkOption("formabd", "NA", $legt->formabd);
		$cicatumb1 = $fachada->checkOption("cicatumb", "N", $legt->cicatumb);
		$cicatumb2 = $fachada->checkOption("cicatumb", "P", $legt->cicatumb);
		$cicatumb3 = $fachada->checkOption("cicatumb", "NA", $legt->cicatumb);
		$peristal1 = $fachada->checkOption("peristal", "N", $legt->peristal);
		$peristal2 = $fachada->checkOption("peristal", "A", $legt->peristal);
		$peristal3 = $fachada->checkOption("peristal", "NA", $legt->peristal);
		$distensao1 = $fachada->checkPOST("distensao", "P", $legt->distensao);
		$distensao2 = $fachada->checkPOST("distensao", "A", $legt->distensao);
		$distensao3 = $fachada->checkPOST("distensao", "NA", $legt->distensao);
		$tumorgt1 = $fachada->checkPOST("tumorgt", "P", $legt->tumorgt);
		$tumorgt2 = $fachada->checkPOST("tumorgt", "A", $legt->tumorgt);
		$tumorgt3 = $fachada->checkPOST("tumorgt", "NA", $legt->tumorgt);
		$ondfluidas1 = $fachada->checkPOST("ondfluidas", "P", $legt->ondfluidas);
		$ondfluidas2 = $fachada->checkPOST("ondfluidas", "A", $legt->ondfluidas);
		$ondfluidas3 = $fachada->checkPOST("ondfluidas", "NA", $legt->ondfluidas);
		$timpangt1 = $fachada->checkOption("timpangt", "N", $legt->timpangt);
		$timpangt2 = $fachada->checkOption("timpangt", "A", $legt->timpangt);
		$timpangt3 = $fachada->checkOption("timpangt", "NA", $legt->timpangt);
		$paredmusc1 = $fachada->checkOption("paredesmusc", "N", $legt->paredesmusc);
		$paredmusc2 = $fachada->checkOption("paredesmusc", "A", $legt->paredesmusc);
		$paredmusc3 = $fachada->checkOption("paredesmusc", "NA", $legt->paredesmusc);
		$espasmos1 = $fachada->checkPOST("espasmos", "P", $legt->espasmos);
		$espasmos2 = $fachada->checkPOST("espasmos", "A", $legt->espasmos);
		$espasmos3 = $fachada->checkPOST("espasmos", "NA", $legt->espasmos);
		$rigidezgt1 = $fachada->checkPOST("rigidezgt", "P", $legt->rigidez);
		$rigidezgt2 = $fachada->checkPOST("rigidezgt", "A", $legt->rigidez);
		$rigidezgt3 = $fachada->checkPOST("rigidezgt", "NA", $legt->rigidez);
		$dorgt1 = $fachada->checkPOST("dorgt", "P", $legt->dor);
		$dorgt2 = $fachada->checkPOST("dorgt", "A", $legt->dor);
		$dorgt3 = $fachada->checkPOST("dorgt", "NA", $legt->dor);
		$estom1 = $fachada->checkOption("estomago", "N", $legt->estomago);
		$estom2 = $fachada->checkOption("estomago", "A", $legt->estomago);
		$estom3 = $fachada->checkOption("estomago", "NA", $legt->estomago);
		$figado1 = $fachada->checkOption("figado", "N", $legt->figado);
		$figado2 = $fachada->checkOption("figado", "A", $legt->figado);
		$figado3 = $fachada->checkOption("figado", "NA", $legt->figado);
		$baco1 = $fachada->checkOption("baco", "N", $legt->baco);
		$baco2 = $fachada->checkOption("baco", "A", $legt->baco);
		$baco3 = $fachada->checkOption("baco", "NA", $legt->baco);
		$rins1 = $fachada->checkOption("rins", "N", $legt->rins);
		$rins2 = $fachada->checkOption("rins", "G", $legt->rins);
		$rins3 = $fachada->checkOption("rins", "NA", $legt->rins);
		$masstum1 = $fachada->checkPOST("massastumgt", "P", $legt->massastum);
		$masstum2 = $fachada->checkPOST("massastumgt", "A", $legt->massastum);
		$masstum3 = $fachada->checkPOST("massastumgt", "NA", $legt->massastum);
		$hernias1 = $fachada->checkOption("hernias", "A", $legt->hernias);
		$hernias2 = $fachada->checkOption("hernias", "PR", $legt->hernias);
		$hernias3 = $fachada->checkOption("hernias", "PI", $legt->hernias);
		$hernias4 = $fachada->checkOption("hernias", "NA", $legt->hernias);
		$ruidosha1 = $fachada->checkPOST("ruidosha", "P", $legt->ruidosha);
		$ruidosha2 = $fachada->checkPOST("ruidosha", "A", $legt->ruidosha);
		$ruidosha3 = $fachada->checkPOST("ruidosha", "NA", $legt->ruidosha);
		$obsgi = $fachada->printOBS($legt->obs, $_POST['obsgi']);
		$titulopront = "Exame F&iacute;sico > Especial > Gastro-Intestinal";
        break;
    case "exame_genurin":
        $div = "div_exame";
        $dir = "exame/aba_genurin";
		$legu = $fachada->getValuesTableAt('examegenurin',$atend);
		if ($paciente->getSexo() == "F"){
			$lesf = $fachada->getValuesTableAt('examegenfem',$atend);
			$fem = 1;
		}
		if ($paciente->getSexo() == "M"){ 
			$lesm = $fachada->getValuesTableAt('examegenmasc',$atend);
		}	
		$peqlabios1 = $fachada->checkOption("peqlabios", "N", $lesf->peqlabios);
		$peqlabios2 = $fachada->checkOption("peqlabios", "C", $lesf->peqlabios);
		$peqlabios3 = $fachada->checkOption("peqlabios", "NA", $lesf->peqlabios);
		$himen1 = $fachada->checkOption("himen", "N", $lesf->himen);
		$himen2 = $fachada->checkOption("himen", "C", $lesf->himen);
		$himen3 = $fachada->checkOption("himen", "NA", $lesf->himen);
		$secrvag1 = $fachada->checkPOST("secrvag", "P", $lesf->secrvag);
		$secrvag2 = $fachada->checkPOST("secrvag", "A", $lesf->secrvag);
		$secrvag3 = $fachada->checkPOST("secrvag", "NA", $lesf->secrvag);
		$fimose1 = $fachada->checkOption("fimose", "F", $lesm->fimose);
		$fimose2 = $fachada->checkOption("fimose", "P", $lesm->fimose);
		$fimose3 = $fachada->checkOption("fimose", "A", $lesm->fimose);
		$fimose4 = $fachada->checkOption("fimose", "NA", $lesm->fimose);
		$circunc1 = $fachada->checkPOST("circuncisao", "P", $lesm->circuncisao);
		$circunc2 = $fachada->checkPOST("circuncisao", "A", $lesm->circuncisao);
		$circunc3 = $fachada->checkPOST("circuncisao", "NA", $lesm->circuncisao);
		$hidrocele1 = $fachada->checkPOST("hidrocele", "P", $lesm->hidrocele);
		$hidrocele2 = $fachada->checkPOST("hidrocele", "A", $lesm->hidrocele);
		$hidrocele3 = $fachada->checkPOST("hidrocele", "NA", $lesm->hidrocele);
		$varicocele1 = $fachada->checkPOST("varicocele", "P", $lesm->varicocele);
		$varicocele2 = $fachada->checkPOST("varicocele", "A", $lesm->varicocele);
		$varicocele3 = $fachada->checkPOST("varicocele", "NA", $lesm->varicocele);
		$testiculos1 = $fachada->checkOption("testiculos", "N", $lesm->testiculos);
		$testiculos2 = $fachada->checkOption("testiculos", "A+", $lesm->testiculos);
		$testiculos3 = $fachada->checkOption("testiculos", "C", $lesm->testiculos);
		$testiculos4 = $fachada->checkOption("testiculos", "AT", $lesm->testiculos);
		$testiculos5 = $fachada->checkOption("testiculos", "Au", $lesm->testiculos);
		$testiculos6 = $fachada->checkOption("testiculos", "NA", $lesm->testiculos);
		$secruret1 = $fachada->checkPOST("secruret", "P", $legu->secruret);
		$secruret2 = $fachada->checkPOST("secruret", "A", $legu->secruret);
		$secruret3 = $fachada->checkPOST("secruret", "NA", $legu->secruret);
		$pelos1 = $fachada->checkOption("pelos", "N", $legu->pelos);
		$pelos2 = $fachada->checkOption("pelos", "A", $legu->pelos);
		$pelos3 = $fachada->checkOption("pelos", "NA", $legu->pelos);
		$lojrenais1 = $fachada->checkOption("lojrenais", "N", $legu->lojrenais);
		$lojrenais2 = $fachada->checkOption("lojrenais", "A", $legu->lojrenais);
		$lojrenais3 = $fachada->checkOption("lojrenais", "NA", $legu->lojrenais);
		$bexiga1 = $fachada->checkOption("bexiga", "N", $legu->bexiga);
		$bexiga2 = $fachada->checkOption("bexiga", "A", $legu->bexiga);
		$bexiga3 = $fachada->checkOption("bexiga", "NA", $legu->bexiga);
		$aspectogu1 = $fachada->checkOption("aspectogu", "N", $legu->aspectogu);
		$aspectogu2 = $fachada->checkOption("aspectogu", "As", $legu->aspectogu);
		$aspectogu3 = $fachada->checkOption("aspectogu", "A", $legu->aspectogu);
		$aspectogu4 = $fachada->checkOption("aspectogu", "NA", $legu->aspectogu);
		$anus1 = $fachada->checkOption("anus", "N", $legu->anus);
		$anus2 = $fachada->checkOption("anus", "F", $legu->anus);
		$anus3 = $fachada->checkOption("anus", "P", $legu->anus);
		$anus4 = $fachada->checkOption("anus", "E", $legu->anus);
		$anus5 = $fachada->checkOption("anus", "NA", $legu->anus);
		$obsgen = $fachada->printOBS($legu->obs, $_POST['obsgen']);
		$titulopront = "Exame F&iacute;sico > Especial > Genito-Urin&aacute;rio";
		break;
    case "exame_muscesq":
        $div = "div_exame";
        $dir = "exame/aba_muscesq";
		$leme = $fachada->getValuesTableAt('examemuscesq',$atend);
		$anomalias1 = $fachada->checkPOST("anomaliasme", "P", $leme->anomalias);
		$anomalias2 = $fachada->checkPOST("anomaliasme", "A", $leme->anomalias);
		$anomalias3 = $fachada->checkPOST("anomaliasme", "NA", $leme->anomalias);
		$deformidades1 = $fachada->checkPOST("deformidadesme", "P", $leme->deformidades);
		$deformidades2 = $fachada->checkPOST("deformidadesme", "A", $leme->deformidades);
		$deformidades3 = $fachada->checkPOST("deformidadesme", "NA", $leme->deformidades);
		$edemas1 = $fachada->checkPOST("edemasme", "P", $leme->edemas);
		$edemas2 = $fachada->checkPOST("edemasme", "A", $leme->edemas);
		$edemas3 = $fachada->checkPOST("edemasme", "NA", $leme->edemas);
		$tumoracoes1 = $fachada->checkPOST("tumoracoesme", "P", $leme->tumoracoes);
		$tumoracoes2 = $fachada->checkPOST("tumoracoesme", "A", $leme->tumoracoes);
		$tumoracoes3 = $fachada->checkPOST("tumoracoesme", "NA", $leme->tumoracoes);
		$forcamusc1 = $fachada->checkOption("forcamusc", "N", $leme->forcamusc);
		$forcamusc2 = $fachada->checkOption("forcamusc", "D", $leme->forcamusc);
		$forcamusc3 = $fachada->checkOption("forcamusc", "NA", $leme->forcamusc);
		$dorossea1 = $fachada->checkPOST("dorossea", "P", $leme->dorossea);
		$dorossea2 = $fachada->checkPOST("dorossea", "A", $leme->dorossea);
		$dorossea3 = $fachada->checkPOST("dorossea", "NA", $leme->dorossea);
		$movativa1 = $fachada->checkOption("movativa", "N", $leme->movativa);
		$movativa2 = $fachada->checkOption("movativa", "L", $leme->movativa);
		$movativa3 = $fachada->checkOption("movativa", "NA", $leme->movativa);
		$movpassiva1 = $fachada->checkOption("movpassiva", "N", $leme->movpassiva);
		$movpassiva2 = $fachada->checkOption("movpassiva", "L", $leme->movpassiva);
		$movpassiva3 = $fachada->checkOption("movpassiva", "NA", $leme->movpassiva);
		$escoliose1 = $fachada->checkPOST("escoliose", "P", $leme->escoliose);
		$escoliose2 = $fachada->checkPOST("escoliose", "A", $leme->escoliose);
		$escoliose3 = $fachada->checkPOST("escoliose", "NA", $leme->escoliose);
		$lordose1 = $fachada->checkPOST("lordose", "P", $leme->lordose);
		$lordose2 = $fachada->checkPOST("lordose", "A", $leme->lordose);
		$lordose3 = $fachada->checkPOST("lordose", "NA", $leme->lordose);
		$cifose1 = $fachada->checkPOST("cifose", "P", $leme->cifose);
		$cifose2 = $fachada->checkPOST("cifose", "A", $leme->cifose);
		$cifose3 = $fachada->checkPOST("cifose", "NA", $leme->cifose);
		$curvfrente1 = $fachada->checkPOST("curvfrente", "P", $leme->curvfrente);
		$curvfrente2 = $fachada->checkPOST("curvfrente", "A", $leme->curvfrente);
		$curvfrente3 = $fachada->checkPOST("curvfrente", "NA", $leme->curvfrente);
		$espmusc1 = $fachada->checkPOST("espmusc", "P", $leme->espmusc);
		$espmusc2 = $fachada->checkPOST("espmusc", "A", $leme->espmusc);
		$espmusc3 = $fachada->checkPOST("espmusc", "NA", $leme->espmusc);
		$dorlocalme1 = $fachada->checkPOST("dorlocal", "P", $leme->dorlocal);
		$dorlocalme2 = $fachada->checkPOST("dorlocal", "A", $leme->dorlocal);
		$dorlocalme3 = $fachada->checkPOST("dorlocal", "NA", $leme->dorlocal);
		$dorreflexame1 = $fachada->checkPOST("dorreflexa", "P", $leme->dorreflexa);
		$dorreflexame2 = $fachada->checkPOST("dorreflexa", "A", $leme->dorreflexa);
		$dorreflexame3 = $fachada->checkPOST("dorreflexa", "NA", $leme->dorreflexa);
		$obsmusc = $fachada->printOBS($leme->obs, $_POST['obsmusc']);
		$titulopront = "Exame F&iacute;sico > Especial > M&uacute;sculo-Esquel&eacute;tico";
		break;
    case "exame_nervoso":
        $div = "div_exame";
        $dir = "exame/aba_nerv";
		$lenv = $fachada->getValuesTableAt('examenervoso',$atend);
		$nivconsc1 = $fachada->checkOption("nivconsc", "A", $lenv->nivconsc);
		$nivconsc2 = $fachada->checkOption("nivconsc", "S", $lenv->nivconsc);
		$nivconsc3 = $fachada->checkOption("nivconsc", "NA", $lenv->nivconsc);
		$orientacao1 = $fachada->checkPOST("orientacao", "S", $lenv->orientacao);
		$orientacao2 = $fachada->checkPOST("orientacao", "N", $lenv->orientacao);
		$orientacao3 = $fachada->checkPOST("orientacao", "NA", $lenv->orientacao);
		$sinfocais1 = $fachada->checkOption("sinfocais", "N", $lenv->sinfocais); 
		$sinfocais2 = $fachada->checkOption("sinfocais", "A", $lenv->sinfocais); 
		$sinfocais3 = $fachada->checkOption("sinfocais", "NA", $lenv->sinfocais); 
		$obsnerv = $fachada->printOBS($lenv->obs, $_POST['obsnerv']);
		$titulopront = "Exame F&iacute;sico > Especial > Nervoso";
        break;
    case "conduta":
        $div = "div_conduta";
        $dir = "aba_condutas";
		$conduta = $fachada->printOBS($linha->conduta, $_POST['conduta']);
		if ($msge && !$_POST['conduta'])
			$lblcd = "class='erro'";
		$titulopront = "Conduta";
        break;
    case "hd":
        $div = "div_hd";
        $dir = "aba_hd";
		if ($msgi) $hipdiag = "";
		else $hipdiag = $fachada->printOBS($_POST['hipdiag'],$hipotese->hipotese);
		$listahip = $fachada->listaHD($atend);
		if ($msge && !$_POST['hipdiag'])
			$lblhd = "class='erro'";
		$titulopront = "Hip&oacute;tese de Diagn&oacute;stico";
		break;
    default:
        $div = "div_paciente";
        $dir = "aba_informante";
		$informante = $fachada->consultaInformante($atend);
		$parentesco = $fachada->consultaParentesco();
		$escolaridade = $fachada->consultaEscolaridade();

		$valInfo[0] = $fachada->printOBS($informante->nome,$_POST['nome']);
		$valInfo[7] = $fachada->printOBS($informante->ender, $_POST['ende']);
		$valInfo[9] = $fachada->printOBS($informante->compl,$_POST['compl']);
		$valInfo[8] = $fachada->printOBS($informante->num,$_POST['num']);
		$valInfo[10] = $fachada->printOBS($informante->bairro,$_POST['bairro']);
		$valInfo[11] = $fachada->printCampo($informante->cidade,$_POST['cidade']);
		$valInfo[12] = $fachada->printCampo($informante->uf,$_POST['uf']);
		$valInfo[13] = $fachada->printOBS($informante->cep,$_POST['cep']);
		/*if (!$informante->sav){ 
			$valInfo[7] = $paciente->getEndereco();
			$valInfo[10] = $paciente->getBairro();
			$valInfo[11] = $paciente->getCidade();
			$valInfo[12] = $paciente->getUF();
			$valInfo[13] = $paciente->getCEP();
		}*/
		$valInfo[14] = $fachada->printOBS($informante->obs, $_POST['obsinfo']);
		$sexoM = $fachada->checkPOST("sexo", "M", $informante->sexo);
		$sexoF = $fachada->checkPOST("sexo", "F", $informante->sexo);
		$titulopront = 'Cadastro do Informante<span class="style7" style="margin-left:20%;">(*) Campos Obrigat&oacute;rios</span>';
		break;
}
		
$data = $fachada->printData($paciente->getDTNasc());

if(strlen($paciente->getNome())>30){

	$array = explode(" ", $paciente->getNome());
	$tamanho = 0;

	while(($tamanho + strlen(current($array))) < 30){
		$name .= current($array).' ';
		$tamanho = $tamanho + strlen(current($array));
		next($array);
	}

}else{
	$name = $paciente->getNome();
}

$natural = $paciente->getCidade()."/".$paciente->getUF();
if ($paciente->getSexo() == "F") $sexo = "Feminino";
else if ($paciente->getSexo() == "M") $sexo = "Masculino";
else $sexo = "Indefinido";
if ($paciente->getAlergias() == "S") $alerg = "Sim";
else if ($paciente->getAlergias() == "N") $alerg = "N&atilde;o";
else $alerg = "N&atilde;o Avaliado";
if ($paciente->getAlergmed() == "S") $alergmed = "Sim";
else if ($paciente->getAlergmed() == "N") $alergmed = "N&atilde;o";
else $alergmed = "N&atilde;o Avaliado";

?>
