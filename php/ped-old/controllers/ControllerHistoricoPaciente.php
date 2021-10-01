<?php

$pront = $_GET['pr'];
$paciente = $fachada->obterPacientePr($pront);
if ($_GET['flag'] == 1){
	$flag = 1;
	$assinatura = 1;
}

$removeuVacina = 0;
if ($_POST['vac'] == "Inserir Vacina"){
	$flag = 1;
	try {
		$fachada->inserirVacinaPaciente($_POST['vacinanome'], $_POST['vacinadose'], 
			$_POST['datavacina'], $paciente->getDTNasc(), $pront);
		$sucvac = 1;
	} catch (CamposInvalidos $e){
		$errvac = 1;
	} catch (DoseInvalida $e){
		$errvac1 = 1;
	}
} else if ($_POST['vac'] == "Remover Vacina"){
	$flag = 1;
	$fachada->removerVacinaPaciente($_POST['vacina'], $_POST['dose'], $pront);
	$removeuVacina = 1;
}

if ($_POST['ctrlhp'])
	$ctrlhp = $_POST['ctrlhp'];
else 
	$ctrlhp = 1;
	
if ($_POST['salvar'] == "Salvar"){
	$flag = 1;
	$fachada = new Fachada();
//	echo "--- Passou + ". $_POST['ccaba'];
	$ccaba = $_POST['ccaba'];
	
	if ($fachada->verPreenchimento($ccaba,'1')){
		try {
			$fachada->inserirPreNatalHP($_POST['acpmed'], $_POST['nacpmed'], $_POST['lacpmed'],
				$_POST['durgest'], $_POST['sangmae'], $_POST['z21'], $_POST['a53'], $_POST['b18'], 
				$_POST['b58'], $_POST['imunizmae'], $_POST['exradion'], $_POST['medic'], 
				$_POST['anorm'], $_POST['doencir'], $_POST['cirurgdc'], $_POST['pesograv'], 
				$_POST['alimgrav'], $_POST['anemia'], $_POST['obsprenat'], $pront);
			$msgi = $fachada->printMsg($msgi,"Pr&eacute;-Natal");
		} catch (CamposInvalidos $e){
			$msge = $fachada->printMsg($msge,"Pr&eacute;-Natal");
			$errpnt = 1;
		}
	}
	
	if ($fachada->verPreenchimento($ccaba,'2')){
		try {
			$fachada->inserirNatalHP($_POST['tgrav'], $_POST['tparto'], $_POST['tapres'], 
				$_POST['durparto'], $_POST['anest'], $_POST['analg'], $_POST['complp'], 
				$_POST['tcomplp'], $_POST['obsnatal'],$pront);
			$msgi = $fachada->printMsg($msgi,"Natal");
		} catch (CamposInvalidos $e){
			$msge = $fachada->printMsg($msge,"Natal");
			$errnt = 1;
		}
	}

	if ($fachada->verPreenchimento($ccaba,'3')){
		try {
			$fachada->inserirNeoNatalHP($_POST['apgar1'], $_POST['apgar5'], $_POST['permnasal'], 
				$_POST['idadegest'], $_POST['sangrn'], $_POST['sinorto'], $_POST['pesoalta'], 
				$_POST['comp'], $_POST['percef'], $_POST['pertorac'], $_POST['spesonasc'], $_POST['pesonasc'], 
				$_POST['testepe'], $_POST['fenilcet'], $_POST['hipotir'], $_POST['anemfalc'], 
				$_POST['triagaud'],$_POST['peate'], $_POST['eoa'], $_POST['reanim'], $_POST['icter'], 
				$_POST['rash'], $_POST['sang'], $_POST['vomit'], $_POST['infec'], $_POST['anomcong'], 
				$_POST['paral'], $_POST['coriza'], $_POST['convul'], $_POST['obsnnatal'], 
				$_POST['pesoat'], $_POST['altat'], $pront);
			$msgi = $fachada->printMsg($msgi, "Neo-Natal");
		} catch (CamposInvalidos $e){
			$msge = $fachada->printMsg($msge,"Neo-Natal");
			$errnnt = 1;
		}
	}

	if ($fachada->verPreenchimento($ccaba,'4')){
		try {
			$fachada->inserirAlimHP($_POST['aleitmat'], $_POST['alimcomp'], $_POST['alimpast'], 
			$_POST['alimfam'], $_POST['dietaat'], $_POST['refdia'], $_POST['horaref'], $_POST['usomam'], 
			$_POST['colher'], $_POST['copo'], $_POST['alimpastl'], $_POST['chantafet'], 
			$_POST['brincref'], $_POST['obsaliment'], $pront);
			$msgi = $fachada->printMsg($msgi, "Alimenta&ccedil;&atilde;o");
		} catch (CamposInvalidos $e){
			$msge = $fachada->printMsg($msge, "Alimenta&ccedil;&atilde;o");
		}
	}

	if ($fachada->verPreenchimento($ccaba,'5')){
		try {
			$fachada->inserirCrescDesHP($_POST['relirm'], $_POST['idadesc'], $_POST['aprend'], 
				$_POST['repetano'],	$_POST['relacol'], $_POST['partfala'], $_POST['muddent'], 
				$_POST['obscrescdes'], $pront);
			$msgi = $fachada->printMsg($msgi, "Crescimento e Desenvolvimento");
		} catch (CamposInvalidos $e){
			$msge = $fachada->printMsg($msge, "Crescimento e Desenvolvimento");
			//$errcd = 1;
		}
	}

	if ($fachada->verPreenchimento($ccaba,'6')){
		try {
			$fachada->inserirHabitHP($_POST['chupeta'], $_POST['chupadedo'], $_POST['roiunha'], 
				$_POST['tique'], $_POST['altalim'], $_POST['geofagia'], $_POST['enurese'], 
				$_POST['pertsono'], $_POST['dormepais'], $_POST['obshab'], $pront);
			$msgi = $fachada->printMsg($msgi, "H&aacute;bitos");
		} catch (CamposInvalidos $e){
			$msge = $fachada->printMsg($msge, "H&aacute;bitos");
		}
	}

	if ($fachada->verPreenchimento($ccaba,'7')){
		try {
			$fachada->inserirImunizHP($_POST['efeitcol'], $_POST['testmant'], $_POST['obsimun'],$pront);
			$msgi = $fachada->printMsg($msgi, "Imuniza&ccedil;&oacute;es");
		} catch (CamposInvalidos $e){
			$msge = $fachada->printMsg($msge, "Imuniza&ccedil;&oacute;es");
			$errim = 1;
		}
	}
	
	if ($fachada->verPreenchimento($ccaba,'8')){	
		try {
			$fachada->inserirDoenAntHP($_POST['coquel'], $_POST['sarampo'], $_POST['varic'], 
				$_POST['parot'], $_POST['dift'], $_POST['tetano'], $_POST['diarr'], $_POST['pneum'], 
				$_POST['mening'], $_POST['febrer'], $_POST['nefro'], $_POST['tuberc'], $_POST['asma'], 
				$_POST['eczema'], $_POST['alerg'], $_POST['talerg'], $_POST['rinite'], $_POST['cirurg'], 
				$_POST['transf'], $_POST['hospit'], $_POST['trata'], $_POST['obsdoenant'], $pront);
			$msgi = $fachada->printMsg($msgi, "Doen&ccedil;as Anteriores");
		} catch (CamposInvalidos $e){
			$msge = $fachada->printMsg($msge, "Doen&ccedil;as Anteriores");
			$errda = 1;
		}
	}
	
	if ($fachada->verPreenchimento($ccaba,'9')){
		try {
			$fachada->inserirOutInfoHP($_POST['chagas'], $_POST['esquist'], $_POST['agtox'], 
				$_POST['tagtox'], $_POST['alergmed'], $_POST['talergmed'], $_POST['ctuberc'], 
				$_POST['obsoutinfo'], $pront);
			$msgi = $fachada->printMsg($msgi, "Outras Informa&ccedil;&otilde;es");
		} catch (CamposInvalidos $e){
			$msge = $fachada->printMsg($msge, "Outras Informa&ccedil;&otilde;es");
			$erroi = 1;	
		}
	}
	
	if ($fachada->verPreenchimento($ccaba,'F')){
		try {
			$fachada->inserirHistFamiliar($_POST['uniaopais'], $_POST['idademae'], $_POST['profmae'],
				$_POST['idadepai'], $_POST['profpai'], $_POST['pais'], $_POST['avos'], $_POST['irmaos'], 
				$_POST['outros'], $_POST['resid'], $_POST['comod'], $_POST['ocup'], $_POST['agua'], 
				$_POST['sanea'], $_POST['luz'], $_POST['animais'], $_POST['obsconddom'], $pront);
			$msgi = $fachada->printMsg($msgi, "Hist&oacute;rico Familiar");
		} catch (CamposInvalidos $e){
			$msge = $fachada->printMsg($msge, "Hist&oacute;rico Familiar");
			$errhf = 1;
		}
	}
}

