<?php
	include("verAssEx.php");
	$lenv = getValuesTableAt('examenervoso',$atend);
?>

<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Exame Físico > Especial > Nervoso</td>
    </tr>
</table>

<br />

<table width="580">
	<tr>
		<td width="275"><fieldset style="width:275px">
			<legend>Avalia&ccedil;&atilde;o do N&iacute;vel de Consci&ecirc;ncia</legend>
			<select name="avnivconsc" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('F')">
              <option value="A" <?php echo checkOption("avnivconsc", "A", $lenv->nivconsc); ?>>Alerta</option>
              <option value="S" <?php echo checkOption("avnivconsc", "S", $lenv->nivconsc); ?>>Sonolento</option>
              <option value="NA" <?php echo checkOption("avnivconsc", "NA", $lenv->nivconsc); ?>>N&atilde;o Avaliado</option>
            </select>
	  </fieldset></td>
		<td width="293"><fieldset>
			<legend>Orienta&ccedil;&atilde;o</legend>
			<input name="orientnerv" type="radio" value="S" onChange="savCampo('F')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("orientnerv", "S", $lenv->orient); ?>/>Sim
            <input name="orientnerv" type="radio" value="N" onChange="savCampo('F')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("orientnerv", "N", $lenv->orient); ?>/>N&atilde;o
            <input name="orientnerv" type="radio" value="NA" onChange="savCampo('F')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("orientnerv", "NA", $lenv->orient); ?>/>N&atilde;o Avaliado
	  </fieldset></td>
	<tr>
	<tr>
		<td colspan="2"><fieldset style="width:275px">
			<legend>Sinais Focais Relativos Aos Pares Cranianos</legend>
			<select name="sinfocc" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('F')">
              <option value="N" <?php echo checkOption("sinfocc", "N", $lenv->sinfoccran); ?>>Normais</option>
              <option value="A" <?php echo checkOption("sinfocc", "A", $lenv->sinfoccran); ?>>Alterados</option>
              <option value="NA" <?php echo checkOption("sinfocc", "NA", $lenv->sinfoccran); ?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
	</tr>
	<tr>
  		<td colspan="2"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
        	<textarea name="obsnerv" cols="68" onKeyUp="savCampo('F')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>
				><?php echo printOBS($lenv->obs, $_POST['obsnerv']); ?></textarea>
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