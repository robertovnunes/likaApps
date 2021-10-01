<br />
<span class="style7">Pessoal > Alimenta&ccedil;&atilde;o</span>
<br />
<fieldset style="width:46%">
	<legend>Aleitamento Materno Exclusivo</legend>
	<select name="aleitmat" onchange="savCampo('4')">
			<option value='-6m' <?php echo $aleitmat1; ?>>Menos de 6 Meses</option>
			<option value='6m1a' <?php echo $aleitmat2; ?>>6 Meses a 1 Ano</option>
			<option value='+1a' <?php echo $aleitmat3; ?>>Mais de 1 Ano</option>
			<option value='N' <?php echo $aleitmat4; ?>>N&atilde;o</option>
			<option value='NA' <?php echo $aleitmat5; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>In&iacute;cio da Alimenta&ccedil;&atilde;o Complementar</legend>
	<select name="alimcomp" onchange="savCampo('4')">
		<option value='-6m' <?php echo $alimcomp1; ?>>Menos de 6 Meses</option>
		<option value='6m1a' <?php echo $alimcomp2; ?>>6 Meses a 1 Ano</option>
		<option value='+1a' <?php echo $alimcomp3; ?>>Mais de 1 Ano</option>
		<option value='N' <?php echo $alimcomp4; ?>>N&atilde;o</option>
		<option value='NA' <?php echo $alimcomp5; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>

<fieldset style="width:46%">
	<legend>In&iacute;cio da Alimenta&ccedil;&atilde;o Pastosa</legend>
	<select name="alimpast" onchange="savCampo('4')">
		<option value='-6m' <?php echo $alimpast1; ?>>Menos de 6 Meses</option>
		<option value='6m1a' <?php echo $alimpast2; ?>>6 Meses a 1 Ano</option>
		<option value='+1a' <?php echo $alimpast3; ?>>Mais de 1 Ano</option>
		<option value='N' <?php echo $alimpast4; ?>>N&atilde;o</option>
		<option value='NA' <?php echo $alimpast5; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>In&iacute;cio da Alimenta&ccedil;&atilde;o Familiar</legend>
	<select name="alimfam" onchange="savCampo('4')">
		<option value='-6m' <?php echo $alimfam1; ?>>Menos de 6 Meses</option>
		<option value='6m1a' <?php echo $alimfam2; ?>>6 Meses a 1 Ano</option>
		<option value='+1a' <?php echo $alimfam3; ?>>Mais de 1 Ano</option>
		<option value='N' <?php echo $alimfam4; ?>>N&atilde;o</option>
		<option value='NA' <?php echo $alimfam5; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>

<fieldset style="width:46%">
	<legend>Dieta Atual</legend>
	<select name="dietaat" onchange="savCampo('4')">
		<option value='F' <?php echo $dietaat1; ?>>Familiar</option>
		<option value='E' <?php echo $dietaat2; ?>>Especial</option>
		<option value='NA' <?php echo $dietaat3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>N&uacute;mero de Refei&ccedil;&otilde;es Di&aacute;rias</legend>
	<select name="refdia" onchange="savCampo('4')">
		 <option value='-3' <?php echo $refdia1; ?>>Menos de Tr&ecirc;s</option>
		 <option value='3' <?php echo $refdia2; ?>>Tr&ecirc;s</option>
		 <option value='+3' <?php if (!$refdia2)  echo $refdia3; ?>>Mais de Tr&ecirc;s</option>
		 <option value='NA' <?php echo $refdia4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>

<fieldset style="width:46%">
	<legend>Hor&aacute;rio das Refei&ccedil;&otilde;es</legend>
	<select name="horaref" onchange="savCampo('4')">
		<option value='N' <?php echo $horaref1; ?>>Normal, tr&ecirc;s refei&ccedil;&otilde;es</option>
		<option value='HE' <?php echo $horaref2; ?>>Hor&aacute;rio Familiar Especial</option>
		<option value='A' <?php echo $horaref3; ?>>Aleat&oacute;rio</option>
		<option value='NA' <?php echo $horaref4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Uso da Mamadeira</legend>
	<span>
		<input name="usomam" type="radio" value="S" onchange="savCampo('4')" <?php echo $usomam1; ?>/><label>Sim</label>
		<input name="usomam" type="radio" value="N" onchange="savCampo('4')" <?php echo $usomam2; ?>/><label>N&atilde;o</label>
		<input name="usomam" type="radio" value="NA" onchange="savCampo('4')" <?php echo $usomam3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>

<fieldset style="width:46%">
	<legend>Uso de Colher</legend>
	<span>
		<input name="colher" type="radio" value="S" onchange="savCampo('4')" <?php echo $colher1; ?>/><label>Sim</label>
		<input name="colher" type="radio" value="N" onchange="savCampo('4')" <?php echo $colher2; ?>/><label>N&atilde;o</label>
		<input name="colher" type="radio" value="NA" onchange="savCampo('4')" <?php echo $colher3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Uso de Copo</legend>
	<span>
		<input name="copo" type="radio" value="S" onchange="savCampo('4')" <?php echo $copo1; ?>/><label>Sim</label>
		<input name="copo" type="radio" value="N" onchange="savCampo('4')" <?php echo $copo2; ?>/><label>N&atilde;o</label>
		<input name="copo" type="radio" value="NA" onchange="savCampo('4')" <?php echo $copo3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>

<fieldset style="width:46%">
	<legend>Alimenta&ccedil;&atilde;o Pastosa Liquidificada</legend>
	<span>
		<input name="alimpastl" type="radio" value="S" onchange="savCampo('4')" <?php echo $alimpastl1; ?>/><label>Sim</label>
		<input name="alimpastl" type="radio" value="N" onchange="savCampo('4')" <?php echo $alimpastl2; ?>/><label>N&atilde;o</label>
		<input name="alimpastl" type="radio" value="NA" onchange="savCampo('4')" <?php echo $alimpastl3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Uso de Chantagem Afetiva</legend>
	<span>
		<input name="chantafet" type="radio" value="S" onchange="savCampo('4')" <?php echo $chantafet1; ?>/><label>Sim</label>
		<input name="chantafet" type="radio" value="N" onchange="savCampo('4')" <?php echo $chantafet2; ?>/><label>N&atilde;o</label>
		<input name="chantafet" type="radio" value="NA" onchange="savCampo('4')" <?php echo $chantafet3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>

<fieldset style="width:46%">
	<legend>Brincadeira na Hora das Refei&ccedil;&otilde;es</legend>
	<span>
		<input name="brincref" type="radio" value="S" onchange="savCampo('4')" <?php echo $brincref1; ?>/><label>Sim</label>
		<input name="brincref" type="radio" value="N" onchange="savCampo('4')" <?php echo $brincref2; ?>/><label>N&atilde;o</label>
		<input name="brincref" type="radio" value="NA" onchange="savCampo('4')" <?php echo $brincref3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>

<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea class="txta1" name="obsaliment" onkeyup="savCampo('4')"><?php echo $obsaliment; ?></textarea>
</fieldset>