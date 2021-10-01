<fieldset style="width:46%">
	<legend>N&aacute;useas</legend>
	<span>
		<input name="nauseas" type="radio" value="S" onchange="savCampo('7')" <?php echo $ass." ".$nauseas1; ?> /><label>Sim</label>
		<input name="nauseas" type="radio" value="N" onchange="savCampo('7')" <?php echo $ass." ".$nauseas2; ?> /><label>N&atilde;o</label>
		<input name="nauseas" type="radio" value="NA" onchange="savCampo('7')" <?php echo $ass." ".$nauseas3; ?> /><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Dor Abdominal</legend>
	<span>
		<input name="dorabdom" type="radio" value="P" onchange="savCampo('7')" <?php echo $ass." ".$dorabdom1; ?>/><label>Presente</label>
		<input name="dorabdom" type="radio" value="A" onchange="savCampo('7')" <?php echo $ass." ".$dorabdom2; ?>/><label>Ausente</label>
		<input name="dorabdom" type="radio" value="NA" onchange="savCampo('7')" <?php echo $ass." ".$dorabdom3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<div style="float:left;width:50%">
	<fieldset style="width:95%">
		<legend>V&ocirc;mitos</legend>
		<select name="vomitos" <?php echo $ass; ?> onchange="savCampo('7')">
			<option value="A" <?php echo $vomitos1; ?>>Ausente</option>
			<option value="AA" <?php echo $vomitos2; ?>>Normais</option>
			<option value="SC" <?php echo $vomitos3; ?>>Brancas</option>
			<option value="N" <?php echo $vomitos4; ?>>Escuras</option>
			<option value="NA" <?php echo $vomitos5; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<div style="height:53px"></div>
	<fieldset style="width:95%">
		<legend>Tenesmo</legend>
		<span>
			<input name="tenesmo" type="radio" value="S" onchange="savCampo('7')" <?php echo $ass." ".$tenesmo1; ?>/><label>Sim</label>
			<input name="tenesmo" type="radio" value="N" onchange="savCampo('7')" <?php echo $ass." ".$tenesmo2; ?>/><label>N&atilde;o</label>
			<input name="tenesmo" type="radio" value="NA" onchange="savCampo('7')" <?php echo $ass." ".$tenesmo3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</fieldset>
</div>
<div style="float:left;width:50%">
	<fieldset style="width:95%">
		<legend>Evacua&ccedil;&atilde;o</legend>
		<div class="full"><select name="evacuacao" <?php echo $ass; ?> onchange="savCampo('7')">
			<option value="N" onClick="habilitaEvacuacao(1)" <?php echo $evacuacao1; ?>>Normal</option>
			<option value="C" onClick="habilitaEvacuacao(1)" <?php echo $evacuacao2; ?>>Constipado</option>
			<option value="D" onClick="habilitaEvacuacao(1)" <?php echo $evacuacao3; ?>>Diarr&eacute;ia</option>
			<option value="NA" onClick="habilitaEvacuacao(0)" <?php echo $evacuacao4; ?>>N&atilde;o Avaliado</option>
		</select></div>
		<label class="labdir1">Aspecto de Fezes:</label>
		<select name="aspfezes" <?php echo $ass." ".$devacuacao; ?> onchange="savCampo('7')">
			<option value="N" <?php echo $aspfezes1; ?>>Normais</option>
			<option value="B" <?php echo $aspfezes2; ?>>Brancas</option>
			<option value="E" <?php echo $aspfezes3; ?>>Escuras</option>
			<option value="L" <?php echo $aspfezes4; ?>>Líquidas</option>
			<option value="P" <?php echo $aspfezes5; ?>>Pastosas</option>
			<option value="NA" <?php echo $aspfezes6; ?>>N&atilde;o Avaliado</option>
		</select>
		<br />
		<label class="labdir1" id="lblnfez" <?php $lblnfez; ?>>N&ordm; de Vezes:</label>
		<input name="nfezes" type="text" size="3" maxlength="2" onfocus="mudaLb(lblnfez)" <?php echo $ass." ".$devacuacao; ?> onkeyup="savCampo('7')" value="<?php echo $nfezes; ?>" />
	</fieldset>
</div>
<div style="clear:both"></div>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsgi" class="txta1" onkeyup="savCampo('7')" <?php echo $ass;?> ><?php echo $obsgi; ?></textarea>
</fieldset>