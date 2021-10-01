<?php 
	$lgi = getValuesTableAt('apgastrointestinal',$atend);
	include ("verAssIS.php");
?>

<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Interrogat�rio Sintomatol�gico > Gastro-Intestinal</td>
    </tr>
</table>
<table width="570" class="style5">
    
    <tr>
		<td width="270"><br /><fieldset style="width:270px;">
		    <legend>N&aacute;useas</legend>
		    <input name="nauseas" type="radio" value="S" onchange="savCampo('7')" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("nauseas", "S", $lgi->naus);?> />Sim
		    <input name="nauseas" type="radio" value="N" onchange="savCampo('7')" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("nauseas", "N", $lgi->naus);?> />N&atilde;o
		    <input name="nauseas" type="radio" value="NA" onchange="savCampo('7')" <?php if(ISAssinado($atend))echo "disabled=true "; 
	  			echo checkPOST("nauseas", "NA", $lgi->naus);?> />N&atilde;o Avaliado
  	  </fieldset></td>
		<td width="298"><br /><fieldset>
			<legend>Dor Abdominal</legend>
		    <input name="dorabdom" type="radio" value="P" onchange="savCampo('7')" <?php if(ISAssinado($atend))echo "disabled=true "; 	  			
				echo checkPOST("dorabdom", "P", $lgi->dorabd); ?> />Presente
		    <input name="dorabdom" type="radio" value="A" onchange="savCampo('7')" <?php if(ISAssinado($atend))echo "disabled=true "; 			  				echo checkPOST("dorabdom", "A", $lgi->dorabd); ?> />Ausente
		    <input name="dorabdom" type="radio" value="NA" onchange="savCampo('7')" <?php if(ISAssinado($atend))echo "disabled=true "; 
	  			echo checkPOST("dorabdom", "NA", $lgi->dorabd); ?> />N&atilde;o Avaliado
  	  </fieldset></td>
  	</tr>
	<tr>
		<td valign="top"><fieldset>
			<legend>V&ocirc;mitos</legend>
		    <select name="vomitos" <?php if(ISAssinado($atend))echo "disabled=true "; ?> onchange="savCampo('7')">
            	<option value="AA" <?php echo checkOption("vomitos", "AA", $lgi->vomit); ?>>Normais</option>
            	<option value="SC" <?php echo checkOption("vomitos", "SC", $lgi->vomit); ?>>Brancas</option>
            	<option value="N" <?php echo checkOption("vomitos", "N", $lgi->vomit); ?>>Escuras</option>
              	<option value="NA" <?php echo checkOption("vomitos", "NA", $lgi->vomit); ?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset>
		<fieldset>
			<legend>Tenesmo</legend>
		    <input name="tenesmo" type="radio" value="S" onchange="savCampo('7')" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("tenesmo", "S", $lgi->ten); ?>/>Sim
		    <input name="tenesmo" type="radio" value="N" onchange="savCampo('7')" <?php if(ISAssinado($atend))echo "disabled=true "; 
	  			echo checkPOST("tenesmo", "N", $lgi->ten); ?>/>N&atilde;o
		    <input name="tenesmo" type="radio" value="NA" onchange="savCampo('7')" <?php if(ISAssinado($atend))echo "disabled=true "; 
	  			echo checkPOST("tenesmo", "NA", $lgi->ten); ?> />N&atilde;o Avaliado
  	  	</fieldset></td>
		<td colspan="2"><fieldset>
			<legend>Evacua&ccedil;&atilde;o</legend>
		    <select name="evacuacao" <?php if(ISAssinado($atend))echo "disabled=true "; ?>  onchange="savCampo('7')">
            	<option value="N" onClick="habilitaEvacuacao(1)" <?php echo checkOption("evacuacao", "N", $lgi->evac); ?>>
					Normal</option>
            	<option value="C" onClick="habilitaEvacuacao(1)" <?php echo checkOption("evacuacao", "C", $lgi->evac); ?>>
					Constipado</option>
				<option value="D" onClick="habilitaEvacuacao(1)" <?php echo checkOption("evacuacao", "D", $lgi->evac); ?>>
					Diarr&eacute;ia</option>
              	<option value="NA" onClick="habilitaEvacuacao(0)" <?php echo checkOption("evacuacao", "NA", $lgi->evac); ?>>
					N&atilde;o Avaliado</option>
            </select>
			<br />
		    <table width="260" class="style5">
		    	<tr>
		        	<td width="133" align="right">Aspecto de Fezes:</td>
				  	<td width="115"><select name="aspfezes" <?php if(ISAssinado($atend))echo "disabled=true "; 
						//echo checkDisable3("evacuacao", $lgi->evac, "C", "N", "D"); ?> onchange="savCampo('7')">
				      	<option value="N" <?php echo checkOption("aspfezes", "N", $lgi->aspfez); ?>>Normais</option>
				      	<option value="B" <?php echo checkOption("aspfezes", "B", $lgi->aspfez); ?>>Brancas</option>
				      	<option value="E" <?php echo checkOption("aspfezes", "E", $lgi->aspfez); ?>>Escuras</option>
				    	<option value="NA" <?php echo checkOption("aspfezes", "NA", $lgi->aspfez); ?>>N&atilde;o Avaliado						
						</option>
		    	  </select></td>
	            </tr>
		    	<tr>
		    	  <td align="right" id="lblnfez" <?php if ($errgi && ($_POST['nfezes'] == "" || 
						!is_numeric($_POST['nfezes']))){ echo 'class="erro"'; }?>>N&ordm; de Vezes:</td>
		    	  <td><input name="nfezes" type="text" size="3" maxlength="2" onfocus="mudaLb(lblnfez)" 
						<?php if(ISAssinado($atend))echo "disabled=true "; //echo checkDisable3("evacuacao", $lgi->evac, "C", "N", "D"); ?> 
						onkeyup="savCampo('7')" value="<?php echo printCampo($lgi->nevac, $_POST['nfezes']); ?>" /></td>
	    	  </tr>
       	</table>
	      	</fieldset></td>
  </tr>
		<tr>
			<td colspan="2"><fieldset>
		    	<legend>Observa&ccedil;&otilde;es</legend>
		    	<textarea name="obsgastint" cols="70" onkeyup="savCampo('7')" <?php if(ISAssinado($atend))echo "disabled=true ";?>
					><?php echo printOBS($lgi->obs, $_POST['obsgastint']); ?></textarea>
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