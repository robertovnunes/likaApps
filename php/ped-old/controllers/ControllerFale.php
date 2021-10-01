<?php
	$envia = $_POST['enviar'];
	if ($envia == "Enviar"){
		$nome = $_POST['nome'];
		$email = $_POST['email'];
		$assunto = $_POST['assunto'];
		$msg = $_POST['msg'];
		$pattern = "^([A-Z_a-z])+.+@([a-zA-Z])+";
		if(!$nome || !ereg($pattern,$email) || !$assunto || !$msg){	
			$error = 1;
			if (!$nome)
				$cerrN = ' msgerr';
			if (!ereg($pattern,$email))
				$cerrE = ' msgerr';
			if (!$assunto)
				$cerrA = ' msgerr';
			if (!$msg)
				$cerrM = ' msgerr';
		} else {
			$mensagem = "Essa é uma mensagem automática.<br>Recebemos sua mensagem e entraremos em contato assim que possível.<br><br><br><b>Mensagem enviada por:</b> ".$nome." <b>em:</b> ".date("d/m/Y - H:i")."\n <br />
				<br/><b>Abaixo seguem os dados do usuário:</b>\n <br/>
				<br/><b>E-mail:</b> ".$email."\n <br />
				<b>Assunto:</b> ".$assunto."\n <br />
				<b>A mensagem enviada foi a seguinte:</b><br/> \n <br/>
				".$msg;
			$headers = "MIME-Version: 1.0\r\n";
			$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
			$headers .= "From: PED <rosalie.belian@ufpe.br>\r\n";
			mail($to,"[PED]Resposta Automática",$mensagem,$headers);

			$mensagem = "Nova mensagem para o sistema PED.<br><br><b>Mensagem enviada por:</b> ".$nome." <b>em:</b> ".date("d/m/Y - H:i")."\n <br />
				<br/><b>Abaixo seguem os dados do usuÃ¡rio:</b>\n <br/>
				<br/><b>E-mail:</b> ".$email."\n <br />
				<b>Assunto:</b> ".$assunto."\n <br />
				<b>A mensagem enviada foi a seguinte:</b><br/> \n <br/>
				".$msg;
			$headers = "MIME-Version: 1.0\r\n";
			$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
			$headers .= "From: $nome <$email>\r\n";
			mail("rosalie.belian@ufpe.br","[PED]Resposta Automática",$mensagem,$headers);
			header("Location: index.php?x=enviado");
		}
	}
?>