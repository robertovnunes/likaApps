<?php
include("includer.php");

$pront = $_GET['pr'];
validarProntuario($usuario->getLogin(),$pront);
if ($_GET['flag'] == 1){
	$flag = 1;
	$assinatura = 1;
}

$paciente = getDadosPacientePr($pront);
if ($_POST['vac'] == "Inserir Vacina"){
	try {
		$flag = 1;
		include("fachada.php");
		$fachada = new Fachada();
		$fachada->inserirVacinaPaciente($_POST['vacinanome'], $_POST['vacinadose'], $_POST['datavacina'], $paciente->dtnasc,$pront);
		$sucvac = 1;
	} catch (CamposInvalidos $e){
		$errvac = 1;
	} catch (DoseInvalida $e){
		$errvac1 = 1;
	}
}

$removeuVacina = 0;

if ($_POST['rVac'] == "RemoverVacina"){
	try {
		$flag = 1;
		include("fachada.php");
		$fachada = new Fachada();
		$fachada->removerVacinaPaciente($_POST['vacina'], $_POST['dose'], $pront);
		$removeuVacina = 1;
		$sucvac = 1;
	} catch (CamposInvalidos $e){
		$errvac = 1;
	} catch (DoseInvalida $e){
		$errvac1 = 1;
	}
}

