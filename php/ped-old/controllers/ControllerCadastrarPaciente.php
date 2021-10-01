<?php
$valCad = array($_POST['nome'], $_POST['data'], $_POST['cns'], $_POST['cpf'], $_POST['sexo'], $_POST['mae'], $_POST['pai'],
    $_POST['ende'], $_POST['num'], $_POST['comp'], $_POST['bair'], $_POST['cidade'], $_POST['uf'], $_POST['cep']);

if ($_POST['salvar'] == "Salvar"){
	$paciente = new Paciente($valCad[0], $valCad[1], $valCad[2], $valCad[3], $valCad[4], $valCad[5], $valCad[6], $valCad[7],
        $valCad[8], $valCad[9], $valCad[10], $valCad[11], $valCad[12], $valCad[13]);
    try {
		$idAtendimento = $fachada->cadastrarPaciente($paciente,$user->getLogin());
		header("Location:aluno.php?x=c&&at=".$idAtendimento);
		//header("Location:prontuario_paciente.php?at=".$idAtendimento);
	} catch (CamposInvalidos $e) {
        $error = 1;
        if (!$valCad[0]){
            $errNome= "*Preencha o nome.<br />";
            $cerrNome = ' erro';
        }
        if (!$valCad[4]){
            $errSexo= "*Selecione um sexo.<br />";
            $cerrSexo =  ' erro';
        }
        $vdat = $fachada->msgData($valCad[1]);
        if ($vdat){
            $errData = "*".$vdat.".<br />";
            $cerrData =  ' erro';
        }
        if(!$fachada->validaCPF($valCad[3])){
            $errCPF = "*Preencha um CPF v&aacute;lido.<br />";
            $cerrCPF =  ' erro';
	    }
        if(!$valCad[5]){
            $errMae= "*Preencha o nome da m&atilde;e.<br />";
            $cerrMae =  ' erro';
        }
	    if(!$valCad[13]){
            $errCEP= "*Preencha um CEP v&aacute;lido para definir um endere&ccedil;o.<br />";
            $cerrCEP =  ' erro';
	    }
        if(!$valCad[7]){
            $errEnde= "*Preencha o endere&ccedil;o.<br />";
            $cerrEnde = ' erro';
        }
	    if(!$valCad[10]){
            $errBair = "*Preencha o bairro.<br />";
            $cerrBair = ' erro';
	    }
	    if(!$valCad[12]){
            $errUF = "*Preencha o UF.<br />";
            $cerrUF = ' erro';
	    }
	    if(!$valCad[11]){
            $errCid = "*Preencha a cidade.<br />";
            $cerrCid = ' erro';
	    }
	    /*if(!validaCEP($_POST['cep'])){
		    echo "*Preencha um CEP v&aacute;lido.<br />";*/
		//$errcep = 1;

  	} catch (ExistePaciente $e) {
        $error = 1;
        $errPac = "*Esse paciente já está cadastrado. Confirme se o nome do paciente, o nome da mãe, a data de 
nascimento, o CPF ou o CNS estão corretos.<br />";
        $errPac = "*Esse paciente já está cadastrado. Confirme se o nome do paciente, o nome da mãe, a data de nascimento, o CPF ou o CNS estão corretos.<br />";
	}
	if ($valCad[4] == "M")
        $sexoM = "checked='checked'";
    else if ($valCad[4] == "F")
        $sexoF = "checked='checked'";
}
?>