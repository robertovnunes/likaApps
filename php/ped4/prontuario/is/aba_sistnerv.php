<?php
	$lnerv = getValuesTableAt('sistnervoso',$atend);
	include ("verAssIS.php");
?>

<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Interrogatório Sintomatológico > Nervoso</td>
    </tr>
</table>
<table width="570">

    
    <tr>
    	<td width="274"><br /><fieldset style="width:274px">
        	<legend>Cefal&eacute;ia</legend>
            <input name="cefaleia" type="radio" value="S" onchange="savCampo('0')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("cefaleia", "S", $lnerv->cefal); ?>/>Sim
           	<input name="cefaleia" type="radio" value="N" onchange="savCampo('0')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("cefaleia", "N", $lnerv->cefal); ?>/>N&atilde;o
          	<input name="cefaleia" type="radio" value="NA" onchange="savCampo('0')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("cefaleia", "NA", $lnerv->cefal);?>/>N&atilde;o Avaliado
      	</fieldset></td>
    	<td width="284"><br /><fieldset>
        	<legend>Tonturas</legend>
            <input name="tonturas" type="radio" value="S" onchange="savCampo('0')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("tonturas", "S", $lnerv->tont); ?>/>Sim
			<input name="tonturas" type="radio" value="N" onchange="savCampo('0')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("tonturas", "N", $lnerv->tont); ?>/>N&atilde;o
           	<input name="tonturas" type="radio" value="NA" onchange="savCampo('0')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("tonturas", "NA", $lnerv->tont);?>/>N&atilde;o Avaliado
   	  </fieldset></td>
    </tr>
    <tr>
    	<td colspan="2"><fieldset>
       		<legend>Convuls&otilde;es</legend>
            <select name="convulsoes" <?php if(ISAssinado($atend))echo "disabled=true "; ?> onchange="savCampo('0')">
            	<option onClick="habilitaConvulsoes(1)" <?php echo checkOption("convulsoes", "F", $lnerv->conv); ?>
					value="F">Febril</option>
              	<option onClick="habilitaConvulsoes(1)" <?php echo checkOption("convulsoes", "AF", $lnerv->conv); ?>
					value="AF">Afebril</option>
              	<option onClick="habilitaConvulsoes(0)" <?php echo checkOption("convulsoes", "A", $lnerv->conv); ?>
					value="A">Ausente</option>
              	<option onClick="habilitaConvulsoes(0)" <?php echo checkOption("convulsoes", "NA", $lnerv->conv); ?>
					value="NA">N&atilde;o Avaliado</option>
            </select>
           	<table width="354" class="style5">
            	<tr>
                	<td width="56" align="right">Tipo 1:</td>
                	<td width="115"><select name="conv1" onchange="savCampo('0')" <?php if(ISAssinado($atend))echo "disabled=true "; 
						echo checkDisable2("convulsoes", $lnerv->conv, "F", "AF");?>>
                    	<option value="T" <?php echo checkOption("conv1", "T", $lnerv->conv1);?>>Febril</option>
                    	<option value="TC" <?php echo checkOption("conv1", "TC", $lnerv->conv1);?>>Afebril</option>
                      	<option value="NA" <?php echo checkOption("conv1", "NA", $lnerv->conv1);?>>N&atilde;o Avaliado</option>
                    </select></td>
                    <td width="47" align="right">Tipo 2: </td>
                    <td width="111"><select name="conv2" onchange="savCampo('0')" <?php if(ISAssinado($atend))echo "disabled=true "; 
				  		echo checkDisable2("convulsoes", $lnerv->conv, "F", "AF");?>>
                      <option value="L" <?php echo checkOption("conv2", "L", $lnerv->conv2); ?>>Localizada</option>
                      <option value="G" <?php echo checkOption("conv2", "G", $lnerv->conv2); ?>>Generalizada</option>
                      <option value="NA" <?php echo checkOption("conv2", "NA", $lnerv->conv2); ?>>N&atilde;o Avaliado</option>
                    </select></td>
	    </table>
        </fieldset></td>
    </tr>
    <tr>
    	<td><fieldset>
            <legend>Traumas Cranianos</legend>
            <input name="traumacran" type="radio" value="S" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("traumacran", "S", $lnerv->trcran); ?> onchange="savCampo('0')"/>Sim
          	<input name="traumacran" type="radio" value="N" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("traumacran", "N", $lnerv->trcran); ?> onchange="savCampo('0')"/>N&atilde;o
          	<input name="traumacran" type="radio" value="NA" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("traumacran", "NA", $lnerv->trcran); ?> onchange="savCampo('0')"/>N&atilde;o Avaliado
     	</fieldset></td>
    	<td><fieldset>
			<legend>S&iacute;ncopes</legend>
            <input name="sincopes" type="radio" value="S" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("traumacran", "S", $lnerv->sinc); ?> onchange="savCampo('0')"/>Sim
           	<input name="sincopes" type="radio" value="N" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("traumacran", "N", $lnerv->sinc); ?> onchange="savCampo('0')"/>N&atilde;o
        	<input name="sincopes" type="radio" value="NA" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("traumacran", "NA", $lnerv->sinc); ?> onchange="savCampo('0')"/>N&atilde;o Avaliado
     	</fieldset></td>
    </tr>
    <tr>
    	<td><fieldset>
        	<legend>Paresias</legend>
            <input name="paresias" type="radio" value="S" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("paresias", "S", $lnerv->pares); ?> onchange="savCampo('0')"/>Sim
          	<input name="paresias" type="radio" value="N" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("paresias", "N", $lnerv->pares); ?> onchange="savCampo('0')"/>N&atilde;o
         	<input name="paresias" type="radio" value="NA" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("paresias", "NA", $lnerv->pares);?> onchange="savCampo('0')"/>N&atilde;o Avaliado
     	</fieldset></td>
    	<td><fieldset>
        	<legend>Paralisias</legend>
          	<input name="paralisias" type="radio" value="S" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("paralisias", "S", $lnerv->paral); ?> onchange="savCampo('0')"/>Sim
           	<input name="paralisias" type="radio" value="N" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("paralisias", "N", $lnerv->paral); ?> onchange="savCampo('0')"/>N&atilde;o
           	<input name="paralisias" type="radio" value="NA" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("paralisias", "NA", $lnerv->paral); ?> onchange="savCampo('0')"/>N&atilde;o Avaliado
       	</fieldset></td>
    </tr>
    <tr>
    	<td colspan="2"><fieldset>
       		<legend>Retardo Neuropsicomotor</legend>
           	<input name="retneurpsi" type="radio" value="S" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("retneurpsi", "S", $lnerv->retnpsi); ?> onchange="savCampo('0')"/>Sim
           	<input name="retneurpsi" type="radio" value="N" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("retneurpsi", "N", $lnerv->retnpsi); ?> onchange="savCampo('0')"/>N&atilde;o
          	<input name="retneurpsi" type="radio" value="NA" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("retneurpsi", "NA", $lnerv->retnpsi); ?> onchange="savCampo('0')"/>N&atilde;o Avaliado
      	</fieldset></td>
    </tr>
   	<tr>
    	<td colspan="2"><fieldset>
            <legend>Observa&ccedil;&otilde;es</legend>
            <textarea name="obssistnerv" cols="70" onkeyup="savCampo('0')" <?php if(ISAssinado($atend))echo "disabled=true "; ?>
				><?php echo printOBS($lnerv->obs, $_POST['obssistnerv']); ?></textarea>
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