if ($_POST['salvar'] == "Salvar"){
	$flag = 1;
	$n = $_GET['n'];
	include("fachada.php");
	include ("classes/adendo.php");
	$fachada = new Fachada();
	switch ($n){
		
		case "antpessoais":
			$ccaba = $_POST['ccaba'];
			$msge = "";
			$msgi = "";
			try {
				if (verPreenchimento($ccaba,'1')){ echo "foi $ccaba";
					$fachada->inserirPreNatalHP($_POST['acpmed'], $_POST['nacpmed'], $_POST['lacpmed'], $_POST['durgest'],
						$_POST['sangmae'], $_POST['z21'], $_POST['a53'], $_POST['b18'],$_POST['b58'], $_POST['imunizmae'],
						$_POST['exradion'],$_POST['medic'],$_POST['anorm'],$_POST['pdoencir'],$_POST['tdoencir'],$_POST['pesograv'],
						$_POST['qaliment'], $_POST['anemia'], $_POST['obsprenat'], $pront);
					$msgi = "Pr&eacute;-Natal";
				}
			} catch (CamposInvalidos $e){
				$msge =  printMsg($msgi,"Pr&eacute;-Natal");
				$errpnt = 1;
			}
		
			try {
				if (verPreenchimento($ccaba,'2')){
					$fachada->inserirNatalHP($_POST['tipograv'], $_POST['tipoparto'],$_POST['tipoapres'],$_POST['durtrabparto'],
						$_POST['anestesia'], $_POST['analgesia'], $_POST['comparto'],$_POST['tcomparto'],$_POST['obsnatal'],$pront);
					$msgi = printMsg($msgi, "Natal");
				}
			} catch (CamposInvalidos $e){
				$msge = printMsg($msge, "Natal");
				$errnt = 1;
			}
			
			try {
				if (verPreenchimento($ccaba,'3')){
					$fachada->inserirNeoNatalHP($_POST['apgar1'], $_POST['apgar5'], $_POST['permnasal'], $_POST['idadegest'],
						$_POST['sangrn'], $_POST['sinalorto'], $_POST['pesoalta'], $_POST['comprimento'],$_POST['percef'], 
						$_POST['pertorac'], $_POST['pesonasc'], $_POST['testepe'],$_POST['fenilcet'], $_POST['hipotiroid'],
						$_POST['anemiafalc'], $_POST['triaaud'],$_POST['PEATE'], $_POST['EOA'], $_POST['reanimacao'],
						$_POST['ictericia'], $_POST['rash'], $_POST['sangramentos'], $_POST['vomitos'], $_POST['infeccoes'],
						$_POST['anomcong'],$_POST['paralisias'], $_POST['coriza'], $_POST['convulsoes'],$_POST['obsnnatal'],$_POST['pesoAtual'],$_POST['alturaAtual'],$pront);
					$msgi = printMsg($msgi, "Neo-Natal");
				}
			} catch (CamposInvalidos $e){
				$msge = printMsg($msge, "Neo-Natal");
			}

			try {
				if (verPreenchimento($ccaba,'4')){
					$fachada->inserirAlimHP($_POST['alimmatexc'], $_POST['alimcomp'], $_POST['alimpast'], $_POST['alimfam'],
						$_POST['dietatu'], $_POST['refdiarias'], $_POST['horaref'],$_POST['usomam'],$_POST['colher'],$_POST['copo'],
						$_POST['alimpastliq'], $_POST['chantafet'],$_POST['brincref'], $_POST['obsaliment'],$pront);
					$msgi = printMsg($msgi, "Alimenta&ccedil;&atilde;o");
				}
			} catch (CamposInvalidos $e){
				$msge = printMsg($msge, "Alimenta&ccedil;&atilde;o");
			}

			try {
				if (verPreenchimento($ccaba,'5')){
					$fachada->inserirCrescDesHP($_POST['relirm'], $_POST['idadesc'], $_POST['aprend'], $_POST['repetano'],
						$_POST['relacol'], $_POST['particfala'], $_POST['muddent'], $_POST['obscrescdes'], $pront);
					$msgi = printMsg($msgi, "Crescimento e Desenvolvimento");
				} 
			} catch (CamposInvalidos $e){
				$msge = printMsg($msge, "Crescimento e Desenvolvimento");
				$errcd = 1;
			}

			try {
				if (verPreenchimento($ccaba,'6')){
					$fachada->inserirHabitHP($_POST['chupeta'], $_POST['chupadedo'], $_POST['roiunhas'], $_POST['tiques'],
						$_POST['altalim'], $_POST['geofagia'],$_POST['enurese'], $_POST['pertsono'], $_POST['dormepais'],
						$_POST['obshab'], $pront);
					$msgi = printMsg($msgi, "H&aacute;bitos");
				}
			} catch (CamposInvalidos $e){
				$msge = printMsg($msge, "H&aacute;bitos");
			}
			
			
			try {
				if (verPreenchimento($ccaba,'7')){
					$fachada->inserirImunizHP($_POST['efeitcol'], $_POST['testmant'], $_POST['obsimun'], $pront);
					$msgi = printMsg($msgi, "Imuniza&ccedil;&oacute;es");
				}
				
				else if ($removeuVacina == 1){
				
					$msgi = "removeu a vacina!";
					
				}
				
			} 
			
			catch (CamposInvalidos $e){
				$msge = printMsg($msge, "Imuniza&ccedil;&oacute;es");
				$errim = 1;
			}

			try {
				if (verPreenchimento($ccaba,'8')){
					$fachada->inserirDoenAntHP($_POST['coqueluche'], $_POST['sarampo'], $_POST['varicela'],$_POST['parotide'], 	
						$_POST['difteria'], $_POST['tetano'],$_POST['diarreia'], $_POST['pneumonia'], $_POST['meningite'],
						$_POST['febrereum'], $_POST['nefropatia'], $_POST['tuberculose'],$_POST['asma'], $_POST['eczema'],
						$_POST['alerg'], $_POST['talerg'],$_POST['rinite'],$_POST['cirurgia'],$_POST['transf'],$_POST['hospit'],
						$_POST['tratamentos'], $_POST['obsdoenant'], $pront);
					$msgi = printMsg($msgi, "Doen&ccedil;as Anteriores");
				}
			} catch (CamposInvalidos $e){
				$msge = printMsg($msge, "Doen&ccedil;as Anteriores");
				$errda = 1;
			}

			try {
				if (verPreenchimento($ccaba,'9')){
					$fachada->inserirOutInfoHP($_POST['doenchag'], $_POST['doenesq'], $_POST['expagtox'], $_POST['texpagtox'], 
						$_POST['alergmed'], $_POST['talergmed'], $_POST['conttuberc'],$_POST['obsoutinfo'], $pront);
					$msgi = printMsg($msgi, "Outras Informa&ccedil;&otilde;es");
				}	
			} catch (CamposInvalidos $e){
				$msge = printMsg($msge, "Outras Informa&ccedil;&otilde;es");
				$erroi = 1;
			}
		
		
			try {
				if(substr($ccaba,0,2)== "hf"){ 
				$fachada->inserirHistFamiliar($_POST['uniaopais'], $_POST['idademae'], $_POST['profmae'], $_POST['idadepai'], $_POST['profpai'], $_POST['pais'], $_POST['avos'], $_POST['irmaos'], $_POST['outros'], $_POST['tiporesid'], $_POST['ncomodos'], $_POST['nocupantes'], $_POST['agua'],$_POST['saneamento'], $_POST['luz'], $_POST['animais'], $_POST['obsconddom'], $pront);
				}
			} catch (CamposInvalidos $e){
				$error = 1;
			}

			break;
		
		
		

		case "historico":
			try {
				$fachada->inserirHistFamiliar($_POST['uniaopais'], $_POST['idademae'], $_POST['profmae'], $_POST['idadepai'], $_POST['profpai'], $_POST['pais'], $_POST['avos'], $_POST['irmaos'], $_POST['outros'], $_POST['tiporesid'], $_POST['ncomodos'], $_POST['nocupantes'], $_POST['agua'],$_POST['saneamento'], $_POST['luz'], $_POST['animais'], $_POST['obsconddom'], $pront);
			} catch (CamposInvalidos $e){
				$error = 1;
			}

			break;
			
	}
}	

$n = "histpaciente";
$show = "alp";
?>

<?php include("acesso_aluno.php"); ?>
