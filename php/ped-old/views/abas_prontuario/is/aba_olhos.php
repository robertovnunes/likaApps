<fieldset style="width:46%">
	<legend>Fotofobia</legend>
	<span>
		<input name="fotofobia" type="radio" value="S" <?php echo $ass." ".$fotofobia1; ?> onchange="savCampo('3')"/><label>Sim</label>
		<input name="fotofobia" type="radio" value="N" <?php echo $ass." ".$fotofobia2; ?> onchange="savCampo('3')"/><label>N&atilde;o</label>
		<input name="fotofobia" type="radio" value="NA" <?php echo $ass." ".$fotofobia3; ?> onchange="savCampo('3')"/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Lacrimejamento</legend>
	<span>
		<input name="lacrim" type="radio" value="S" <?php echo $ass." ".$lacrim1; ?> onchange="savCampo('3')"/><label>Sim</label>
		<input name="lacrim" type="radio" value="N" <?php echo $ass." ".$lacrim2; ?> onchange="savCampo('3')"/><label>N&atilde;o</label>
		<input name="lacrim" type="radio" value="NA" <?php echo $ass." ".$lacrim3; ?> onchange="savCampo('3')"/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Secre&ccedil;&atilde;o</legend>
	<span>
		<input name="secrecaool" type="radio" value="S" <?php echo $ass." ".$secrecao1; ?> onchange="savCampo('3')"/><label>Sim</label>
		<input name="secrecaool" type="radio" value="N" <?php echo $ass." ".$secrecao2; ?> onchange="savCampo('3')"/><label>N&atilde;o</label>
		<input name="secrecaool" type="radio" value="NA" <?php echo $ass." ".$secrecao3; ?> onchange="savCampo('3')"/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Edema Palpebral</legend>
	<span>
		<input name="edemapalp" type="radio" value="S" <?php echo $ass." ".$edema1; ?> onchange="savCampo('3')"/><label>Sim</label>
		<input name="edemapalp" type="radio" value="N" <?php echo $ass." ".$edema2; ?> onchange="savCampo('3')"/><label>N&atilde;o</label>
		<input name="edemapalp" type="radio" value="NA" <?php echo $ass." ".$edema3; ?> onchange="savCampo('3')"/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Dor</legend>
	<select name="dorolho" <?php echo $ass;?> onchange="savCampo('3')">
		<option value="OE" <?php echo $dorolho1; ?>>Olho Esquerdo</option>
		<option value="OD" <?php echo $dorolho2; ?>>Olho Direito</option>
		<option value="AO" <?php echo $dorolho3; ?>>Ambos os Olhos</option>
		<option value="N" <?php echo $dorolho4; ?>>Sem Dor</option>
		<option value="NA" <?php echo $dorolho5; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Acuidade Visual</legend>
	<select name="acuidvis" <?php echo $ass;?> onchange="savCampo('3')">
		<option value="TN" <?php echo $acuidvis1; ?>>Teste do Olhinho Normal</option>
		<option value="TA" <?php echo $acuidvis2; ?>>Teste do Olhinho Anormal</option>
		<option value="S" <?php echo $acuidvis3; ?>>Sim</option>
		<option value="N" <?php echo $acuidvis4; ?>>N&atilde;o</option>
		<option value="C" <?php echo $acuidvis5; ?>>Cegueira</option>
		<option value="NA" <?php echo $acuidvis6; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsolho" class="txta1" onkeyup="savCampo('3')" <?php echo $ass; ?>><?php echo $obsolho; ?></textarea>
</fieldset>