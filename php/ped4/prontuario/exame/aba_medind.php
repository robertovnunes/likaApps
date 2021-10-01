<?php
	$medind = getValuesTableAt('medind',$atend);
	include("verAssEx.php");
?>
<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Exame F&iacute;sico > Antropometria > Medidas e &iacute;ndices</td>
    </tr>
</table>

<br />
<table width="580">

	<tr> 
    <td>
<fieldset style="width:200px;">   
   
    	<legend> Peso </legend>
    	<select name="pesomed" onChange="savCampo('M')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>  >
				<option value="NA" <?php echo checkOption("pesomed", "NA", $medind->peso); ?>  onclick="habilitaPesoMedind(0)">N&atilde;o Avaliado</option>
				<option value="AV" <?php echo checkOption("pesomed", "AV", $medind->peso); ?> onclick="habilitaPesoMedind(1)">Valor</option>
				
			</select> 
                 
			<input name="pesomedin" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('M')" size="3" maxlength="3" value="<?php echo printOBS($medind->pesoin, $_POST['pesomedin']); ?>"  <?php echo checkDisable("pesomed", $medind->peso, "AV"); ?> /> kg 
   
        </fieldset>
        </td>
        <td>
        <fieldset style="width:200px;">   
   
    	<legend> Altura </legend>
    	<select name="alturamed" onChange="savCampo('M')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>>
				<option value="NA" <?php echo checkOption("alturamed", "NA", $medind->altura); ?>   onclick="habilitaAlturaMedind(0)">N&atilde;o Avaliado</option>
				<option value="AV" <?php echo checkOption("alturamed", "AV", $medind->altura); ?>  onclick="habilitaAlturaMedind(1)">Valor</option>
				
			</select> 
            
   
            
			<input name="alturamedin" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('M')" size="3" maxlength="3" value="<?php echo printOBS($medind->alturain, $_POST['alturamedin']); ?>" <?php echo checkDisable("alturamed", $medind->altura, "AV"); ?> /> cm 
   
        </fieldset>
    </td>
    </tr> 
	<tr>
   		<td width="45">
        
        	<fieldset>
			<legend>Per&iacute;metro Cef&aacute;lico</legend>
			<input name="permcef" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('M')" size="3" maxlength="3" value="<?php echo printOBS($medind->permcef, $_POST['permcef']); ?>" /> cm 	</fieldset></td>
        <td width="45"><fieldset>  	
            <legend>Per&iacute;metro Tor&aacute;cico</legend>
			<input name="permtora" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('M')" size="3" maxlength="3" value="<?php echo printOBS($medind->permtora, $_POST['permtora']); ?>" /> cm 	</fieldset></td>  
		<td width="45"><fieldset>
            <legend>Per&iacute;metro Abdominal</legend>
			<input name="permab" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('M')" size="3" maxlength="3" value="<?php echo printOBS($medind->permab, $_POST['permab']); ?>" /> cm 	</fieldset></td>  
            
            
  		
  	</tr>
  	<tr>
    <td width="45"><fieldset>
            <legend>Prega Tricipial</legend>
			<input name="pregatric" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('M')" size="3" maxlength="3" value="<?php echo printOBS($medind->pregatric, $_POST['pregatric']); ?>" /> cm 	</fieldset></td>  
            <td width="45"><fieldset>
            <legend>Prega Sub-escapular</legend>
			<input name="pregasubesc" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('M')" size="3" maxlength="3" value="<?php echo printOBS($medind->pregasubesc, $_POST['pregasubesc']); ?>" /> cm 	</fieldset></td>  
    </tr>
  	<tr>
    	<td colspan="2">
      		
<?php 
		if ($linha->ass) { ?>
<fieldset><legend> Assinatura</legend>	<?php 
		
				echo "<table ><tr><td><font size='2' face='Trebuchet MS' color='#666666'>".  getNomeAluno($linha->idAlun)." - ".printData($linha->dthr)." - ".
		printHora($linha->dthr)."</font></td></tr></table>";?></fieldset> <?php } ?>
<?php
include("functions/funcoesimpressoes.php");
printAdendoEX($atend); ?></td>
	</tr>
</table>
