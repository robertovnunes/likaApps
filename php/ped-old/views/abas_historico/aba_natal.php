<br />
<span class="style7">Pessoal > Natal</span>
<br />
<fieldset style="width:30%">
	<legend>Tipo de Gravidez</legend>
	<select name="tgrav" onchange="savCampo('2')">
		<option value='S' <?php echo $tgrav1; ?>>Simples</option>
		<option value='M' <?php echo $tgrav2; ?>>M&uacute;ltipla</option>
		<option value='NA' <?php echo $tgrav3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:29%">
	<legend>Tipo de Parto</legend>
	<select name="tparto" onchange="savCampo('2')">
		<option value='E' <?php echo $tparto1; ?>>Espont&acirc;neo</option>
		<option value='I' <?php echo $tparto2; ?>>Instrumental</option>
		<option value='C' <?php echo $tparto3; ?>>Cir&uacute;rgico</option>
		<option value='NA' <?php echo $tparto4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:29%">
	<legend>Tipo de Apresenta&ccedil;&atilde;o</legend>
	<select name="tapres" onchange="savCampo('2')">
		<option value='C' <?php echo $tapres1; ?>>Cef&aacute;lica</option>
		<option value='P' <?php echo $tapres2; ?>>P&eacute;lvica</option>
		<option value='O' <?php echo $tapres3; ?>>Outra</option>
		<option value='NA' <?php echo $tapres4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>

<fieldset style="width:30%">
	<legend id="lbltrpart" <?php echo $lbltrpart; ?>>Dura&ccedil;&atilde;o Trabalho de Parto</legend>
	<input name="durparto" size="6" maxlength="5" onkeyup="savCampo('2')" value="<?php echo $durparto; ?>" onfocus="mudaLb(lbltrpart)" onkeypress="mascara(this,4)"/><label style="margin:4 0 0 0">(hh:mm)</label>
</fieldset>
<fieldset  style="width:62%; margin-top:4px">
	<legend>Anestesia</legend>
	<span>
		<input name="anest" type="radio" value="S" onchange="savCampo('2')"	<?php echo $anest1; ?>/><label>Sim</label>
		<input name="anest" type="radio" value="N" onchange="savCampo('2')" <?php echo $anest2; ?>/><label>N&atilde;o</label>
		<input name="anest" type="radio" value="NA" onchange="savCampo('2')" <?php echo $anest3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset class="full">
	<legend id="lblanalg">Analgesia</legend>
	<textarea class="txta1" name="analg" onkeyup="savCampo('2')" onfocus="mudaLb(lblanalg)"><?php echo $analg; ?></textarea>
</fieldset>

<fieldset class="full">
	<legend id="lblcomp" <?php echo $lblcomp; ?>>Complica&ccedil;&otilde;es</legend>
	<span>
		<input name="complp" type="radio" value="S" onclick="habilitaCompParto(1); mudaLb(lblcomp)" onchange="savCampo('2')" <?php echo $complp1; ?>/><label>Sim</label>
		<input name="complp" type="radio" value="N" onclick="habilitaCompParto(0); mudaLb(lblcomp)" onchange="savCampo('2')" <?php echo $complp2; ?>/><label>N&atilde;o</label>
		<input name="complp" type="radio" value="NA" onclick="habilitaCompParto(0); mudaLb(lblcomp)" onchange="savCampo('2')" <?php echo $complp3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
	<textarea class="txta1" name="tcomplp" onkeyup="savCampo('2')" onfocus="mudaLb(lblcomp)" <?php echo $dcomplp; ?>><?php echo $tcomplp; ?></textarea>
</fieldset>

<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea class="txta1" name="obsnatal" onkeyup="savCampo('2')"><?php echo $obsnatal; ?></textarea>
</fieldset>