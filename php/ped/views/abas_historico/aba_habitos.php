<br />
<span class="style7">Pessoal > H&aacute;bitos</span>
<br />
<fieldset style="width:46%">
	<legend>Chupeta</legend>
	<span>
		<input name="chupeta" type="radio" value="S" onchange="savCampo('6')" <?php echo $chupeta1; ?>/><label>Sim</label>
		<input name="chupeta" type="radio" value="N" onchange="savCampo('6')" <?php echo $chupeta2; ?>/><label>N&atilde;o</label>
		<input name="chupeta" type="radio" value="NA" onchange="savCampo('6')" <?php echo $chupeta3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Chupa Dedo</legend>
	<span>
		<input name="chupadedo" type="radio" value="S" onchange="savCampo('6')" <?php echo $chupadedo1; ?> /><label>Sim</label>
		<input name="chupadedo" type="radio" value="N" onchange="savCampo('6')" <?php echo $chupadedo2; ?>/><label>N&atilde;o</label>
		<input name="chupadedo" type="radio" value="NA" onchange="savCampo('6')" <?php echo $chupadedo3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>

<fieldset style="width:46%">
	<legend>R&oacute;i Unhas</legend>
	<span>
		<input name="roiunha" type="radio" value="S" onchange="savCampo('6')" <?php echo $roiunha1; ?>/><label>Sim</label>
		<input name="roiunha" type="radio" value="N" onchange="savCampo('6')" <?php echo $roiunha2; ?>/><label>N&atilde;o</label>
		<input name="roiunha" type="radio" value="NA" onchange="savCampo('6')" <?php echo $roiunha3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Tiques</legend>
	<span>
		<input name="tique" type="radio" value="S" onchange="savCampo('6')" <?php echo $tique1; ?>/><label>Sim</label>
		<input name="tique" type="radio" value="N" onchange="savCampo('6')" <?php echo $tique2; ?>/><label>N&atilde;o</label>
		<input name="tique" type="radio" value="NA" onchange="savCampo('6')" <?php echo $tique3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>

<fieldset style="width:46%">
	<legend>Altera&ccedil;&otilde;es na Alimenta&ccedil;&atilde;o</legend>
	<span>
		<input name="altalim" type="radio" value="S" onchange="savCampo('6')" <?php echo $altalim1; ?>/><label>Sim</label>
		<input name="altalim" type="radio" value="N" onchange="savCampo('6')" <?php echo $altalim2; ?>/><label>N&atilde;o</label>
		<input name="altalim" type="radio" value="NA" onchange="savCampo('6')" <?php echo $altalim3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Geofagia</legend>
	<span>
		<input name="geofagia" type="radio" value="S" onchange="savCampo('6')" <?php echo $geofagia1; ?>/><label>Sim</label>
		<input name="geofagia" type="radio" value="N" onchange="savCampo('6')" <?php echo $geofagia2; ?>/><label>N&atilde;o</label>
		<input name="geofagia" type="radio" value="NA" onchange="savCampo('6')" <?php echo $geofagia3; ?> onchange="savCampo('6')"/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>

<fieldset style="width:46%">
	<legend>Enurese</legend>
	<span>
		<input name="enurese" type="radio" value="S" onchange="savCampo('6')" <?php echo $enurese1; ?>/><label>Sim</label>
		<input name="enurese" type="radio" value="N" onchange="savCampo('6')" <?php echo $enurese2; ?>/><label>N&atilde;o</label>
		<input name="enurese" type="radio" value="NA" onchange="savCampo('6')" <?php echo $enurese3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>
<fieldset style="width:46%">
	<legend>Perturba&ccedil;&otilde;es  do Sono</legend>
	<span>
		<input name="pertsono" type="radio" value="S" onchange="savCampo('6')" <?php echo $pertsono1; ?>/><label>Sim</label>
		<input name="pertsono" type="radio" value="N" onchange="savCampo('6')" <?php echo $pertsono2; ?>/><label>N&atilde;o</label>
		<input name="pertsono" type="radio" value="NA" onchange="savCampo('6')" <?php echo $pertsono3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>

<fieldset style="width:46%">
	<legend>Dorme na Cama dos Pais</legend>
	<span>
		<input name="dormepais" type="radio" value="S" onchange="savCampo('6')" <?php echo $dormepais1; ?>/><label>Sim</label>
		<input name="dormepais" type="radio" value="N" onchange="savCampo('6')" <?php echo $dormepais2; ?>/><label>N&atilde;o</label>
		<input name="dormepais" type="radio" value="NA" onchange="savCampo('6')" <?php echo $dormepais3; ?>/><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>

<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea class="txta1" name="obshab" onkeyup="savCampo('6')"><?php echo $obshab; ?></textarea>
</fieldset>