<?php
	$lapcv = getValuesTableAt('apcardiovascular',$atend);
	include ("verAssIS.php");
?>


<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Interrogatório Sintomatológico > Cardiovascular</td>
    </tr>
</table>
<table width="570" class="style5">
	
    <tr>
    	<td width="274"><br /><fieldset style="width:274px;">
        	<legend>Dispn&eacute;ia</legend>
       		<input name="dispneia" type="radio" value="S" onchange="savCampo('6')" <?php if(ISAssinado($atend))echo "disabled=true "; 
				echo checkPOST("dispneia", "S", $lapcv->disp); ?> />Sim
           	<input name="dispneia" type="radio" value="N" onchange="savCampo('6')" <?php if(ISAssinado($atend))echo "disabled=true "; echo checkPOST("dispneia", "N", $lapcv->disp); ?> />N&atilde;o
 	    	<input name="dispneia" type="radio" value="NA" onchange="savCampo('6')"<?php if(ISAssinado($atend))echo "disabled=true "; echo checkPOST("dispneia", "NA", $lapcv->disp); ?>/>N&atilde;o Avaliado
	  </fieldset></td>
      <td width="294"><br /><fieldset>
      	<legend>Cianose</legend>
        	<select name="cianose" <?php if(ISAssinado($atend))echo "disabled=true ";  ?> onchange="savCampo('6')">
            	<option value="L" <?php echo checkOption("cianose", "L", $lapcv->cian); ?>>Labial</option>
                <option value="G" <?php echo checkOption("cianose", "G", $lapcv->cian); ?>>Generalizada</option>
                <option value="A" <?php echo checkOption("cianose", "A", $lapcv->cian); ?>>Ausente</option>
                <option value="NA" <?php echo checkOption("cianose", "NA", $lapcv->cian); ?>>N&atilde;o Avaliado</option>
        	</select>
      </fieldset></td>
	</tr>
	<tr>
    	<td><fieldset>
        	<legend>Palpita&ccedil;&atilde;o</legend>
            <input name="palpitacao" type="radio" value="S" onchange="savCampo('6')" <?php if(ISAssinado($atend))echo "disabled=true "; echo checkPOST("palpitacao", "S", $lapcv->palp); ?> />Sim
           	<input name="palpitacao" type="radio" value="N" onchange="savCampo('6')" <?php if(ISAssinado($atend))echo "disabled=true "; echo checkPOST("palpitacao", "N", $lapcv->palp); ?> />N&atilde;o
           	<input name="palpitacao" type="radio" value="NA" onchange="savCampo('6')" <?php if(ISAssinado($atend))echo "disabled=true "; echo checkPOST("palpitacao", "NA", $lapcv->palp); ?> />N&atilde;o Avaliado
     	</fieldset></td>
      	<td><fieldset>
     		<legend>Taquicardia</legend>
            <input name="taquicardia" type="radio" value="S" onchange="savCampo('6')" <?php if(ISAssinado($atend))echo "disabled=true "; echo checkPOST("taquicardia", "S", $lapcv->taq); ?> />Sim
			<input name="taquicardia" type="radio" value="N" onchange="savCampo('6')" <?php if(ISAssinado($atend))echo "disabled=true "; echo checkPOST("taquicardia", "N", $lapcv->taq); ?> />N&atilde;o
	       	<input name="taquicardia" type="radio" value="NA" onchange="savCampo('6')" <?php if(ISAssinado($atend))echo "disabled=true ";echo checkPOST("taquicardia", "NA", $lapcv->taq); ?> />N&atilde;o Avaliado
	    </fieldset></td>
  	</tr>
	<tr>
		<td colspan="2"><fieldset>
	  		<legend>Observa&ccedil;&otilde;es</legend>
    		<textarea name="obscardvasc" cols="70" onkeyup="savCampo('6')" <?php if(ISAssinado($atend))echo "disabled=true ";  ?>><?php 
				echo printOBS($lapcv->obs, $_POST['obscardvasc']); ?></textarea>
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
	