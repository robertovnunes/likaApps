<fieldset style="width:46%">
	<legend>Prec&oacute;rdio</legend>
	<select name="precord" <?php echo $ass; ?> onChange="savCampo('B')">
		<option value="A" <?php echo $precrd1; ?>>Abaulado</option>
		<option value="R" <?php echo $precrd2; ?>>Retra&iacute;do</option>
		<option value="NA" <?php echo $precrd3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Ictus Cordis (Inspe&ccedil;&atilde;o) </legend>
	<select name="ictuscordi" <?php echo $ass; ?> onChange="savCampo('B')">
		<option value="S" <?php echo $ici1; ?>>Localiza&ccedil;&atilde;o normal</option>
		<option value="A" <?php echo $ici2; ?>>Localiza&ccedil;&atilde;o alterado</option>
		<option value="NA" <?php echo $ici3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Ictus Cordis (Palpa&ccedil;&atilde;o)</legend>
	<select name="ictuscordp" <?php echo $ass; ?> onChange="savCampo('B')">
		<option value="BN" <?php echo $icp1; ?>>For&ccedil;a de batimento normal</option>
		<option value="BA" <?php echo $icp2; ?>>For&ccedil;a de batimento alterado</option>
		<option value="NA" <?php echo $icp3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Art&eacute;rias perif&eacute;ricas (pulso, ritmo, tens&atilde;o)</legend>
	<select name="artperif" <?php echo $ass; ?> onChange="savCampo('B')">
		<option value="N" <?php echo $artper1; ?>>Normais</option>
		<option value="A" <?php echo $artper2; ?>>Alteradas</option>
		<option value="NA" <?php echo $artper3; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Bulhas</legend>
	<select name="bulhas" <?php echo $ass; ?> onChange="savCampo('B')">
		<option value="NF" <?php echo $bulhas1; ?>>Normofon&eacute;ticas</option>
		<option value="+F" <?php echo $bulhas2; ?>>Hipofon&eacute;ticas</option>
		<option value="-F" <?php echo $bulhas3; ?>>Hiperfon&eacute;ticas</option>
		<option value="NA" <?php echo $bulhas4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Sopros</legend>
	<span>
		<input name="sopros" type="radio" value="P" onChange="savCampo('B')" <?php echo $ass." ".$sopros1; ?>/><label>Presente</label>
		<input name="sopros" type="radio" value="A" onChange="savCampo('B')" <?php echo $ass." ".$sopros2; ?>/><label>Ausente</label>
		<input name="sopros" type="radio" value="NA" onChange="savCampo('B')" <?php echo $ass." ".$sopros3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend id="lblpart" <?php echo (isset($lblpart) ? $lblpart : ''); ?>>Press&atilde;o Arterial</legend>
	<select style="margin:4 0 0 10" name="pressaoart" onfocus="mudaLb(lblpart)" onChange="savCampo('B')" <?php echo $ass; ?>  >
		<option value="NA" <?php echo $presart1; ?> onclick="habilitaExCardioPres(0)">N&atilde;o Avaliado</option>
		<option value="AV" <?php echo $presart2; ?> onclick="habilitaExCardioPres(1)" <?php if($presartin){?> selected="selected" <?}?> >Valor</option>
	</select> 
	<input name="pressaoartin" <?php echo $ass." ".$dpresart; ?> onchange="savCampo('B')" onkeypress="mascara(this,5)" size="4" maxlength="4" value="<?php echo $presartin; ?>" /><span class="lbdtt1">mmHg</span>
</fieldset>
<fieldset style="width:46%">
	<legend id="lblfqcd" <?php echo (isset($lblfqcd) ? $lblfqcd : ''); ?>>Freq&uuml;&ecirc;ncia Card&iacute;aca</legend>
	<select style="margin:4 0 0 10" name="freqcard" onfocus="mudaLb(lblfqcd)" <?php echo $ass; ?> onChange="savCampo('B')">
		<option value="NA" <?php echo $frqcrd1; ?> onclick="habilitaExCardioFreq(0)">N&atilde;o Avaliado</option>
		<option value="AV" <?php echo $frqcrd2; ?> onclick="habilitaExCardioFreq(1)" <?php if($frqcrdin){?> selected="selected" <?}?>>Valor</option>
	</select>
	<input name="freqcardin" <?php echo $ass." ".$dfrqcrd; ?> onchange="savCampo('B')" onkeypress="mascara(this,6)" size="3" maxlength="3" value="<?php echo $frqcrdin; ?>" /><span class="lbdtt1">bpm</span>
</fieldset>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obscdvs" class="txta1" onKeyUp="savCampo('B')" <?php echo $ass; ?>><?php echo $obscdvs; ?></textarea>
</fieldset>