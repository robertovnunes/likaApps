<fieldset style="width:46%">
	<legend>P&ecirc;los Pubianos</legend>
	<select name="pelospub" onChange="savCampo('4')" <?php echo $ass; ?>>
		<option value="1" <?php echo $pelospub1; ?>>Est&aacute;gio I</option>
		<option value="2" <?php echo $pelospub2; ?>>Est&aacute;gio II</option>
		<option value="3" <?php echo $pelospub3; ?>>Est&aacute;gio III</option>
		<option value="4" <?php echo $pelospub4; ?>>Est&aacute;gio IV</option>
		<option value="5" <?php echo $pelospub5; ?>>Est&aacute;gio V</option>
		<option value="NA" <?php echo $pelospub6; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<?php if ($paciente->getSexo() == "F") { ?>
<fieldset style="width:46%">
	<legend>Mamas</legend>
	<select name="mamas" onChange="savCampo('4')" <?php echo $ass; ?>>
		<option value="1" <?php echo $mamas1; ?>>Est&aacute;gio I</option>
		<option value="2" <?php echo $mamas2; ?>>Est&aacute;gio II</option>
		<option value="3" <?php echo $mamas3; ?>>Est&aacute;gio III</option>
		<option value="4" <?php echo $mamas4; ?>>Est&aacute;gio IV</option>
		<option value="5" <?php echo $mamas5; ?>>Est&aacute;gio V</option>
		<option value="NA" <?php echo $mamas6; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<?php } else if ($paciente->getSexo()== "M"){?>
<fieldset style="width:21%">
	<legend>Volume Testicular</legend>
	<select name="voltest" onChange="savCampo('4')" <?php echo $ass; ?>>
		<option value="-4" <?php echo $voltest1; ?>>Menos de 4 mL</option>
		<option value="4" <?php echo $voltest2; ?>>4 mL</option>
		<option value="9" <?php echo $voltest3; ?>>9 mL</option>
		<option value="16" <?php echo $voltest4; ?>>16 mL</option>
		<option value="20" <?php echo $voltest5; ?>>20 mL</option>
		<option value="NA" <?php echo $voltest6; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:21%">
	<legend>Genitais</legend>
	<select name="genitais" onChange="savCampo('4')" <?php echo $ass; ?>>
		<option value="1" <?php echo $genitais1; ?>>Est&aacute;gio I</option>
		<option value="2" <?php echo $genitais2; ?>>Est&aacute;gio II</option>
		<option value="3" <?php echo $genitais3; ?>>Est&aacute;gio III</option>
		<option value="4" <?php echo $genitais4; ?>>Est&aacute;gio IV</option>
		<option value="5" <?php echo $genitais5; ?>>Est&aacute;gio V</option>
		<option value="NA" <?php echo $genitais6; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<?php } ?>
<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsantrop" class="txta1" onKeyUp="savCampo('4')" <?php echo $ass; ?>><?php echo $obsantrop; ?></textarea>
</fieldset>