<?php
$limun = getValuesTablePr('imunizacoes',$pront);
$vacinas = SQLVacinas();
$dose = SQLDose();
$vacpac = SQLVacinasPaciente($pront);
?>
<table width="570" class="style5">
	<tr>
		<td>
		<fieldset><legend>Vacina&ccedil;&atilde;o</legend>
		<table width="500" align="center" class="style5">
			<tr align="center" class="style5">
				<td>Vacina</td>
				<td>Dose</td>
				<td>Data</td>
			</tr>
			<?php while ($lvacinas = mysql_fetch_array($vacpac)){?>
			<tr align="center" class="style5">
				<td><?php echo $lvacinas['vacina'];?></td>
				<td><?php echo $lvacinas['dose'];?></td>
				<td><?php echo printData($lvacinas['dt']);?></td>
				<td><img src="images/lixo.gif"
                        onclick="remove('<?php echo $lvacinas['vacina'];?>', '<?php echo $lvacinas['dose'];?>');" onmouseover="javascript:this.style.cursor='pointer'" alt = "Remover Vacina" /></td>
			</tr>
			<?php } ?>
		</table>
		<input type=hidden name="vacina" id="vacina" value="" /> <input
			type=hidden name="dose" id="dose" value="" /> <input type=hidden
			name="rVac" value="" id="rVac" /> <br />
		</fieldset>
		</td>
	</tr>

	<script>
           function remove(vacina,dose){
            
                document.getElementById("vacina").value=vacina;
                document.getElementById("dose").value = dose;
                document.getElementById("rVac").value = "RemoverVacina";
                document.getElementById("form_historico").submit();
             }
   
   </script>



	<tr>
		<td>
		<fieldset><legend id="lblnvac"
		<?php if ($errvac){ echo 'class="erro"'; }?>>Inserir Nova Vacina</legend>
		<table width="500" align="center" class="style5">
			<tr align="center" class="style5">
				<td>Vacina</td>
				<td>Dose</td>
				<td>Data</td>
			</tr>
			<tr align="center">
				<td><select name="vacinanome" onfocus="mudaLb(lblnvac)"
					onchange="savCampo('7')">
					<option value="0">Vacina</option>
					<?php while ($nvac = mysql_fetch_array($vacinas)){?>
					<option value="<?php echo $nvac['idVac']; ?>"
					<?php if ($nvac['idVac'] == $_POST['vacinanome']){ echo "SELECTED";} ?>><?php echo $nvac['vacina']; ?>
					</option>
					<?php } ?>
				</select></td>
				<td><select name="vacinadose" onfocus="mudaLb(lblnvac)"
					onchange="savCampo('7')">
					<option value="0">Dose</option>
					<?php while ($ndose = mysql_fetch_array($dose)){?>
					<option value="<?php echo $ndose['idDose']; ?>"
					<?php if ($ndose['idDose'] == $_POST['vacinadose']){
						echo "SELECTED";} ?>><?php echo $ndose['dose']; ?></option>
						<?php } ?>
				</select></td>
				<td><input name="datavacina" size="12" maxlength="10"
					onkeypress="mascara(this,2)" onfocus="mudaLb(lblnvac)"
					value="<?php echo $_POST['datavacina']; ?>" onkeyup="savCampo()" /></td>
			</tr>
		</table>
		<br />
		<div align="center" >
		<table cellspacing="10" class="style5">
			<tr align="center">
				<td> <input type="submit" value="Inserir Vacina" name="vac" /></td>
				<td><input type="button" value="Consultar Tabela de Vacinas"
					onclick="window.open('images/vacinas.gif','Tabela',  'height=338, width=700');" />
				</td>
			</tr>
		</table>
		</div>
		</fieldset>
		</td>
	</tr>
</table>


<table width="570" class="style5">
	<tr>
		<td>
		<fieldset><legend id="lblefcol"
		<?php if ($errim && !$linha->ass && $_POST['efeitcol'] == "")?>>
		Efeitos Colaterais</legend> <textarea name="efeitcol" cols="80"
			onfocus="mudaLb(lblefcol)" onkeyup="savCampo('7')"><?php echo printOBS($limun->efcol, $_POST['efeitcol']); ?></textarea>
		</fieldset>
		</td>
	</tr>
	<tr>
		<td>
		<fieldset style="width: 274px"><legend>Teste de Mantoux</legend> <input
			name="testmant" type="radio" value="S" onchange="savCampo('7')"
			<?php echo checkPOST("testmant", "S", $limun->testmant); ?> />Positivo
		<input name="testmant" type="radio" value="N" onchange="savCampo('7')"
		<?php echo checkPOST("testmant", "N", $limun->testmant); ?> />Normal <input
			name="testmant" type="radio" value="NA" onchange="savCampo('7')"
			<?php echo checkPOST("testmant", "NA", $limun->testmant); ?> />N&atilde;o
		Avaliado</fieldset>
		</td>
	</tr>
	<tr>
		<td>
		<fieldset><legend>Observa&ccedil;&otilde;es</legend> <textarea
			name="obsimun" cols="80" onkeyup="savCampo('7')"><?php echo printOBS($limun->obs, $_POST['obsimun']); ?></textarea>
		</fieldset>
		</td>
	</tr>
</table>
