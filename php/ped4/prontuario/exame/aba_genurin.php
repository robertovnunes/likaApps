<?php
	include("verAssEx.php");
	$legu = getValuesTableAt('examegenurin',$atend);
?>

<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Exame Físico > Especial > Genito-Urin&aacute;rio</td>
    </tr>
</table>

<br />

<table width="580">
<?php if ($paciente->sexo == "F") {  
	$lesf = getValuesTableAt('examegenfem',$atend);
?>
	<tr>
		<td><fieldset>
			<legend>Pequenos L&aacute;bios</legend>
			<select name="peqlab" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('D')">
              <option value="N" <?php echo checkOption("peqlab", "N", $lesf->peqlab); ?>>Normais</option>
              <option value="C" <?php echo checkOption("peqlab", "C", $lesf->peqlab); ?>>Coalescentes</option>
              <option value="NA" <?php echo checkOption("peqlab", "NA", $lesf->peqlab); ?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
		<td><fieldset>
			<legend>H&iacute;men</legend>
			<select name="himen" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('D')">
              <option value="N" <?php echo checkOption("himen", "N", $lesf->himen); ?>>Normais</option>
              <option value="C" <?php echo checkOption("himen", "C", $lesf->himen); ?>>Coalescentes</option>
              <option value="NA" <?php echo checkOption("himen", "NA", $lesf->himen); ?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
	<tr>
	<tr>
		<td><fieldset>
			<legend>Secre&ccedil;&atilde;o Vaginal</legend>
			<input name="secrvag" type="radio" value="P" onChange="savCampo('D')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("secrvag", "P", $lesf->secrvg); ?>/>Presentes
            <input name="secrvag" type="radio" value="A" onChange="savCampo('D')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("secrvag", "A", $lesf->secrvg); ?>/>Ausentes
            <input name="secrvag" type="radio" value="NA" onChange="savCampo('D')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("secrvag", "NA", $lesf->secrvg); ?>/>N&atilde;o Avaliado
		</fieldset></td>
<?php } else if ($paciente->sexo == "M") {  
	$lesm = getValuesTableAt('examegenmasc',$atend);
?>
	<tr>
		<td><fieldset>
			<legend>Fimose</legend>
			<select name="fimose" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('D')">
              <option value="F" <?php echo checkOption("fimose", "F", $lesm->fimose); ?>>Fisiol&oacute;gica</option>
              <option value="P" <?php echo checkOption("fimose", "P", $lesm->fimose); ?>>Presente</option>
              <option value="A" <?php echo checkOption("fimose", "A", $lesm->fimose); ?>>Ausente</option>
              <option value="NA" <?php echo checkOption("fimose", "NA", $lesm->fimose); ?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
		<td><fieldset>
			<legend>Circuncis&atilde;o</legend>
			<input name="circunc" type="radio" value="P" onChange="savCampo('D')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("circunc", "P", $lesm->circ); ?>/>Presente
            <input name="circunc" type="radio" value="A" onChange="savCampo('D')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("circunc", "A", $lesm->circ); ?>/>Ausente
            <input name="circunc" type="radio" value="NA" onChange="savCampo('D')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("circunc", "NA", $lesm->circ); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	<tr>
	<tr>
		<td><fieldset>
			<legend>Hidrocele</legend>
			<input name="hidroc" type="radio" value="P" onChange="savCampo('D')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("hidroc", "P", $lesm->hidroc); ?>/>Presente
            <input name="hidroc" type="radio" value="A" onChange="savCampo('D')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("hidroc", "A", $lesm->hidroc); ?>/>Ausente
            <input name="hidroc" type="radio" value="NA" onChange="savCampo('D')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("hidroc", "NA", $lesm->hidroc); ?>/>N&atilde;o Avaliado
		</fieldset></td>
		<td><fieldset>
			<legend>Varicocele</legend>
			<input name="varic" type="radio" value="P" onChange="savCampo('D')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("varic", "P", $lesm->varic); ?>/>Presente
            <input name="varic" type="radio" value="A" onChange="savCampo('D')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("varic", "A", $lesm->varic); ?>/>Ausente
            <input name="varic" type="radio" value="NA" onChange="savCampo('D')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("varic", "NA", $lesm->varic); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	<tr>
	<tr>
		<td><fieldset>
			<legend>Test&iacute;culos</legend>
			<select name="testic" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('D')">
              <option value="N" <?php echo checkOption("testic", "N", $lesm->test); ?>>Normais</option>
              <option value="A+" <?php echo checkOption("testic", "A+", $lesm->test); ?>>Aumentados</option>
              <option value="C" <?php echo checkOption("testic", "C", $lesm->test); ?>>Criptorquidia</option>
              <option value="AT" <?php echo checkOption("testic", "AT", $lesm->test); ?>>Aus&ecirc;ncia de 1 test&iacute;culo
			  </option>
              <option value="Au" <?php echo checkOption("testic", "Au", $lesm->test); ?>>Ausentes</option>
              <option value="NA" <?php echo checkOption("testic", "NA", $lesm->test); ?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
<?php } ?>
		<td><fieldset>
			<legend>Secre&ccedil;&atilde;o Uretral</legend>
			<input name="secruret" type="radio" value="P" onChange="savCampo('D')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("secruret", "P", $legu->secruret); ?>/>Presente
            <input name="secruret" type="radio" value="A" onChange="savCampo('D')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("secruret", "A", $legu->secruret); ?>/>Ausente
            <input name="secruret" type="radio" value="NA" onChange="savCampo('D')" <?php if(EXAssinado($atend)) echo " disabled=true ";
				echo checkPOST("secruret", "NA", $legu->secruret); ?>/>N&atilde;o Avaliado
		</fieldset></td>
	</tr>
	<tr>
		<td width="275"><fieldset style="width:275px">
			<legend>P&ecirc;los</legend>
			<select name="pelos" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('D')">
              <option value="N" <?php echo checkOption("pelos", "N", $legu->pelos); ?>>Normais para a idade</option>
              <option value="A" <?php echo checkOption("pelos", "A", $legu->pelos); ?>>Alterados para a idade</option>
              <option value="NA" <?php echo checkOption("pelos","NA",$legu->pelos);?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
		<td><fieldset>
			<legend>Lojas Renais</legend>
			<select name="lojren" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('D')">
              <option value="N" <?php echo checkOption("lojren", "N", $legu->lojren); ?>>Normal</option>
              <option value="A" <?php echo checkOption("lojren", "A", $legu->lojren); ?>>Alteradas</option>
              <option value="NA" <?php echo checkOption("lojren","NA",$legu->lojren);?>>N&atilde;o Avaliado</option>
            </select>			
		</fieldset></td>
	</tr>
	<tr>
		<td width="276"><fieldset>
			<legend>Bexiga</legend>
			<select name="bexiga" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('D')">
              <option value="N" <?php echo checkOption("bexiga", "N", $legu->bexiga); ?>>Normal</option>
              <option value="A" <?php echo checkOption("bexiga", "A", $legu->bexiga); ?>>Alterada</option>
              <option value="NA" <?php echo checkOption("bexiga","NA",$legu->bexiga);?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
		<td width="292"><fieldset>
			<legend>Aspecto</legend>
			<select name="aspgen" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('D')">
              <option value="N" <?php echo checkOption("aspgen", "N", $legu->asp); ?>>Normal</option>
              <option value="As" <?php echo checkOption("aspgen", "As", $legu->asp); ?>>Assaduras</option>
              <option value="A" <?php echo checkOption("aspgen", "A", $legu->asp); ?>>Alterado (escoria&ccedil;&otilde;es, fissuras)
			  </option>
              <option value="NA" <?php echo checkOption("aspgen","NA",$legu->asp);?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
  	</tr>
	<tr>
		<td colspan="2"><fieldset style="width:275px">
			<legend>&Acirc;nus</legend>
			<select name="anus" <?php if(EXAssinado($atend)) echo " disabled=true "; ?> onChange="savCampo('D')">
              <option value="N" <?php echo checkOption("anus", "N", $legu->anus); ?>>Normal</option>
              <option value="F" <?php echo checkOption("anus", "F", $legu->anus); ?>>Fissuras</option>
              <option value="P" <?php echo checkOption("anus", "P", $legu->anus); ?>>Prolapso</option>
              <option value="E" <?php echo checkOption("anus", "E", $legu->anus);?>>Escoria&ccedil;&otilde;es e/ou fissuras</option>
              <option value="NA" <?php echo checkOption("anus","NA",$legu->anus);?>>N&atilde;o Avaliado</option>
            </select>
		</fieldset></td>
	</tr>
	<tr>
  		<td colspan="2"><fieldset>
			<legend>Observa&ccedil;&otilde;es</legend>
        	<textarea name="obsgen" cols="68" onKeyUp="savCampo('D')" <?php if(EXAssinado($atend)) echo " disabled=true "; ?>
				><?php echo printOBS($legu->obs, $_POST['obsgen']); ?></textarea>
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
