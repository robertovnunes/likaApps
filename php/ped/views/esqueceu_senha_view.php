<?php
	include_once("cabecalho.inc.php");
	include_once("topoped.php");
?>
<div id="telainicialContent">
<?php include("views/menudatahora.inc.php"); ?>
<div id="formCadastro">
<form action="esqueceu.php" method="post" name="formContato">
    <fieldset>
		<legend>Recuperação de Senha</legend>
		<table bgcolor="#E8E8E8" width="600"><tr><td>
			<br />
		<?php if ($error) { ?>
			<div class="msgerro">Preencha corretamente os campos em vermelho.</div>
		<?php } ?>
		<?php if ($error1) { ?>
			<div class="msgerro">Login ou e-mail incompatíveis.</div>
			<br /><br />
		<?php } ?>
			<fieldset class="full">
                <legend>Dados</legend>
				<div style="clear:both">
					<label id="lbLogin" class="labdir2<?php echo $cerrN; ?>">Login*:</label>
					<input class="tam30" name="login" onfocus="mudaLb(lbLogin)" onkeyup="savCampo()" value="<?php echo $login; ?>" maxlength="50" />
                </div>
				<div style="clear:both">
					<label id="lbEmail" class="labdir2<?php echo $cerrE; ?>">E-mail*:</label>
					<input class="tam30" name="email" onfocus="mudaLb(lbEmail)" onkeyup="savCampo()" value="<?php echo $email; ?>" maxlength="50" />
                </div>
				<div style="clear: both">
					<label style="font-size: 11px; margin-left: 80px">(*) Campos obrigatórios.</label>				
				</div>
			</fieldset>
			<br />
			<fieldset class="full">
				<legend>Op&ccedil;&otilde;es</legend>
				<input name="limpar" type="reset" value="Limpar" />
				<input name="voltar" type="submit" value="Voltar" onclick="this.form.action='index.php'" />
				<div class="salvar">
					<input name="enviar" type="submit" value="Enviar" />
					<input type="hidden" value="0" id="ctrl" />
				</div>
			</fieldset>
        </td></tr></table>
    </fieldset>
</form>
</div>