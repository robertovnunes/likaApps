<fieldset style="width:46%">
	<legend>Avalia&ccedil;&atilde;o do N&iacute;vel de Consci&ecirc;ncia</legend>
	<select name="nivconsc" <?php echo $ass; ?> onChange="savCampo('F')">
		<option value="A" <?php echo $nivconsc1; ?>>Alerta</option>
		<option value="S" <?php echo $nivconsc2; ?>>Sonolento</option>
		<option value="NA" <?php echo $nivconsc3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Orienta&ccedil;&atilde;o</legend>
	<span>
		<input name="orientacao" type="radio" value="S" onChange="savCampo('F')" <?php echo $ass." ".$orientacao1; ?>/><label>Sim</label>
		<input name="orientacao" type="radio" value="N" onChange="savCampo('F')" <?php echo $ass." ".$orientacao2; ?>/><label>N&atilde;o</label>
		<input name="orientacao" type="radio" value="NA" onChange="savCampo('F')" <?php echo $ass." ".$orientacao3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Sinais Focais Relativos Aos Pares Cranianos</legend>
	<select name="sinfocais" <?php echo $ass; ?> onChange="savCampo('F')">
		<option value="N" <?php echo $sinfocais1; ?>>Normais</option>
		<option value="A" <?php echo $sinfocais2; ?>>Alterados</option>
		<option value="NA" <?php echo $sinfocais3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsnerv" class="txta1" onKeyUp="savCampo('F')" <?php echo $ass; ?>><?php echo $obsnerv; ?></textarea>
</fieldset>