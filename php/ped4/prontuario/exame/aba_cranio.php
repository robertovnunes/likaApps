<?php
	$lcr = getValuesTableAt('examecranio',$atend);
	include("verAssEx.php");
?>
<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Exame Físico > Especial > Cr&acirc;nio</td>
    </tr>
</table>

<br />
<table width="580">
	<tr>
   		<td width="275"><fieldset style="width:275">
      		<legend>Tamanho</legend>
      		<select name="tamcr" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('6')">
            	<option value="N" <?php echo checkOption("tamcr", "N", $lcr->tam); ?>>Normal</option>
            	<option value="A" <?php echo checkOption("tamcr", "A", $lcr->tam); ?>>Alterado</option>
            	<option value="NA" <?php echo checkOption("tamcr", "NA", $lcr->tam); ?>>N&atilde;o Avaliado</option>
            </select>
    	</fieldset></td>
    	<td width="293"><fieldset>
      		<legend>Forma</legend>
      		<select name="formcr" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('6')">
            	<option value="N" <?php echo checkOption("formcr", "N", $lcr->forma); ?>>Normal</option>
            	<option value="A" <?php echo checkOption("formcr", "A", $lcr->forma); ?>>Alterada</option>
            	<option value="NA" <?php echo checkOption("formcr", "NA", $lcr->forma); ?>>N&atilde;o Avaliado</option>
            </select>
    	</fieldset></td>
	</tr>
	<tr>
   		<td><fieldset>
      		<legend>Fontanelas (tamanho e tens&atilde;o)</legend>
      		<select name="fontan" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('6')">
            	<option value="N" <?php echo checkOption("fontan", "N", $lcr->fontan); ?>>Normais</option>
            	<option value="A" <?php echo checkOption("fontan", "A", $lcr->fontan); ?>>Alteradas</option>
            	<option value="NA" <?php echo checkOption("fontan", "NA", $lcr->fontan); ?>>N&atilde;o Avaliado</option>
            </select>
    	</fieldset></td>
    	<td><fieldset>
      		<legend>Suturas</legend>
      		<input name="sutu" type="radio" value="P" onchange="savCampo('6')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("sutu", "P", $lcr->sutu); ?>/>Presentes
      		<input name="sutu" type="radio" value="A" onchange="savCampo('6')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("sutu", "A", $lcr->sutu); ?>/>Ausentes
      		<input name="sutu" type="radio" value="NA" onchange="savCampo('6')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("sutu", "NA", $lcr->sutu); ?>/>N&atilde;o Avaliado
    	</fieldset></td>
	</tr>
	<tr>
   		<td><fieldset>
      		<legend>Craneotabes</legend>
      		<input name="craneo" type="radio" value="S" onchange="savCampo('6')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("craneo", "S", $lcr->craneo);?>/>Sim
      		<input name="craneo" type="radio" value="N" onchange="savCampo('6')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("craneo", "N", $lcr->craneo);?>/>N&atilde;o
      		<input name="craneo" type="radio" value="NA" onchange="savCampo('6')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("craneo", "NA", $lcr->craneo);?>/>N&atilde;o Avaliado
    	</fieldset></td>
    	<td><fieldset>
      		<legend>Cabelos</legend>
      		<input name="cabelo" type="radio" value="P" onchange="savCampo('6')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("cabelo", "P", $lcr->cabelo); ?>/>Presentes
      		<input name="cabelo" type="radio" value="A" onchange="savCampo('6')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("cabelo", "A", $lcr->cabelo); ?>/>Ausentes
      		<input name="cabelo" type="radio" value="NA" onchange="savCampo('6')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("cabelo", "NA", $lcr->cabelo); ?>/>N&atilde;o Avaliado
    	</fieldset></td>
	</tr>
	<tr>
   		<td colspan="2"><fieldset style="width:275px">
      		<legend>Les&otilde;es de Couro Cabeludo</legend>
      		<input name="lescab" type="radio" value="S" onchange="savCampo('6')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("lescab", "S", $lcr->lescab);?>/>Sim
      		<input name="lescab" type="radio" value="N" onchange="savCampo('6')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("lescab", "N", $lcr->lescab);?>/>N&atilde;o
      		<input name="lescab" type="radio" value="NA" onchange="savCampo('6')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("lescab", "NA", $lcr->lescab);?>/>N&atilde;o Avaliado
    	</fieldset></td>
   	</tr>
	<tr>
  		<td colspan="2"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
        	<textarea name="obscran" cols="68" onkeyup="savCampo('6')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>
				><?php echo printOBS($lcr->obs, $_POST['obscran']); ?></textarea>
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