/* valor que define o form que acesso_aluno.php irá imprimir. No caso, o form de histórico do paciente. */
$n = "hstp";

/*$show = "alp";*/
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

/* ------------------------------------------------------------------------------------------------------------- */
/* --------------------------------------------- Alimentação --------------------------------------------------- */
/* ------------------------------------------------------------------------------------------------------------- */
$lalim = $fachada->getValuesTablePr('alimentacao',$pront);
$aleitmat1 = $fachada->checkOption("aleitmat", "-6m", $lalim->aleitmat);
$aleitmat2 = $fachada->checkOption("aleitmat", "-6m1a", $lalim->aleitmat);
$aleitmat3 = $fachada->checkOption("aleitmat", "-1a", $lalim->aleitmat);
$aleitmat4 = $fachada->checkOption("aleitmat", "N", $lalim->aleitmat);
$aleitmat5 = $fachada->checkOption("aleitmat", "NA", $lalim->aleitmat);
$alimcomp1 = $fachada->checkOption("alimcomp", "-6m", $lalim->alimcomp);
$alimcomp2 = $fachada->checkOption("alimcomp", "-6m1a", $lalim->alimcomp);
$alimcomp3 = $fachada->checkOption("alimcomp", "-1a", $lalim->alimcomp);
$alimcomp4 = $fachada->checkOption("alimcomp", "N", $lalim->alimcomp);
$alimcomp5 = $fachada->checkOption("alimcomp", "NA", $lalim->alimcomp);
$alimpast1 = $fachada->checkOption("alimpast", "-6m", $lalim->alimpast);
$alimpast2 = $fachada->checkOption("alimpast", "-6m1a", $lalim->alimpast);
$alimpast3 = $fachada->checkOption("alimpast", "-1a", $lalim->alimpast);
$alimpast4 = $fachada->checkOption("alimpast", "N", $lalim->alimpast);
$alimpast5 = $fachada->checkOption("alimpast", "NA", $lalim->alimpast);
$alimfam1 = $fachada->checkOption("alimfam", "-6m", $lalim->alimfam);
$alimfam2 = $fachada->checkOption("alimfam", "-6m1a", $lalim->alimfam);
$alimfam3 = $fachada->checkOption("alimfam", "-1a", $lalim->alimfam);
$alimfam4 = $fachada->checkOption("alimfam", "N", $lalim->alimfam);
$alimfam5 = $fachada->checkOption("alimfam", "NA", $lalim->alimfam);
$dietaat1 = $fachada->checkOption("dietaat", "F", $lalim->dietaat);
$dietaat2 = $fachada->checkOption("dietaat", "E", $lalim->dietaat);
$dietaat3 = $fachada->checkOption("dietaat", "NA", $lalim->dietaat);
$refdia1 = $fachada->checkOption("refdia", "-3", $lalim->refdia);
$refdia2 = $fachada->checkOption("refdia", "3", $lalim->refdia);
$refdia3 = $fachada->checkOption("refdia", "+3", $lalim->refdia);
$refdia4 = $fachada->checkOption("refdia", "NA", $lalim->refdia);
$horaref1 = $fachada->checkOption("horaref","N",$lalim->horaref);
$horaref2 = $fachada->checkOption("horaref","HE",$lalim->horaref);
$horaref3 = $fachada->checkOption("horaref","A",$lalim->horaref);
$horaref4 = $fachada->checkOption("horaref","NA",$lalim->horaref);
$usomam1 = $fachada->checkPOST("usomam", "S", $lalim->mamadeira);
$usomam2 = $fachada->checkPOST("usomam", "N", $lalim->mamadeira);
$usomam3 = $fachada->checkPOST("usomam", "NA", $lalim->mamadeira);
$colher1 = $fachada->checkPOST("colher", "S", $lalim->colher);
$colher2 = $fachada->checkPOST("colher", "N", $lalim->colher);
$colher3 = $fachada->checkPOST("colher", "NA", $lalim->colher);
$copo1 = $fachada->checkPOST("copo", "S", $lalim->copo);
$copo2 = $fachada->checkPOST("copo", "N", $lalim->copo);
$copo3 = $fachada->checkPOST("copo", "NA", $lalim->copo);
$alimpastl1 = $fachada->checkPOST("alimpastl", "S", $lalim->alimpastl);
$alimpastl2 = $fachada->checkPOST("alimpastl", "N", $lalim->alimpastl);
$alimpastl3 = $fachada->checkPOST("alimpastl", "NA", $lalim->alimpastl);
$chantafet1 = $fachada->checkPOST("chantafet", "S", $lalim->chantafet);
$chantafet2 = $fachada->checkPOST("chantafet", "N", $lalim->chantafet);
$chantafet3 = $fachada->checkPOST("chantafet", "NA", $lalim->chantafet);
$brincref1 = $fachada->checkPOST("brincref", "S", $lalim->brincref);
$brincref2 = $fachada->checkPOST("brincref", "N", $lalim->brincref);
$brincref3 = $fachada->checkPOST("brincref", "NA", $lalim->brincref);
$obsaliment = $fachada->printOBS($lalim->obs, $_POST['obsaliment']);
/* ------------------------------------------------------------------------------------------------------------- */
/* ------------------------------------ Crescimento e Desenvolvimento ------------------------------------------ */
/* ------------------------------------------------------------------------------------------------------------- */
$lcd = $fachada->getValuesTablePr('crescimento',$pront);
$relirm = $fachada->printOBS($lcd->relirm, $_POST['relirm']);
$idadesc1 = $fachada->checkOption("idadesc", "610", $lcd->idadesc);
$idadesc2 = $fachada->checkOption("idadesc", "-6", $lcd->idadesc);
$idadesc3 = $fachada->checkOption("idadesc", "+10", $lcd->idadesc);
$idadesc4 = $fachada->checkOption("idadesc", "NF", $lcd->idadesc);
$idadesc5 = $fachada->checkOption("idadesc", "NA", $lcd->idadesc);
$aprend = $fachada->printOBS($lcd->aprend, $_POST['aprend']);
$repetano = $fachada->printOBS($lcd->repetano, $_POST['repetano']);
$relacol = $fachada->printOBS($lcd->relacol, $_POST['relacol']);
$partfala = $fachada->printOBS($lcd->partfala, $_POST['partfala']);
$muddent = $fachada->printOBS($lcd->muddent, $_POST['muddent']);
$obscrescdes = $fachada->printOBS($lcd->obs, $_POST['obscrescdes']);
$natural = $paciente->getCidade()."/".$paciente->getUF();
/* ------------------------------------------------------------------------------------------------------------- */
/* ------------------------------------------ Doenças Anteriores ----------------------------------------------- */
/* ------------------------------------------------------------------------------------------------------------- */
$ldoenc = $fachada->getValuesTablePr('doencasanteriores',$pront);
$coquel1 = $fachada->checkPOST("coquel", "S", $ldoenc->coquel);
$coquel2 = $fachada->checkPOST("coquel", "N", $ldoenc->coquel);
$coquel3 = $fachada->checkPOST("coquel", "NA", $ldoenc->coquel);
$sarampo1 = $fachada->checkPOST("sarampo", "S", $ldoenc->saramp);
$sarampo2 = $fachada->checkPOST("sarampo", "N", $ldoenc->saramp);
$sarampo3 = $fachada->checkPOST("sarampo", "NA", $ldoenc->saramp);
$varic1 = $fachada->checkPOST("varic", "S", $ldoenc->varic);
$varic2 = $fachada->checkPOST("varic", "N", $ldoenc->varic);
$varic3 = $fachada->checkPOST("varic", "NA", $ldoenc->varic);
$parot1 = $fachada->checkPOST("parot", "S", $ldoenc->parot);
$parot2 = $fachada->checkPOST("parot", "N", $ldoenc->parot);
$parot3 = $fachada->checkPOST("parot", "NA", $ldoenc->parot);
$dift1 = $fachada->checkPOST("dift", "S", $ldoenc->dift);
$dift2 = $fachada->checkPOST("dift", "N", $ldoenc->dift);
$dift3 = $fachada->checkPOST("dift", "NA", $ldoenc->dift);
$tetano1 = $fachada->checkPOST("tetano", "S", $ldoenc->tetano);
$tetano2 = $fachada->checkPOST("tetano", "N", $ldoenc->tetano);
$tetano3 = $fachada->checkPOST("tetano", "NA", $ldoenc->tetano);
$diarr1 = $fachada->checkPOST("diarr", "S", $ldoenc->diarr);
$diarr2 = $fachada->checkPOST("diarr", "N", $ldoenc->diarr);
$diarr3 = $fachada->checkPOST("diarr", "NA", $ldoenc->diarr);
$pneum1 = $fachada->checkPOST("pneum", "S", $ldoenc->pneum);
$pneum2 = $fachada->checkPOST("pneum", "N", $ldoenc->pneum);
$pneum3 = $fachada->checkPOST("pneum", "NA", $ldoenc->pneum);
$mening1 = $fachada->checkPOST("mening", "S", $ldoenc->mening);
$mening2 = $fachada->checkPOST("mening", "N", $ldoenc->mening);
$mening3 = $fachada->checkPOST("mening", "NA", $ldoenc->mening);
$febrer1 = $fachada->checkPOST("febrer", "S", $ldoenc->febrer);
$febrer2 = $fachada->checkPOST("febrer", "N", $ldoenc->febrer);
$febrer3 = $fachada->checkPOST("febrer", "NA", $ldoenc->febrer);
$nefro1 = $fachada->checkPOST("nefro", "S", $ldoenc->nefro);
$nefro2 = $fachada->checkPOST("nefro", "N", $ldoenc->nefro);
$nefro3 = $fachada->checkPOST("nefro", "NA", $ldoenc->nefro);
$tuberc1 = $fachada->checkPOST("tuberc", "S", $ldoenc->tuberc);
$tuberc2 = $fachada->checkPOST("tuberc", "N", $ldoenc->tuberc);
$tuberc3 = $fachada->checkPOST("tuberc", "NA", $ldoenc->tuberc);
$asma1 = $fachada->checkPOST("asma", "S", $ldoenc->asma);
$asma2 = $fachada->checkPOST("asma", "N", $ldoenc->asma);
$asma3 = $fachada->checkPOST("asma", "NA", $ldoenc->asma);
$eczema1 = $fachada->checkPOST("eczema", "S", $ldoenc->eczema);
$eczema2 = $fachada->checkPOST("eczema", "N", $ldoenc->eczema);
$eczema3 = $fachada->checkPOST("eczema", "NA", $ldoenc->eczema);
$alerg1 = $fachada->checkPOST("alerg", "S", $ldoenc->alerg);
$alerg2 = $fachada->checkPOST("alerg", "N", $ldoenc->alerg);
$alerg3 = $fachada->checkPOST("alerg", "NA", $ldoenc->alerg);
$dalerg = $fachada->checkDisable("alerg", $ldoenc->alerg, "S");
$talerg = $fachada->printOBS($ldoenc->talerg, $_POST['talerg']);
$rinite1 = $fachada->checkPOST("rinite", "S", $ldoenc->rinite);
$rinite2 = $fachada->checkPOST("rinite", "N", $ldoenc->rinite);
$rinite3 = $fachada->checkPOST("rinite", "NA", $ldoenc->rinite);
$cirurg1 = $fachada->checkPOST("cirurg", "S", $ldoenc->cirurg);
$cirurg2 = $fachada->checkPOST("cirurg", "N", $ldoenc->cirurg);
$cirurg3 = $fachada->checkPOST("cirurg", "NA", $ldoenc->cirurg);
$transf1 = $fachada->checkPOST("transf", "S", $ldoenc->transf);
$transf2 = $fachada->checkPOST("transf", "N", $ldoenc->transf);
$transf3 = $fachada->checkPOST("transf", "NA", $ldoenc->transf);
$hospit1 = $fachada->checkPOST("hospit", "S", $ldoenc->hospit);
$hospit2 = $fachada->checkPOST("hospit", "N", $ldoenc->hospit);
$hospit3 = $fachada->checkPOST("hospit", "NA", $ldoenc->hospit);
//if ($errda && $_POST['trata'] == "") Tratamentos Realizados
$trata = $fachada->printOBS($ldoenc->trata, $_POST['trata']);
$obsdoenant = $fachada->printOBS($ldoenc->obs, $_POST['obsdoenant']);
if ($errda && $_POST['alerg'] == "S" && $_POST['talerg'] == "")
	$lblalerg = "class='erro'";
