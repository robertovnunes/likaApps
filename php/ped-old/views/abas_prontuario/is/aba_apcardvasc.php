<fieldset style="width:46%">
	<legend>Cianose</legend>
	<select name="cianose" <?php echo $ass; ?> onchange="savCampo('6')">
		<option value="L" <?php echo $cianose1; ?>>Labial</option>
		<option value="G" <?php echo $cianose2; ?>>Generalizada</option>
		<option value="A" <?php echo $cianose3; ?>>Ausente</option>
		<option value="NA" <?php echo $cianose4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%;">
	<legend>Dispn&eacute;ia</legend>
	<span>
		<input name="dispneia" type="radio" value="S" onchange="savCampo('6')" <?php echo $ass." ".$dispneia1; ?> /><label>Sim</label>
		<input name="dispneia" type="radio" value="N" onchange="savCampo('6')" <?php echo $ass." ".$dispneia2; ?> /><label>N&atilde;o</label>
		<input name="dispneia" type="radio" value="NA" onchange="savCampo('6')" <?php echo $ass." ".$dispneia3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Palpita&ccedil;&atilde;o</legend>
	<span>
		<input name="palpitacao" type="radio" value="S" onchange="savCampo('6')" <?php echo $ass." ".$palpitacao1; ?> /><label>Sim</label>
		<input name="palpitacao" type="radio" value="N" onchange="savCampo('6')" <?php echo $ass." ".$palpitacao2; ?> /><label>N&atilde;o</label>
		<input name="palpitacao" type="radio" value="NA" onchange="savCampo('6')" <?php echo $ass." ".$palpitacao3; ?> /><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Taquicardia</legend>
	<span>
		<input name="taquicardia" type="radio" value="S" onchange="savCampo('6')" <?php echo $ass." ".$taquicardia1; ?> /><label>Sim</label>
		<input name="taquicardia" type="radio" value="N" onchange="savCampo('6')" <?php echo $ass." ".$taquicardia2; ?> /><label>N&atilde;o</label>
		<input name="taquicardia" type="radio" value="NA" onchange="savCampo('6')" <?php echo $ass." ".$taquicardia3; ?> /><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obscv" class="txta1" onkeyup="savCampo('6')" <?php echo $ass; ?>><?php echo $obscv; ?></textarea>
</fieldset>