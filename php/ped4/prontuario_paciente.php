<?php

include ("includer.php");

$atend = $_GET['at'];
$gamb = $_POST['gamb'];

validarAtendimento($usuario->getLogin(), $atend);
$paciente = obterPacienteAt($usuario->getLogin(), $atend);
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

if ($_POST['salvar'] == "Salvar" || $assinar){
	$flag = 1;
	$n = $_GET['n'];
	include ("fachada.php");
	include ("classes/adendo.php");
	$fachada = new Fachada();

	switch ($n){

		case "informante":
			try {
				include ("classes/Informante.php");
				$informante = new Informante($_POST['nome'], $_POST['sexo'], $_POST['ende'],$_POST['comp'], $_POST['bairro'],
				$_POST['cidade'], $_POST['estado'], $_POST['cep'], $_POST['escol'], $_POST['parent'], $_POST['obsinfo']);
				$fachada->inserirInformante($informante, $atend);
			} catch (CamposInvalidos $e) {
				$error = 1;
			}
			break;

		case "qpdhda":
			include ("classes/QPDHDA.php");
			$qpdhda = new QPDHDA($_POST['QPD'], $_POST['HDA']);
			if (!QPDHDAAssinado($atend)){
				try {
					$fachada->inserirQPDHDA($qpdhda, $atend, $assinar, $usuario->getID());
				} catch (CamposInvalidos $e){
					$error = 1;
				}
			} else {
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoQH($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=qpdhda&flag=1');
				} catch (CamposInvalidos $e) {
					$error = 1;
				}
			}
			break;

		/*case "is":

			$ccaba = $_POST['ccaba'];
			$assinatura = ISAssinado($atend);
			$msge = "";
			$msgi = "";
			if (!$assinatura){
				try {
					if (verPreenchimento($ccaba,'1')){
						$fachada->inserirGeralIS($_POST['febre'], $_POST['altpeso'], $_POST['atividade'], $_POST['apetite'],
						$_POST['obsgeral'], $atend);
						$msgi = printMsg($msgi, "Geral");
						setGeral($atend);
					}
				} catch (CamposInvalidos $e) {	
					$msge = "Geral";
				}
				try {
					if (verPreenchimento($ccaba,'2')){
						$fachada->inserirPeleIS($_POST['rash'], $_POST['ictericia'], $_POST['infecrep'], $_POST['obspele'], $atend);
						$msgi = printMsg($msgi, "Pele");
						setPeleIs($atend);
					}
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Pele");
				}
				try {
					if (verPreenchimento($ccaba,'3')){
						$fachada->inserirOlhosIS($_POST['fotofobia'], $_POST['lacrim'], $_POST['edemapalp'], $_POST['secrecaool'],
						$_POST['dorolho'], $_POST['acuidvis'], $_POST['obsolho'], $atend);
						$msgi = printMsg($msgi, "Olhos");
						setOlhosIs($atend);
					}
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Olhos");
				}
				try {
					if (verPreenchimento($ccaba,'4')){
						$fachada->inserirOuvidosIS($_POST['inffreq'], $_POST['secrecaoou'], $_POST['dorouvido'], $_POST['acuidaud'],
						$_POST['obsouvido'], $atend);
						$msgi = printMsg($msgi, "Ouvidos");
						setOuvidos($atend);
					}
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Ouvidos");
				}
				try {
					if (verPreenchimento($ccaba,'5')){
						$fachada->inserirRespIS($_POST['crrnas'],$_POST['sufoc'],$_POST['epist'],$_POST['tosse'],$_POST['difresp'],
						$_POST['dtosse'],$_POST['ttosse'],$_POST['ptosse'], $_POST['resfrq'], $_POST['dortor'], $_POST['hemop'],
						$_POST['obsresp'], $atend);
						$msgi = printMsg($msgi, "Respirat&oacute;rio");
						setRespiratorio($atend);
					}
				} catch (CamposInvalidos $e){
					$msge = printMsg($msge, "Respirat&oacute;rio");
				}
				try {
					if (verPreenchimento($ccaba,'6')){
						$fachada->inserirCardVascIS($_POST['dispneia'],$_POST['cianose'],$_POST['palpitacao'],$_POST['taquicardia'],
						$_POST['obscardvasc'], $atend);
						$msgi = printMsg($msgi, "Cardiovascular");
						setCardiovascular($atend);
					}
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Cardiovascular");
				}
				try {
					if (verPreenchimento($ccaba,'7')){
						$fachada->inserirGastIntIS($_POST['nauseas'], $_POST['dorabdom'], $_POST['vomitos'], $_POST['tenesmo'],
						$_POST['evacuacao'], $_POST['aspfezes'], $_POST['nfezes'], $_POST['obsgastint'], $atend);
						$msgi = printMsg($msgi, "Gastro-Intestinal");
						setGastroIntest($atend);
					}
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Gastro-Intestinal");
					$errgi = 1;
				}
				try {
					if (verPreenchimento($ccaba,'8')){
						$fachada->inserirGenUriIS($paciente->sexo, $_POST['qtdurina'], $_POST['jatourina'], $_POST['corurina'],
						$_POST['odorurina'], $_POST['frequrina'], $_POST['urgurina'], $_POST['coorure'], $_POST['corcorrure'],
						$_POST['odorcorrure'], $_POST['disuria'], $_POST['atsexual'], $_POST['voltestic'], $_POST['tampenis'],
						$_POST['pubarcah'], $_POST['polucoes'], $_POST['erecao'], $_POST['corrvag'], $_POST['corcorrvag'],
						$_POST['odorcorrvag'], $_POST['prucorrvag'], $_POST['telarca'], $_POST['pubarcam'], $_POST['histmenst'],
						$_POST['menarca'], $_POST['regularidade'], $_POST['fluxo'], $_POST['obsgenuri'], $atend);
						$msgi = printMsg($msgi, "Genito-Urin&aacute;rio");
						setGenitoUrinario($atend);
					}
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Genito-Urin&aacute;rio");
				}
				try {
					if (verPreenchimento($ccaba,'9')){
						$fachada->inserirMuscEsqIS($_POST['deform'], $_POST['tumefacoes'], $_POST['fraqmusc'], $_POST['dorossea'],
						$_POST['obsmuscesq'], $atend);
						$msgi = printMsg($msgi, "M&uacute;sc. Esquel&eacute;tico");
						setMuscEsqueletico($atend);
					}
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "M&uacute;sc. Esquel&eacute;tico");
				}
				try {
					if (verPreenchimento($ccaba,'0')){
						$fachada->inserirNervIS($_POST['cefaleia'], $_POST['tonturas'], $_POST['convulsoes'], $_POST['conv1'],
						$_POST['conv2'], $_POST['traumacran'], $_POST['sincopes'], $_POST['paresias'], $_POST['paralisias'],
						$_POST['retneurpsi'], $_POST['obssistnerv'], $atend);
						$msgi = printMsg($msgi, "Nervoso");
						setNervoso($atend);
					}
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Nervoso");
				}
				if ($msge == "") $fachada->assinarIS($assinar, $atend, $usuario->getID());

			} else {
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoIS($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=is&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;
		*/
		
		case "geral":

			$ccaba = $_POST['ccaba'];
			$assinatura = ISAssinado($atend);
			$msge = "";
			$msgi = "";
			if (!$assinatura){
				try {	
							$fachada->inserirGeralIS($_POST['febre'], $_POST['altpeso'], $_POST['atividade'], $_POST['apetite'],
							$_POST['obsgeral'], $atend);
							$msgi = printMsg($msgi, "Geral");
							setGeral($atend);
						
					} catch (CamposInvalidos $e) {	
						$msge = "Geral";
				}
				if ($msge == "") $fachada->assinarIS($assinar, $atend, $usuario->getID());
			}else {
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoIS($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=geral&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
				}
			break;
		
	case "ouvidos":

			$ccaba = $_POST['ccaba'];
			$assinatura = ISAssinado($atend);
			$msge = "";
			$msgi = "";
			if (!$assinatura){
				try {
					
						$fachada->inserirOuvidosIS($_POST['inffreq'], $_POST['secrecaoou'], $_POST['dorouvido'], $_POST['acuidaud'],
						$_POST['obsouvido'], $atend);
						$msgi = printMsg($msgi, "Ouvidos");
						setOuvidos($atend);
					
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Ouvidos");
				}
			if ($msge == "") $fachada->assinarIS($assinar, $atend, $usuario->getID());
			}else {
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoIS($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=ouvidos&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
				}
			break;	
	   case "pele":

			$ccaba = $_POST['ccaba'];
			$assinatura = ISAssinado($atend);
			$msge = "";
			$msgi = "";
			if (!$assinatura){
					try {
						
						$fachada->inserirPeleIS($_POST['rash'], $_POST['ictericia'], $_POST['infecrep'], $_POST['obspele'], $atend);
						$msgi = printMsg($msgi, "Pele");
						setPeleIs($atend);
					
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Pele");
				}
			 if ($msge == "") $fachada->assinarIS($assinar, $atend, $usuario->getID());
			}else {
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoIS($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=pele&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
				}
			break;
			
			
	case "respiratorio":

			$ccaba = $_POST['ccaba'];
			$assinatura = ISAssinado($atend);
			$msge = "";
			$msgi = "";
			if (!$assinatura){
					try {
						
						$fachada->inserirRespIS($_POST['crrnas'],$_POST['sufoc'],$_POST['epist'],$_POST['tosse'],$_POST['difresp'],
						$_POST['dtosse'],$_POST['ttosse'],$_POST['ptosse'], $_POST['resfrq'], $_POST['dortor'], $_POST['hemop'],
						$_POST['obsresp'], $atend);
						$msgi = printMsg($msgi, "Respirat&oacute;rio");
						setRespiratorio($atend);
					
				} catch (CamposInvalidos $e){
					$msge = printMsg($msge, "Respirat&oacute;rio");
				}
			  if ($msge == "") $fachada->assinarIS($assinar, $atend, $usuario->getID());
			}else {
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoIS($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=respiratorio&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
				}
			break;
			
			
	case "cardiovascular":

			$ccaba = $_POST['ccaba'];
			$assinatura = ISAssinado($atend);
			$msge = "";
			$msgi = "";
			if (!$assinatura){
					try {
					
						$fachada->inserirCardVascIS($_POST['dispneia'],$_POST['cianose'],$_POST['palpitacao'],$_POST['taquicardia'],
						$_POST['obscardvasc'], $atend);
						$msgi = printMsg($msgi, "Cardiovascular");
						setCardiovascular($atend);
					
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Cardiovascular");
				}
			  if ($msge == "") $fachada->assinarIS($assinar, $atend, $usuario->getID());
			}else {
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoIS($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=cardiovascular&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
				}
			break;		
			
			
	case "gastrointestinal":

			$ccaba = $_POST['ccaba'];
			$assinatura = ISAssinado($atend);
			$msge = "";
			$msgi = "";
			if (!$assinatura){
					try {
					
						$fachada->inserirGastIntIS($_POST['nauseas'], $_POST['dorabdom'], $_POST['vomitos'], $_POST['tenesmo'],
						$_POST['evacuacao'], $_POST['aspfezes'], $_POST['nfezes'], $_POST['obsgastint'], $atend);
						$msgi = printMsg($msgi, "Gastro-Intestinal");
						setGastroIntest($atend);
					
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Gastro-Intestinal");
					$errgi = 1;
				}
			  if ($msge == "") $fachada->assinarIS($assinar, $atend, $usuario->getID());
			}else {
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoIS($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=gastrointestinal&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
				}
			break;		
			
		case "genitourinario":

			$ccaba = $_POST['ccaba'];
			$assinatura = ISAssinado($atend);
			$msge = "";
			$msgi = "";
			if (!$assinatura){
					try {
				
						$fachada->inserirGenUriIS($paciente->sexo, $_POST['qtdurina'], $_POST['jatourina'], $_POST['corurina'],
						$_POST['odorurina'], $_POST['frequrina'], $_POST['urgurina'], $_POST['coorure'], $_POST['corcorrure'],
						$_POST['odorcorrure'], $_POST['disuria'], $_POST['atsexual'], $_POST['voltestic'], $_POST['tampenis'],
						$_POST['pubarcah'], $_POST['polucoes'], $_POST['erecao'], $_POST['corrvag'], $_POST['corcorrvag'],
						$_POST['odorcorrvag'], $_POST['prucorrvag'], $_POST['telarca'], $_POST['pubarcam'], $_POST['histmenst'],
						$_POST['menarca'], $_POST['regularidade'], $_POST['fluxo'], $_POST['obsgenuri'], $atend);
						$msgi = printMsg($msgi, "Genito-Urin&aacute;rio");
						setGenitoUrinario($atend);
					
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Genito-Urin&aacute;rio");
				}
			  if ($msge == "") $fachada->assinarIS($assinar, $atend, $usuario->getID());
			}else {
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoIS($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=genitourinario&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
				}
			break;			
			
		case "musculoesqueletico":

			$ccaba = $_POST['ccaba'];
			$assinatura = ISAssinado($atend);
			$msge = "";
			$msgi = "";
			if (!$assinatura){
					try {
				
						$fachada->inserirMuscEsqIS($_POST['deform'], $_POST['tumefacoes'], $_POST['fraqmusc'], $_POST['dorossea'],
						$_POST['obsmuscesq'], $atend);
						$msgi = printMsg($msgi, "M&uacute;sc. Esquel&eacute;tico");
						setMuscEsqueletico($atend);
					
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "M&uacute;sc. Esquel&eacute;tico");
				}
   			  if ($msge == "") $fachada->assinarIS($assinar, $atend, $usuario->getID());
			}else {
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoIS($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=musculoesqueletico&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
				}
			break;	
			
	case "nervoso":

			$ccaba = $_POST['ccaba'];
			$assinatura = ISAssinado($atend);
			$msge = "";
			$msgi = "";
			if (!$assinatura){		
			try {
					
						$fachada->inserirNervIS($_POST['cefaleia'], $_POST['tonturas'], $_POST['convulsoes'], $_POST['conv1'],
						$_POST['conv2'], $_POST['traumacran'], $_POST['sincopes'], $_POST['paresias'], $_POST['paralisias'],
						$_POST['retneurpsi'], $_POST['obssistnerv'], $atend);
						$msgi = printMsg($msgi, "Nervoso");
						setNervoso($atend);
					
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Nervoso");
				}
                       if ($msge == "") $fachada->assinarIS($assinar, $atend, $usuario->getID());	
			}else {
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoIS($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=nervoso&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
				}
				break;	
			
		case "olhos":

			$ccaba = $_POST['ccaba'];
			$assinatura = ISAssinado($atend);
			$msge = "";
			$msgi = "";
			if (!$assinatura){
				/*try {
					if (verPreenchimento($ccaba,'1')){
						$fachada->inserirGeralIS($_POST['febre'], $_POST['altpeso'], $_POST['atividade'], $_POST['apetite'],
						$_POST['obsgeral'], $atend);
						$msgi = printMsg($msgi, "Geral");
						setGeral($atend);
					}
				} catch (CamposInvalidos $e) {	
					$msge = "Geral";
				}
				try {
					if (verPreenchimento($ccaba,'2')){
						$fachada->inserirPeleIS($_POST['rash'], $_POST['ictericia'], $_POST['infecrep'], $_POST['obspele'], $atend);
						$msgi = printMsg($msgi, "Pele");
						setPeleIs($atend);
					}
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Pele");
				}
				try {
					if (verPreenchimento($ccaba,'3')){
						$fachada->inserirOlhosIS($_POST['fotofobia'], $_POST['lacrim'], $_POST['edemapalp'], $_POST['secrecaool'],
						$_POST['dorolho'], $_POST['acuidvis'], $_POST['obsolho'], $atend);
						$msgi = printMsg($msgi, "Olhos");
						setOlhosIs($atend);
					}
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Olhos");
				}
				try {
					if (verPreenchimento($ccaba,'4')){
						$fachada->inserirOuvidosIS($_POST['inffreq'], $_POST['secrecaoou'], $_POST['dorouvido'], $_POST['acuidaud'],
						$_POST['obsouvido'], $atend);
						$msgi = printMsg($msgi, "Ouvidos");
						setOuvidos($atend);
					}
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Ouvidos");
				}
				try {
					if (verPreenchimento($ccaba,'5')){
						$fachada->inserirRespIS($_POST['crrnas'],$_POST['sufoc'],$_POST['epist'],$_POST['tosse'],$_POST['difresp'],
						$_POST['dtosse'],$_POST['ttosse'],$_POST['ptosse'], $_POST['resfrq'], $_POST['dortor'], $_POST['hemop'],
						$_POST['obsresp'], $atend);
						$msgi = printMsg($msgi, "Respirat&oacute;rio");
						setRespiratorio($atend);
					}
				} catch (CamposInvalidos $e){
					$msge = printMsg($msge, "Respirat&oacute;rio");
				}
				try {
					if (verPreenchimento($ccaba,'6')){
						$fachada->inserirCardVascIS($_POST['dispneia'],$_POST['cianose'],$_POST['palpitacao'],$_POST['taquicardia'],
						$_POST['obscardvasc'], $atend);
						$msgi = printMsg($msgi, "Cardiovascular");
						setCardiovascular($atend);
					}
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Cardiovascular");
				}
				try {
					if (verPreenchimento($ccaba,'7')){
						$fachada->inserirGastIntIS($_POST['nauseas'], $_POST['dorabdom'], $_POST['vomitos'], $_POST['tenesmo'],
						$_POST['evacuacao'], $_POST['aspfezes'], $_POST['nfezes'], $_POST['obsgastint'], $atend);
						$msgi = printMsg($msgi, "Gastro-Intestinal");
						setGastroIntest($atend);
					}
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Gastro-Intestinal");
					$errgi = 1;
				}
				try {
					if (verPreenchimento($ccaba,'8')){
						$fachada->inserirGenUriIS($paciente->sexo, $_POST['qtdurina'], $_POST['jatourina'], $_POST['corurina'],
						$_POST['odorurina'], $_POST['frequrina'], $_POST['urgurina'], $_POST['coorure'], $_POST['corcorrure'],
						$_POST['odorcorrure'], $_POST['disuria'], $_POST['atsexual'], $_POST['voltestic'], $_POST['tampenis'],
						$_POST['pubarcah'], $_POST['polucoes'], $_POST['erecao'], $_POST['corrvag'], $_POST['corcorrvag'],
						$_POST['odorcorrvag'], $_POST['prucorrvag'], $_POST['telarca'], $_POST['pubarcam'], $_POST['histmenst'],
						$_POST['menarca'], $_POST['regularidade'], $_POST['fluxo'], $_POST['obsgenuri'], $atend);
						$msgi = printMsg($msgi, "Genito-Urin&aacute;rio");
						setGenitoUrinario($atend);
					}
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Genito-Urin&aacute;rio");
				}
				try {
					if (verPreenchimento($ccaba,'9')){
						$fachada->inserirMuscEsqIS($_POST['deform'], $_POST['tumefacoes'], $_POST['fraqmusc'], $_POST['dorossea'],
						$_POST['obsmuscesq'], $atend);
						$msgi = printMsg($msgi, "M&uacute;sc. Esquel&eacute;tico");
						setMuscEsqueletico($atend);
					}
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "M&uacute;sc. Esquel&eacute;tico");
				}
				try {
					if (verPreenchimento($ccaba,'0')){
						$fachada->inserirNervIS($_POST['cefaleia'], $_POST['tonturas'], $_POST['convulsoes'], $_POST['conv1'],
						$_POST['conv2'], $_POST['traumacran'], $_POST['sincopes'], $_POST['paresias'], $_POST['paralisias'],
						$_POST['retneurpsi'], $_POST['obssistnerv'], $atend);
						$msgi = printMsg($msgi, "Nervoso");
						setNervoso($atend);
					}
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Nervoso");
				}
				if ($msge == "") $fachada->assinarIS($assinar, $atend, $usuario->getID());

			} else {
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoIS($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=is&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}*/
			  try {
					
						$fachada->inserirOlhosIS($_POST['fotofobia'], $_POST['lacrim'], $_POST['edemapalp'], $_POST['secrecaool'],
						$_POST['dorolho'], $_POST['acuidvis'], $_POST['obsolho'], $atend);
						$msgi = printMsg($msgi, "Olhos");
						setOlhosIs($atend);
				
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Olhos");
				}
			  if ($msge == "") $fachada->assinarIS($assinar, $atend, $usuario->getID());
			}else {
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoIS($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=olhos&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
				}
			break;
		
		case "exame_inspec":
			$ccaba = $_POST['ccaba'];
			$assinatura = EXAssinado($atend);
			$msge = "";
			$msgi = "";
			
			if (!$assinatura){
				try {
					
					
						$fachada->inserirInspecaoEX($_POST['estger'], $_POST['tdoenc'], $_POST['aspdoenc'], $_POST['desfis'], 
							$_POST['nutricao'],$_POST['coop'],$_POST['facies'],$_POST['deffis'],$_POST['anorpt'],$_POST['obsins'], 
							$atend);
							$msgi = "Inspe&ccedil;&atilde;o";
							setInspecao($atend);
					
				} catch (CamposInvalidos $e) {
					$msge = "Inspe&ccedil;&atilde;o";
				}
				if ($msge == ""){ $fachada->assinarEX($assinar, $atend, $usuario->getID(), $assinaturaExame); }
			}
			else{
			
			$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoEX($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=exame_inspec&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;
		// exame_pele
		
		case "exame_pele":
			$ccaba = $_POST['ccaba'];
			$assinatura = EXAssinado($atend);
			$msge = "";
			$msgi = "";
			
			if (!$assinatura){
				try {
					
					
				      $fachada->inserirPeleEX($_POST['corpele'], $_POST['textpele'], $_POST['umidpele'], $_POST['temppele'],
						$_POST['cicatriz'], $_POST['descam'], $_POST['hemorr'], $_POST['rash'], $_POST['circcol'],
						$_POST['edemapele'], $_POST['consun'],$_POST['defun'],$_POST['mancun'],$_POST['influn'],
						$_POST['obsepele'], $atend);
						$msgi = printMsg($msgi, "Pele e Mucosas");
							
						setPele($atend);
					}
				 catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Pele e Mucosas");
				}
				if ($msge == "") $fachada->assinarEX($assinar, $atend, $usuario->getID(), $assinaturaExame);
			}
			else{
			
			$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoEX($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=exame_pele&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;
				
		//exame_ganglios
		
		case "exame_gang":
			$ccaba = $_POST['ccaba'];
			$assinatura = EXAssinado($atend);
			$msge = "";
			$msgi = "";
			
			if (!$assinatura){
				try {
						
							$fachada->inserirGangliosEX($_POST['ganglinf'], $_POST['obsegang'], $atend);
							$msgi = printMsg($msgi, "G&acirc;nglios Linf&aacute;ticos");
							setGanglios($atend);
	
						
					} catch (CamposInvalidos $e) {
						$msge = printMsg($msge, "G&acirc;nglios Linf&aacute;ticos");
					}
					if ($msge == "") $fachada->assinarEX($assinar, $atend, $usuario->getID(), $assinaturaExame);
			}
			else{
			
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoEX($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=exame_gang&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;
			
			
			
			case "exame_medind":
			$ccaba = $_POST['ccaba'];
			$assinatura = EXAssinado($atend);
			$msge = "";
			$msgi = "";
			
			if (!$assinatura){
				try {
						
							$fachada->inserirMedindEX($_POST['pesomed'],$_POST['pesomedin'], $_POST['alturamed'],$_POST['alturamedin'],$_POST['permcef'],$_POST['permtora'],$_POST['permab'],$_POST['pregatric'],$_POST['pregasubesc'], $atend);
							$msgi = printMsg($msgi, "Medidas e &Iacute;ndices");
							setGanglios($atend);
	
						
					} catch (CamposInvalidos $e) {
						$msge = printMsg($msge, "Medidas e &Iacute;ndices");
					}
					if ($msge == "") $fachada->assinarEX($assinar, $atend, $usuario->getID(), $assinaturaExame);
			}
			else{
			
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoEX($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=exame_gang&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;
			
			
			
			
		//bugado	
		case "exame_estpub":
			$ccaba = $_POST['ccaba'];
			$assinatura = EXAssinado($atend);
			$msge = "";
			$msgi = "";
			
			if (!$assinatura){
				try {
				
					$fachada->inserirPuberalEX($_POST['ppub'], $_POST['mamaspub'], $_POST['voltest'], $_POST['genit'],$_POST['obseantrop'], $atend);
					$msgi = printMsg($msgi, "Estadiamento Puberal");
					setEstadPuberal($atend);
					
				}catch(CamposInvalidos $e) {
					$msge = printMsg($msge, "Estadiamento Puberal");

				}
				if ($msge == "") $fachada->assinarEX($assinar, $atend, $usuario->getID(), $assinaturaExame);
			}else{
				
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoEX($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=exame_estpub&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
				
			break;	
			
		case "exame_desneuro":		
			$ccaba = $_POST['ccaba'];
			$assinatura = EXAssinado($atend);
			$msge = "";
			$msgi = "";
			
			if (!$assinatura){
				try {
					
						$fachada->inserirDesenvolvimentoEX($_POST['brvm'],$_POST['orpp'],$_POST['paqos'],$_POST['rscs'],
						$_POST['pblco'],$_POST['scopo'],$_POST['bcvtc'],$_POST['bcmlb'],$_POST['bmfsa'],$_POST['vrs'],
						$_POST['absf'],$_POST['qeabtl'],$_POST['bfssa'],$_POST['cae'],$_POST['pomo'],$_POST['epd'],
						$_POST['rspm'],$_POST['bpfpca'],$_POST['bpacda'],$_POST['pfudp'],$_POST['cas'],$_POST['cbld'],
						$_POST['qcs'],$_POST['gehmd'],$_POST['cfbqc'],$_POST['ffs'],$_POST['dtvp'],$_POST['csde'],
						$_POST['pasv'],$_POST['acxc'], $_POST['secac'],$_POST['cpnt'],$_POST['gboc'],$_POST['vests'],
						$_POST['ffcc'],$_POST['pmpq'],$_POST['iaaif'], $_POST['obsdes'], $atend);
						$msgi = printMsg($msgi, "Desenvolvimento Neuropsicomotor");
						setDesenvNeuropsicomotor($atend);
					
				} catch (CamposInvalidos $e){
					$msge = printMsg($msge, "Desenvolvimento Neuropsicomotor");
				}
				if ($msge == "") $fachada->assinarEX($assinar, $atend, $usuario->getID(), $assinaturaExame);
			}else{
				
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoEX($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=exame_desneuro&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;	
		
		
			case "exame_cranio":		
			$ccaba = $_POST['ccaba'];
			$assinatura = EXAssinado($atend);
			$msge = "";
			$msgi = "";
			
			if (!$assinatura){
				try {
					
						$fachada->inserirCranioEX($_POST['tamcr'],$_POST['formcr'],$_POST['fontan'],$_POST['sutu'],$_POST['craneo'],
						$_POST['cabelo'],$_POST['lescab'],$_POST['obscran'],$atend);
						$msgi = printMsg($msgi, "Cr&acirc;nio");
						setCranio($atend);
					
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Cr&acirc;nio");
				}
				if ($msge == "") $fachada->assinarEX($assinar, $atend, $usuario->getID(), $assinaturaExame);
			}else{
				
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoEX($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=exame_cranio&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;	
		
		case "exame_olhos":		
			$ccaba = $_POST['ccaba'];
			$assinatura = EXAssinado($atend);
			$msge = "";
			$msgi = "";
			
			if (!$assinatura){
				try {
					
						$fachada->inserirOlhosEX($_POST['ptose'],$_POST['edpalp'],$_POST['corol'],$_POST['hemorol'],$_POST['secrol']
						,$_POST['inflol'], $_POST['cilios'],  $_POST['movocan'], $_POST['pupila'],$_POST['acvis'],$_POST['obsolho'],
						$atend);
						$msgi = printMsg($msgi, "Olhos");
						setOlhos($atend);
					
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Olhos");
					$errgi = 1;
				}
				if ($msge == "") $fachada->assinarEX($assinar, $atend, $usuario->getID(), $assinaturaExame);
			}else{
				
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoEX($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=exame_olhos&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;	
		
		case "exame_sistotor":		
			$ccaba = $_POST['ccaba'];
			$assinatura = EXAssinado($atend);
			$msge = "";
			$msgi = "";
			
			if (!$assinatura){
				try {
					
						$fachada->inserirSistOtorEX($_POST['posorel'], $_POST['formorel'], $_POST['dororel'],
						$_POST['edmast'], $_POST['caudex'], $_POST['secrorel'], $_POST['otoscop'], $_POST['batnariz'],
						$_POST['secrna'], $_POST['tumorna'], $_POST['rinosc'], $_POST['corlab'], $_POST['umidlab'],
						$_POST['eruplab'], $_POST['fislab'], $_POST['maslab'], $_POST['corgeng'], $_POST['hemorge'],
						$_POST['corli'], $_POST['umidli'], $_POST['exsuli'], $_POST['tremli'], $_POST['tumorac'],
						$_POST['numdent'], $_POST['impldent'], $_POST['consdent'], $_POST['corfar'], $_POST['exsufar'],
						$_POST['obsotor'], $atend);
						$msgi = printMsg($msgi, "Sistema Otorrinolaringol&oacute;gico");
						setSistOtorrino($atend);
					
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Sistema Otorrinolaringol&oacute;gico");
				}
				if ($msge == "") $fachada->assinarEX($assinar, $atend, $usuario->getID(), $assinaturaExame);
			}else{
				
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoEX($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=exame_sistotor&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;	
		
			case "exame_pescoco":		
			$ccaba = $_POST['ccaba'];
			$assinatura = EXAssinado($atend);
			$msge = "";
			$msgi = "";
			
			if (!$assinatura){
				try {
					
						$fachada->inserirPescocoEX($_POST['retrpesc'], $_POST['torcpesc'], $_POST['clavpesc'], $_POST['tirepesc'],
						$_POST['mastum'], $_POST['fistpesc'], $_POST['rigidpesc'], $_POST['fosspesc'], $_POST['obspesc'],
						$atend);
						$msgi = printMsg($msgi, "Pesco&ccedil;o");
						setPescoco($atend);
					
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Pesco&ccedil;o");
				}
				if ($msge == "") $fachada->assinarEX($assinar, $atend, $usuario->getID(), $assinaturaExame);
			}else{
				
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoEX($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=exame_pescoco&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;	
			
		case "exame_apresp":		
			$ccaba = $_POST['ccaba'];
			$assinatura = EXAssinado($atend);
			$msge = "";
			$msgi = "";
			
			if (!$assinatura){
				try {
					
						$fachada->inserirRespEX($_POST['formtor'], $_POST['simtor'], $_POST['contorn'], $_POST['proem'],
						$_POST['masanorrsp'], $_POST['mamasrsp'], $_POST['tresp'], $_POST['tirint'], $_POST['freqresp'],
						$_POST['fremtrvc'], $_POST['frembronq'], $_POST['frempleu'], $_POST['submac'], $_POST['macic'],
						$_POST['timpan'], $_POST['murves'], $_POST['estert'], $_POST['estrid'], $_POST['sibilos'],
						$_POST['atpleu'], $_POST['obsresp'], $atend);
						$msgi = printMsg($msgi, "Respirat&oacute;rio");
						setApRespiratorio($atend);
					
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Respirat&oacute;rio");
				}
				if ($msge == "") $fachada->assinarEX($assinar, $atend, $usuario->getID(), $assinaturaExame);
			}else{
				
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoEX($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=exame_apresp&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;	
		
			case "exame_cardio":		
			$ccaba = $_POST['ccaba'];
			$assinatura = EXAssinado($atend);
			$msge = "";
			$msgi = "";
			
			if (!$assinatura){
				try {
					
						$fachada->inserirCardVascEX($_POST['precord'], $_POST['ictcrdi'], $_POST['ictcrdp'], $_POST['artper'],
						$_POST['bulhas'], $_POST['sopros'],$_POST['pressaoart'], $_POST['pressaoartin'], $_POST['freqcard'], $_POST['freqcardin'], $_POST['obscdvs'], $atend);
						$msgi = printMsg($msgi, "Cardiovascular");
						setApCardiovascular($atend);
					
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Cardiovascular");
				}
				if ($msge == "") $fachada->assinarEX($assinar, $atend, $usuario->getID(), $assinaturaExame);
			}else{
				
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoEX($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=exame_cardio&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;	
		case "exame_apgast":		
			$ccaba = $_POST['ccaba'];
			$assinatura = EXAssinado($atend);
			$msge = "";
			$msgi = "";
			
			if (!$assinatura){
					try {
					
						$fachada->inserirGastIntEX($_POST['formabd'], $_POST['cicumb'], $_POST['peristal'], $_POST['distens'],
						$_POST['tumorgt'], $_POST['ondfluid'], $_POST['timpgt'], $_POST['parmusc'], $_POST['espasmo'],
						$_POST['rigidgt'], $_POST['dorgt'], $_POST['estomago'], $_POST['figado'], $_POST['baco'],$_POST['rins'],
						$_POST['mastumgt'], $_POST['hernias'], $_POST['rhidaer'], $_POST['obsgtint'], $atend);
						$msgi = printMsg($msgi, "Gastro Intestinal");
						setApGastroInt($atend);
				
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Gastro Intestinal");
				}
				if ($msge == "") $fachada->assinarEX($assinar, $atend, $usuario->getID(), $assinaturaExame);
			}else{
				
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoEX($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=exame_apgast&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;	
		
		//bugado	
		case "exame_genurin":		
			$ccaba = $_POST['ccaba'];
			$assinatura = EXAssinado($atend);
			$msge = "";
			$msgi = "";
			
			if (!$assinatura){
					try {
						$fachada->inserirGenitoEX($paciente->sexo, $_POST['peqlab'], $_POST['himen'], $_POST['secrvag'],
						$_POST['fimose'],$_POST['circunc'],$_POST['hidroc'],$_POST['varic'],$_POST['testic'],$_POST['secruret'],
						$_POST['pelos'],$_POST['lojren'], $_POST['bexiga'],$_POST['aspgen'],$_POST['anus'],$_POST['obsgen'],
						$atend);
						$msgi = printMsg($msgi, "Genito Urin&aacute;rio");
						setApGenitoUrinario($atend);
				
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Genito Urin&aacute;rio");
				}
				if ($msge == "") $fachada->assinarEX($assinar, $atend, $usuario->getID(), $assinaturaExame);
			}else{
				
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoEX($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=exame_genuri&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;	
			
			case "exame_muscesq":		
			$ccaba = $_POST['ccaba'];
			$assinatura = EXAssinado($atend);
			$msge = "";
			$msgi = "";
			
			if (!$assinatura){
					try {

						$fachada->inserirMuscEsqEX($_POST['anommusc'], $_POST['deformmusc'], $_POST['edemamusc'],$_POST['tumomusc'],
						$_POST['forcmusc'], $_POST['dorossea'], $_POST['movativ'], $_POST['movpas'], $_POST['escoliose'],
						$_POST['lordose'], $_POST['cifose'], $_POST['curvfr'], $_POST['espmusc'], $_POST['dorlocmusc'],
						$_POST['dorrefmusc'], $_POST['obsmusc'], $atend);
						$msgi = printMsg($msgi, "M&uacute;sculo-Esquel&eacute;tico");
						setApMuscesqueletico($atend);
					
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "M&uacute;sculo-Esquel&eacute;tico");
				}
				if ($msge == "") $fachada->assinarEX($assinar, $atend, $usuario->getID(), $assinaturaExame);
			}else{
				
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoEX($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=exame_muscesq&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;	
			
			case "exame_nervoso":		
			$ccaba = $_POST['ccaba'];
			$assinatura = EXAssinado($atend);
			$msge = "";
			$msgi = "";
			
			if (!$assinatura){
					try {
					
						$fachada->inserirNervEX($_POST['avnivconsc'], $_POST['orientnerv'], $_POST['sinfocc'], $_POST['obsnerv'],
						$atend);
						$msgi = printMsg($msgi, "Nervoso");
						setSistNervoso($atend);

					
				} catch (CamposInvalidos $e) {
					$msge = printMsg($msge, "Nervoso");
				}
				if ($msge == "") $fachada->assinarEX($assinar, $atend, $usuario->getID(), $assinaturaExame);
			}else{
				
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoEX($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=exame_nervoso&flag=1');
				} catch (CamposInvalidos $e) {
					$errad = 1;
				}
			}
			break;								
			
			
		case "hd":
			if (!HDAssinado($atend)){
				try {
					$fachada->preencherHipDiag($_POST['hipdiag'], $atend, $assinar, $usuario->getID());
				} catch (CamposInvalidos$e){
					$error = 1;
				}
			} else {
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoHD($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=hd&flag=1');
				} catch (CamposInvalidos$e) {
					$error = 1;
				}
			}
			break;

		case "conduta":
			if (!CondAssinado($atend)){
				try {
					$fachada->preencherConduta($_POST['conduta'], $atend, $assinar, $usuario->getID());
				} catch (CamposInvalidos$e){
					$error = 1;
				}
			} else {
				$adendo = new Adendo($_POST['adendoNovo']);
				try {
					$fachada->adendoCD($adendo, $atend, $usuario->getID());
					header('Location:prontuario_paciente.php?at='.$atend.'&n=conduta&flag=1');
				} catch (CamposInvalidos$e) {
					$error = 1;
				}
			}
			break;

	}
}

$n = "prontpaciente";
$show = "alp";
?>

<?php include ("acesso_aluno.php"); ?>