/* ------------------------------------------------------------------------------------------------------------- */
/* ------------------------------------------------- Hábitos --------------------------------------------------- */
/* ------------------------------------------------------------------------------------------------------------- */
$lhab = $fachada->getValuesTablePr('habitos',$pront);
$chupeta1 = $fachada->checkPOST("chupeta", "S", $lhab->chupeta);
$chupeta2 = $fachada->checkPOST("chupeta", "N", $lhab->chupeta);
$chupeta3 = $fachada->checkPOST("chupeta", "NA", $lhab->chupeta);
$chupadedo1 = $fachada->checkPOST("chupadedo", "S", $lhab->chupadedo);
$chupadedo2 = $fachada->checkPOST("chupadedo", "N", $lhab->chupadedo);
$chupadedo3 = $fachada->checkPOST("chupadedo", "NA", $lhab->chupadedo);
$roiunha1 = $fachada->checkPOST("roiunha", "S", $lhab->roiunha);
$roiunha2 = $fachada->checkPOST("roiunha", "N", $lhab->roiunha);
$roiunha3 = $fachada->checkPOST("roiunha", "NA", $lhab->roiunha);
$tique1 = $fachada->checkPOST("tique", "S", $lhab->tique);
$tique2 = $fachada->checkPOST("tique", "N", $lhab->tique);
$tique3 = $fachada->checkPOST("tique", "NA", $lhab->tique);
$altalim1 = $fachada->checkPOST("altalim", "S", $lhab->altalim);
$altalim2 = $fachada->checkPOST("altalim", "N", $lhab->altalim);
$altalim3 = $fachada->checkPOST("altalim", "NA", $lhab->altalim);
$geofagia1 = $fachada->checkPOST("geofagia", "S", $lhab->geofagia);
$geofagia2 = $fachada->checkPOST("geofagia", "N", $lhab->geofagia);
$geofagia3 = $fachada->checkPOST("geofagia", "NA", $lhab->geofagia);
$enurese1 = $fachada->checkPOST("enurese", "S", $lhab->enurese);
$enurese2 = $fachada->checkPOST("enurese", "N", $lhab->enurese);
$enurese3 = $fachada->checkPOST("enurese", "NA", $lhab->enurese);
$pertsono1 = $fachada->checkPOST("pertsono", "S", $lhab->pertsono);
$pertsono2 = $fachada->checkPOST("pertsono", "N", $lhab->pertsono);
$pertsono3 = $fachada->checkPOST("pertsono", "NA", $lhab->pertsono);
$dormepais1 = $fachada->checkPOST("dormepais", "S", $lhab->dormepais);
$dormepais2 = $fachada->checkPOST("dormepais", "N", $lhab->dormepais);
$dormepais3 = $fachada->checkPOST("dormepais", "NA", $lhab->dormepais);
$obshab = $fachada->printOBS($lhab->obs,$_POST['obshab']);
/* ------------------------------------------------------------------------------------------------------------- */
/* -------------------------------------------- Histórico Familiar --------------------------------------------- */
/* ------------------------------------------------------------------------------------------------------------- */
$linfam = $fachada->getValuesTablePr('familia',$pront);
$lindom = $fachada->getValuesTablePr('condicoesdomesticas',$pront);
$listcbo = $fachada->getCBO();
//checkAssinado($linha->ass);
$uniaopais1 = $fachada->checkOption("uniaopais", "UE", $linfam->uniaopais);
$uniaopais2 = $fachada->checkOption("uniaopais", "C", $linfam->uniaopais);
$uniaopais3 = $fachada->checkOption("uniaopais", "SJ", $linfam->uniaopais);
$uniaopais4 = $fachada->checkOption("uniaopais", "O", $linfam->uniaopais);
$uniaopais5 = $fachada->checkOption("uniaopais", "NA", $linfam->uniaopais);
if ($errhf && !is_numeric($_POST['idademae'])) 
	$lblidadmae = ' erro'; 
