<fieldset style="width:46%">
	<legend>Forma do T&oacute;rax</legend>
	<select name="formtorax" <?php echo $ass; ?> onChange="savCampo('A')">
		<option value="N" <?php echo $formtorax1; ?>>Normal</option>
		<option value="B" <?php echo $formtorax2; ?>>Em &quot;Barril&quot;</option>
		<option value="PP" <?php echo $formtorax3; ?>>Em &quot;peito de pombo&quot;</option>
		<option value="A" <?php echo $formtorax4; ?>>Outra Altera&ccedil;&atilde;o</option>
		<option value="NA" <?php echo $formtorax5; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Simetria do T&oacute;rax</legend>
	<select name="simtorax" <?php echo $ass; ?> onChange="savCampo('A')">
		<option value="S" <?php echo $simtorax1; ?>>Sim&eacute;trico</option>
		<option value="A" <?php echo $simtorax2; ?>>Assim&eacute;trico</option>
		<option value="NA" <?php echo $simtorax3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Contornos</legend>
	<select name="contornos" <?php echo $ass; ?> onChange="savCampo('A')">
	  <option value="N" <?php echo $contornos1; ?>>Normal</option>
	  <option value="Al" <?php echo $contornos2; ?>>Alterados</option>
	  <option value="NA" <?php echo $contornos3;?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Proemin&ecirc;ncias</legend>
	<span>
		<input name="proemi" type="radio" value="P" onChange="savCampo('A')" <?php echo $ass." ".$proemi1; ?>/><label>Presentes</label>
		<input name="proemi" type="radio" value="A" onChange="savCampo('A')" <?php echo $ass." ".$proemi2; ?>/><label>Ausentes</label>
		<input name="proemi" type="radio" value="NA" onChange="savCampo('A')" <?php echo $ass." ".$proemi3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Mamas</legend>
	<select name="mamas" <?php echo $ass; ?> onchange="savCampo('A')">
		<option value="N" <?php echo $mamas1; ?>>Normal</option>
		<option value="A" <?php echo $mamas2; ?>>Aumentadas</option>
		<option value="D" <?php echo $mamas3; ?>>Diminu&iacute;das</option>
		<option value="PM" <?php echo $mamas4; ?>>Presen&ccedil;a de Massa/Tumora&ccedil;&atilde;o</option>
		<option value="NA" <?php echo $mamas5; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Massas Anormais</legend>
	<span>
		<input name="massasanorm" type="radio" value="P" onChange="savCampo('A')" <?php echo $ass." ".$massasanorm1; ?>/><label>Presentes</label>
		<input name="massasanorm" type="radio" value="A" onChange="savCampo('A')" <?php echo $ass." ".$massasanorm2; ?>/><label>Ausentes</label>
		<input name="massasanorm" type="radio" value="NA" onChange="savCampo('A')" <?php echo $ass." ".$massasanorm3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Tipo de respira&ccedil;&atilde;o</legend>
	<select name="tresp" <?php echo $ass; ?> onChange="savCampo('A')">
		<option value="N" <?php echo $tresp1; ?>>Normal</option>
		<option value="D" <?php echo $tresp2; ?>>Dispn&eacute;ia</option>
		<option value="CS" <?php echo $tresp3; ?>>Cheyne-Stokes</option>
		<option value="B" <?php echo $tresp4; ?>>Biot</option>
		<option value="K" <?php echo $tresp5; ?>>Kussmaul</option>
		<option value="S" <?php echo $tresp6; ?>>Suspirosa</option>
		<option value="NA" <?php echo $tresp7;?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Tiragem Intercostal</legend>
	<span>
		<input name="tirinterc" type="radio" value="P" onChange="savCampo('A')" <?php echo $ass." ".$tirinterc1; ?>/><label>Presente</label>
		<input name="tirinterc" type="radio" value="A" onChange="savCampo('A')" <?php echo $ass." ".$tirinterc2; ?>/><label>Ausente</label>
		<input name="tirinterc" type="radio" value="NA" onChange="savCampo('A')" <?php echo $ass." ".$tirinterc3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Freq&uuml;&ecirc;ncia Respirat&oacute;ria</legend>
	<select name="freqresp" <?php echo $ass; ?> onChange="savCampo('A')">
		<option value="N" <?php echo $freqresp1; ?>>Normal</option>
		<option value="D" <?php echo $freqresp2; ?>>Diminu&iacute;da</option>
		<option value="A" <?php echo $freqresp3; ?>>Aumentada</option>
		<option value="NA" <?php echo $freqresp4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Fr&ecirc;mito T&oacute;raco-vocal</legend>
	<select name="fremtv" <?php echo $ass; ?> onChange="savCampo('A')">
		<option value="N" <?php echo $fremtv1; ?>>Presente e normal</option>
		<option value="PD" <?php echo $fremtv2;?>>Presente e diminu&iacute;do</option>
		<option value="PA" <?php echo $fremtv3; ?>>Presente e aumentado</option>
		<option value="A" <?php echo $fremtv4; ?>>Ausente</option>
		<option value="NA" <?php echo $fremtv5;?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Fr&ecirc;mito Br&ocirc;nquico</legend>
	<span>
		<input name="frembronq" type="radio" value="P" onchange="savCampo('A')" <?php echo $ass." ".$frembronq1; ?>/><label>Presente</label>
		<input name="frembronq" type="radio" value="A" onchange="savCampo('A')" <?php echo $ass." ".$frembronq2; ?>/><label>Ausente</label>
		<input name="frembronq" type="radio" value="NA" onchange="savCampo('A')" <?php echo $ass." ".$frembronq3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Fr&ecirc;mito pleural</legend>
	<span>
		<input name="frempleur" type="radio" value="P" onChange="savCampo('A')" <?php echo $ass." ".$frempleur1; ?>/><label>Presente</label>
		<input name="frempleur" type="radio" value="A" onChange="savCampo('A')" <?php echo $ass." ".$frempleur2; ?>/><label>Ausente</label>
		<input name="frempleur" type="radio" value="NA" onChange="savCampo('A')" <?php echo $ass." ".$frempleur3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Submacicez normal</legend>
	<select name="submacicez" <?php echo $ass; ?> onChange="savCampo('A')">
		<option value="AH" <?php echo $submacicez1; ?>>Em ambos hemi-t&oacute;rax</option>
		<option value="HE" <?php echo $submacicez2;?>>Somente hemi-t&oacute;rax esquerdo</option>
		<option value="HD" <?php echo $submacicez3;?>>Somente hemi-t&oacute;rax direito</option>
		<option value="A" <?php echo $submacicez4; ?>>Ausente</option>
		<option value="NA" <?php echo $submacicez5;?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Macicez</legend>
	<select name="macicez" <?php echo $ass; ?> onchange="savCampo('A')">
		<option value="AH" <?php echo $macicez1; ?>>Em ambos hemi-t&oacute;rax</option>
		<option value="HE" <?php echo $macicez2;?>>Somente hemi-t&oacute;rax esquerdo</option>
		<option value="HD" <?php echo $macicez3;?>>Somente hemi-t&oacute;rax direito</option>
		<option value="A" <?php echo $macicez4; ?>>Ausente</option>
		<option value="NA" <?php echo $macicez5;?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Timp&acirc;nico</legend>
	<select name="timpanico" <?php echo $ass; ?> onChange="savCampo('A')">
		<option value="AH" <?php echo $timpanico1; ?>>Em ambos hemi-t&oacute;rax</option>
		<option value="HE" <?php echo $timpanico2;?>>Somente hemi-t&oacute;rax esquerdo</option>
		<option value="HD" <?php echo $timpanico3;?>>Somente hemi-t&oacute;rax direito</option>
		<option value="A" <?php echo $timpanico4; ?>>Ausente</option>
		<option value="NA" <?php echo $timpanico5;?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Murm&uacute;rios Vesiculares</legend>
	<select name="murmvesic" <?php echo $ass; ?> onChange="savCampo('A')">
		<option value="AH" <?php echo $murmvesic1; ?>>Em ambos hemi-t&oacute;rax</option>
		<option value="HE" <?php echo $murmvesic2; ?>>Somente hemi-t&oacute;rax esquerdo</option>
		<option value="HD" <?php echo $murmvesic3; ?>>Somente hemi-t&oacute;rax direito</option>
		<option value="A" <?php echo $murmvesic4; ?>>Ausente</option>
		<option value="NA" <?php echo $murmvesic5; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Estertores / Crepita&ccedil;&otilde;es</legend>
	<span>
		<input name="estertores" type="radio" value="P" onchange="savCampo('A')" <?php echo $ass." ".$estertores1; ?>/><label>Presentes</label>
		<input name="estertores" type="radio" value="A" onchange="savCampo('A')" <?php echo $ass." ".$estertores2; ?>/><label>Ausentes</label>
		<input name="estertores" type="radio" value="NA" onchange="savCampo('A')" <?php echo $ass." ".$estertores3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Estridores</legend>
	<span>
		<input name="estridores" type="radio" value="P" onChange="savCampo('A')" <?php echo $ass." ".$estridores1; ?>/><label>Presentes</label>
		<input name="estridores" type="radio" value="A" onChange="savCampo('A')" <?php echo $ass." ".$estridores2; ?>/><label>Ausentes</label>
		<input name="estridores" type="radio" value="NA" onChange="savCampo('A')" <?php echo $ass." ".$estridores3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Sibilos</legend>
	<span>
		<input name="sibilos" type="radio" value="P" onchange="savCampo('A')" <?php echo $ass." ".$sibilos1; ?>/><label>Presentes</label>
		<input name="sibilos" type="radio" value="A" onchange="savCampo('A')" <?php echo $ass." ".$sibilos2; ?>/><label>Ausentes</label>
		<input name="sibilos" type="radio" value="NA" onchange="savCampo('A')" <?php echo $ass." ".$sibilos3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Atrito Pleural</legend>
	<span>
		<input name="atritopl" type="radio" value="P" onChange="savCampo('A')" <?php echo $ass." ".$atritopl1; ?>/><label>Presente</label>
		<input name="atritopl" type="radio" value="A" onChange="savCampo('A')" <?php echo $ass." ".$atritopl2; ?>/><label>Ausente</label>
		<input name="atritopl" type="radio" value="NA" onChange="savCampo('A')" <?php echo $ass." ".$atritopl3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsresp" class="txta1" onKeyUp="savCampo('A')" <?php echo $ass; ?>><?php echo $obsresp; ?></textarea>
</fieldset>