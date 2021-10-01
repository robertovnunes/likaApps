<?php if ($fem) { ?>
<fieldset style="width:46%">
	<legend>Pequenos L&aacute;bios</legend>
	<select name="peqlabios" <?php echo $ass; ?> onChange="savCampo('D')">
		<option value="N" <?php echo $peqlabios1; ?>>Normais</option>
		<option value="C" <?php echo $peqlabios2; ?>>Coalescentes</option>
		<option value="NA" <?php echo $peqlabios3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>H&iacute;men</legend>
	<select name="himen" <?php echo $ass; ?> onChange="savCampo('D')">
		<option value="N" <?php echo $himen1; ?>>Normais</option>
		<option value="C" <?php echo $himen2; ?>>Coalescentes</option>
		<option value="NA" <?php echo $himen3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Secre&ccedil;&atilde;o Vaginal</legend>
	<span>
		<input name="secrvag" type="radio" value="P" onChange="savCampo('D')" <?php echo $ass." ".$secrvag1; ?>/><label>Presentes</label>
		<input name="secrvag" type="radio" value="A" onChange="savCampo('D')" <?php echo $ass." ".$secrvag2; ?>/><label>Ausentes</label>
		<input name="secrvag" type="radio" value="NA" onChange="savCampo('D')" <?php echo $ass." ".$secrvag3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<?php } else { ?>
<fieldset style="width:46%">
	<legend>Fimose</legend>
	<select name="fimose" <?php echo $ass; ?> onChange="savCampo('D')">
		<option value="F" <?php echo $fimose1; ?>>Fisiol&oacute;gica</option>
		<option value="P" <?php echo $fimose2; ?>>Presente</option>
		<option value="A" <?php echo $fimose3; ?>>Ausente</option>
		<option value="NA" <?php echo $fimose4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Circuncis&atilde;o</legend>
	<span>
		<input name="circuncisao" type="radio" value="P" onChange="savCampo('D')" <?php echo $ass." ".$circunc1; ?>/><label>Presente</label>
		<input name="circuncisao" type="radio" value="A" onChange="savCampo('D')" <?php echo $ass." ".$circunc2; ?>/><label>Ausente</label>
		<input name="circuncisao" type="radio" value="NA" onChange="savCampo('D')" <?php echo $ass." ".$circunc3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Hidrocele</legend>
	<span>
		<input name="hidrocele" type="radio" value="P" onChange="savCampo('D')" <?php echo $ass." ".$hidrocele1; ?>/><label>Presente</label>
		<input name="hidrocele" type="radio" value="A" onChange="savCampo('D')" <?php echo $ass." ".$hidrocele2; ?>/><label>Ausente</label>
		<input name="hidrocele" type="radio" value="NA" onChange="savCampo('D')" <?php echo $ass." ".$hidrocele3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Varicocele</legend>
	<span>
		<input name="varicocele" type="radio" value="P" onChange="savCampo('D')" <?php echo $ass." ".$varicocele1; ?>/><label>Presente</label>
		<input name="varicocele" type="radio" value="A" onChange="savCampo('D')" <?php echo $ass." ".$varicocele2; ?>/><label>Ausente</label>
		<input name="varicocele" type="radio" value="NA" onChange="savCampo('D')" <?php echo $ass." ".$varicocele3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Test&iacute;culos</legend>
	<select name="testiculos" <?php echo $ass; ?> onChange="savCampo('D')">
		<option value="N" <?php echo $testiculos1; ?>>Normais</option>
		<option value="A+" <?php echo $testiculos2; ?>>Aumentados</option>
		<option value="C" <?php echo $testiculos3; ?>>Criptorquidia</option>
		<option value="AT" <?php echo $testiculos4; ?>>Aus&ecirc;ncia de 1 test&iacute;culo</option>
		<option value="Au" <?php echo $testiculos5; ?>>Ausentes</option>
		<option value="NA" <?php echo $testiculos6; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<?php } ?>
<fieldset style="width:46%">
	<legend>Secre&ccedil;&atilde;o Uretral</legend>
	<span>
		<input name="secruret" type="radio" value="P" onChange="savCampo('D')" <?php echo $ass." ".$secruret1; ?>/><label>Presente</label>
		<input name="secruret" type="radio" value="A" onChange="savCampo('D')" <?php echo $ass." ".$secruret2; ?>/><label>Ausente</label>
		<input name="secruret" type="radio" value="NA" onChange="savCampo('D')" <?php echo $ass." ".$secruret3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>P&ecirc;los</legend>
	<select name="pelos" <?php echo $ass; ?> onChange="savCampo('D')">
		<option value="N" <?php echo $pelos1; ?>>Normais para a idade</option>
		<option value="A" <?php echo $pelos2; ?>>Alterados para a idade</option>
		<option value="NA" <?php echo $pelos3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Lojas Renais</legend>
	<select name="lojrenais" <?php echo $ass; ?> onChange="savCampo('D')">
		<option value="N" <?php echo $lojrenais1; ?>>Normal</option>
		<option value="A" <?php echo $lojrenais2; ?>>Alteradas</option>
		<option value="NA" <?php echo $lojrenais3;?>>N&atilde;o Avaliado</option>
	</select>			
</fieldset>
<fieldset style="width:46%">
	<legend>Bexiga</legend>
	<select name="bexiga" <?php echo $ass; ?> onChange="savCampo('D')">
		<option value="N" <?php echo $bexiga1; ?>>Normal</option>
		<option value="A" <?php echo $bexiga2; ?>>Alterada</option>
		<option value="NA" <?php echo $bexiga3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Aspecto</legend>
	<select name="aspectogu" <?php echo $ass; ?> onChange="savCampo('D')">
		<option value="N" <?php echo $aspectogu1; ?>>Normal</option>
		<option value="As" <?php echo $aspectogu2; ?>>Assaduras</option>
		<option value="A" <?php echo $aspectogu3; ?>>Alterado (escoria&ccedil;&otilde;es, fissuras)</option>
		<option value="NA" <?php echo $aspectogu4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>&Acirc;nus</legend>
	<select name="anus" <?php echo $ass; ?> onChange="savCampo('D')">
		<option value="N" <?php echo $anus1; ?>>Normal</option>
		<option value="F" <?php echo $anus2; ?>>Fissuras</option>
		<option value="P" <?php echo $anus3; ?>>Prolapso</option>
		<option value="E" <?php echo $anus4; ?>>Escoria&ccedil;&otilde;es e/ou fissuras</option>
		<option value="NA" <?php echo $anus5; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsgen" class="txta1" onKeyUp="savCampo('D')" <?php echo $ass; ?>><?php echo $obsgen; ?></textarea>
</fieldset>