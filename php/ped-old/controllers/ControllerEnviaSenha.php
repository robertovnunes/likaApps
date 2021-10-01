<?php
	$envia = $_POST['enviar'];
	if ($envia == "Enviar"){
		$login = $_POST['login'];
		$email = $_POST['email'];
		$pattern = "^([A-Z_a-z])+.+@([a-zA-Z])+";
		if(!$login || !ereg($pattern,$email)){	
			$error = 1;
			if (!$login)
				$cerrN = ' msgerr';
			if (!ereg($pattern,$email))
				$cerrE = ' msgerr';
		} else {
			if ($fachada->existeLoginEmail($login, $email)) {
				$novaSenha = $fachada->novaSenha($login, $email);
				$to = $email;
				$mensagem = "Você solicitou a recuperação e uma nova senha foi gerada pelo sistema PED\n\n
					Data da solicitação: ".date("d/m/Y - H:i")."\n 
					Login: ".$login."\n 
					Nova senha: ".$novaSenha."\n\nÉ recomendável que, ao logar no sistema PED, o usuário altere sua senha pelo menu 'Editar Perfil'";
				$headers = "MIME-Version: 1.0\r\n";
				$headers = "Content-type: text/html; charset=iso-8859-1\r\n";
				$headers = "From: PED <rosalie.belian@ufpe.br>\r\n";
				mail($to,"[PED]Recuperação de senha",$mensagem,$headers);
				header("Location: index.php?x=nsenha");	
			} else {
				$error1 = 1;
			}
		}
	}
?>