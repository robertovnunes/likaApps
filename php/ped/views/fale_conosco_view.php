<?php
	include_once("cabecalho.inc.php");
	include_once("topoped.php");
?>
<div id="telainicialContent">
<?php include("views/menudatahora.inc.php"); ?>
<div id="formCadastro">
<form action="faleconosco.php" method="post" name="formContato">
    <fieldset>
       <legend>Fale Conosco</legend>
       <table bgcolor="#E8E8E8" width="600"><tr><td>
			<br />
		<?php if ($error) { ?>
			<div class="msgerro">Preencha corretamente os campos em vermelho.</div>
		<?php } ?>
			<fieldset class="full">
                <legend>Dados</legend>
				<div style="clear:both">
					<label id="lbNome" class="labdir2<?php echo $cerrN; ?>">Nome*:</label>
					<input class="tam50" name="nome" onfocus="mudaLb(lbNome)" onkeyup="savCampo()" value="<?php echo $nome; ?>" maxlength="50" />
                </div>
				<div style="clear:both">
					<label id="lbEmail" class="labdir2<?php echo $cerrE; ?>">E-mail*:</label>
					<input class="tam50" name="email" onfocus="mudaLb(lbEmail)" onkeyup="savCampo()" value="<?php echo $email; ?>" maxlength="50" />
                </div>
				<div style="clear:both">
					<label id="lbAssunto" class="labdir2<?php echo $cerrA; ?>">Assunto*:</label>
					<input class="tam50" name="assunto" onfocus="mudaLb(lbAssunto)" onkeyup="savCampo()" value="<?php echo $assunto; ?>" maxlength="50" />
                </div>
				<div style="clear:both">
					<label id="lbMsg" class="labdir2<?php echo $cerrM; ?>">Mensagem*:</label>
					<textarea class="txta3" name="msg" onfocus="mudaLb(lbMsg)" onkeyup="savCampo('5')"><?php echo $msg; ?></textarea>
                </div>
				<div>
					<label>(*) Campos obrigatórios.</label>
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