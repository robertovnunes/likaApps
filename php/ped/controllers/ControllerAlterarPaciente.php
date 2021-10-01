<?php
$n = "altp";
$pront = $_GET['pr'];
$paciente = $fachada->obterPacientePr($pront);

$estados = $fachada->listarEstados();

$valAlt = array('','','','','','','','','','','','','','');

$error = 0;
$mensagem = $campos = '';
$cerrCPF = $cerrNome = $cerrData = $cerrMae = $cerrSexo = $cerrCEP = $cerrEnde = $cerrBair = $cerrUF = $cerrCid = $cerrData = $cerrCEP = '';
$errc = $errData = $errCEP = '';

if (isset ($_POST['salvar'])) {

	$valAlt = array($_POST['nome'], $_POST['data'], $_POST['cns'], $_POST['cpf'],
					$_POST['sexo'], $_POST['mae'], $_POST['pai'], $_POST['ende'],
					$_POST['num'], $_POST['comp'], $_POST['bair'], isset($_POST['cidade']) ? $_POST['cidade'] : '',
					$_POST['uf'], $_POST['cep']);

	if ($_POST['salvar'] == "Salvar") {
		$pac = new Paciente($valAlt[0], $valAlt[1], $valAlt[2], $valAlt[3], 
			$valAlt[4], $valAlt[5], $valAlt[6], $valAlt[7], $valAlt[8], $valAlt[9], $valAlt[10], 
			$valAlt[11], $valAlt[12], $valAlt[13]);
		
		//$pac = new Paciente($valAlt[0], $valAlt[1], $paciente->getCNS(), $paciente->getCPF(), 
		//	$paciente->getSexo(), $valAlt[5], $valAlt[6], $valAlt[7], $valAlt[8], $valAlt[9], $valAlt[10], 
		//	$valAlt[11], $valAlt[12], $valAlt[13]);
		try {
			$fachada->alterarPaciente($pac, $pront);
			 $mensagem =  'Paciente alterado com sucesso';
			 $error = 1;
			//header("Location:aluno.php?x=s");
		} catch (CamposInvalidos $e){
				$error = 1;
				if (!$valAlt[0]){
					$cerrNome =  ' erro';
					$errc = 1;
				}
				if (!$valAlt[1]){
					$cerrData =  ' erro';
					$errc = 1;
				}
				if (!$valAlt[5]){
					$cerrMae =  ' erro';
					$errc = 1;
				}
				if (!$valAlt[13]){
					$cerrCEP =  ' erro';
					$errc = 1;
				}
				if (!$valAlt[7]){
					$cerrEnde =  ' erro';
					$errc = 1;
				}
				if (!$valAlt[10]){
					$cerrBair =  ' erro';
					$errc = 1;
				}
				if (!$valAlt[12]){
					$cerrUF =  ' erro';
					$errc = 1;
				}
				if (!$valAlt[11]){
					$cerrCid =  ' erro';
					$errc = 1;
				}
				if ($errc) $campos = "*Os campos alterados n&atilde;o podem ficar vazios.<br />";
				$vdat = $fachada->msgData($valAlt[1]);
				if ($vdat){
					$errData = "*".$vdat.".<br />";
					$cerrData =  ' erro';
				}
				if(!$fachada->validaCEP($valAlt[13])){
					$errCEP = "*O CEP informado &eacute; inv&aacute;lido.<br />";
					$cerrCEP = ' erro';
				}
		}
	}
}

/*Valor que define o form que acesso_aluno.php irá imprimir.*/	
$valAlt[0] = $fachada->printCampo($paciente->getNome(), $valAlt[0]);
$valAlt[1] = $fachada->printCampo($fachada->printData($paciente->getDTNasc()), $valAlt[1]);
$valAlt[2] = $fachada->printCampo($paciente->getCNS(), $valAlt[2]);
$valAlt[3] = $fachada->printCampo($paciente->getCPF(), $valAlt[3]);
$valAlt[4] = $fachada->printCampo($paciente->getSexo(), $valAlt[4]);
$valAlt[5] = $fachada->printCampo($paciente->getMae(),$valAlt[5]);
$valAlt[6] = $fachada->printCampo($paciente->getPai(),$valAlt[6]);
$valAlt[7] = $fachada->printCampo($paciente->getEndereco(),$valAlt[7]);
$valAlt[8] = $fachada->printCampo($paciente->getNumero(),$valAlt[8]);
$valAlt[9] = $fachada->printCampo($paciente->getComplemento(),$valAlt[9]);
$valAlt[10] = $fachada->printCampo($paciente->getBairro(),$valAlt[10]);
$valAlt[11] = $fachada->printCampo($paciente->getCidade(),$valAlt[11]);
$valAlt[12] = $fachada->printCampo($paciente->getUF(),$valAlt[12]);
$valAlt[13] = $fachada->printCampo($paciente->getCEP(),$valAlt[13]);

?>