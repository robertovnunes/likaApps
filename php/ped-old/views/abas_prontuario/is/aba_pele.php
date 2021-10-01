<fieldset style="width:22%">
	<legend>Rash</legend>
	<select name="rash" <?php echo $ass; ?> onchange="savCampo('2')">
		<option value="E" <?php echo $rash1; ?>>Escarlatiniforme</option>
		<option value="M" <?php echo $rash2; ?>>Morbiliforme</option>
		<option value="A" <?php echo $rash3; ?>>Ausente</option>
		<option value="NA" <?php echo $rash4; ?>>Não Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:24%">
	<legend>Icter&iacute;cia</legend>
	<select name="ictericia" <?php echo $ass; ?> onchange="savCampo('2')">
	<?php for ($i=1;$i<=5;$i++){
	$s = $fachada->checkOption("ictericia", $i, $lpele->ictericia); ?>
		<option value="<? echo $i; ?>" <?php echo $s; ?>>Zona <?php echo $i; ?> de Kramer</option>
	<?php $s = ""; } ?>
		<option value="A" <?php echo $ictericia1; ?>>Ausente</option>
		<option value="NA" <?php echo $ictericia2; ?>>Não Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:42%">
	<legend>Infec&ccedil;&otilde;es de Repeti&ccedil;&atilde;o</legend>
	<span>
		<input name="infecrep" type="radio" value="S" <?php echo $ass." ".$infecrep1; ?> onchange="savCampo('2')"/><label>Sim</label>
		<input name="infecrep" type="radio" value="N" <?php echo $ass." ".$infecrep2; ?> onchange="savCampo('2')"/><label>N&atilde;o</label>
		<input name="infecrep" type="radio" value="NA" <?php echo $ass." ".$infecrep3; ?> onchange="savCampo('2')"/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obspele" class="txta1" onkeyup="savCampo('2')" <?php echo $ass; ?>><?php echo $obspele; ?></textarea>
</fieldset>