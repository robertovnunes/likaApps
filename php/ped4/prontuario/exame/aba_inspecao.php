<?php
	$leins = getValuesTableAt('inspecao',$atend);
	include("verAssEx.php");
?>

<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Exame Físico > Geral > Inspeção</td>
    </tr>
</table>
<table width="580">
	<tr>
   		<td width="278"><br /><fieldset>
			<legend>Estado Geral</legend>
			<select name="estger" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('1')">
				<option value="B" <?php echo checkOption("estger", "B", $leins->estger); ?>>Bom (EGB)</option>
				<option value="Rg" <?php echo checkOption("estger", "Rg", $leins->estger); ?>>Regular</option>
				<option value="R" <?php echo checkOption("estger", "R", $leins->estger); ?>>Ruim</option>
				<option value="G" <?php echo checkOption("estger", "G", $leins->estger); ?>>Grave</option>
				<option value="NA" <?php echo checkOption("estger", "NA", $leins->estger); ?>>N&atilde;o Avaliado</option>
			</select>
  	  </fieldset></td>
   		<td width="123"><br /><fieldset>
       		<legend>Tipo de Doença</legend>
          	<select name="tdoenc" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('1')">
				<option value="A" <?php echo checkOption("tdoenc", "A", $leins->tdoenc); ?>>Aguda</option>
				<option value="C" <?php echo checkOption("tdoenc", "C", $leins->tdoenc); ?>>Crônica</option>
            	<option value="NA" <?php echo checkOption("tdoenc", "NA", $leins->tdoenc); ?>>N&atilde;o Avaliado</option>
       		</select>
  	  </fieldset></td>
   		<td width="143"><br /><fieldset>
       		<legend>Aspecto da Doença</legend>
          	<select name="aspdoenc" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('1')">
				<option value="C" <?php echo checkOption("aspdoenc", "C", $leins->aspdoenc); ?>>Com gravidade</option>
				<option value="S" <?php echo checkOption("aspdoenc", "S", $leins->aspdoenc); ?>>Sem gravidade</option>
            	<option value="NA" <?php echo checkOption("aspdoenc", "NA", $leins->aspdoenc); ?>>N&atilde;o Avaliado</option>
       		</select>
  	  </fieldset></td>
  	</tr>
	<tr>
		<td width="278"><fieldset>
			<legend>Desenvolvimento F&iacute;sico</legend>
			<select name="desfis" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('1')">
				<option value="C" <?php echo checkOption("desfis", "C", $leins->desenvfis); ?>
					>Compat&iacute;vel com a idade cronológica</option>
				<option value="I" <?php echo checkOption("desfis", "I", $leins->desenvfis); ?>
					>Incompat&iacute;vel com a idade cronológica</option>
				<option value="NA" <?php echo checkOption("desfis", "NA", $leins->desenvfis); ?>>N&atilde;o Avaliado</option>
			</select>
  	  </fieldset></td>
   		<td width="123"><fieldset>
       		<legend>Nutri&ccedil;&atilde;o</legend>
          	<select name="nutricao" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('1')">
				<option value="N" <?php echo checkOption("nutricao", "N", $leins->nutric); ?>>Nutrido</option>
            	<option value="D" <?php echo checkOption("nutricao", "D", $leins->nutric); ?>>Desnutrido</option>
            	<option value="NA" <?php echo checkOption("nutricao", "NA", $leins->nutric); ?>>N&atilde;o Avaliado</option>
       		</select>
  	  </fieldset></td>
		<td colspan="3"><fieldset>
			<legend>Coopera&ccedil;&atilde;o</legend>
			<select name="coop" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onchange="savCampo('1')">
				<option value="B" <?php echo checkOption("coop", "B", $leins->coop); ?>>Boa</option>
				<option value="P" <?php echo checkOption("coop", "P", $leins->coop); ?>>Pouca</option>
				<option value="N" <?php echo checkOption("coop", "N", $leins->coop); ?>>Nenhuma</option>
				<option value="NA" <?php echo checkOption("coop", "NA", $leins->coop); ?>>N&atilde;o Avaliado</option>
			</select>
  	  	</fieldset></td>
  	</tr>
	<tr>
   		<td><fieldset>
      		<legend>Deformidades F&iacute;sicas</legend>
      		<input name="deffis" type="radio" value="P" onchange="savCampo('1')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("deffis", "P", $leins->deformfis);?> />Presentes
      		<input name="deffis" type="radio" value="A" onchange="savCampo('1')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("deffis", "A", $leins->deformfis);?>/>Ausentes
      		<input name="deffis" type="radio" value="NA" onchange="savCampo('1')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("deffis", "NA", $leins->deformfis);?>/>N&atilde;o Avaliado
    	</fieldset></td>
    	<td colspan="2"><fieldset>
      		<legend>Anormalidade de Postura</legend>
      		<input name="anorpt" type="radio" value="P" onchange="savCampo('1')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("anorpt", "P", $leins->anormpost); ?>/>Presente
      		<input name="anorpt" type="radio" value="A" onchange="savCampo('1')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("anorpt", "A", $leins->anormpost); ?>/>Ausente
      		<input name="anorpt" type="radio" value="NA" onchange="savCampo('1')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("anorpt", "NA", $leins->anormpost); ?>/>N&atilde;o Avaliado
    	</fieldset></td>
	</tr>
	<tr>
  		<td colspan="3"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
        	<textarea name="obsins" cols="68" onkeyup="savCampo('1')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>
				><?php echo printOBS($leins->obs, $_POST['obsins']); ?></textarea>
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