<?php
	$id = $user->getID();
	$login = $user->getLogin();
	$cpf = $user->getCPF();
    if ($_POST['salvar'] == "Salvar"){
		try {
			$usenha = $user->getSenha();
			$fachada->editarPerfil($id, $_POST['nome'], $_POST['nsenha'], $_POST['rnsenha'], $_POST['senha'], 
				$user->getSenha(), $_POST['email']);
			$user->setNome($_POST['nome']);	
			if ($_POST['nsenha']) $user->setSenha($_POST['nsenha']);	
			$user->setEmail($_POST['email']);	
			session_start();
			$_SESSION['user'] = serialize($user);	
			header("Location:aluno.php?x=a");
		} catch (CamposInvalidos $e) {
			$error = 1;
		}
    } else{
		$name = $user->getNome();
		$email = $user->getEmail();
    }

	$enome = $fachada->printCampo($name, $_POST['nome']);
	$eemail = $fachada->printCampo($email, $_POST['email']);
?>