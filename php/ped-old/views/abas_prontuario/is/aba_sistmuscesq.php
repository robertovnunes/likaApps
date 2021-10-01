<fieldset style="width:46%;">
	<legend>Deformidades</legend>
	<span>
		<input name="deform" type="radio" value="S" <?php echo $ass." ".$deform1; ?> onchange="savCampo('9')"/><label>Sim</label>
		<input name="deform" type="radio" value="N" <?php echo $ass." ".$deform2; ?> onchange="savCampo('9')"/><label>N&atilde;o</label>
		<input name="deform" type="radio" value="NA" <?php echo $ass." ".$deform3; ?> onchange="savCampo('9')"/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Tumefa&ccedil;&otilde;es</legend>
	<span>
		<input name="tumefacoes" type="radio" value="P" onchange="savCampo('9')" <?php echo $ass." ".$tumefacoes1; ?>/><label>Presente</label>
		<input name="tumefacoes" type="radio" value="A" onchange="savCampo('9')" <?php echo $ass." ".$tumefacoes2; ?>/><label>Ausente</label>
		<input name="tumefacoes" type="radio" value="NA" onchange="savCampo('9')" <?php echo $ass." ".$tumefacoes3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%;">
	<legend>Fraqueza Muscular</legend>
	<span>
		<input name="fraqmusc" type="radio" value="S" <?php echo $ass." ".$fraqmusc1; ?> onchange="savCampo('9')"/><label>Sim</label>
		<input name="fraqmusc" type="radio" value="N" <?php echo $ass." ".$fraqmusc2; ?> onchange="savCampo('9')"/><label>N&atilde;o</label>
		<input name="fraqmusc" type="radio" value="NA" <?php echo $ass." ".$fraqmusc3; ?> onchange="savCampo('9')"/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%;">
	<legend>Dores &Oacute;sseas e Articulares</legend>
	<span>
		<input name="dorossea" type="radio" value="P" onchange="savCampo('9')" <?php echo $ass." ".$dorossea1; ?>/><label>Presente</label>
		<input name="dorossea" type="radio" value="A" onchange="savCampo('9')" <?php echo $ass." ".$dorossea2; ?>/><label>Ausente</label>
		<input name="dorossea" type="radio" value="NA" onchange="savCampo('9')" <?php echo $ass." ".$dorossea3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsme" class="txta1" onkeyup="savCampo('9')" <?php echo $ass;?>><?php echo $obsme; ?></textarea>
</fieldset>