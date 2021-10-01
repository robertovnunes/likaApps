<?php
	$leolh = getValuesTableAt('exameolhos',$atend);
	include("verAssEx.php");
?>
<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Exame Físico > Especial > Olhos</td>
    </tr>
</table>

<br />
<table width="580">
	<tr>
   		<td width="275"><fieldset style="width:275">
      		<legend>Ptose</legend>
      		<input name="ptose" type="radio" value="S" onchange="savCampo('7')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("ptose", "S", $leolh->ptose);?> />Sim
      		<input name="ptose" type="radio" value="N" onchange="savCampo('7')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("ptose", "N", $leolh->ptose);?>/>N&atilde;o
      		<input name="ptose" type="radio" value="NA" onchange="savCampo('7')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("ptose", "NA", $leolh->ptose);?>/>N&atilde;o Avaliado
    	</fieldset></td>
    	<td width="293"><fieldset>
      		<legend>Edema Palpebral</legend>
      		<input name="edpalp" type="radio" value="S" onchange="savCampo('7')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("edpalp", "S", $leolh->edpalp); ?>/>Sim
      		<input name="edpalp" type="radio" value="N" onchange="savCampo('7')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("edpalp", "N", $leolh->edpalp); ?>/>N&atilde;o
      		<input name="edpalp" type="radio" value="NA" onchange="savCampo('7')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("edpalp", "NA", $leolh->edpalp); ?>/>N&atilde;o Avaliado
    	</fieldset></td>
	</tr>
	<tr>
		<td colspan="2"><fieldset>
			<legend>Escler&oacute;ticas e conjuntiva</legend>
			<table width="557">
			<tr>
				<td width="276"><fieldset>
					<legend>Cor</legend>
					<select name="corol" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('7')">
						<option value="B" <?php echo checkOption("corol", "B", $leolh->cor); ?>>Branca</option>
						<option value="A" <?php echo checkOption("corol", "A", $leolh->cor); ?>>Amarela</option>
						<option value="NA" <?php echo checkOption("corol", "NA", $leolh->cor); ?>>N&atilde;o Avaliado</option>
					</select>
			  </fieldset></td>
				<td width="276"><fieldset>
					<legend>Hemorragias</legend>
					<input name="hemorol" type="radio" value="S" onchange="savCampo('7')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("hemorol", "S", $leolh->hemor); ?>/>Sim
					<input name="hemorol" type="radio" value="N" onchange="savCampo('7')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("hemorol", "N", $leolh->hemor); ?>/>N&atilde;o
					<input name="hemorol" type="radio" value="NA" onchange="savCampo('7')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("hemorol", "NA", $leolh->hemor); ?>/>N&atilde;o Avaliado
			  </fieldset></td>
			</tr>
			<tr>
				<td><fieldset>
					<legend>Secre&ccedil;&atilde;o</legend>
					<select name="secrol" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('7')">
					  <option value="N" <?php echo checkOption("secrol", "N", $leolh->secr); ?>>N&atilde;o</option>
					  <option value="SP" <?php echo checkOption("secrol", "SP", $leolh->secr); ?>>Sim, purulenta</option>
					  <option value="SH" <?php echo checkOption("secrol", "SH", $leolh->secr); ?>>Sim, hialina</option>
					  <option value="NA" <?php echo checkOption("secrol", "NA", $leolh->secr); ?>>N&atilde;o Avaliado</option>
					</select>
				</fieldset></td>
				<td><fieldset>
					<legend>Inflama&ccedil;&atilde;o</legend>
					<input name="inflol" type="radio" value="P" onchange="savCampo('7')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("inflol", "P", $leolh->inflam); ?>/>Presente
					<input name="inflol" type="radio" value="A" onchange="savCampo('7')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("inflol", "A", $leolh->inflam); ?>/>Ausente
					<input name="inflol" type="radio" value="NA" onchange="savCampo('7')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("inflol", "NA", $leolh->inflam); ?>/>N&atilde;o Avaliado
				</fieldset></td>
			</tr>
			<tr>
				<td><fieldset>
					<legend>C&iacute;lios</legend>
					<input name="cilios" type="radio" value="P" onchange="savCampo('7')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("cilios", "P", $leolh->cilios);?>/>Presentes
					<input name="cilios" type="radio" value="A" onchange="savCampo('7')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("cilios", "A", $leolh->cilios);?>/>Ausentes
					<input name="cilios" type="radio" value="NA" onchange="savCampo('7')" <?php if(EXAssinado($atend)) echo " disabled=true ";
						echo checkPOST("cilios", "NA", $leolh->cilios);?>/>N&atilde;o Avaliado
				</fieldset></td>
				<td><fieldset>
					<legend>Movimentos Oculares Anormais</legend>
					<select name="movocan" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('7')">
						<option value="A" <?php echo checkOption("movocan", "A", $leolh->movoc); ?>>Ausentes</option>
						<option value="E" <?php echo checkOption("movocan", "E", $leolh->movoc); ?>>Estrabismo</option>
						<option value="N" <?php echo checkOption("movocan", "N", $leolh->movoc); ?>>Nistagmo</option>
						<option value="NA" <?php echo checkOption("movocan", "NA", $leolh->movoc); ?>>N&atilde;o Avaliado</option>
					</select>
				</fieldset></td>
			</tr>
			<tr>
				<td><fieldset>
					<legend>Pupilas</legend>
					<select name="pupila" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('7')">
						<option value="NL" <?php echo checkOption("pupila", "NL", $leolh->pupila); ?>>Normais, reativas &agrave; luz
						</option>
						<option value="OL" <?php echo checkOption("pupila", "OL", $leolh->pupila); ?>>Opacas, reativas &agrave; luz
						</option>
						<option value="NN" <?php echo checkOption("pupila", "NN", $leolh->pupila); ?>>Normais, n&atilde;o reativas
						</option>
						<option value="LN" <?php echo checkOption("pupila", "LN", $leolh->pupila); ?>>Opacas, n&atilde;o reativas
						</option>
						<option value="NA" <?php echo checkOption("pupila", "NA", $leolh->pupila); ?>>N&atilde;o Avaliado</option>
					</select>
				</fieldset></td>
				<td><fieldset>
					<legend>Acuidade visual</legend>
					<select name="acvis" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('7')">
					  <option value="S" <?php echo checkOption("acvis", "S", $leolh->acvis); ?>>Sim</option>
					  <option value="NS" <?php echo checkOption("acvis", "NS", $leolh->acvis); ?>>N&atilde;o, sem lentes corretivas
					  </option>
					  <option value="NL" <?php echo checkOption("acvis", "NL", $leolh->acvis); ?>>N&atilde;o, com lentes corretivas
					  </option>
					  <option value="NA" <?php echo checkOption("acvis", "NA", $leolh->acvis); ?>>N&atilde;o Avaliado</option>
					</select>
				</fieldset></td>
		</tr></table>
	</fieldset>	</tr>
	<tr>
  		<td colspan="2"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
        	<textarea name="obsolho" cols="68" onkeyup="savCampo('7')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>
				><?php echo printOBS($leolh->obs, $_POST['obsolho']); ?></textarea>
	  </fieldset>
		<?php 
		if ($linha->ass) { ?>
<fieldset><legend> Assinatura</legend>	<?php 
		
			echo "<table ><tr><td><font size='2' face='Trebuchet MS' color='#666666'>".  getNomeAluno($linha->idAlun)." - ".printData($linha->dthr)." - ".
		printHora($linha->dthr)."</font></td></tr></table>";?></fieldset> <?php } ?>
<?php
include("functions/funcoesimpressoes.php");
printAdendoEX($atend); ?>
		</td>
	</tr>
</table>
