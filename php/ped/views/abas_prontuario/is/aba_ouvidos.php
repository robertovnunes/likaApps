<fieldset style="width:46%">
	<legend>Secre&ccedil;&atilde;o</legend>
	<span>
		<input name="secrecaoou" type="radio" value="S" <?php echo $ass." ".$secrecao1; ?> onchange="savCampo('4')"/><label>Sim</label>
		<input name="secrecaoou" type="radio" value="N" <?php echo $ass." ".$secrecao2; ?> onchange="savCampo('4')"/><label>N&atilde;o</label>
		<input name="secrecaoou" type="radio" value="NA" <?php echo $ass." ".$secrecao3; ?> onchange="savCampo('4')"/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Infec&ccedil;&otilde;es Freq&uuml;entes</legend>
	<span>
		<input name="infecfreq" type="radio" value="S" <?php echo $ass." ".$infecfreq1; ?> onchange="savCampo('4')"/><label>Sim</label>
		<input name="infecfreq" type="radio" value="N" <?php echo $ass." ".$infecfreq2; ?> onchange="savCampo('4')"/><label>N&atilde;o</label>
		<input name="infecfreq" type="radio" value="NA" id="inffreq" <?php echo $ass." ".$infecfreq3; ?> onchange="savCampo('4')"/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Dor</legend>
	<select name="dorouvido" <?php echo $ass;?> onchange="savCampo('4')">
		<option value="OE" <?php echo $dorouv1; ?>>Ouvido Esquerdo</option>
		<option value="OD" <?php echo $dorouv2; ?>>Ouvido Direito</option>
		<option value="AO" <?php echo $dorouv3; ?>>Ambos os Ouvidos</option>
		<option value="N" <?php echo $dorouv4; ?>>Não</option>
		<option value="NA" <?php echo $dorouv5; ?>>Não Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Acuidade Auditiva</legend>
	<select name="acuidaud" <?php echo $ass;?> onchange="savCampo('4')">
		<option value="TN" <?php echo $acuidaud1; ?>>Teste da Orelhinha Normal</option>
		<option value="TA" <?php echo $acuidaud2; ?>>Teste da Orelhinha Anormal</option>
		<option value="S" <?php echo $acuidaud3; ?>>Sim</option>
		<option value="N" <?php echo $acuidaud4; ?>>Não</option>
		<option value="NA" <?php echo $acuidaud5; ?>>Não Avaliado</option>
	</select>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsouvido" class="txta1" onkeyup="savCampo('4')" <?php echo $ass; ?>><?php echo $obsouvido; ?></textarea>
</fieldset>