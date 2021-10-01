<fieldset style="width:46%">
	<legend>Cor</legend>
	<select name="corpele" <?php echo $ass; ?> onChange="savCampo('2')">
		<option value="Co" <?php echo $corpele1; ?>>Corado</option>
		<option value="P" <?php echo $corpele2; ?>>P&aacute;lida</option>
		<option value="Ci" <?php echo $corpele3; ?>>Cian&oacute;tica</option>
		<option value="I" <?php echo $corpele4; ?>>Ict&eacute;rica</option>
		<option value="NA" <?php echo $corpele5; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Umidade</legend>
	<select name="umidpele" <?php echo $ass; ?> onChange="savCampo('2')">
		<option value="H" <?php echo $umidpele1; ?>>Hidratada</option>
		<option value="U" <?php echo $umidpele2; ?>>&Uacute;mida</option>
		<option value="S" <?php echo $umidpele3; ?>>Seca</option>
		<option value="NA" <?php echo $umidpele4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Temperatura</legend>
	<select name="temppele" <?php echo $ass; ?> onChange="savCampo('2')">
		<option value="N" <?php echo $temppele1; ?>>Normal</option>
		<option value="Q" <?php echo $temppele2; ?>>Quente</option>
		<option value="F" <?php echo $temppele3; ?>>Fria</option>
		<option value="NA" <?php echo $temppele4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Cicatrizes</legend>
	<span>
		<input name="cicatriz" type="radio" value="P" onChange="savCampo('2')" <?php echo $ass." ".$cicatriz1;?>/><label>Presentes</label>
		<input name="cicatriz" type="radio" value="A" onChange="savCampo('2')" <?php echo $ass." ".$cicatriz2;?>/><label>Ausentes</label>
		<input name="cicatriz" type="radio" value="NA" onChange="savCampo('2')" <?php echo $ass." ".$cicatriz3;?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Hemorragias</legend>
	<span>
		<input name="hemor" type="radio" value="P" onChange="savCampo('2')" <?php echo $ass." ".$hemor1;?>/><label>Presentes</label>
		<input name="hemor" type="radio" value="A" onChange="savCampo('2')" <?php echo $ass." ".$hemor2;?>/><label>Ausentes</label>
		<input name="hemor" type="radio" value="NA" onChange="savCampo('2')" <?php echo $ass." ".$hemor3;?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Rash</legend>
	<span>
		<input name="rash" type="radio" value="P" onChange="savCampo('2')" <?php echo $ass." ".$rash1;?>/><label>Presente</label>
		<input name="rash" type="radio" value="A" onChange="savCampo('2')" <?php echo $ass." ".$rash2;?>/><label>Ausente</label>
		<input name="rash" type="radio" value="NA" onChange="savCampo('2')" <?php echo $ass." ".$rash3;?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Circula&ccedil;&atilde;o Colateral</legend>
	<span>
		<input name="circcol" type="radio" value="P" onChange="savCampo('2')" <?php echo $ass." ".$circcol1;?>/><label>Presente</label>
		<input name="circcol" type="radio" value="A" onChange="savCampo('2')" <?php echo $ass." ".$circcol2;?>/><label>Ausente</label>
		<input name="circcol" type="radio" value="NA" onChange="savCampo('2')" <?php echo $ass." ".$circcol3;?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Edema</legend>
	<select name="edemapele" <?php echo $ass; ?> onChange="savCampo('2')">
		<option value="A" <?php echo $edemapele1; ?>>Ausente</option>
		<option value="M" <?php echo $edemapele2; ?>>MMII</option>
		<option value="P" <?php echo $edemapele3; ?>>Periorbital</option>
		<option value="An" <?php echo $edemapele4; ?>>Anasarca</option>
		<option value="NA" <?php echo $edemapele5; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset class="full">
	<legend>Unhas</legend>
	<div style="clear:both">
	<fieldset style="width:46%">
		<legend>Consist&ecirc;ncia</legend>
		<select name="consistun" <?php echo $ass; ?> onChange="savCampo('2')">
			<option value="N" <?php echo $consistun1; ?>>Normal</option>
			<option value="Q" <?php echo $consistun2; ?>>Quebradi&ccedil;a</option>
			<option value="E" <?php echo $consistun3; ?>>Endurecida</option>
			<option value="NA" <?php echo $consistun4; ?>>N&atilde;o Avaliado							</option>
		</select>
	</fieldset>
	<fieldset style="width:46%">
		<legend>Deformidades</legend>
		<span>
			<input name="deformun" type="radio" value="P" onChange="savCampo('2')" <?php echo $ass." ".$deformun1;?>/><label>Presente</label>
			<input name="deformun" type="radio" value="A" onChange="savCampo('2')" <?php echo $ass." ".$deformun2;?>/><label>Ausente</label>
			<input name="deformun" type="radio" value="NA" onChange="savCampo('2')" <?php echo $ass." ".$deformun3;?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
	</div>
	<div style="clear:both">
	<fieldset style="width:46%">
		<legend>Manchas</legend>
		<span>
			<input name="manchasun" type="radio" value="P" onChange="savCampo('2')" <?php echo $ass." ".$manchasun1;?>/><label>Presente</label>
			<input name="manchasun" type="radio" value="A" onChange="savCampo('2')" <?php echo $ass." ".$manchasun2;?>/><label>Ausente</label>
			<input name="manchasun" type="radio" value="NA" onChange="savCampo('2')" <?php echo $ass." ".$manchasun3;?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
	<fieldset style="width:46%">
		<legend>Inflama&ccedil;&otilde;es </legend>
		<span>
			<input name="inflamun" type="radio" value="P" onChange="savCampo('2')" <?php echo $ass." ".$inflamun1;?>/><label>Presente</label>
			<input name="inflamun" type="radio" value="A" onChange="savCampo('2')" <?php echo $ass." ".$inflamun2;?>/><label>Ausente</label>
			<input name="inflamun" type="radio" value="NA" onChange="savCampo('2')" <?php echo $ass." ".$inflamun3;?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
	</div>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsepele" class="txta1" onKeyUp="savCampo('2')" <?php echo $ass;?>><?php echo $obspele; ?></textarea>
</fieldset>