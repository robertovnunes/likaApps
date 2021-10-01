<fieldset style="width:46%">
	<legend>Tamanho</legend>
	<select name="tamcranio" <?php echo $ass; ?> onchange="savCampo('6')">
		<option value="N" <?php echo $tamcranio1; ?>>Normal</option>
		<option value="A" <?php echo $tamcranio2; ?>>Alterado</option>
		<option value="NA" <?php echo $tamcranio3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Forma</legend>
	<select name="formacranio" <?php echo $ass; ?> onchange="savCampo('6')">
		<option value="N" <?php echo $formacranio1; ?>>Normal</option>
		<option value="A" <?php echo $formacranio2; ?>>Alterada</option>
		<option value="NA" <?php echo $formacranio3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Fontanelas (tamanho e tens&atilde;o)</legend>
	<select name="fontanelas" <?php echo $ass; ?> onchange="savCampo('6')">
		<option value="N" <?php echo $fontanelas1; ?>>Normais</option>
		<option value="A" <?php echo $fontanelas2; ?>>Alteradas</option>
		<option value="NA" <?php echo $fontanelas3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Suturas</legend>
	<span>
		<input name="suturas" type="radio" value="P" onchange="savCampo('6')" <?php echo $ass." ".$suturas1; ?>/><label>Presentes</label>
		<input name="suturas" type="radio" value="A" onchange="savCampo('6')" <?php echo $ass." ".$suturas2; ?>/><label>Ausentes</label>
		<input name="suturas" type="radio" value="NA" onchange="savCampo('6')" <?php echo $ass." ".$suturas3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Craneotabes</legend>
	<span>
		<input name="craneo" type="radio" value="S" onchange="savCampo('6')" <?php echo $ass." ".$craneo1; ?>/><label>Sim</label>
		<input name="craneo" type="radio" value="N" onchange="savCampo('6')" <?php echo $ass." ".$craneo2; ?>/><label>N&atilde;o</label>
		<input name="craneo" type="radio" value="NA" onchange="savCampo('6')" <?php echo $ass." ".$craneo3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Cabelos</legend>
	<span>
		<input name="cabelo" type="radio" value="P" onchange="savCampo('6')" <?php echo $ass." ".$cabelo1; ?>/><label>Presentes</label>
		<input name="cabelo" type="radio" value="A" onchange="savCampo('6')" <?php echo $ass." ".$cabelo2; ?>/><label>Ausentes</label>
		<input name="cabelo" type="radio" value="NA" onchange="savCampo('6')" <?php echo $ass." ".$cabelo3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Les&otilde;es de Couro Cabeludo</legend>
	<span>
		<input name="lescab" type="radio" value="S" onchange="savCampo('6')" <?php echo $ass." ".$lescab1; ?>/><label>Sim</label>
		<input name="lescab" type="radio" value="N" onchange="savCampo('6')" <?php echo $ass." ".$lescab2; ?>/><label>N&atilde;o</label>
		<input name="lescab" type="radio" value="NA" onchange="savCampo('6')" <?php echo $ass." ".$lescab3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obscran" class="txta1" onkeyup="savCampo('6')" <?php echo $ass; ?>><?php echo $obscran; ?></textarea>
</fieldset>