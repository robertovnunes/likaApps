<?php
include ("verAssIS.php");
	$lger = getValuesTableAt('geral',$atend);
	
?>
<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Interrogatório Sintomatológico > Geral</td>
    </tr>
</table>

<table width="570">
	
    
	<tr>
    	<td width="205"><br/><fieldset style="width:170px">
			<legend>Altera&ccedil;&atilde;o de Peso</legend>
			<select name="altpeso" onchange="savCampo('1')" <?php if(ISAssinado($atend))echo "disabled=true "; ?>>
				<option value="GP" <?php echo checkOption("altpeso", "GP", $lger->avpeso); ?>>Ganho de Peso</option>
				<option value="PP" <?php echo checkOption("altpeso", "PP", $lger->avpeso); ?>>Perda de Peso</option>
				<option value="NE" <?php echo checkOption("altpeso", "NE", $lger->avpeso); ?>>Nenhuma Alteração</option>
				<option value="NA" <?php echo checkOption("altpeso", "NA", $lger->avpeso); ?>>Não Avaliado</option>
			</select>
   	  </fieldset></td>
    	<td width="120"><br /><fieldset style="width:130px;">
       		<legend>Apetite</legend>
            <select name="apetite" onchange="savCampo('1')" <?php if(ISAssinado($atend))echo "disabled=true "; ?>>
            	<option value="F" <?php echo checkOption("apetite", "F", $lger->apet); ?>>Falta</option>
            	<option value="E" <?php echo checkOption("apetite", "E", $lger->apet); ?>>Em excesso</option>
            	<option value="N" <?php echo checkOption("apetite", "N", $lger->apet); ?>>Normal</option>
            	<option value="NA" <?php echo checkOption("apetite", "NA", $lger->apet); ?>>Não Avaliado</option>
        	</select>
  	  </fieldset></td>
	   	<td width="175"><br /><fieldset style="width:130px;">
        	<legend>Atividade</legend>
			<select name="atividade" onchange="savCampo('1')" <?php if(ISAssinado($atend))echo "disabled=true "; ?>>
            	<option value="A" <?php echo checkOption("atividade", "A", $lger->ativ); ?>>Ativo</option>
                <option value="Q" <?php echo checkOption("atividade", "Q", $lger->ativ); ?>>Quieto</option>
                <option value="NA" <?php echo checkOption("atividade", "NA", $lger->ativ); ?>>Não Avaliado</option>
        	</select>
	  </fieldset></td>
    </tr>
    <tr>
   		<td colspan="3"><fieldset style="width:205px">
			<legend>Febre</legend>
			<input name="febre" type="radio" value="S" onchange="savCampo('1')" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("febre", "S", $lger->febre); ?>/><font face="Trebuchet MS" size="2">Sim</font>
			<input name="febre" type="radio" value="N" onchange="savCampo('1')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("febre", "N", $lger->febre); ?>/><font face="Trebuchet MS" size="2">N&atilde;o</font>
			<input name="febre" type="radio" value="NA" onchange="savCampo('1')" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("febre", "NA", $lger->febre); ?>/><font face="Trebuchet MS" size="2"> N&atilde;o Avaliado</font>
   	  </fieldset></td>
  	</tr>
    <tr>
    	<td colspan="3"><fieldset>
        	<legend>Observa&ccedil;&otilde;es</legend>
        	<textarea name="obsgeral" cols="71" onkeyup="savCampo('1')" <?php if(ISAssinado($atend))echo "disabled=true "; ?>
				><?php echo printOBS($lger->obs, $_POST['obsgeral']); ?></textarea>
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
	

