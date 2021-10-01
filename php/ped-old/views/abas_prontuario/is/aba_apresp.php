<fieldset style="width:35%">
	<legend>Sufoca&ccedil;&atilde;o</legend>
	<span>
		<input name="sufocacao" type="radio" value="S" onchange="savCampo('5')" <?php echo $ass." ".$sufoca1; ?>/><label>Sim</label>
		<input name="sufocacao" type="radio" value="N" onchange="savCampo('5')" <?php echo $ass." ".$sufoca2; ?>/><label>N&atilde;o</label>
		<input name="sufocacao" type="radio" value="NA" onchange="savCampo('5')" <?php echo $ass." ".$sufoca3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:35%">
	<legend>Epistaxe</legend>
	<span>
		<input name="epistaxe" type="radio" value="S" onchange="savCampo('5')" <?php echo $ass." ".$epistaxe1; ?>/><label>Sim</label>
		<input name="epistaxe" type="radio" value="N" onchange="savCampo('5')" <?php echo $ass." ".$epistaxe2; ?>/><label>N&atilde;o</label>
		<input name="epistaxe" type="radio" value="NA" onchange="savCampo('5')" <?php echo $ass." ".$epistaxe3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:10%">
	<legend>Corrimento Nasal</legend>
	<select name="corrnasal" onchange="savCampo('5')" <?php echo $ass;?>>
		<option value="CL" <?php echo $corrnasal1; ?>>Normal</option>
		<option value="ES" <?php echo $corrnasal2; ?>>Abundante</option>
		<option value="A" <?php echo $corrnasal3; ?>>Escassa</option>
		<option value="NA" <?php echo $corrnasal4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset class="full">
	<legend>Tosse</legend>
	<div><span>
		<input name="tosse" type="radio" value="P" onchange="savCampo('5')" <?php echo $ass." ".$tosse1; ?> onclick="habilitaTosse(1)"/><label>Presente</label>
		<input name="tosse" type="radio" value="A" onchange="savCampo('5')" <?php echo $ass." ".$tosse2; ?> onclick="habilitaTosse(0)"/><label>Ausente</label>
		<input name="tosse" type="radio" value="NA" onchange="savCampo('5')" <?php echo $ass." ".$tosse3; ?> onclick="habilitaTosse(0)"/><label>N&atilde;o Avaliado</label>
	</span></div>
	<div style="clear:both"></div>
	<div style="float:left;margin-top:5px">
		<label class="labdir">Dura&ccedil;&atilde;o:</label>
		<select name="dtosse" onchange="savCampo('5')" <?php echo $ass." ".$dtosse; ?>>
			<option value="-30" <?php echo $dtosse1; ?>>Menos de 30 dias</option>
			<option value="+30" <?php echo $dtosse2; ?>>Mais de 30 dias</option>
			<option value="NA" <?php echo $dtosse3; ?>>N&atilde;o Avaliado</option>
		</select>
	</div>
	<div style="float:left;margin-top:5px">
		<label class="labdir">Tipo:</label>
		<select name="ttosse" onchange="savCampo('5')" <?php echo $ass." ".$dtosse; ?>>
			<option value="P" <?php echo $ttosse1; ?>>Produtiva</option>
			<option value="S" <?php echo $ttosse2; ?>>Seca</option>
			<option value="NA" <?php echo $ttosse3; ?>>N&atilde;o Avaliado</option>
		</select>
	</div>
	<div style="float:left;margin-top:5px">
		<label class="labdir">Per&iacute;odo:</label>
		<select name="ptosse" onchange="savCampo('5')" <?php echo $ass." ".$dtosse; ?>>
			<option value="N" <?php echo $ptosse1; ?>>Noturna</option>
			<option value="M" <?php echo $ptosse2; ?>>Matutina</option>
			<option value="NA" <?php echo $ptosse3; ?>>N&atilde;o Avaliado</option>
		</select>
	</div>
	<div style="clear:both"></div>
</fieldset>
<fieldset style="width:46%">
	<legend>Resfriados Freq&uuml;entes</legend>
	<span>
		<input name="resffreq" type="radio" value="S" onchange="savCampo('5')" <?php echo $ass." ".$resffreq1; ?>/><label>Sim</label>
		<input name="resffreq" type="radio" value="N" onchange="savCampo('5')" <?php echo $ass." ".$resffreq2; ?>/><label>N&atilde;o</label>
		<input name="resffreq" type="radio" value="NA" onchange="savCampo('5')" <?php echo $ass." ".$resffreq3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Dor Tor&aacute;cica</legend>
	<span>
		<input name="dortor" type="radio" value="P" onchange="savCampo('5')" <?php echo $ass." ".$dortor1; ?>/><label>Presente</label>
		<input name="dortor" type="radio" value="A" onchange="savCampo('5')" <?php echo $ass." ".$dortor2; ?>/><label>Ausente</label>
		<input name="dortor" type="radio" value="NA" onchange="savCampo('5')" <?php echo $ass." ".$dortor3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Dificuldade Respirat&oacute;ria</legend>
	<span>
		<input name="difresp" type="radio" value="S" onchange="savCampo('5')" <?php echo $ass." ".$difresp1; ?>/><label>Sim</label>
		<input name="difresp" type="radio" value="N" onchange="savCampo('5')" <?php echo $ass." ".$difresp2; ?>/><label>N&atilde;o</label>
		<input name="difresp" type="radio" value="NA" onchange="savCampo('5')" <?php echo $ass." ".$difresp3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Hemoptise</legend>
	<span>
		<input name="hemoptise" type="radio" value="P" onchange="savCampo('5')" <?php echo $ass." ".$hemopt1; ?>/><label>Presente</label>
		<input name="hemoptise" type="radio" value="A" onchange="savCampo('5')" <?php echo $ass." ".$hemopt2; ?>/><label>Ausente</label>
		<input name="hemoptise" type="radio" value="NA" onchange="savCampo('5')" <?php echo $ass." ".$hemopt3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsresp" class="txta1" onkeyup="savCampo('5')" <?php echo $ass; ?>><?php echo $obsresp; ?></textarea>
</fieldset>