<?php
	$linfo = getValuesTablePr('outrasinformacoes',$pront);
?>

<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Pessoal > Outras Informa&ccedil;&otilde;es</td>
    	
    </tr>
</table>
<br/>
<table width="570" class="style5">
	<tr>
   		<td width="274"><fieldset style="width:274px">
   	  		<legend>Epidemiologia  Para Doen&ccedil;a de Chagas</legend>
      		<input name="doenchag" type="radio" value="S" onchange="savCampo('9')"  
	  			<?php echo checkPOST("doenchag", "S", $linfo->chagas); ?>/>Sim
      		<input name="doenchag" type="radio" value="N" onchange="savCampo('9')" 
				<?php echo checkPOST("doenchag", "N", $linfo->chagas); ?>/>N&atilde;o
      		<input name="doenchag" type="radio" value="NA" onchange="savCampo('9')" 
				<?php echo checkPOST("doenchag", "NA", $linfo->chagas); ?>/>N&atilde;o Avaliado
    	</fieldset></td>
    	<td width="284"><fieldset>
      		<legend>Epidemiologia  Para Esquistossomose</legend>
      		<input name="doenesq" type="radio" value="S" onchange="savCampo('9')"  
				<?php echo checkPOST("doenesq", "S", $linfo->esquist); ?>/>Sim
      		<input name="doenesq" type="radio" value="N" onchange="savCampo('9')" 
				<?php echo checkPOST("doenesq", "N", $linfo->esquist); ?>/>N&atilde;o
      		<input name="doenesq" type="radio" value="NA" onchange="savCampo('9')" 
				<?php echo checkPOST("doenesq", "NA", $linfo->esquist); ?>/>N&atilde;o Avaliado
	  </fieldset></td>
  	</tr>
  	<tr>
  	  	<td colspan="2"><fieldset>
			<legend id="lblexpag" <?php if ($erroi && $_POST['expagtox'] == "S" && $_POST['texpagtox'] == "") echo 'class="erro"';
				?>>Exposi&ccedil;&atilde;o &agrave; Agentes T&oacute;xicos</legend>
			<input name="expagtox" type="radio" value="S" onclick="habilitaExpAgentTox(1);mudaLb(lblexpag)" onchange="savCampo('9')"  				<?php echo checkPOST("expagtox", "S", $linfo->agtox); ?> />Sim
			<input name="expagtox" type="radio" value="N" onclick="habilitaExpAgentTox(0);mudaLb(lblexpag)" onchange="savCampo('9')"	
				<?php echo checkPOST("expagtox", "N", $linfo->agtox); ?>/>N&atilde;o
			<input name="expagtox" type="radio" value="NA" onclick="habilitaExpAgentTox(0);mudaLb(lblexpag)"onchange="savCampo('9')"	
				<?php echo checkPOST("expagtox", "NA", $linfo->agtox); ?>/>N&atilde;o Avaliado
			<br />
			<textarea name="texpagtox" cols="70" onkeyup="savCampo('9')" onfocus="mudaLb(lblexpag)" <?php echo checkDisable("expagtox", $linfo->agtox, "S"); ?>><?php echo printOBS($linfo->tagtox, $_POST['texpagtox']); ?></textarea>
		</fieldset></td>
  	</tr>
	<tr>
  		<td colspan="2"><fieldset>
			<legend id="lblalgmed" <?php if ($erroi && $_POST['alergmed'] == "S" && $_POST['talergmed'] == "")echo 'class="erro"';  
				?>>Alergia &agrave; Medicamento</legend>
			<input name="alergmed" type="radio" value="S" onclick="habilitaAlergMed(1); mudaLb(lblalgmed)" onchange="savCampo('9')"
				<?php echo checkPOST("alergmed", "S", $linfo->alergmed); ?>/>Sim
			<input name="alergmed" type="radio" value="N" onclick="habilitaAlergMed(0); mudaLb(lblalgmed)" onchange="savCampo('9')"
				<?php echo checkPOST("alergmed", "N", $linfo->alergmed); ?>/>N&atilde;o
			<input name="alergmed" type="radio" value="NA" onclick="habilitaAlergMed(0); mudaLb(lblalgmed)" onchange="savCampo('9')"
				<?php echo checkPOST("alergmed", "NA", $linfo->alergmed); ?> />N&atilde;o Avaliado
			<br />
			<textarea name="talergmed" cols="70" onkeyup="savCampo('9')" onfocus="mudaLb(lblalgmed)" <?php echo checkDisable("alergmed", $linfo->alergmed, "S"); ?>><?php echo printOBS($linfo->talergmed, $_POST['talergmed']); ?></textarea>
		</fieldset></td>
  	</tr>
  	<tr>
    	<td colspan="2"><fieldset style="width:274px">
			<legend>Contato com Tuberculose</legend>
			<input name="conttuberc" type="radio" value="S" onchange="savCampo('9')" 
				<?php echo checkPOST("conttuberc", "S", $linfo->conttub); ?>/>Sim 
			<input name="conttuberc" type="radio" value="N" onchange="savCampo('9')" 
				<?php echo checkPOST("conttuberc", "N", $linfo->conttub); ?>/>N&atilde;o
			<input name="conttuberc" type="radio" value="NA" onchange="savCampo('9')" 
				<?php echo checkPOST("conttuberc", "NA", $linfo->conttub); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
  	<tr>
  	  	<td colspan="2"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
			<textarea name="obsoutinfo" cols="70" onkeyup="savCampo('9')"><?php echo printOBS($linfo->obs, $_POST['obsoutinfo']); ?></textarea>
		</fieldset></td>
  	</tr>
</table>




