<fieldset style="width:46%">
	<legend>Forma do Abd&ocirc;men</legend>
	<select name="formabd" <?php echo $ass; ?> onChange="savCampo('C')">
		<option value="N" <?php echo $formabd1; ?>>Normal</option>
		<option value="A" <?php echo $formabd2; ?>>Abaulado</option>
		<option value="R" <?php echo $formabd3; ?>>Retra&iacute;do</option>
		<option value="NA" <?php echo $formabd4;?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Cicatriz Umbilical</legend>
	<select name="cicatumb" <?php echo $ass; ?> onChange="savCampo('C')">
		<option value="N" <?php echo $cicatumb1; ?>>Normal</option>
		<option value="P" <?php echo $cicatumb2;?>>Protrusa</option>
		<option value="NA" <?php echo $cicatumb3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Peristaltismo</legend>
	<select name="peristal" <?php echo $ass; ?> onChange="savCampo('C')">
		<option value="N" <?php echo $peristal1; ?>>Normal</option>
		<option value="A" <?php echo $peristal2; ?>>Alterado</option>
		<option value="NA" <?php echo $peristal3;?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Distens&atilde;o</legend>
	<span>
		<input name="distensao" type="radio" value="P" onChange="savCampo('C')" <?php echo $ass." ".$distensao1; ?>/><label>Presente</label>
		<input name="distensao" type="radio" value="A" onChange="savCampo('C')" <?php echo $ass." ".$distensao2; ?>/><label>Ausente</label>
		<input name="distensao" type="radio" value="NA" onChange="savCampo('C')" <?php echo $ass." ".$distensao3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Tumora&ccedil;&otilde;es</legend>
	<span>
		<input name="tumorgt" type="radio" value="P" onChange="savCampo('C')" <?php echo $ass." ".$tumorgt1; ?> /><label>Presente</label>
		<input name="tumorgt" type="radio" value="A" onChange="savCampo('C')" <?php echo $ass." ".$tumorgt2; ?> /><label>Ausente</label>
		<input name="tumorgt" type="radio" value="NA" onChange="savCampo('C')" <?php echo $ass." ".$tumorgt3; ?> /><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Ondas Fluidas</legend>
	<span>
		<input name="ondfluidas" type="radio" value="P" onChange="savCampo('C')" <?php echo $ass." ".$ondfluidas1; ?>/><label>Presentes</label>
		<input name="ondfluidas" type="radio" value="A" onChange="savCampo('C')" <?php echo $ass." ".$ondfluidas2; ?>/><label>Ausentes</label>
		<input name="ondfluidas" type="radio" value="NA" onChange="savCampo('C')" <?php echo $ass." ".$ondfluidas3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Timpanismo</legend>
	<select name="timpangt" <?php echo $ass; ?> onChange="savCampo('C')">
		<option value="N" <?php echo $timpangt1; ?>>Normal</option>
		<option value="A" <?php echo $timpangt2; ?>>Alterado</option>
		<option value="NA" <?php echo $timpangt3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Estado das Paredes Musculares</legend>
	<select name="paredesmusc" <?php echo $ass; ?> onChange="savCampo('C')">
		<option value="N" <?php echo $paredmusc1; ?>>Normal</option>
		<option value="A" <?php echo $paredmusc2; ?>>Alteradas</option>
		<option value="NA" <?php echo $paredmusc3; ?>>N&atilde;o Avaliado</option>
	</select>			
