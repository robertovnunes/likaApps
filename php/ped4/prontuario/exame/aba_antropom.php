<?php
	$lant = getValuesTableAt('antroestpuberal',$atend);
	include("verAssEx.php");
?>

<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Exame Físico > Antropometria > Estadiamento Puberal</td>
    </tr>
</table>

<br />
<table width="580">
  	<tr>
    	<td><fieldset>
      		<legend>P&ecirc;los Pubianos</legend>
			<select name="ppub" onChange="savCampo('4')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>>
				<option value="1" <?php echo checkOption("ppub", "1", $lant->pelos); ?>>Est&aacute;gio I</option>
				<option value="2" <?php echo checkOption("ppub", "2", $lant->pelos); ?>>Est&aacute;gio II</option>
				<option value="3" <?php echo checkOption("ppub", "3", $lant->pelos); ?>>Est&aacute;gio III</option>
				<option value="4" <?php echo checkOption("ppub", "4", $lant->pelos); ?>>Est&aacute;gio IV</option>
				<option value="5" <?php echo checkOption("ppub", "5", $lant->pelos); ?>>Est&aacute;gio V</option>
				<option value="NA" <?php echo checkOption("ppub", "NA", $lant->pelos); ?>>N&atilde;o Avaliado</option>
			</select>
    	</fieldset></td>
  	<?php if ($paciente->sexo == "F") { ?>
		<td><fieldset>
      		<legend>Mamas</legend>
			<select name="mamaspub" onChange="savCampo('4')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>>
				<option value="1" <?php echo checkOption("mamaspub", "1", $lant->mamas); ?>>Est&aacute;gio I</option>
				<option value="2" <?php echo checkOption("mamaspub", "2", $lant->mamas); ?>>Est&aacute;gio II</option>
				<option value="3" <?php echo checkOption("mamaspub", "3", $lant->mamas); ?>>Est&aacute;gio III</option>
				<option value="4" <?php echo checkOption("mamaspub", "4", $lant->mamas); ?>>Est&aacute;gio IV</option>
				<option value="5" <?php echo checkOption("mamaspub", "5", $lant->mamas); ?>>Est&aacute;gio V</option>
				<option value="NA" <?php echo checkOption("mamaspub", "NA", $lant->mamas); ?>>N&atilde;o Avaliado</option>
			</select>
    	</fieldset></td>
  	</tr>
	<?php } else if ($paciente->sexo == "M"){?>
  	</tr>
	<tr>
    	<td width="258"><fieldset>
      		<legend>Volume Testicular</legend>
      		<select name="voltest" onChange="savCampo('4')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>>
        		<option value="-4" <?php echo checkOption("voltest", "-4", $lant->voltest); ?>>Menos de 4 mL</option>
        		<option value="4" <?php echo checkOption("voltest", "4", $lant->voltest); ?>>4 mL</option>
        		<option value="9" <?php echo checkOption("voltest", "9", $lant->voltest); ?>>9 mL</option>
        		<option value="16" <?php echo checkOption("voltest", "16", $lant->voltest); ?>>16 mL</option>
        		<option value="20" <?php echo checkOption("voltest", "20", $lant->voltest); ?>>20 mL</option>
      			<option value="NA" <?php echo checkOption("voltest", "NA", $lant->voltest); ?>>N&atilde;o Avaliado</option>
      		</select>
    	</fieldset></td>
    	<td width="310"><fieldset>
      		<legend>Genitais</legend>
			<select name="genit" onChange="savCampo('4')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>>
				<option value="1" <?php echo checkOption("genit", "1", $lant->genit); ?>>Est&aacute;gio I</option>
				<option value="2" <?php echo checkOption("genit", "2", $lant->genit); ?>>Est&aacute;gio II</option>
				<option value="3" <?php echo checkOption("genit", "3", $lant->genit); ?>>Est&aacute;gio III</option>
				<option value="4" <?php echo checkOption("genit", "4", $lant->genit); ?>>Est&aacute;gio IV</option>
				<option value="5" <?php echo checkOption("genit", "5", $lant->genit); ?>>Est&aacute;gio V</option>
				<option value="NA" <?php echo checkOption("genit", "NA", $lant->genit); ?>>N&atilde;o Avaliado</option>
			</select>
    	</fieldset></td>
  	</tr>
  	<?php } ?>
  	<tr>
		<td colspan="2"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
			<textarea name="obseantrop" cols="70" onKeyUp="savCampo('4')" <?php if(EXAssinado($atend)) echo " disabled=true ";?>
				><?php echo printOBS($lant->obs, $_POST['obseantrop']); ?></textarea>
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
