<fieldset style="width:46%">
	<legend>Retra&ccedil;&otilde;es </legend>
	<span>
		<input name="retracoesp" type="radio" value="P" onchange="savCampo('9')" <?php echo $ass." ".$retracoesp1; ?>/><label>Presentes</label>
		<input name="retracoesp" type="radio" value="A" onchange="savCampo('9')" <?php echo $ass." ".$retracoesp2; ?>/><label>Ausentes</label>
		<input name="retracoesp" type="radio" value="NA" onchange="savCampo('9')" <?php echo $ass." ".$retracoesp3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Torcicolo</legend>
	<span>
		<input name="torcicolo" type="radio" value="P" onchange="savCampo('9')" <?php echo $ass." ".$torcicolo1; ?>/><label>Presente</label>
		<input name="torcicolo" type="radio" value="A" onchange="savCampo('9')" <?php echo $ass." ".$torcicolo2; ?>/><label>Ausente</label>
		<input name="torcicolo" type="radio" value="NA" onchange="savCampo('9')" <?php echo $ass." ".$torcicolo3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Clav&iacute;culas</legend>
	<select name="claviculas" <?php echo $ass; ?> onchange="savCampo('9')">
		<option value="N" <?php echo $claviculas1; ?>>Normal</option>
		<option value="Al" <?php echo $claviculas2; ?>>Alteradas</option>
		<option value="Au" <?php echo $claviculas3; ?>>Ausentes</option>
		<option value="NA" <?php echo $claviculas4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Tire&oacute;ide (aumento, massas, consist&ecirc;ncia)</legend>
	<select name="tireoide" <?php echo $ass; ?> onchange="savCampo('9')">
		<option value="N" <?php echo $tireoide1; ?>>Normal</option>
		<option value="Au" <?php echo $tireoide2; ?>>Consist&ecirc;ia Aumentada</option>
		<option value="Al" <?php echo $tireoide3; ?>>Ausente</option>
		<option value="NA" <?php echo $tireoide4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Outras massas tumorais</legend>
	<span>
		<input name="massastum" type="radio" value="P" onchange="savCampo('9')" <?php echo $ass." ".$massastum1; ?>/><label>Presentes</label>
		<input name="massastum" type="radio" value="A" onchange="savCampo('9')" <?php echo $ass." ".$massastum2; ?>/><label>Ausentes</label>
		<input name="massastum" type="radio" value="NA" onchange="savCampo('9')" <?php echo $ass." ".$massastum3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>F&iacute;stulas</legend>
	<span>
		<input name="fistulas" type="radio" value="P" onchange="savCampo('9')" <?php echo $ass." ".$fistulas1; ?>/><label>Presentes</label>
		<input name="fistulas" type="radio" value="A" onchange="savCampo('9')" <?php echo $ass." ".$fistulas2; ?>/><label>Ausentes</label>
		<input name="fistulas" type="radio" value="NA" onchange="savCampo('9')" <?php echo $ass." ".$fistulas3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Rigidez</legend>
	<span>
		<input name="rigidez" type="radio" value="P" onchange="savCampo('9')" <?php echo $ass." ".$rigidez1; ?>/><label>Presente</label>
		<input name="rigidez" type="radio" value="A" onchange="savCampo('9')" <?php echo $ass." ".$rigidez2; ?>/><label>Ausente</label>
		<input name="rigidez" type="radio" value="NA" onchange="savCampo('9')" <?php echo $ass." ".$rigidez3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Fossa supra-clavicular</legend>
	<select name="fosspesc" <?php echo $ass; ?> onchange="savCampo('9')">
		<option value="N" <?php echo $fossapesc1; ?>>Normal</option>
		<option value="A+" <?php echo $fossapesc2; ?>>Aumentada</option>
		<option value="A" <?php echo $fossapesc3; ?>>Ausente</option>
		<option value="NA" <?php echo $fossapesc4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obspesc" class="txta1" onkeyup="savCampo('9')" <?php echo $ass; ?>><?php echo $obspesc; ?></textarea>
</fieldset>