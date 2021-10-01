<fieldset style="width:20%">
	<legend>G&acirc;nglios Linf&aacute;ticos</legend>
	<select name="ganglinf" <?php echo $ass; ?> onChange="savCampo('3')">
		<option value="N" <?php echo $ganglios1; ?>>Normais</option>
		<option value="A" <?php echo $ganglios2; ?>>Anormais</option>
		<option value="NA" <?php echo $ganglios3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsegang" class="txta1" onKeyUp="savCampo('3')" <?php echo $ass;?>><?php echo $obsegang; ?></textarea>
</fieldset>