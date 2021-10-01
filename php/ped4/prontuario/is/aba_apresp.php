<?php
	$lrsp = getValuesTableAt('aprespiratorio',$atend);
	include ("verAssIS.php");
?>

<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Interrogatório Sintomatológico > Respiratório</td>
    </tr>
</table>
<table width="570" class="style5">
  	
    
    <tr>
    	<td width="211"><br /><fieldset>
			<legend>Sufoca&ccedil;&atilde;o</legend>
           	<input name="sufoc" type="radio" value="S" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("sufoc", "S", $lrsp->sufoc); ?>/>Sim
          	<input name="sufoc" type="radio" value="N" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("sufoc", "N", $lrsp->sufoc); ?>/>N&atilde;o
           	<input name="sufoc" type="radio" value="NA" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("sufoc", "NA", $lrsp->sufoc); ?>/>N&atilde;o Avaliado
      </fieldset></td>
		<td width="207"><br /><fieldset>
			<legend>Epistaxe</legend>
            <input name="epist" type="radio" value="S" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("epist", "S", $lrsp->epist); ?>/>Sim
          	<input name="epist" type="radio" value="N" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("epist", "N", $lrsp->epist); ?>/>N&atilde;o
          	<input name="epist" type="radio" value="NA" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("epist", "NA", $lrsp->epist); ?>/>N&atilde;o Avaliado
  	  </fieldset></td>
  	    <td width="136"><br /><fieldset>
			<legend>Corrimento Nasal</legend>
			<select name="crrnas" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true ";?>>
				<option value="CL" <?php echo checkOption("crrnas", "CL", $lrsp->corrnas); ?>>Normal</option>
				<option value="ES" <?php echo checkOption("crrnas", "ES", $lrsp->corrnas);?>>Abundante</option>
				<option value="A" <?php echo checkOption("crrnas", "A", $lrsp->corrnas);?>>Escassa</option>
				<option value="NA" <?php echo checkOption("crrnas","NA", $lrsp->corrnas);?>>N&atilde;o Avaliado</option>
			</select>
	  </fieldset></td>
  	</tr>
  	<tr>
    	<td colspan="3"><fieldset>
            <legend>Tosse</legend>
            <input name="tosse" type="radio" value="P" onclick="habilitaTosse(1)" onchange="savCampo('5')"
				<?php if(ISAssinado($atend))echo "disabled=true "; echo checkPOST("tosse", "P", $lrsp->tosse); ?> />Presente
          	<input name="tosse" type="radio" value="A" onclick="habilitaTosse(0)" onchange="savCampo('5')"
				<?php if(ISAssinado($atend))echo "disabled=true "; echo checkPOST("tosse", "A", $lrsp->tosse); ?>/>Ausente
          	<input name="tosse" type="radio" value="NA" onclick="habilitaTosse(0)" onchange="savCampo('5')"
				<?php if(ISAssinado($atend))echo "disabled=true "; echo checkPOST("tosse", "NA", $lrsp->tosse); ?>/>N&atilde;o Avaliado
			<table width="529" cellspacing="3" class="style5">
            	<tr>
                	<td width="59" align="right">Dura&ccedil;&atilde;o:</td>
                  	<td width="137"><select name="dtosse" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true "; 
						//echo checkDisable("tosse", $lrsp->tosse, "P");?>>
						<option value="-30" <?php echo checkOption("dtosse", "-30",$lrsp->dtosse); ?>>Menos de 30 dias</option>
						<option value="+30" <?php echo checkOption("dtosse", "+30", $lrsp->dtosse);?>>Mais de 30 dias</option>
						<option value="NA" <?php echo checkOption("dtosse", "NA",$lrsp->dtosse);?>>N&atilde;o Avaliado</option>
					</select></td>
           	  	    <td width="31" align="right">Tipo:</td>
           	  	    <td width="111"><select name="ttosse" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true "; 
						//echo checkDisable("tosse", $lrsp->tosse, "P");?>>
                      	<option value="P" <?php echo checkOption("ttosse", "P", $lrsp->ttosse); ?>>Produtiva</option>
                      	<option value="S" <?php echo checkOption("ttosse", "S", $lrsp->ttosse);?>>Seca</option>
                      	<option value="NA" <?php echo checkOption("ttosse", "NA",$lrsp->ttosse);?>>N&atilde;o Avaliado</option>
                    </select></td>
           	  	    <td width="61" align="right">Per&iacute;odo:</td>
           	  	    <td width="112"><select name="ptosse" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true "; 
						//echo checkDisable("tosse", $lrsp->tosse, "P");?>>
                      	<option value="N" <?php echo checkOption("ptosse", "N", $lrsp->ptosse); ?>>Noturna</option>
                      	<option value="M" <?php echo checkOption("ptosse", "M", $lrsp->ptosse);?>>Matutina</option>
                      	<option value="NA" <?php echo checkOption("ptosse", "NA",$lrsp->ptosse);?>>N&atilde;o Avaliado</option>
                    </select></td>
            	</tr>
       	</table>
        </fieldset></td>
  	</tr>
  	<tr>
       	<td><fieldset>
        	<legend>Resfriados Freq&uuml;entes</legend>
            <input name="resfrq" type="radio" value="S" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("resfrq", "S", $lrsp->resf); ?>/>Sim
           	<input name="resfrq" type="radio" value="N" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("resfrq", "N", $lrsp->resf); ?>/>N&atilde;o
          	<input name="resfrq" type="radio" value="NA" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("resfrq", "NA", $lrsp->resf); ?>/>N&atilde;o Avaliado
        </fieldset></td>
        <td colspan="2"><fieldset>
 			<legend>Dor Tor&aacute;cica</legend>
         	<input name="dortor" type="radio" value="P" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("dortor", "P", $lrsp->dortor); ?>/>Presente
           	<input name="dortor" type="radio" value="A" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("dortor", "A", $lrsp->dortor); ?>/>Ausente
           	<input name="dortor" type="radio" value="NA" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("dortor", "NA", $lrsp->dortor); ?>/>N&atilde;o Avaliado
       	</fieldset></td>
  	</tr>
  	<tr>
		<td><fieldset>
        	<legend>Dificuldade Respirat&oacute;ria</legend>
            <input name="difresp" type="radio" value="S" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("difresp", "S", $lrsp->difresp); ?>/>Sim
          	<input name="difresp" type="radio" value="N" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("difresp", "N", $lrsp->difresp); ?>/>N&atilde;o
         	<input name="difresp" type="radio" value="NA" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("difresp", "NA", $lrsp->difresp); ?>/>N&atilde;o Avaliado
       	</fieldset></td>
 		<td colspan="2"><fieldset>
    		<legend>Hemoptise</legend>
        	<input name="hemop" type="radio" value="P" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("hemop", "P", $lrsp->hemop); ?>/>Presente
        	<input name="hemop" type="radio" value="A" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("hemop", "A", $lrsp->hemop); ?>/>Ausente
          	<input name="hemop" type="radio" value="NA" onchange="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("hemop", "NA", $lrsp->hemop); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
  	<tr>
    	<td colspan="3"><fieldset>
       		<legend>Observa&ccedil;&otilde;es</legend>
        	<textarea name="obsresp" cols="70" onkeyup="savCampo('5')" <?php if(ISAssinado($atend))echo "disabled=true "; ?>
				><?php echo printOBS($lrsp->obs, $_POST['obsresp']); ?></textarea>
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