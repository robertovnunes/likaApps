<fieldset style="width:30%">
	<legend>Altera&ccedil;&atilde;o de Peso</legend>
	<select name="altpeso" onchange="savCampo('1')" <?php echo $ass; ?>>
		<option value="GP" <?php echo $altpeso1; ?>>Ganho de Peso</option>
		<option value="PP" <?php echo $altpeso2; ?>>Perda de Peso</option>
		<option value="NE" <?php echo $altpeso3; ?>>Nenhuma Alteração</option>
		<option value="NA" <?php echo $altpeso4; ?>>Não Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:29%">
	<legend>Apetite</legend>
	<select name="apetite" onchange="savCampo('1')" <?php echo $ass; ?>>
		<option value="F" <?php echo $apetite1; ?>>Falta</option>
		<option value="E" <?php echo $apetite2; ?>>Em excesso</option>
		<option value="N" <?php echo $apetite3; ?>>Normal</option>
		<option value="NA" <?php echo $apetite4; ?>>Não Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:29%">
	<legend>Atividade</legend>
	<select name="atividade" onchange="savCampo('1')" <?php echo $ass; ?>>
		<option value="A" <?php echo $atividade1; ?>>Ativo</option>
		<option value="Q" <?php echo $atividade2; ?>>Quieto</option>
		<option value="NA" <?php echo $atividade3; ?>>Não Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:40%">
	<legend>Febre</legend>
	<span>
		<input name="febre" type="radio" value="S" onchange="savCampo('1')" <?php echo $ass." ".$febre1; ?>/><label>Sim</label>
		<input name="febre" type="radio" value="N" onchange="savCampo('1')" <?php echo $ass." ".$febre2; ?> /><label>N&atilde;o</label>
		<input name="febre" type="radio" value="NA" onchange="savCampo('1')" <?php echo $ass." ".$febre3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsgeral" class="txta1" onkeyup="savCampo('1')" <?php echo $ass; ?>><?php echo $obsgeral; ?></textarea>
</fieldset>