if ($errhf && $_POST['profmae'] == "0")
	$ocupmae = ' erro';
/*if ($error && !$_POST['idadepai']) 
	$lblidadmae = 'class="erro"';
if ($error && $_POST['profpai'] == "0")
	$ocuppai = 'class="erro"';	*/
$idademae = $fachada->printCampo($linfam->idademae, $_POST['idademae']);
$idadepai = $fachada->printCampo($linfam->idadepai, $_POST['idadepai']);
$pais = $fachada->printOBS($linfam->pais, $_POST['pais']);
$avos = $fachada->printOBS($linfam->avos, $_POST['avos']);
$irmaos = $fachada->printOBS($linfam->irmaos, $_POST['irmaos']);
$outros = $fachada->printOBS($linfam->outros, $_POST['outros']);
/*if ($errhf && !$_POST['avos'])
	$lblavos = 'class="erro"';
if ($errhf && !$_POST['irmaos'])
	$lblirmaos = 'class="erro"';
if ($errhf && !$_POST['outros'])
	$lbloutros = 'class="erro"';*/
$resid1 = $fachada->checkOption("resid", "A", $lindom->resid);
$resid2 = $fachada->checkOption("resid", "T", $lindom->resid);
$resid3 = $fachada->checkOption("resid", "B", $lindom->resid);
$resid4 = $fachada->checkOption("resid", "NA", $lindom->resid);
if ($errhf && !is_numeric($_POST['comod']))
	$lblncom = ' erro';
