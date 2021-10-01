<br />
<span class="style7">Pessoal > Pr&eacute;-Natal</span>
<br />
<div style="float:left;width:70%">
	<fieldset style="width:95%">
		<legend>Acompanhamento M&eacute;dico</legend>
		<div><span>
			<input name="acpmed" type="radio" value="S" onclick="habilitaAcompMedico(1)" onchange="savCampo('1')" <?php echo $acpmed1; ?>/><label>Sim</label>
			<input name="acpmed" type="radio" value="N" onclick="habilitaAcompMedico(0)" onchange="savCampo('1')" <?php echo $acpmed2; ?>/><label>N&atilde;o</label>
			<input name="acpmed" type="radio" value="NA" onclick="habilitaAcompMedico(0)" onchange="savCampo('1')" <?php echo $acpmed3; ?>/><label>N&atilde;o Avaliado</label>
		</span></div>
		<div style="clear:both"></div>
		<div style="float:left;margin-top:5px">
			<label id="lbLMed" class="labdir labtop<?php echo (isset($lblmed) ? $lblmed : ''); ?>">Local:</label>
			<input name="lacpmed" size="45" maxlength="40" onfocus="mudaLb(lbLMed)" onkeyup="savCampo('1')" value="<?php echo $lacpmed; ?>" <?php echo $dacpmed; ?>/>
		</div>
		<div style="float:left;margin-top:5px">
			<label id="lbNCons" class="labdir2">N&ordm; de Consultas:</label>
			<select name="nacpmed" onchange="savCampo('1')" <?php echo $dacpmed; ?>>
				<option value='+6' <?php echo $nacpmed1; ?>>Mais de 6</option>
				<option value='-6' <?php echo $nacpmed2; ?>>Menos de 6</option>
				<option value='NA' <?php echo $nacpmed3; ?>>N&atilde;o Avaliado</option>
			</select>
		</div>
	</fieldset>
</div>
<div style="float:left;width:30%">
	<fieldset style="width:94%">
		<legend>Dura&ccedil;&atilde;o da Gesta&ccedil;&atilde;o </legend>
		<select name="durgest" onchange="savCampo('1')">
			<option value='PrT' <?php echo $durgest1; ?>>Pr&eacute;-Termo</option>
			<option value='T' <?php echo $durgest2; ?>>Termo</option>
			<option value='PoT' <?php echo $durgest3; ?>>P&oacute;s-Termo</option>
			<option value='NA' <?php echo $durgest4; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<div style="height:55px"></div>
	<fieldset style="width:94%">
		<legend>Grupo Sangu&iacute;neo da M&atilde;e</legend>
		<select name="sangmae" onchange="savCampo('1')">
			<option value='NA' <?php echo $sangmae1; ?>>N&atilde;o Avaliado</option>
		<?php foreach ($sang as $s){
			$sangmaex = $fachada->checkOption("sangmae",$s['idSang'],$lpnat->idSang) ?>
			<option value="<?php echo $s['idSang']; ?>" <?php echo $sangmaex;?>><?php echo $s['tipo']; ?></option>
		<?php } ?>
		</select>
	</fieldset>
</div>
<div style="clear:both"></div>
<fieldset class="full">
	<legend>Testes Sorol&oacute;gicos (CID-10)</legend>
	<fieldset class="fieldTam1" style="margin-left:30px;width:42%">
		<legend>Z21 (HIV Positivo)</legend>
		<select name="z21" onchange="savCampo('1')">
			<option value='P1' <?php echo $z211; ?>>Positivo, 1&ordm; trimestre</option>
			<option value='P2' <?php echo $z212; ?>>Positivo, 2&ordm; trimestre</option>
			<option value='P3' <?php echo $z213; ?>>Positivo, 3&ordm; trimestre</option>
			<option value='N' <?php echo $z214; ?>>Negativo</option>
			<option value='NA' <?php echo $z215; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset class="fieldTam1" style="width:42%">
		<legend>A53 (S&iacute;filis)</legend>
		<select name="a53" onchange="savCampo('1')">
			<option value='P1' <?php echo $a531; ?>>Positivo, 1&ordm; trimestre</option>
			<option value='P2' <?php echo $a532; ?>>Positivo, 2&ordm; trimestre</option>
			<option value='P3' <?php echo $a533; ?>>Positivo, 3&ordm; trimestre</option>
			<option value='N' <?php echo $a534; ?>>Negativo</option>
			<option value='NA' <?php echo $a535; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset class="fieldTam1" style="margin-left:30px;width:42%">
		<legend>B18 (Hepatite Viral)</legend>
		<select name="b18" onchange="savCampo('1')">
			<option value='P1' <?php echo $b181; ?>>Positivo, 1&ordm; trimestre</option>
			<option value='P2' <?php echo $b182; ?>>Positivo, 2&ordm; trimestre</option>
			<option value='P3' <?php echo $b183; ?>>Positivo, 3&ordm; trimestre</option>
			<option value='N' <?php echo $b184; ?>>Negativo</option>
			<option value='NA' <?php echo $b185; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
	<fieldset class="fieldTam1" style="width:42%">
		<legend>B58 (Toxoplasmose)</legend>
		<select name="b58" onchange="savCampo('1')">
			<option value='P1' <?php echo $b581; ?>>Positivo, 1&ordm; trimestre</option>
			<option value='P2' <?php echo $b582; ?>>Positivo, 2&ordm; trimestre</option>
			<option value='P3' <?php echo $b583; ?>>Positivo, 3&ordm; trimestre</option>
			<option value='N' <?php echo $b584; ?>>Negativo</option>
			<option value='NA' <?php echo $b585; ?>>N&atilde;o Avaliado</option>
		</select>
	</fieldset>
