<?php
	include("verAssEx.php");
	$leme = getValuesTableAt('examemuscesq',$atend);
?>
<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Exame Físico > Especial > M&uacute;sculo-Esquel&eacute;tico</td>
    </tr>
</table>

<br />


<table width="580">
	<tr>
		<td width="275"><fieldset style="width:275px">
			<legend>Anomalias</legend>
			<input name="anommusc" type="radio" value="P" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("anommusc", "P", $leme->anom); ?>/>Presentes
            <input name="anommusc" type="radio" value="A" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("anommusc", "A", $leme->anom); ?>/>Ausentes
            <input name="anommusc" type="radio" value="NA" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("anommusc", "NA", $leme->anom); ?>/>N&atilde;o Avaliado
  	  </fieldset></td>
		<td width="293"><fieldset>
			<legend>Deformidades</legend>
			<input name="deformmusc" type="radio" value="P" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("deformmusc", "P", $leme->deform); ?>/>Presentes
            <input name="deformmusc" type="radio" value="A" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("deformmusc", "A", $leme->deform); ?>/>Ausentes
            <input name="deformmusc" type="radio" value="NA" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("deformmusc", "NA", $leme->deform); ?>/>N&atilde;o Avaliado
	  </fieldset></td>
	</tr>
	<tr>
		<td><fieldset>
			<legend>Edemas</legend>
			<input name="edemamusc" type="radio" value="P" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("edemamusc", "P", $leme->edemas); ?>/>Presentes
            <input name="edemamusc" type="radio" value="A" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("edemamusc", "A", $leme->edemas); ?>/>Ausentes
            <input name="edemamusc" type="radio" value="NA" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("edemamusc", "NA", $leme->edemas); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>Tumora&ccedil;&otilde;es</legend>
			<input name="tumomusc" type="radio" value="P" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("tumomusc", "P", $leme->tumor); ?>/>Presentes
            <input name="tumomusc" type="radio" value="A" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("tumomusc", "A", $leme->tumor); ?>/>Ausentes
            <input name="tumomusc" type="radio" value="NA" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("tumomusc", "NA", $leme->tumor); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
	<tr>
		<td><fieldset>
			<legend>For&ccedil;a Muscular</legend>
			<select name="forcmusc" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('E')">
            	<option value="N" <?php echo checkOption("forcmusc", "N", $leme->forcmusc); ?>>Normal</option>
            	<option value="D" <?php echo checkOption("forcmusc", "D", $leme->forcmusc); ?>>Diminu&iacute;da</option>
              	<option value="NA" <?php echo checkOption("forcmusc","NA",$leme->forcmusc); ?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
		<td><fieldset>
			<legend>Dor &Oacute;ssea e Articular </legend>
			<input name="dorossea" type="radio" value="P" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("dorossea", "P", $leme->dorossart); ?>/>Presentes
            <input name="dorossea" type="radio" value="A" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("dorossea", "A", $leme->dorossart); ?>/>Ausentes
            <input name="dorossea" type="radio" value="NA" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("dorossea", "NA", $leme->dorossart); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
	<tr>
		<td><fieldset>
			<legend>Movimenta&ccedil;&atilde;o Ativa</legend>
			<select name="movativ" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('E')">
            	<option value="N" <?php echo checkOption("movativ", "N", $leme->movativ); ?>>Normal</option>
            	<option value="L" <?php echo checkOption("movativ", "L", $leme->movativ); ?>>Limitada</option>
              	<option value="NA" <?php echo checkOption("movativ","NA",$leme->movativ); ?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
		<td><fieldset>
			<legend>Movimenta&ccedil;&atilde;o Passiva</legend>
			<select name="movpas" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('E')">
            	<option value="N" <?php echo checkOption("movpas", "N", $leme->movpass); ?>>Normal</option>
            	<option value="L" <?php echo checkOption("movpas", "L", $leme->movpass); ?>>Limitada</option>
              	<option value="NA" <?php echo checkOption("movpas","NA",$leme->movpass); ?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
	</tr>
	<tr>
		<td width="276"><fieldset>
			<legend>Escoliose</legend>
			<input name="escoliose" type="radio" value="P" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("escoliose", "P", $leme->escol); ?>/>Presente
            <input name="escoliose" type="radio" value="A" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("escoliose", "A", $leme->escol); ?>/>Ausente
            <input name="escoliose" type="radio" value="NA" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("escoliose", "NA", $leme->escol); ?>/>N&atilde;o Avaliado
  	  	</fieldset></td>
		<td width="292"><fieldset>
			<legend>Lordose</legend>
			<input name="lordose" type="radio" value="P" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("lordose", "P", $leme->lordo); ?>/>Presente
            <input name="lordose" type="radio" value="A" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("lordose", "A", $leme->lordo); ?>/>Ausente
            <input name="lordose" type="radio" value="NA" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("lordose", "NA", $leme->lordo); ?>/>N&atilde;o Avaliado
	  </fieldset></td>
  	</tr>
	<tr>
		<td><fieldset>
			<legend>Cifose</legend>
			<input name="cifose" type="radio" value="P" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("cifose", "P", $leme->cifose); ?>/>Presente
            <input name="cifose" type="radio" value="A" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("cifose", "A", $leme->cifose); ?>/>Ausente
            <input name="cifose" type="radio" value="NA" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("cifose", "NA", $leme->cifose); ?>/>N&atilde;o Avaliado
        </fieldset></td>
		<td><fieldset>
			<legend>Curvatura Para Frente (simetria de esc&aacute;pulas)</legend>
			<input name="curvfr" type="radio" value="P" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("curvfr", "P", $leme->curvfren); ?>/>Presente
            <input name="curvfr" type="radio" value="A" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("curvfr", "A", $leme->curvfren); ?>/>Ausente
            <input name="curvfr" type="radio" value="NA" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("curvfr", "NA", $leme->curvfren); ?>/>N&atilde;o Avaliado
		</fieldset></td>
 	</tr>
	<tr>
		<td><fieldset>
			<legend>Espasmos Musculares</legend>
			<input name="espmusc" type="radio" value="P" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("espmusc", "P", $leme->espmusc); ?>/>Presentes
            <input name="espmusc" type="radio" value="A" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("espmusc", "A", $leme->espmusc); ?>/>Ausentes
            <input name="espmusc" type="radio" value="NA" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("espmusc", "NA", $leme->espmusc); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>Dor Local</legend>
			<input name="dorlocmusc" type="radio" value="P" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("dorlocmusc", "P", $leme->dorloc); ?>/>Presente
            <input name="dorlocmusc" type="radio" value="A" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("dorlocmusc", "A", $leme->dorloc); ?>/>Ausente
            <input name="dorlocmusc" type="radio" value="NA" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("dorlocmusc", "NA", $leme->dorloc); ?>/>N&atilde;o Avaliado
		</fieldset></td>
  	</tr>
	<tr>
		<td colspan="2"><fieldset style="width:275px">
			<legend>Dor Reflexa</legend>
			<input name="dorrefmusc" type="radio" value="P" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("dorrefmusc", "P", $leme->dorrefl); ?>/>Presente
            <input name="dorrefmusc" type="radio" value="A" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("dorrefmusc", "A", $leme->dorrefl); ?>/>Ausente
            <input name="dorrefmusc" type="radio" value="NA" onChange="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("dorrefmusc", "NA", $leme->dorrefl); ?>/>N&atilde;o Avaliado
  	  </fieldset></td>
  	</tr>
	<tr>
  		<td colspan="2"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
        	<textarea name="obsmusc" cols="68" onKeyUp="savCampo('E')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>
				><?php echo printOBS($leme->obs, $_POST['obsmusc']); ?></textarea>
	  	</fieldset>
        <?php 
		if ($linha->ass) { ?>
<fieldset><legend> Assinatura</legend>	<?php 
				echo "<table ><tr><td><font size='2' face='Trebuchet MS' color='#666666'>".  getNomeAluno($linha->idAlun)." - ".printData($linha->dthr)." - ".
		printHora($linha->dthr)."</font></td></tr></table>";?></fieldset> <?php } ?>
<?php
include("functions/funcoesimpressoes.php");
printAdendoEX($atend); ?></td>
	</tr>
</table>