if ($errhf && !is_numeric($_POST['ocup']))
	$lblnocup = ' erro';
$comod = $fachada->printCampo($lindom->comod, $_POST['comod']);
$ocup = $fachada->printCampo($lindom->ocup, $_POST['ocup']);
$agua1 = $fachada->checkPOST("agua", "E", $lindom->agua);
$agua2 = $fachada->checkPOST("agua", "NE", $lindom->agua);
$agua3 = $fachada->checkPOST("agua", "NA", $lindom->agua);
$sanea1 = $fachada->checkOption("sanea", "EE", $lindom->sanea);
$sanea2 = $fachada->checkOption("sanea", "FS", $lindom->sanea);
$sanea3 = $fachada->checkOption("sanea", "EA", $lindom->sanea);
$sanea4 = $fachada->checkOption("sanea", "NA", $lindom->sanea);
$luz1 = $fachada->checkPOST("luz", "S", $lindom->luz);
$luz2 = $fachada->checkPOST("luz", "N", $lindom->luz);
$luz3 = $fachada->checkPOST("luz", "NA", $lindom->luz);
$animais1 = $fachada->checkPOST("animais", "S", $lindom->animais);
$animais2 = $fachada->checkPOST("animais", "N", $lindom->animais);
$animais3 = $fachada->checkPOST("animais", "NA", $lindom->animais);
$obsconddom = $fachada->printOBS($lindom->obs, $_POST['obsconddom']);
/* ------------------------------------------------------------------------------------------------------------- */
/* ------------------------------------------- Imunizações ----------------------------------------------------- */
/* ------------------------------------------------------------------------------------------------------------- */
$limun = $fachada->getValuesTablePr('imunizacoes',$pront);
$vacinas = $fachada->getVacinas();
$dose = $fachada->getDoses();
$vacpac = $fachada->getVacinasPaciente($pront);
 //if ($errim && !$linha->ass && $_POST['efeitcol'] == "") - Efeitos Colaterais
$efeitcol = $fachada->printOBS($limun->efeitcol, $_POST['efeitcol']);
$testmant1 = $fachada->checkPOST("testmant", "P", $limun->testmant);
$testmant2 = $fachada->checkPOST("testmant", "N", $limun->testmant);
$testmant3 = $fachada->checkPOST("testmant", "NA", $limun->testmant);
$obsimun = $fachada->printOBS($limun->obs, $_POST['obsimun']);
/* ------------------------------------------------------------------------------------------------------------- */
/* ------------------------------------------------- Natal ----------------------------------------------------- */
/* ------------------------------------------------------------------------------------------------------------- */
$lnat = $fachada->getValuesTablePr('natal',$pront);
$tgrav1 = $fachada->checkOption("tgrav", "S", $lnat->tgrav);
$tgrav2 = $fachada->checkOption("tgrav", "M", $lnat->tgrav);
$tgrav3 = $fachada->checkOption("tgrav", "NA", $lnat->tgrav);
$tparto1 = $fachada->checkOption("tparto", "E", $lnat->tparto);
$tparto2 = $fachada->checkOption("tparto", "I", $lnat->tparto);
$tparto3 = $fachada->checkOption("tparto", "C", $lnat->tparto);
$tparto4 = $fachada->checkOption("tparto", "NA", $lnat->tparto);
$tapres1 = $fachada->checkOption("tapres", "C", $lnat->tapres); 
$tapres2 = $fachada->checkOption("tapres", "P", $lnat->tapres); 
$tapres3 = $fachada->checkOption("tapres", "O", $lnat->tapres); 
$tapres4 = $fachada->checkOption("tapres", "NA", $lnat->tapres); 
if ($errnt && !$fachada->validaHora($_POST['durparto']))
	$lbltrpart =  'class="erro"';
$durparto = $fachada->printCampo($lnat->durparto, $_POST['durparto']);
$anest1 = $fachada->checkPOST("anest", "S", $lnat->anest);
$anest2 = $fachada->checkPOST("anest", "N", $lnat->anest);
$anest3 = $fachada->checkPOST("anest", "NA", $lnat->anest);
//if ($errnt && !$linha->ass && $_POST['analg'] == "") -- lblanalg
if ($errnt && $_POST['complp'] == "S" && !$_POST['tcomplp']) 
	$lblcomp = 'class="erro"';
