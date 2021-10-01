<div id="formCadastro">
    <form action="editarPerfil.php" method="post" name="formEditarPerfil">
    <fieldset>
        <legend>Editar Perfil</legend>
        <table bgcolor="#E8E8E8" width="600"><tr><td>
	<?php
	if ($error){
		echo '<div class="msgerro">';
		if(!$_POST['nome'])
			echo "*Preencha o nome.<br />";
		if(!$_POST['senha'])
			echo "*Preencha a senha atual.<br />";
		if($_POST['senha'] && ($_POST['senha'] != $usenha))
			echo "*Preencha a senha atual correta.<br />";
		if(($_POST['nsenha'] || $_POST['rnsenha']) && ($_POST['nsenha'] != $_POST['rnsenha']))
			echo "*As senhas não são iguais.<br />";
		if(!$fachada->validaEmail($_POST['email'])){
			echo "*Preencha um E-mail v&aacute;lido.<br />";
			$errmail = 1;
		}
		echo "</div>";
	}
	?>
			<br />
			<span class="style7">(*) Campos Obrigat&oacute;rios</span>
			<br />
			<fieldset class="full">
				<legend>Dados Pessoais</legend>
				<div style="clear:both">
					<label id="lbLogin" class="labdir2">Login: </label>
					<label style="margin:3 0 0 0"><?php echo $login;?></label>
				</div>
				<div style="clear:both">
					<label id="lbLogin" class="labdir2">CPF: </label>
					<label style="margin:3 0 0 0"><?php echo $cpf;?></label>
				</div>
				<div style="clear:both">
					<label id="lbNome" class="labdir2<?php if ($error && !$_POST['nome']){ echo ' erro'; }?>">Aluno*:</label>
					<input class="tam50" name="nome" onfocus="mudaLb(lbNome)" onkeyup="savCampo()" value="<?php echo $enome; ?>" maxlength="50" />
				</div>
				<div style="clear:both">
					<label id="lbNwPass" class="labdir2">Nova Senha:</label>
					<input class="tam20" name="nsenha" type="password" maxlength="15" onkeyup="savCampo()"/>
				</div>
				<div style="clear:both">
					<label id="lbNwPass" class="labdir2">Repetir Nova Senha:</label>
					<input class="tam20" name="rnsenha" type="password" maxlength="15" onkeyup="savCampo()"/>
				</div>
				<div style="clear:both">
					<label id="lbEmail" class="labdir2<?php if ($error && $errmail){ echo ' erro'; }?>">E-mail*:</label>
					<input class="tam50" name="email" maxlength="50" value="<?php echo $eemail; ?>" onfocus="mudaLb(lbEmail)" onkeyup="savCampo()"/>
				</div>
				<div style="clear:both">
					<label id="lbNwPass" class="labdir2">Senha atual*:</label>
					<input class="tam20" name="senha" type="password" maxlength="15" onkeyup="savCampo()"/>
				</div>
			</fieldset>
			<br />
			<fieldset class="full">
				<legend>Op&ccedil;&otilde;es</legend>
				<label>
					<input class="opcoes" name="voltar" type="submit" value="Voltar" onclick="this.form.action='aluno.php'" />
					<div class="salvar">
						<input class="opcoes" name="salvar" type="submit" value="Salvar" />
					</div>
					<input type="hidden" value="0" id="ctrl" />
				</label>
			</fieldset>
		</td></tr></table>
	</fieldset>
    </form>
</div>