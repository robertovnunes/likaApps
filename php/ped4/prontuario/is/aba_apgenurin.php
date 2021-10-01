<?php 
	$lgu = getValuesTableAt('apgenitourinario',$atend);
	include ("verAssIS.php");
		
?>

<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Interrogatório Sintomatológico > Genito-Urinário</td>
    </tr>
</table>
<table  width="570">
	
    
    <tr>
    	<td colspan="2"><br /><fieldset>
			<legend>Urina</legend>
			<table width="531" >
				<tr>
					<td width="75" align="right"><font size="2" face="Trebuchet MS" color="#666666"> Quantidade:</font></td>
					<td width="160"><select name="qtdurina" <?php if(ISAssinado($atend))echo "disabled=true ";?> onchange="savCampo('8')">
						<option value="N" <?php echo checkOption("qtdurina", "N", $lgu->qtdur); ?>>Normal</option>
						<option value="A" <?php echo checkOption("qtdurina", "A", $lgu->qtdur);?>>Abundante</option>
						<option value="E" <?php echo checkOption("qtdurina", "E", $lgu->qtdur);?>>Escassa</option>
						<option value="NA" <?php echo checkOption("qtdurina","NA", $lgu->qtdur);?>>N&atilde;o Avaliado</option>
		  	  	  </select></td>
					<td width="71" align="right"><font size="2" face="Trebuchet MS" color="#666666">Jato:</font></td>
					<td width="215"><select name="jatourina" <?php if(ISAssinado($atend))echo "disabled=true ";?> onchange="savCampo('8')">
						<option value="C" <?php echo checkOption("jatourina", "C", $lgu->jatour); ?>>Contínuo</option>
						<option value="P" <?php echo checkOption("jatourina", "P", $lgu->jatour); ?>>Partido</option>
						<option value="NA" <?php echo checkOption("jatourina", "NA", $lgu->jatour); ?>>N&atilde;o Avaliado						</option>
			  		</select></td>
				</tr>
				<tr>
					<td align="right"><font size="2" face="Trebuchet MS" color="#666666">Cor:</font></td>
					<td><select name="corurina" <?php if(ISAssinado($atend))echo "disabled=true ";?> onchange="savCampo('8')">
						<option value="C" <?php echo checkOption("corurina", "C", $lgu->corur); ?>>Claro</option>
						<option value="E" <?php echo checkOption("corurina", "E", $lgu->corur); ?>>Escuro</option>
						<option value="NA" <?php echo checkOption("corurina", "NA", $lgu->corur); ?>>N&atilde;o Avaliado						</option>
					</select></td>
					<td align="right"><font size="2" face="Trebuchet MS" color="#666666">Odor:</font></td>
					<td><select name="odorurina" <?php if(ISAssinado($atend))echo "disabled=true ";?> onchange="savCampo('8')">
						<option value="C" <?php echo checkOption("odorurina", "C", $lgu->odorur); ?>>Característico</option>
						<option value="F" <?php echo checkOption("odorurina", "F", $lgu->odorur); ?>>Fétido</option>
						<option value="NA" <?php echo checkOption("odorurina", "NA", $lgu->odorur); ?>>N&atilde;o Avaliado						</option>
					</select></td>
			  	</tr>
				<tr>
					<td align="right"><font size="2" face="Trebuchet MS" color="#666666">Freq&uuml;&ecirc;ncia:</font></td>
					<td><select name="frequrina" <?php if(ISAssinado($atend))echo "disabled=true ";?> onchange="savCampo('8')">
						<option value="N" <?php echo checkOption("frequrina", "N", $lgu->frequr); ?>>Normal</option>
						<option value="MH" <?php echo checkOption("frequrina", "MH", $lgu->frequr); ?>>Mais que o Habitual						</option>
						<option value="NA" <?php echo checkOption("frequrina", "NA", $lgu->frequr); ?>>Não Avaliado</option>
					</select></td>
					<td align="right"><font size="2" face="Trebuchet MS" color="#666666">Urg&ecirc;ncia:</font></td>
					<td><input name="urgurina" type="radio" value="S" <?php if(ISAssinado($atend))echo "disabled=true "; 
						echo checkPOST("urgurina", "S", $lgu->urgur); ?> onchange="savCampo('8')"/><font size="2" face="Trebuchet MS" color="#666666">Sim</font>
					<input name="urgurina" type="radio" value="N" <?php if(ISAssinado($atend))echo "disabled=true "; 
						echo checkPOST("urgurina", "N", $lgu->urgur); ?> onchange="savCampo('8')"/><font size="2" face="Trebuchet MS" color="#666666">N&atilde;o</font>
					<input name="urgurina" type="radio" value="NA" <?php if(ISAssinado($atend))echo "disabled=true "; 
						echo checkPOST("urgurina", "NA", $lgu->urgur); ?> onchange="savCampo('8')"/><font size="2" face="Trebuchet MS" color="#666666">N&atilde;o Avaliado</font></td>
				</tr>
		</table>
		</fieldset></td>
    </tr>
    <tr>
    	<td width="273"><fieldset>
			<legend>Corrimento Uretral</legend>
			<input name="coorure" type="radio" value="P" onclick="habilitaCorrUret(1)" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("coorure", "P", $lgu->curt); ?> onchange="savCampo('8')"/>Presente
           	<input name="coorure" type="radio" value="A" onclick="habilitaCorrUret(0)" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("coorure", "A", $lgu->curt); ?> onchange="savCampo('8')"/>Ausente
           	<input name="coorure" type="radio" value="NA" onclick="habilitaCorrUret(0)" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("coorure", "NA", $lgu->curt); ?> onchange="savCampo('8')"/>N&atilde;o Avaliado
			<br />
			<table width="223" class="style5">
		  		<tr>
            		<td align="right">Cor:</td>
		    		<td><select name="corcorrure" <?php if(ISAssinado($atend))echo "disabled=true "; 
						/*echo checkDisable("coorure", $lgu->curt, "P");*/ echo $lgu->curt;?> onchange="savCampo('8')">
                		<option value="C" <?php echo checkOption("corcorrure", "C", $lgu->corcurt); ?>>Claro</option>
                		<option value="L" <?php echo checkOption("corcorrure", "L", $lgu->corcurt); ?>>Leitoso</option>
                		<option value="NA" <?php echo checkOption("corcorrure", "NA", $lgu->corcurt); ?>>N&atilde;o Avaliado						</option>
              		</select></td>
	      		</tr>
                <tr>
                	<td width="67" align="right">Odor:</td>
                	<td width="156"><select name="odorcorrure" onchange="savCampo('8')" <?php if(ISAssinado($atend))echo "disabled=true "; 
						//echo checkDisable("coorure", $lgu->curt, "P"); ?>>
                    	<option value="I" <?php echo checkOption("odorcorrure", "I", $lgu->odorcurt); ?>>Inodoro</option>
                    	<option value="F" <?php echo checkOption("odorcorrure", "F", $lgu->odorcurt); ?>>F&eacute;tido</option>
                      	<option value="NA" <?php echo checkOption("odorcorrure", "NA", $lgu->odorcurt); ?>>N&atilde;o Avaliado					  						</option>
                  </select></td>
              	</tr>
            </table>
  	  </fieldset></td>
   		<td width="285" valign="top"><fieldset>
			<legend>Dis&uacute;ria</legend>
			<input name="disuria" type="radio" value="S" onchange="savCampo('8')" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("disuria", "S", $lgu->dis); ?> />Sim
			<input name="disuria" type="radio" value="N" onchange="savCampo('8')" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("disuria", "N", $lgu->dis); ?> />N&atilde;o
			<input name="disuria" type="radio" value="NA" onchange="savCampo('8')" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("disuria", "NA", $lgu->dis); ?>/>N&atilde;o Avaliado
	  </fieldset>
	  <fieldset>
			<legend>Atividade Sexual</legend>
			<input name="atsexual" type="radio" value="S" onchange="savCampo('8')" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("atsexual", "S", $lgu->ativsex); ?>/>Sim
			<input name="atsexual" type="radio" value="N" onchange="savCampo('8')" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("atsexual", "N", $lgu->ativsex); ?>/>N&atilde;o
			<input name="atsexual" type="radio" value="NA" onchange="savCampo('8')" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("atsexual", "NA", $lgu->ativsex); ?>/>N&atilde;o Avaliado
      </fieldset></td>
  	</tr>
	<?php printDiv($paciente->sexo, $flag, $atend, $linha->ass); ?>
    <tr>
    	<td colspan="2"><fieldset>
	        <legend>Observa&ccedil;&otilde;es</legend>
            <textarea name="obsgenuri" cols="70" <?php if(ISAssinado($atend))echo "disabled=true ";?> onkeyup="savCampo('8')"><?php 
				echo printOBS($lgu->obs, $_POST['obsgenuri']); ?></textarea>
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
<p />
<?php 
function printDiv($sexo,$flag,$atend, $assinado){
	if ($sexo == "F") include("form_m.php");
	else include("form_h.php");
}
?>