$complp1 = $fachada->checkPOST("complp", "S", $lnat->complp);
$complp2 = $fachada->checkPOST("complp", "N", $lnat->complp);
$complp3 = $fachada->checkPOST("complp", "NA", $lnat->complp);
$dcomplp = $fachada->checkDisable("complp", $lnat->complp, "S");
$analg = $fachada->printOBS($lnat->analg,$_POST['analg']);
$tcomplp = $fachada->printOBS($lnat->tcomplp, $_POST['tcomplp']);
$obsnatal = $fachada->printOBS($lnat->obs, $_POST['obsnatal']); 
/* ------------------------------------------------------------------------------------------------------------- */
/* ----------------------------------------------- Neo-Natal --------------------------------------------------- */
/* ------------------------------------------------------------------------------------------------------------- */
$lnnat = $fachada->getValuesTablePr('neonatal',$pront);
$sang = $fachada->getGrupoSanguineo();
$apgar11 = $fachada->checkOption("apgar1", "NA", $lnnat->apgar1);
$apgar51 = $fachada->checkOption("apgar5", "NA", $lnnat->apgar5);
$idadegest1 = $fachada->checkOption("idadegest", "PrT", $lnnat->idadegest);
$idadegest2 = $fachada->checkOption("idadegest", "T", $lnnat->idadegest);
$idadegest3 = $fachada->checkOption("idadegest", "PoT", $lnnat->idadegest);
$idadegest4 = $fachada->checkOption("idadegest", "NA", $lnnat->idadegest);
$permnasal1 = $fachada->checkPOST("permnasal", "S", $lnnat->permnasal);
$permnasal2 = $fachada->checkPOST("permnasal", "N", $lnnat->permnasal);
$permnasal3 = $fachada->checkPOST("permnasal", "NA", $lnnat->permnasal);
$sangrn = $fachada->checkOption("sangrn", "NA", $lnnat->idSang);
$sinorto1 = $fachada->checkPOST("sinorto", "S", $lnnat->sinorto);
$sinorto2 = $fachada->checkPOST("sinorto", "N", $lnnat->sinorto);
$sinorto3 = $fachada->checkPOST("sinorto", "NA", $lnnat->sinorto);
$pesoalta1 = $fachada->checkOption("pesoalta", "2500", $lnnat->pesoalta);
$pesoalta2 = $fachada->checkOption("pesoalta", "3000", $lnnat->pesoalta);
$pesoalta3 = $fachada->checkOption("pesoalta", "NA", $lnnat->pesoalta);
$percef1 = $fachada->checkOption("percef", "-34", $lnnat->percef);
$percef2 = $fachada->checkOption("percef", "34", $lnnat->percef);
$percef3 = $fachada->checkOption("percef", "+36", $lnnat->percef);
$percef4 = $fachada->checkOption("percef", "NA", $lnnat->percef);
$pesoat = $fachada->printOBS($lnnat->pesoat,$_POST['pesoat']);
$altat = $fachada->printOBS($lnnat->altat,$_POST['altat']);
$pesonasc1 = $fachada->checkOption("spesonasc", "NA", $lnnat->pesonasc);
$pesonasc2 = $fachada->checkOption("spesonasc", "AV", $lnnat->pesonasc);
$pesonasc = $fachada->printOBS($lnnat->vpesonasc, $_POST['pesonasc']);
if ($errnnt && $_POST['spesonasc'] == "AV" && !is_numeric($_POST['pesonasc'])) 
	$lblpeson = "class='erro'";