</fieldset>
<fieldset style="width:46%">
	<legend>Espasmos</legend>
	<span>
		<input name="espasmos" type="radio" value="P" onChange="savCampo('C')" <?php echo $ass." ".$espasmos1; ?>/><label>Presentes</label>
		<input name="espasmos" type="radio" value="A" onChange="savCampo('C')" <?php echo $ass." ".$espasmos2; ?>/><label>Ausentes</label>
		<input name="espasmos" type="radio" value="NA" onChange="savCampo('C')" <?php echo $ass." ".$espasmos3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Rigidez</legend>
	<span>
		<input name="rigidezgt" type="radio" value="P" onChange="savCampo('C')" <?php echo $ass." ".$rigidezgt1; ?>/><label>Presentes</label>
		<input name="rigidezgt" type="radio" value="A" onChange="savCampo('C')" <?php echo $ass." ".$rigidezgt2; ?>/><label>Ausentes</label>
		<input name="rigidezgt" type="radio" value="NA" onChange="savCampo('C')" <?php echo $ass." ".$rigidezgt3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Est&ocirc;mago</legend>
	<select name="estomago" <?php echo $ass; ?> onChange="savCampo('C')">
		<option value="N" <?php echo $estom1; ?>>Normal</option>
		<option value="A" <?php echo $estom2; ?>>Alterado</option>
		<option value="NA" <?php echo $estom3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>F&iacute;gado</legend>
	<select name="figado" <?php echo $ass; ?> onChange="savCampo('C')">
		<option value="N" <?php echo $figado1; ?>>Normal</option>
		<option value="A" <?php echo $figado2; ?>>Aumentado</option>
		<option value="NA" <?php echo $figado3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Ba&ccedil;o</legend>
	<select name="baco" <?php echo $ass; ?> onChange="savCampo('C')">
		<option value="N" <?php echo $baco1; ?>>Normal</option>
		<option value="A" <?php echo $baco2; ?>>Aumentado</option>
		<option value="NA" <?php echo $baco3;?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Rins</legend>
	<select name="rins" <?php echo $ass; ?> onChange="savCampo('C')">
		<option value="N" <?php echo $rins1; ?>>Normal</option>
		<option value="G" <?php echo $rins2; ?>>Giordano positivo</option>
		<option value="NA" <?php echo $rins3;?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>H&eacute;rnias</legend>
	<select name="hernias" <?php echo $ass; ?> onChange="savCampo('C')">
		<option value="A" <?php echo $hernias1; ?>>Ausentes</option>
		<option value="PR" <?php echo $hernias2; ?>>Presentes e redut&iacute;veis</option>
		<option value="PI" <?php echo $hernias3; ?>>Presentes e irredut&iacute;veis</option>
		<option value="NA" <?php echo $hernias4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Massas Tumorais</legend>
	<span>
		<input name="massastumgt" type="radio" value="P" onChange="savCampo('C')" <?php echo $ass." ".$masstum1; ?>/><label>Presentes</label>
		<input name="massastumgt" type="radio" value="A" onChange="savCampo('C')" <?php echo $ass." ".$masstum2; ?>/><label>Ausentes</label>
		<input name="massastumgt" type="radio" value="NA" onChange="savCampo('C')" <?php echo $ass." ".$masstum3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Ru&iacute;dos hidro-a&eacute;reos</legend>
	<span>
		<input name="ruidosha" type="radio" value="P" onChange="savCampo('C')" <?php echo $ass." ".$ruidosha1; ?>/><label>Presentes</label>
		<input name="ruidosha" type="radio" value="A" onChange="savCampo('C')" <?php echo $ass." ".$ruidosha2; ?>/><label>Ausentes</label>
		<input name="ruidosha" type="radio" value="NA" onChange="savCampo('C')" <?php echo $ass." ".$ruidosha3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Dor</legend>
	<span>
		<input name="dorgt" type="radio" value="P" onChange="savCampo('C')" <?php echo $ass." ".$dorgt1; ?>/><label>Presente</label>
		<input name="dorgt" type="radio" value="A" onChange="savCampo('C')" <?php echo $ass." ".$dorgt2; ?>/><label>Ausente</label>
		<input name="dorgt" type="radio" value="NA" onChange="savCampo('C')" <?php echo $ass." ".$dorgt3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsgi" class="txta1" onKeyUp="savCampo('C')" <?php echo $ass; ?>><?php echo $obsgi; ?></textarea>
</fieldset>