<?php
	$louv = getValuesTableAt('ouvidos',$atend);
	include ("verAssIS.php");
?>

<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Interrogatório Sintomatológico > Ouvidos</td>
    </tr>
</table>
<table width="570" class="style5">
	
    
    <tr>
    	<td width="274"><br /><fieldset style="width:274px;">
        	<legend>Secre&ccedil;&atilde;o</legend>
          	<input name="secrecaoou" type="radio" value="S" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("secrecaoou", "S", $louv->secr); ?> onchange="savCampo('4')"/>Sim
           	<input name="secrecaoou" type="radio" value="N" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("secrecaoou", "N", $louv->secr); ?> onchange="savCampo('4')"/>N&atilde;o
         	<input name="secrecaoou" type="radio" value="NA" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("secrecaoou", "NA", $louv->secr ); ?> onchange="savCampo('4')"/>N&atilde;o Avaliado
      	</fieldset></td>
		<td width="284"><br /><fieldset>
   			<legend>Infec&ccedil;&otilde;es Freq&uuml;entes</legend>
         	<input name="inffreq" type="radio" value="S" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("inffreq", "S", $louv->infecfreq); ?> onchange="savCampo('4')"/>Sim
           	<input name="inffreq" type="radio" value="N" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("inffreq", "N", $louv->infecfreq); ?> onchange="savCampo('4')"/>N&atilde;o
          	<input name="inffreq" type="radio" value="NA" id="inffreq" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("inffreq", "NA", $louv->infecfreq); ?> onchange="savCampo('4')"/>N&atilde;o Avaliado
   	  </fieldset></td>
	</tr>
    <tr>
    	<td><fieldset>
       		<legend>Dor</legend>
         	<select name="dorouvido" <?php if(ISAssinado($atend))echo "disabled=true ";?> onchange="savCampo('4')">
				<option value="OE" <?php echo checkOption("dorouvido", "OE", $louv->dorouv); ?>>Ouvido Esquerdo</option>
				<option value="OD" <?php echo checkOption("dorouvido", "OD", $louv->dorouv); ?>>Ouvido Direito</option>
				<option value="AO" <?php echo checkOption("dorouvido", "AO", $louv->dorouv); ?>>Ambos os Ouvidos</option>
				<option value="N" <?php echo checkOption("dorouvido", "N", $louv->dorouv); ?>>Não</option>
				<option value="NA" <?php echo checkOption("dorouvido", "NA", $louv->dorouv); ?>>Não Avaliado</option>
          	</select>
     	</fieldset></td>
		<td><fieldset>
    		<legend>Acuidade Auditiva</legend>
            <select name="acuidaud" <?php if(ISAssinado($atend))echo "disabled=true ";?> onchange="savCampo('4')">
				<option value="TN" <?php echo checkOption("acuidaud", "TN", $louv->acuid); ?>>Teste da Orelhinha Normal</option>
				<option value="TA" <?php echo checkOption("acuidaud", "TA", $louv->acuid); ?>>Teste da Orelhinha Anormal</option>
				<option value="S" <?php echo checkOption("acuidaud", "S", $louv->acuid); ?>>Sim</option>
				<option value="N" <?php echo checkOption("acuidaud", "N", $louv->acuid); ?>>Não</option>
				<option value="NA" <?php echo checkOption("acuidaud", "NA", $louv->acuid); ?>>Não Avaliado</option>
         	</select>
       	</fieldset></td>
   	</tr>
   	<tr>
       	<td colspan="2"><fieldset>
        	<legend>Observa&ccedil;&otilde;es</legend>
            <textarea name="obsouvido" cols="70" onkeyup="savCampo('4')" <?php if(ISAssinado($atend))echo "disabled=true "; ?>
				><?php echo printOBS($louv->obs, $_POST['obsouvido']); ?></textarea>
        </fieldset>

	<?php 
		if ($linha->ass) { ?>
<fieldset><legend> Assinatura</legend>	<?php 
		
		echo "<table ><tr><td><font size='2' face='Trebuchet MS' color='#666666'>".  getNomeAluno($linha->idAlun)." - ".printData($linha->dthr)." - ".
		printHora($linha->dthr)."</font></td></tr></table>";?></fieldset> <?php } ?>


	</td>
 	</tr>
</table>
<?php
include("functions/funcoesimpressoes.php");
printAdendoIS($atend); ?>