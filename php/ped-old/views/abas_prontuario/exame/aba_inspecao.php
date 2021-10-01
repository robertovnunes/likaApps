<fieldset style="width:46%">
	<legend>Estado Geral</legend>
	<select name="estgeral" <?php echo $ass; ?> onchange="savCampo('1')">
		<option value="B" <?php echo $estgeral1; ?>>Bom (EGB)</option>
		<option value="Rg" <?php echo $estgeral2; ?>>Regular</option>
		<option value="R" <?php echo $estgeral3; ?>>Ruim</option>
		<option value="G" <?php echo $estgeral4; ?>>Grave</option>
		<option value="NA" <?php echo $estgeral5; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:20%">
	<legend>Tipo de Doença</legend>
	<select name="tdoenca" <?php echo $ass; ?> onchange="savCampo('1')">
		<option value="A" <?php echo $tdoenca1; ?>>Aguda</option>
		<option value="C" <?php echo $tdoenca2; ?>>Crônica</option>
		<option value="NA" <?php echo $tdoenca3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:22%">
	<legend>Aspecto da Doença</legend>
	<select name="aspdoenca" <?php echo $ass; ?> onchange="savCampo('1')">
		<option value="C" <?php echo $aspdoenca1; ?>>Com gravidade</option>
		<option value="S" <?php echo $aspdoenca2; ?>>Sem gravidade</option>
		<option value="NA" <?php echo $aspdoenca3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Desenvolvimento F&iacute;sico</legend>
	<select name="desenvfis" <?php echo $ass; ?> onchange="savCampo('1')">
		<option value="C" <?php echo $desenvfis1; ?>>Compat&iacute;vel com a idade cronológica</option>
		<option value="I" <?php echo $desenvfis2; ?>>Incompat&iacute;vel com a idade cronológica</option>
		<option value="NA" <?php echo $desenvfis3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:20%">
	<legend>Nutri&ccedil;&atilde;o</legend>
	<select name="nutricao" <?php echo $ass; ?> onchange="savCampo('1')">
		<option value="N" <?php echo $nutricao1; ?>>Nutrido</option>
		<option value="D" <?php echo $nutricao2; ?>>Desnutrido</option>
		<option value="NA" <?php echo $nutricao3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:22%">
	<legend>Coopera&ccedil;&atilde;o</legend>
	<select name="coop" <?php echo $ass; ?> onchange="savCampo('1')">
		<option value="B" <?php echo $coop1; ?>>Boa</option>
		<option value="P" <?php echo $coop2; ?>>Pouca</option>
		<option value="N" <?php echo $coop3; ?>>Nenhuma</option>
		<option value="NA" <?php echo $coop4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Deformidades F&iacute;sicas</legend>
	<span>
		<input name="deformfis" type="radio" value="P" onchange="savCampo('1')" <?php echo $ass." ".$deformfis1;?> /><label>Presentes</label>
		<input name="deformfis" type="radio" value="A" onchange="savCampo('1')" <?php echo $ass." ".$deformfis2;?>/><label>Ausentes</label>
		<input name="deformfis" type="radio" value="NA" onchange="savCampo('1')" <?php echo $ass." ".$deformfis3;?>/><label>N&atilde;o Avaliado</label>
	</span>
	</fieldset>
<fieldset style="width:46%">
	<legend>Anormalidade de Postura</legend>
	<span>
		<input name="anormpost" type="radio" value="P" onchange="savCampo('1')" <?php echo $ass." ".$anormpost1;?> /><label>Presente</label>
		<input name="anormpost" type="radio" value="A" onchange="savCampo('1')" <?php echo $ass." ".$anormpost2;?>/><label>Ausente</label>
		<input name="anormpost" type="radio" value="NA" onchange="savCampo('1')" <?php echo $ass." ".$anormpost3;?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsins" class="txta1" onkeyup="savCampo('1')" <?php echo $ass; ?>><?php echo $obsins; ?></textarea>
</fieldset>