</fieldset>

<fieldset style="width:46%">
	<legend>Imuniza&ccedil;&otilde;es da M&atilde;e</legend>
	<select name="imunizmae" onchange="savCampo('1')">
		<option value='EC' <?php echo $imunizmae1; ?>>Esquema Completo</option>
		<option value='EI' <?php echo $imunizmae2; ?>>Esquema Incompleto</option>
		<option value='NR' <?php echo $imunizmae3; ?>>N&atilde;o Realizou</option>
		<option value='NA' <?php echo $imunizmae4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>
<fieldset style="width:46%">
	<legend>Exames com Radia&ccedil;&atilde;o Ionizante</legend>
	<select name="exradion" onchange="savCampo('1')">
		<option value='1T' <?php echo $exradion1; ?>>Sim, durante o 1&ordm; trimestre</option>
		<option value='GR' <?php echo $exradion2; ?>>Sim, durante a gravidez</option>
		<option value='N' <?php echo $exradion3; ?>>N&atilde;o</option>
		<option value='NA' <?php echo $exradion4; ?>>N&atilde;o Avaliado</option>
	</select>
</fieldset>

<fieldset class="full">
	<legend id="lbMedic" <?php if (isset($_POST['$lbMedic'])) echo $lbMedic; ?>>Medica&ccedil;&otilde;es</legend>
	<textarea class="txta1" name="medic" onkeyup="savCampo('1')" onfocus="mudaLb(lbMedic)"><?php echo $medic; ?></textarea>
</fieldset>

<fieldset class="full">
	<legend id="lbAnorm" <?php $lbAnorm; ?>>Anormalidades</legend>
	<textarea class="txta1" name="anorm" onkeyup="savCampo('1')" onfocus="mudaLb(lbAnorm)" ><?php echo $anorm; ?></textarea>
</fieldset>

<fieldset class="full">
	<legend>Doen&ccedil;as Cir&uacute;rgicas</legend>
	<select name="doencir" onchange="savCampo('1');habilitaCirurgia(this.selectedIndex);">
		<option value='NT' <?php echo $doencir1; ?>>N&atilde;o teve</option>
		<option value='1T' <?php echo $doencir2; ?>>No 1&ordm; trimestre</option>
		<option value='2T' <?php echo $doencir3; ?>>No 2&ordm; trimestre</option>
		<option value='3T' <?php echo $doencir4; ?>>No 3&ordm; trimestre ou posterior</option>
		<option value='NA' onclick="habilitaCirurgia(0)" <?php echo $doencir5; ?>>N&atilde;o Avaliado</option>
	</select>
	<br /><br />
	<label id="lbCirug" <?php if (isset($_POST['$lbCirug'])) echo $lbCirug; ?>>Cirurgias:</label>
	<textarea class="txta1" name="cirurgdc" id="cirurgdc" cols="71" onkeyup="savCampo('1')" onfocus="mudaLb(lbCirug)" <?php echo $ddoencir; ?>><?php echo $cirurgdc; ?></textarea>
</fieldset>

<fieldset class="full">
	<legend>Estado Nutricional Durante a Gravidez</legend>
	<div style="float:left">
		<label class="labdir1">Peso na Gravidez (Kg):</label>
		<input name="pesograv" size="5" maxlength="4" onkeyup="savCampo('1')" onfocus="mudaLb(lblpesgr)" value="<?php echo $pesograv; ?>" />
	</div>
	<div style="float:left;margin-top:2px">
		<label class="labdir2">Anemia:</label>
		<span>
			<input name="anemia" type="radio" value="S" onchange="savCampo('1')" <?php echo $anemia1; ?>/><label>Sim</label>
			<input name="anemia" type="radio" value="N" onchange="savCampo('1')" <?php echo $anemia2; ?>/><label>N&atilde;o</label>
			<input name="anemia" type="radio" value="NA" onchange="savCampo('1')" <?php echo $anemia3; ?>/><label>N&atilde;o Avaliado</label>
		</span>
	</div>
	<div style="clear:both">
		<label class="labdir1">Alimenta&ccedil;&atilde;o:</label>
		<select style="margin-top:5px" name="alimgrav" onchange="savCampo('1')">
			<option value='B' <?php echo $alimgrav1; ?>>Boa (Normal)</option>
			<option value='R' <?php echo $alimgrav2; ?>>Ruim (Normal)</option>
			<option value='E' <?php echo $alimgrav3; ?>>Excesso</option>
			<option value='F' <?php echo $alimgrav4; ?>>Falta</option>
			<option value='NA' <?php echo $alimgrav5; ?>>N&atilde;o Avaliado</option>
		</select>
	</div>
	<div style="clear:both"></div>
</fieldset>

<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea class="txta1" name="obsprenat" onkeyup="savCampo('2')"><?php echo $obsprenat; ?></textarea>
</fieldset>