$dpesonasc = $fachada->checkDisable("spesonasc", $lnnat->pesonasc, "AV");
/*$pesonasc1 = $fachada->checkOption("pesonasc","-1500",$lnnat->pesonasc);
$pesonasc2 = $fachada->checkOption("pesonasc","2500",$lnnat->pesonasc);
$pesonasc3 = $fachada->checkOption("pesonasc","+2500",$lnnat->pesonasc);
$pesonasc4 = $fachada->checkOption("pesonasc","3000",$lnnat->pesonasc);
$pesonasc5 = $fachada->checkOption("pesonasc","4000",$lnnat->pesonasc);
$pesonasc6 = $fachada->checkOption("pesonasc","NA",$lnnat->pesonasc);*/
$pertorac1 = $fachada->checkOption("pertorac", "-30", $lnnat->pertorac);
$pertorac2 = $fachada->checkOption("pertorac", "34", $lnnat->pertorac);
$pertorac3 = $fachada->checkOption("pertorac", "+34", $lnnat->pertorac);
$pertorac4 = $fachada->checkOption("pertorac", "NA", $lnnat->pertorac);
$comp1 = $fachada->checkOption("comp", "-47", $lnnat->comp);
$comp2 = $fachada->checkOption("comp", "47", $lnnat->comp);
$comp3 = $fachada->checkOption("comp", "+50", $lnnat->comp);
$comp4 = $fachada->checkOption("comp", "NA", $lnnat->comp);
$testepe1 = $fachada->checkPOST("testepe", "S", $lnnat->testepe);
$testepe2 = $fachada->checkPOST("testepe", "N", $lnnat->testepe);
$testepe3 = $fachada->checkPOST("testepe", "NA", $lnnat->testepe);
$dtestepe = $fachada->checkDisable("testepe", $lnnat->testepe, "S");
$fenilcet1 = $fachada->checkOption("fenilcet", "S", $lnnat->fenilcet);
$fenilcet2 = $fachada->checkOption("fenilcet", "N", $lnnat->fenilcet);
$fenilcet3 = $fachada->checkOption("fenilcet", "NA", $lnnat->fenilcet);
$hipotir1 = $fachada->checkOption("hipotir", "S", $lnnat->hipotir);
$hipotir2 = $fachada->checkOption("hipotir", "N", $lnnat->hipotir);
$hipotir3 = $fachada->checkOption("hipotir", "NA", $lnnat->hipotir);
$anemfalc1 = $fachada->checkOption("anemfalc", "S", $lnnat->anemfalc);
$anemfalc2 = $fachada->checkOption("anemfalc", "N", $lnnat->anemfalc);
$anemfalc3 = $fachada->checkOption("anemfalc", "NA", $lnnat->anemfalc);
$triagaud1 = $fachada->checkPOST("triagaud", "S", $lnnat->triagaud);
$triagaud2 = $fachada->checkPOST("triagaud", "N", $lnnat->triagaud);
$triagaud3 = $fachada->checkPOST("triagaud", "NA", $lnnat->triagaud);
$dtriagaud = $fachada->checkDisable("triagaud", $lnnat->triagaud, "S");
$peate1 = $fachada->checkOption("peate", "P", $lnnat->peate);
$peate2 = $fachada->checkOption("peate", "N", $lnnat->peate);
$peate3 = $fachada->checkOption("peate", "NA", $lnnat->peate);
$eoa1 = $fachada->checkOption("eoa", "N", $lnnat->eoa); 
$eoa2 = $fachada->checkOption("eoa", "A", $lnnat->eoa); 
$eoa3 = $fachada->checkOption("eoa", "NA", $lnnat->eoa); 
$reanim1 = $fachada->checkPOST("reanim", "S", $lnnat->reanim); 
$reanim2 = $fachada->checkPOST("reanim", "N", $lnnat->reanim); 
$reanim3 = $fachada->checkPOST("reanim", "NA", $lnnat->reanim); 
$icter1 = $fachada->checkOption("icter", "A", $lnnat->icter);
$icter2 = $fachada->checkOption("icter", "NA", $lnnat->icter);
$rash1 = $fachada->checkPOST("rash", "S", $lnnat->rash);
$rash2 = $fachada->checkPOST("rash", "N", $lnnat->rash);
$rash3 = $fachada->checkPOST("rash", "NA", $lnnat->rash);
$sang1 = $fachada->checkPOST("sang", "S", $lnnat->sang);
$sang2 = $fachada->checkPOST("sang", "N", $lnnat->sang);
$sang3 = $fachada->checkPOST("sang", "NA", $lnnat->sang);
$vomit1 = $fachada->checkPOST("vomit", "S", $lnnat->vomit);
$vomit2 = $fachada->checkPOST("vomit", "N", $lnnat->vomit);
$vomit3 = $fachada->checkPOST("vomit", "NA", $lnnat->vomit);
$infec1 = $fachada->checkPOST("infec", "S", $lnnat->infec);
$infec2 = $fachada->checkPOST("infec", "N", $lnnat->infec);
$infec3 = $fachada->checkPOST("infec", "NA", $lnnat->infec);
$anomcong1 = $fachada->checkPOST("anomcong", "S", $lnnat->anomcong);
$anomcong2 = $fachada->checkPOST("anomcong", "N", $lnnat->anomcong);
$anomcong3 = $fachada->checkPOST("anomcong", "NA", $lnnat->anomcong);
$paral1 = $fachada->checkPOST("paral", "S", $lnnat->paral);
$paral2 = $fachada->checkPOST("paral", "N", $lnnat->paral);
$paral3 = $fachada->checkPOST("paral", "NA", $lnnat->paral);
$coriza1 = $fachada->checkPOST("coriza", "S", $lnnat->coriza);
$coriza2 = $fachada->checkPOST("coriza", "N", $lnnat->coriza);
$coriza3 = $fachada->checkPOST("coriza", "NA", $lnnat->coriza);
$convul1 = $fachada->checkPOST("convul", "S", $lnnat->convul);
$convul2 = $fachada->checkPOST("convul", "N", $lnnat->convul);
$convul3 = $fachada->checkPOST("convul", "NA", $lnnat->convul);
$obsnnatal = $fachada->printOBS($lnnat->obs, $_POST['obsnnatal']);
/* ------------------------------------------------------------------------------------------------------------- */
/* ------------------------------------------ Outras Informações ----------------------------------------------- */
/* ------------------------------------------------------------------------------------------------------------- */
$linfo = $fachada->getValuesTablePr('outrasinformacoes',$pront);
$chagas1 = $fachada->checkPOST("chagas", "S", $linfo->chagas);
$chagas2 = $fachada->checkPOST("chagas", "N", $linfo->chagas);
$chagas3 = $fachada->checkPOST("chagas", "NA", $linfo->chagas);
$esquist1 = $fachada->checkPOST("esquist", "S", $linfo->esquist);
$esquist2 = $fachada->checkPOST("esquist", "N", $linfo->esquist);
$esquist3 = $fachada->checkPOST("esquist", "NA", $linfo->esquist);
if ($erroi && $_POST['agtox'] == "S" && $_POST['tagtox'] == "") 
	$lblexpag = 'class="erro"';
$agtox1 = $fachada->checkPOST("agtox", "S", $linfo->agtox);
$agtox2 = $fachada->checkPOST("agtox", "N", $linfo->agtox);
$agtox3 = $fachada->checkPOST("agtox", "NA", $linfo->agtox);
$tagtox = $fachada->printOBS($linfo->tagtox, $_POST['tagtox']);
$dagtox = $fachada->checkDisable("agtox", $linfo->agtox, "S");
$ctuberc1 = $fachada->checkPOST("ctuberc", "S", $linfo->ctuberc);
$ctuberc2 = $fachada->checkPOST("ctuberc", "N", $linfo->ctuberc);
$ctuberc3 = $fachada->checkPOST("ctuberc", "NA", $linfo->ctuberc);
if ($erroi && $_POST['alergmed'] == "S" && $_POST['talergmed'] == "")
	$lblalgmed = 'class="erro"';
$alergmed1 = $fachada->checkPOST("alergmed", "S", $linfo->alergmed);
$alergmed2 = $fachada->checkPOST("alergmed", "N", $linfo->alergmed);
$alergmed3 = $fachada->checkPOST("alergmed", "NA", $linfo->alergmed);
$dalergmed = $fachada->checkDisable("alergmed", $linfo->alergmed, "S");
$talergmed = $fachada->printOBS($linfo->talergmed, $_POST['talergmed']);
$obsoutinfo = $fachada->printOBS($linfo->obs, $_POST['obsoutinfo']);
/* ------------------------------------------------------------------------------------------------------------- */
/* ----------------------------------------------- Pré-Natal --------------------------------------------------- */
/* ------------------------------------------------------------------------------------------------------------- */
$lpnat = $fachada->getValuesTablePr('prenatal',$pront);
$sang = $fachada->getGrupoSanguineo();
$acpmed1 = $fachada->checkPOST("acpmed", "S", $lpnat->acpmed);
$acpmed2 = $fachada->checkPOST("acpmed", "N", $lpnat->acpmed);
$acpmed3 = $fachada->checkPOST("acpmed", "NA", $lpnat->acpmed);
if ($errpnt && $_POST['acpmed'] == "S" && $_POST['lacpmed'] == "") 
	$lblmed = ' erro';
