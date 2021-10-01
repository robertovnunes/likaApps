<br />
<span class="style7">Pessoal > Outras Informa&ccedil;&otilde;es</span>
<br />
<fieldset style="width:46%">
	<legend>Epidemiologia Para Doen&ccedil;a de Chagas</legend>
	<span>
		<input name="chagas" type="radio" value="S" onchange="savCampo('9')" <?php echo $chagas1; ?>/><label>Sim</label>
		<input name="chagas" type="radio" value="N" onchange="savCampo('9')" <?php echo $chagas2; ?>/><label>N&atilde;o</label>
		<input name="chagas" type="radio" value="NA" onchange="savCampo('9')" <?php echo $chagas3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Epidemiologia Para Esquistossomose</legend>
	<span>
		<input name="esquist" type="radio" value="S" onchange="savCampo('9')" <?php echo $esquist1 = $fachada->checkPOST("esquist", "S", $linfo->esquist); ?>/><label>Sim</label>
		<input name="esquist" type="radio" value="N" onchange="savCampo('9')" <?php echo $esquist2 = $fachada->checkPOST("esquist", "N", $linfo->esquist); ?>/><label>N&atilde;o</label>
		<input name="esquist" type="radio" value="NA" onchange="savCampo('9')" <?php echo $esquist3 = $fachada->checkPOST("esquist", "NA", $linfo->esquist); ?>/><label>N&atilde;o Avaliado</label>
	</span>
  </fieldset>

<fieldset class="full">
	<legend id="lblexpag" <?php echo (isset($lblexpag) ? $lblexpag : '');?>>Exposi&ccedil;&atilde;o &agrave; Agentes T&oacute;xicos</legend>
	<span>
		<input name="agtox" type="radio" value="S" onclick="habilitaExpAgentTox(1);mudaLb(lblexpag)" onchange="savCampo('9')" <?php echo $agtox1; ?> /><label>Sim</label>
		<input name="agtox" type="radio" value="N" onclick="habilitaExpAgentTox(0);mudaLb(lblexpag)" onchange="savCampo('9')" <?php echo $agtox2; ?>/><label>N&atilde;o</label>
		<input name="agtox" type="radio" value="NA" onclick="habilitaExpAgentTox(0);mudaLb(lblexpag)"onchange="savCampo('9')" <?php echo $agtox3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
	<textarea class="txta1" name="tagtox" onkeyup="savCampo('9')" onfocus="mudaLb(lblexpag)" <?php echo $dagtox; ?>><?php echo $tagtox; ?></textarea>
</fieldset>

<fieldset class="full">
	<legend id="lblalgmed" <?php echo (isset($lblalgmed) ? $lblalgmed : ''); ?>>Alergia &agrave; Medicamento</legend>
	<span>
		<input name="alergmed" type="radio" value="S" onclick="habilitaAlergMed(1); mudaLb(lblalgmed)" onchange="savCampo('9')" <?php echo $alergmed1; ?>/><label>Sim</label>
		<input name="alergmed" type="radio" value="N" onclick="habilitaAlergMed(0); mudaLb(lblalgmed)" onchange="savCampo('9')" <?php echo $alergmed2; ?>/><label>N&atilde;o</label>
		<input name="alergmed" type="radio" value="NA" onclick="habilitaAlergMed(0); mudaLb(lblalgmed)" onchange="savCampo('9')" <?php echo $alergmed3; ?> /><label>N&atilde;o Avaliado</label>
	</span>
	<textarea class="txta1" name="talergmed" onkeyup="savCampo('9')" onfocus="mudaLb(lblalgmed)" <?php echo $dalergmed; ?>><?php echo $talergmed; ?></textarea>
</fieldset>

<fieldset style="width:46%">
	<legend>Contato com Tuberculose</legend>
	<span>
		<input name="ctuberc" type="radio" value="S" onchange="savCampo('9')" <?php echo $ctuberc1; ?>/><label>Sim</label>
		<input name="ctuberc" type="radio" value="N" onchange="savCampo('9')" <?php echo $ctuberc2; ?>/><label>N&atilde;o</label>
		<input name="ctuberc" type="radio" value="NA" onchange="savCampo('9')" <?php echo $ctuberc3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>

<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea class="txta1" name="obsoutinfo" onkeyup="savCampo('9')"><?php echo $obsoutinfo; ?></textarea>
</fieldset>