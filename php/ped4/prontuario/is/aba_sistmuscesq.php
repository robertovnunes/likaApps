<?php
	$lme = getValuesTableAt('sistmusculoesqueletico',$atend);
	include ("verAssIS.php");
?>
<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Interrogatório Sintomatológico > Músculo-Esquelético</td>
    </tr>
</table>
<table width="570">
	
    
    <tr>
    	<td width="274"><br /><fieldset style="width:274px;">
        	<legend>Deformidades</legend>
         	<input name="deform" type="radio" value="P" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("deform", "P", $lme->deform); ?> onchange="savCampo('9')"/>Sim
           	<input name="deform" type="radio" value="A" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("deform", "A", $lme->deform); ?> onchange="savCampo('9')"/>N&atilde;o
           	<input name="deform" type="radio" value="NA" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("deform", "NA", $lme->deform); ?> onchange="savCampo('9')"/>N&atilde;o Avaliado
    	</fieldset></td>
        <td width="284"><br /><fieldset>
        	<legend>Tumefa&ccedil;&otilde;es</legend>
            <input name="tumefacoes" type="radio" value="P" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("tumefacoes", "P", $lme->tumef); ?> onchange="savCampo('9')"/>Presente
            <input name="tumefacoes" type="radio" value="A" <?php if(ISAssinado($atend))echo "disabled=true ";
			  	echo checkPOST("tumefacoes", "A", $lme->tumef); ?> onchange="savCampo('9')"/>Ausente
            <input name="tumefacoes" type="radio" value="NA" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("tumefacoes", "NA", $lme->tumef); ?> onchange="savCampo('9')"/>N&atilde;o Avaliado
   	  </fieldset></td>
	</tr>
    <tr>
         <td><fieldset>
      		<legend>Fraqueza Muscular</legend>
           	<input name="fraqmusc" type="radio" value="S" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("fraqmusc", "S", $lme->fraqmusc); ?> onchange="savCampo('9')"/>Sim
          	<input name="fraqmusc" type="radio" value="N" id="fraqmusc" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("fraqmusc", "N", $lme->fraqmusc); ?> onchange="savCampo('9')"/>N&atilde;o
  			<input name="fraqmusc" type="radio" value="NA" id="fraqmusc" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("fraqmusc", "NA", $lme->fraqmusc); ?> onchange="savCampo('9')"/>N&atilde;o Avaliado
       	</fieldset></td>
        <td><fieldset>
 			<legend>Dores &Oacute;sseas e Articulares</legend>
           	<input name="dorossea" type="radio" value="P" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("dorossea", "P", $lme->doross); ?> onchange="savCampo('9')"/>Sim
          	<input name="dorossea" type="radio" value="A" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("dorossea", "A", $lme->doross); ?> onchange="savCampo('9')"/>N&atilde;o
        	<input name="dorossea" type="radio" value="NA" <?php if(ISAssinado($atend))echo "disabled=true ";
				echo checkPOST("dorossea", "NA", $lme->doross); ?> onchange="savCampo('9')"/>N&atilde;o Avaliado
   		</fieldset></td>
	</tr>
    <tr>
    	<td colspan="2"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
			<textarea name="obsmuscesq" cols="70" onkeyup="savCampo('9')" <?php if(ISAssinado($atend))echo "disabled=true ";?>
				><?php echo printOBS($lme->obs, $_POST['obsmuscesq']); ?></textarea>
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