$lacpmed = $fachada->printOBS($lpnat->lacpmed, $_POST['lacpmed']);
$dacpmed = $fachada->checkDisable("acpmed", $lpnat->acpmed, "S");
$nacpmed1 = $fachada->checkOption("nacpmed", "+6", $lpnat->nacpmed);
$nacpmed2 = $fachada->checkOption("nacpmed", "-6", $lpnat->nacpmed);
$nacpmed3 = $fachada->checkOption("nacpmed", "NA", $lpnat->nacpmed);
$durgest1 = $fachada->checkOption("durgest", "PrT", $lpnat->durgest);
$durgest2 = $fachada->checkOption("durgest", "T", $lpnat->durgest);
$durgest3 = $fachada->checkOption("durgest", "PoT", $lpnat->durgest);
$durgest4 = $fachada->checkOption("durgest", "NA", $lpnat->durgest);
$sangmae1 = $fachada->checkOption("sangmae", "NA", $lpnat->idSang);
$z211 = $fachada->checkOption("z21", "P1", $lpnat->z21);
$z212 = $fachada->checkOption("z21", "P2", $lpnat->z21);
$z213 = $fachada->checkOption("z21", "P3", $lpnat->z21);
$z214 = $fachada->checkOption("z21", "N", $lpnat->z21);
$z215 = $fachada->checkOption("z21", "NA", $lpnat->z21);
$a531 = $fachada->checkOption("a53", "P1", $lpnat->a53);
$a532 = $fachada->checkOption("a53", "P2", $lpnat->a53);
$a533 = $fachada->checkOption("a53", "P3", $lpnat->a53);
$a534 = $fachada->checkOption("a53", "N", $lpnat->a53);
$a535 = $fachada->checkOption("a53", "NA", $lpnat->a53);
$b181 = $fachada->checkOption("b18", "P1", $lpnat->b18);
$b182 = $fachada->checkOption("b18", "P2", $lpnat->b18);
$b183 = $fachada->checkOption("b18", "P3", $lpnat->b18);
$b184 = $fachada->checkOption("b18", "N", $lpnat->b18);
$b185 = $fachada->checkOption("b18", "NA", $lpnat->b18);
$b581 = $fachada->checkOption("b58", "P1", $lpnat->b58);
$b582 = $fachada->checkOption("b58", "P2", $lpnat->b58);
$b583 = $fachada->checkOption("b58", "P3", $lpnat->b58);
$b584 = $fachada->checkOption("b58", "N", $lpnat->b58);
$b585 = $fachada->checkOption("b58", "NA", $lpnat->b58);
$imunizmae1 = $fachada->checkOption("imunizmae", "EC", $lpnat->imunizmae);
$imunizmae2 = $fachada->checkOption("imunizmae", "EI", $lpnat->imunizmae);
$imunizmae3 = $fachada->checkOption("imunizmae", "NR", $lpnat->imunizmae);
$imunizmae4 = $fachada->checkOption("imunizmae", "NA", $lpnat->imunizmae);
$exradion1 = $fachada->checkOption("exradion", "1T", $lpnat->exradion);
$exradion2 = $fachada->checkOption("exradion", "GR", $lpnat->exradion);
$exradion3 = $fachada->checkOption("exradion", "N", $lpnat->exradion);
$exradion4 = $fachada->checkOption("exradion", "NA", $lpnat->exradion);
//if ($errpnt && !$linha->ass && $_POST['medic'] == "") 
//	$lbMedic = 'class="erro"';
$medic = $fachada->printOBS($lpnat->medic, $_POST['medic']);
if ($errpnt && !$linha->ass && $_POST['anorm'] == "") 
	$lbAnorm = 'class="erro"';
$anorm = $fachada->printOBS($lpnat->anorm, $_POST['anorm']);
$doencir1 = $fachada->checkOption("doencir", "NT", $lpnat->doencir);
$doencir2 = $fachada->checkOption("doencir", "1T", $lpnat->doencir);
$doencir3 = $fachada->checkOption("doencir", "2T", $lpnat->doencir);
$doencir4 = $fachada->checkOption("doencir", "3T", $lpnat->doencir);
$doencir5 = $fachada->checkOption("doencir", "NA", $lpnat->doencir);
if ($errpnt && $_POST['doencir'] != "NA" && $_POST['doencir'] != "NT" && $_POST['cirurgdc'] == "") 
	$lbCirug = "class='erro'"; 
$ddoencir = $fachada->checkDisable3("doencir",$lpnat->doencir,"1T", "2T", "3T");
$cirurgdc = $fachada->printOBS($lpnat->cirurgdc, $_POST['cirurgdc']);
$anemia1 = $fachada->checkPOST("anemia", "S", $lpnat->anemia);
$anemia2 = $fachada->checkPOST("anemia", "N", $lpnat->anemia);
$anemia3 = $fachada->checkPOST("anemia", "NA", $lpnat->anemia);
$alimgrav1 = $fachada->checkOption("alimgrav", "B", $lpnat->alimgrav);
$alimgrav2 = $fachada->checkOption("alimgrav", "R", $lpnat->alimgrav);
$alimgrav3 = $fachada->checkOption("alimgrav", "E", $lpnat->alimgrav);
$alimgrav4 = $fachada->checkOption("alimgrav", "F", $lpnat->alimgrav);
$alimgrav5 = $fachada->checkOption("alimgrav", "NA", $lpnat->alimgrav);
$pesograv = $fachada->printCampo($lpnat->pesograv, $_POST['pesograv']);
$obsprenat = $fachada->printOBS($lpnat->obs, $_POST['obsprenat']);
/* ------------------------------------------------------------------------------------------------------------- */

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