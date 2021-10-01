<?php
	$lpele = getValuesTableAt('pele',$atend);
	include ("verAssIS.php");
?>

<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Interrogatório Sintomatológico > Pele</td>
    </tr>
</table>
<table width="570">
	
	<tr>
   		<td width="165"><br /><fieldset>
			<legend>Rash</legend>
			<select name="rash" <?php if(ISAssinado($atend))echo "disabled=true "; ?> onchange="savCampo('2')">
				<option value="E" <?php echo checkOption("rash", "E", $lpele->rash); ?>>Escarlatiniforme</option>
				<option value="M" <?php echo checkOption("rash", "M", $lpele->rash); ?>>Morbiliforme</option>
				<option value="A" <?php echo checkOption("rash", "A", $lpele->rash); ?>>Ausente</option>
				<option value="NA" <?php echo checkOption("rash", "NA", $lpele->rash); ?>>Não Avaliado</option>
			</select>
	  </fieldset></td>
   		<td width="163"><br /><fieldset>
       		<legend>Icter&iacute;cia</legend>
          	<select name="ictericia" <?php if(ISAssinado($atend))echo "disabled=true "; ?> onchange="savCampo('2')">
			<?php for ($i=1;$i<=5;$i++){
			$s = checkOption("ictericia", $i, $lpele->icter); ?> 
				<option value="<? echo $i; ?>" <?php echo $s; ?>>Zona <?php echo $i; ?> de Kramer</option>
			<?php $s = ""; } ?>
            	<option value="A" <?php echo checkOption("ictericia", "A", $lpele->icter); ?>>Ausente</option>
            	<option value="NA" <?php echo checkOption("ictericia", "NA", $lpele->icter); ?>>Não Avaliado</option>
       		</select>
	  </fieldset></td>
   		<td width="226"><br /><fieldset>
			<legend>Infec&ccedil;&otilde;es de Repeti&ccedil;&atilde;o</legend>
			<input name="infecrep" type="radio" value="S" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("infecrep", "S", $lpele->infecrep); ?> onchange="savCampo('2')"/>Sim
			<input name="infecrep" type="radio" value="N" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("infecrep", "N", $lpele->infecrep); ?> onchange="savCampo('2')"/>N&atilde;o
			<input name="infecrep" type="radio" value="NA" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("infecrep", "NA", $lpele->infecrep); ?> onchange="savCampo('2')"/>N&atilde;o Avaliado
	  </fieldset></td>
  	</tr>
	<tr>
  		<td colspan="3"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
        	<textarea name="obspele" cols="70" onkeyup="savCampo('2')" <?php if(ISAssinado($atend))echo "disabled=true "; ?>
				><?php echo printOBS($lpele->obs, $_POST['obspele']); ?></textarea>
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
	