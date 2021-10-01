<?php
	$legang = getValuesTableAt('exameganglinf',$atend);
	include("verAssEx.php");
?>
<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Exame Físico > Geral > G&acirc;nglios Linf&aacute;ticos</td>
    </tr>
</table>
<br />
<fieldset style="width:200px">
<legend>G&acirc;nglios Linf&aacute;ticos</legend>
<table width="560">
	<tr>
    	<td><select name="ganglinf" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('3')">
			<option value="N" <?php echo checkOption("ganglinf", "N", $legang->ganglios); ?>>Normais</option>
			<option value="A" <?php echo checkOption("ganglinf", "A", $legang->ganglios); ?>>Anormais</option>
			<option value="NA" <?php echo checkOption("ganglinf", "NA", $legang->ganglios); ?>>N&atilde;o Avaliado</option>
		</select></td>
  	</tr>
  	<tr>
		<td><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
			<textarea name="obsegang" cols="68" onKeyUp="savCampo('3')" <?php if(EXAssinado($atend)) echo " disabled=true ";?>
				><?php echo printOBS($legang->obs, $_POST['obsegang']); ?></textarea>
		</fieldset>	
		<?php 
		if ($linha->ass) { ?>
<fieldset><legend> Assinatura</legend>	<?php 
		
				echo "<table ><tr><td><font size='2' face='Trebuchet MS' color='#666666'>".  getNomeAluno($linha->idAlun)." - ".printData($linha->dthr)." - ".
		printHora($linha->dthr)."</font></td></tr></table>";?></fieldset> <?php } ?>
<?php
include("functions/funcoesimpressoes.php");
printAdendoEX($atend); ?>	</td>
	</tr>
</table>
</fieldset>