<br />
<span class="style7">Pessoal > Imuniza&ccedil;&otilde;es</span>
<br />
<fieldset class="full">
	<legend>Vacina&ccedil;&atilde;o</legend>
	<table width="560" align="center">
		<tr class="style51">
			<td>Vacina</td>
			<td>Dose</td>
			<td>Data</td>
		</tr>
	<?php foreach ($vacpac as $lvac){?>
		<tr class="style51">
			<td><?php echo $lvac['vacina'];?></td>
			<td><?php echo $lvac['dose'];?></td>
			<td><?php echo $lvac['dt'];?></td>
			<td><input type="image" value="Remover Vacina" name="vac" src="images/lixo.gif" onclick="removerVacina('<?php echo $lvac['vacina'];?>', '<?php echo $lvac['dose'];?>');removerVacinaMod('<?php echo $lvac['vacina'];?>', '<?php echo $lvac['dose'];?>','vac');" /></td>
			<td id="tdVAC"><!--Aqui é adicionado o input: Confirmar ou Remover--></td>
		</tr>
	<?php } ?>
	</table>
	<input type=hidden name="vacina" id="vacina" value="" />
	<input type=hidden name="dose" id="dose" value="" />
	<br />
</fieldset>

<fieldset class="full">
<legend id="lblnvac" <?php if (isset($errvac)){ echo 'class="erro"'; }?>>Inserir Nova Vacina</legend>
	<table width="560" align="center">
		<tr class="style51">
			<td>Vacina</td>
			<td>Dose</td>
			<td>Data</td>
		</tr>
		<tr class="style51">
			<td>
				<select name="vacinanome" onfocus="mudaLb(lblnvac)" onchange="savCampo('7')">
					<option value="0">Vacina</option>
				<?php foreach ($vacinas as $nvac){
					if ($nvac['idVacina'] == (isset($_POST['vacinanome']) ? $_POST['vacinanome'] : '')) $sel = "SELECTED"; else $sel = ""; ?>
					<option value="<?php echo $nvac['idVacina']; ?>" <?php echo $sel; ?>><?php echo $nvac['vacina']; ?></option>
				<?php } ?>
				</select>
			</td>
			<td>
				<select name="vacinadose" onfocus="mudaLb(lblnvac)" onchange="savCampo('7')">
					<option value="0">Dose</option>
				<?php foreach ($dose as $doses){
					if ($doses['idDose'] == (isset($_POST['vacinadose']) ? $_POST['vacinadose'] : '')) $sel = "SELECTED"; else $sel = ""; ?>
					<option value="<?php echo $doses['idDose']; ?>" <?php echo $sel; ?>><?php echo $doses['dose']; ?></option>
				<?php } ?>
				</select>
			</td>
			<td>
				<input name="datavacina" size="12" maxlength="10" onkeypress="mascara(this,2)" onfocus="mudaLb(lblnvac)" value="<?php echo (isset($_POST['datavacina']) ? $_POST['datavacina'] : ''); ?>" onkeyup="savCampo()" />
				<label style="margin:3 0 0 10">(dd/mm/aaaa)<A HREF="#" onClick="cal19.select(document.forms[0].datavacina,'anchor19','dd/MM/yyyy'); return false;" TITLE="cal19.select(document.forms[0].datavacina,'anchor19','MM/dd/yyyy'); return false;" NAME="anchor19" ID="anchor19"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></A></label>
				<SCRIPT LANGUAGE="JavaScript" ID="js19">
				  var cal19 = new CalendarPopup();
				  cal19.showYearNavigation();
				  cal19.showYearNavigationInput();
				</SCRIPT>
				<SCRIPT LANGUAGE="JavaScript">writeSource("js19");</SCRIPT>
			</td>
		</tr>
	</table>
	<br />
	<div align="center" >
	<table cellspacing="10" class="style5">
		<tr align="center">
			<td> <input type="submit" value="Inserir Vacina" name="vac" /></td>
			<td><input type="button" value="Consultar Tabela de Vacinas"
				onclick="window.open('images/vacinas.gif','Tabelas','height=338, width=700');" />
			</td>
		</tr>
	</table>
	</div>
</fieldset>

<fieldset class="full">
	<legend id="lblefcol">Efeitos Colaterais</legend>
	<textarea class="txta1" name="efeitcol" onfocus="mudaLb(lblefcol)" onkeyup="savCampo('7')"><?php echo $efeitcol; ?></textarea>
</fieldset>

<fieldset style="width:46%">
	<legend>Teste de Mantoux</legend>
	<span>
		<input name="testmant" type="radio" value="P" onchange="savCampo('7')" <?php echo $testmant1; ?> /><label>Positivo</label>
		<input name="testmant" type="radio" value="N" onchange="savCampo('7')" <?php echo $testmant2; ?> /><label>Normal</label>
		<input name="testmant" type="radio" value="NA" onchange="savCampo('7')" <?php echo $testmant3; ?> /><label>N&atilde;o Avaliado</label>
	</span>
</fieldset>

<fieldset class="full">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea class="txta1" name="obsimun" onkeyup="savCampo('7')"><?php echo $obsimun; ?></textarea>
</fieldset>