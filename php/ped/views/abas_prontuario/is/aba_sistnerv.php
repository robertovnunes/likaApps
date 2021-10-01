<fieldset style="width:46%">
	<legend>Cefal&eacute;ia</legend>
	<span>
		<input name="cefaleia" type="radio" value="S" onchange="savCampo('0')" <?php echo $ass." ".$cefaleia1; ?>/><label>Sim</label>
		<input name="cefaleia" type="radio" value="N" onchange="savCampo('0')" <?php echo $ass." ".$cefaleia2; ?>/><label>N&atilde;o</label>
		<input name="cefaleia" type="radio" value="NA" onchange="savCampo('0')" <?php echo $ass." ".$cefaleia3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Tonturas</legend>
	<span>
		<input name="tonturas" type="radio" value="S" onchange="savCampo('0')" <?php echo $ass." ".$tonturas1; ?>/><label>Sim</label>
		<input name="tonturas" type="radio" value="N" onchange="savCampo('0')" <?php echo $ass." ".$tonturas2; ?>/><label>N&atilde;o</label>
		<input name="tonturas" type="radio" value="NA" onchange="savCampo('0')" <?php echo $ass." ".$tonturas3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset class="full">
	<legend>Convuls&otilde;es</legend>
	<div style="clear:both;margin-bottom:5px">
		<select name="convulsoes" <?php echo $ass; ?> onchange="savCampo('0')">
			<option onClick="habilitaConvulsoes(1)" <?php echo $convulsoes1; ?> value="F">Febril</option>
			<option onClick="habilitaConvulsoes(1)" <?php echo $convulsoes2; ?> value="AF">Afebril</option>
			<option onClick="habilitaConvulsoes(0)" <?php echo $convulsoes3; ?> value="A">Ausente</option>
			<option onClick="habilitaConvulsoes(0)" <?php echo $convulsoes4; ?> value="NA">N&atilde;o Avaliado</option>
		</select>
	</div>
	<div style="float:left;margin-bottom:5px">
		<label class="labdir2">Tipo 1:</label>
		<select name="conv1" onchange="savCampo('0')" <?php echo $ass." ".$dconvulsoes; ?>>
			<option value="T" <?php echo $conv11; ?>>Febril</option>
			<option value="TC" <?php echo $conv12; ?>>Afebril</option>
			<option value="NA" <?php echo $conv13; ?>>N&atilde;o Avaliado</option>
		</select>
	</div>
	<div style="float:left;margin-bottom:5px">
		<label class="labdir2">Tipo 2:</label>
		<select name="conv2" onchange="savCampo('0')" <?php echo $ass." ".$dconvulsoes; ?>>
			<option value="L" <?php echo $conv21; ?>>Localizada</option>
			<option value="G" <?php echo $conv22; ?>>Generalizada</option>
			<option value="NA" <?php echo $conv23; ?>>N&atilde;o Avaliado</option>
		</select>
	</div>
	<div style="clear:both"></div>
</fieldset>
<fieldset style="width:46%">
	<legend>Traumas Cranianos</legend>
	<span>
		<input name="traumacran" type="radio" value="S" <?php echo $ass." ".$traumacran1; ?> onchange="savCampo('0')"/><label>Sim</label>
		<input name="traumacran" type="radio" value="N" <?php echo $ass." ".$traumacran2; ?> onchange="savCampo('0')"/><label>N&atilde;o</label>
		<input name="traumacran" type="radio" value="NA" <?php echo $ass." ".$traumacran3; ?> onchange="savCampo('0')"/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>S&iacute;ncopes</legend>
	<span>
		<input name="sincopes" type="radio" value="S" <?php echo $ass." ".$sincopes1; ?> onchange="savCampo('0')"/><label>Sim</label>
		<input name="sincopes" type="radio" value="N" <?php echo $ass." ".$sincopes2; ?> onchange="savCampo('0')"/><label>N&atilde;o</label>
		<input name="sincopes" type="radio" value="NA" <?php echo $ass." ".$sincopes3; ?> onchange="savCampo('0')"/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Paresias</legend>
	<span>
		<input name="paresias" type="radio" value="S" <?php echo $ass." ".$paresias1; ?> onchange="savCampo('0')"/><label>Sim</label>
		<input name="paresias" type="radio" value="N" <?php echo $ass." ".$paresias2; ?> onchange="savCampo('0')"/><label>N&atilde;o</label>
		<input name="paresias" type="radio" value="NA" <?php echo $ass." ".$paresias3; ?> onchange="savCampo('0')"/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Paralisias</legend>
	<span>
		<input name="paralisias" type="radio" value="S" <?php echo $ass." ".$paralisias1; ?> onchange="savCampo('0')"/><label>Sim</label>
		<input name="paralisias" type="radio" value="N" <?php echo $ass." ".$paralisias2; ?> onchange="savCampo('0')"/><label>N&atilde;o</label>
		<input name="paralisias" type="radio" value="NA" <?php echo $ass." ".$paralisias3; ?> onchange="savCampo('0')"/><label>N&atilde;o Avaliado</label>
	<span>
</fieldset>
<fieldset style="width:46%">
	<legend>Retardo Neuropsicomotor</legend>
	<span>
		<input name="retneuropsi" type="radio" value="S" <?php echo $ass." ".$retneuropsi1; ?> onchange="savCampo('0')"/><label>Sim</label>
		<input name="retneuropsi" type="radio" value="N" <?php echo $ass." ".$retneuropsi2; ?> onchange="savCampo('0')"/><label>N&atilde;o</label>
		<input name="retneuropsi" type="radio" value="NA" <?php echo $ass." ".$retneuropsi3; ?> onchange="savCampo('0')"/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsnerv" class="txta1" onkeyup="savCampo('0')" <?php echo $ass; ?>><?php echo $obsnerv; ?></textarea>
</fieldset>