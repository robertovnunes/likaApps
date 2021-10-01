<?php
	if ($flag){
		if ($ass){
			if ($gamb == "true"){
				echo "<div class='msgTelaAluno'>Assinatura efetuada com sucesso.</div>";
			} else {
				if ($errad) echo "<div class='msgerro'>Preencha o adendo.</div>";
				else if ($_POST['vhip'] == "Ver Hipótese") echo "";
				else echo "<div class='msgTelaAluno'>Novo Adendo Inserido.</div>";
			}
		} else {
			if ($msge)
				echo "<div class='msgerro'>Alguns dados nesta aba est&atilde;o incorretos. Destaque em vermelho.</div>";
			if ($msgi)
				echo "<div class='msgTelaAluno'>Dados inseridos com sucesso.</div>";
		}
		if ($error && $dir == "aba_informante"){
			echo '<div class="msgerro" style="font-size:14px">';
			if (!$_POST['nome']){
				echo "*Preencha um nome.<br />";
				$cerrNome = 'erro';
			} if (!$_POST['sexo']){
				echo "*Selecione um sexo.<br />";
				$cerrSexo = 'erro';
			} if (!$_POST['ende']){
				echo "*Preencha um endere&ccedil;o.<br />";
				$cerrEnde = 'erro';
			} if (!$_POST['bairro']){
				echo "*Preencha um bairro.<br />";
				$cerrBair = 'erro';
			} if (!$_POST['cidade']){
				echo "*Preencha uma cidade.<br />";
				$cerrCid = 'erro';
			} if (!$_POST['uf']){
				echo "*Preencha um UF.<br />";
				$cerrUF = 'erro';
			} if ($_POST['parent'] == "0"){
				echo "*Selecione um parentesco.<br />";
				$cerrParent = 'erro';
			} if ($_POST['escol'] == "0"){
				echo "*Selecione uma escolaridade.<br />";
				$cerrEsc = 'erro';
			} if(!$fachada->validaCEP($_POST['cep']) && $_POST['cep']){
				echo "*O CEP informado &eacute; inv&aacute;lido.<br />";
				$cerrCEP = 'class="erro"';
			}
			echo '</div >';		
		} else if (!$error && $dir == "aba_informante"){
			echo '<div class="msgTelaAluno">Dados inseridos com sucesso.</div>';
		}
		echo '<br />';		
	}
	
?>