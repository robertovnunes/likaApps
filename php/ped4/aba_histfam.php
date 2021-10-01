<?php 
	$linha = verHF($pront);
	$linfam = getValuesTablePr('familia',$pront);
	$lindom = getValuesTablePr('condicoesdomesticas',$pront);
	if ($flag){
		echo '<br /><table width="590" bgcolor="#629BD2"><tr>';
		if ($error)
			echo "<td class='erro'>Algum dos campos informados est�o incorretos. O campo est� destacado em vermelho.";	
		else echo "<td class='style4'>Dados inseridos com sucesso.";	
		echo "</td></tr></table><br />";
	}
?>

<fieldset style="width:590px;">
	<legend>Pais</legend>
    <table width="580">
		<tr class="style5">
			<td width="43" align="left"><p>Tipo de Uni&atilde;o:</p></td>
<td colspan="3" align="left"><select style="float:left;" name="uniaopais" onchange="savCampo()">
				<option value="UE" <?php echo checkOption("uniaopais", "UE", $linfam->uniaopais); ?>>Uni&atilde;o Est&aacute;vel
				</option>
				<option value="C" <?php echo checkOption("uniaopais", "C", $linfam->uniaopais); ?>>Casamento</option>
				<option value="SJ" <?php echo checkOption("uniaopais", "SJ", $linfam->uniaopais);?>>Separa&ccedil;&atilde;o Judicial
				</option>
				<option value="O" <?php echo checkOption("uniaopais", "O", $linfam->uniaopais); ?>>Outros</option>
				<option value='NA' <?php echo checkOption("uniaopais", "NA", $linfam->uniaopais); ?>>N�o Avaliado</option>
			</select></td>
	  </tr>
		<tr class="style5">
			<td width="43" align="left" id="lblidadmae" <?php if ($error && !$linha->ass && ($_POST['idademae'] <= "0" || 
				!is_numeric($_POST['idademae']))){ echo 'class="erro"'; }?>>Idade da M&atilde;e:</td>
	  	  <td width="3"><input name="idademae" size="3" maxlength="2"onkeyup="savCampo()" onfocus="mudaLb(lblidadmae)" 
		  		value="<?php echo printCampo($linfam->idademae, $_POST['idademae']); ?>" /></td>
	 
  	  	  
  	  </tr>
      <tr class="style5">
       <td width="72" align="left" <?php if ($error && !$linha->ass && $_POST['profmae'] == "") echo 'class="erro"'; ?>>
				Ocupa&ccedil;&atilde;o da M&atilde;e:</td>
      <td ><input name="profmae" size="40" maxlength="30"onkeyup="savCampo()" onfocus="mudaLb(lblprofmae)"
				value="<?php echo printOBS($linfam->profmae, $_POST['profmae']); ?>"/></td>
       </tr>
		<tr class="style5">
			<td width="43" align="left" id="lblidadpai" <?php if ($error && !$linha->ass && ($_POST['idadepai'] <= "0" || 
				!is_numeric($_POST['idadepai']))){ echo 'class="erro"'; }?>>Idade do Pai:</td>
		  <td width="3"><input name="idadepai" size="3" maxlength="2" onkeyup="savCampo()" onfocus="mudaLb(lblidadpai)" 
				value="<?php echo printCampo($linfam->idadepai, $_POST['idadepai']); ?>"/></td>
			
		  
	  </tr>
      <tr class="style5">
      <td width="72" align="left" <?php if ($error && !$linha->ass && $_POST['profpai'] == "") echo 'class="erro"'; ?>>
				Ocupa&ccedil;&atilde;o do Pai:</td>
      <td ><input  name="profpai" size="40" maxlength="30" onkeyup="savCampo()" onfocus="mudaLb(lblprofpai)"
				value="<?php echo printOBS($linfam->profpai,$_POST['profpai']);?>"/>			</td>
      </tr>
		<tr class="style5">
			<td colspan="3"><fieldset style="width:565px;">
          <legend>Detalhes</legend><textarea  name="pais" cols="65" onkeyup="savCampo()" onfocus="mudaLb(lbldet)"><?php echo printOBS($linfam->pais, $_POST['pais']); ?></textarea></fieldset></td>
            
            
            <td width="3" height="79" id="lbldet" <?php if ($error && !$linha->ass && $_POST['pais'] == "")
				?>> </td>
                
          
	  </tr>
</table>
</fieldset>

<fieldset style="width:540px">
	<legend>Parentes</legend>
	<table width="540px">
		<tr class="style5">
			<td width="90" align="right" valign="top" id="lblavos" <?php if ($error && !$linha->ass && $_POST['avos']=="")
				 ?>>Av&oacute;s:</td>
		  	<td width="478" style="float:left;"><textarea name="avos" cols="60" onkeyup="savCampo()" onfocus="mudaLb(lblavos)"><?php echo printOBS($linfam->avos, $_POST['avos']); ?></textarea></td>
		</tr>
		<tr class="style5">
			<td width="90" align="right" valign="top" id="lblirm" <?php if ($error && !$linha->ass && $_POST['irmaos']=="")
				 ?>>Irm&atilde;os:</td>
		  	<td width="478"  style="float:left;"><textarea name="irmaos" cols="60" onkeyup="savCampo()" onfocus="mudaLb(lblirm)"><?php echo printOBS($linfam->irmaos, $_POST['irmaos']); ?></textarea></td>
		</tr>
		<tr class="style5">
			<td width="90" align="right" valign="top" id="lblout" <?php if ($error && !$linha->ass && $_POST['outros']=="")
				 ?>>Outros:</td>
		  <td width="478"  style="float:left;"><textarea name="outros" cols="60" onkeyup="savCampo()" onfocus="mudaLb(lblout)"><?php echo printOBS($linfam->outros, $_POST['outros']); ?></textarea></td>
		</tr>
</table>
</fieldset>

<fieldset style="width:590px">
	<legend>Condi&ccedil;&otilde;es Dom&eacute;sticas</legend>
	<table width="590px" class="style5">
		<tr>
			<td colspan="2"><fieldset>
				<legend>Resid&ecirc;ncia</legend>
				<table width="520">
					<tr class="style5">
						<td width="178">Tipo:
						<select name="tiporesid" onchange="savCampo()" onfocus="mudaLb(lbltipores)">
							<option value='A' <?php echo checkOption("tiporesid", "A", $lindom->resid);?>>Alvenaria</option>
							<option value='T' <?php echo checkOption("tiporesid", "T", $lindom->resid); ?>>Taipa</option>
							<option value='B' <?php echo checkOption("tiporesid", "B", $lindom->resid); ?>>Barraco</option>
							<option value='NA' <?php echo checkOption("tiporesid", "NA", $lindom->resid); ?>>N�o Avaliado</option>
						</select></td>
						<td width="167" id="lblncom" <?php if ($error && !$linha->ass && ($_POST['ncomodos'] <= "0" || 
							!is_numeric($_POST['ncomodos'])))?>>N&ordm; de C&ocirc;modos:
						<input name="ncomodos" size="4" maxlength="3" onfocus="mudaLb(lblncom)" onkeyup="savCampo()"
							value="<?php echo printCampo($lindom->comod, $_POST['ncomodos']); ?>"/></td>
						<td width="181" id="lblnocup" <?php if ($error && !$linha->ass && ($_POST['nocupantes'] <= "0" || 
							!is_numeric($_POST['nocupantes'])))?>>N&ordm; de Ocupantes:
						<input name="nocupantes" size="4" maxlength="3" onfocus="mudaLb(lblnocup)" onkeyup="savCampo()"
							value="<?php echo printCampo($lindom->ocup, $_POST['nocupantes']); ?>"/></td>
					</tr>
				</table>
			</fieldset></td>
		</tr>
	  	<tr>
			<td width="274"><fieldset style="width:274px">
				<legend>&Aacute;gua</legend>
				<input name="agua" type="radio" value="E" onchange="savCampo()" <?php echo checkPOST("agua", "E",$lindom->agua);?>/>
					Encanada
				<input name="agua" type="radio" value="NE" onchange="savCampo()"<?php echo checkPOST("agua","NE",$lindom->agua);?>/>
					N&atilde;o-encanada
				<input name="agua" type="radio" value="NA" onchange="savCampo()"<?php echo checkPOST("agua","NA",$lindom->agua);?>/>
					N&atilde;o Avaliado
			</fieldset></td>
			<td width="259"><fieldset>
				<legend>Saneamento</legend>
				<select name="saneamento" onchange="savCampo()">
					<option value="EE" <?php echo checkOption("saneamento", "EE", $lindom->sanea); ?>>Esgoto Encanado</option>
					<option value="FS" <?php echo checkOption("saneamento", "FS", $lindom->sanea); ?>>Fossa S�ptica</option>
					<option value="EA" <?php echo checkOption("saneamento", "EA", $lindom->sanea); ?>>Esgoto a C�u Aberto</option>
					<option value="NA" <?php echo checkOption("saneamento", "NA", $lindom->sanea); ?>>N�o Avaliado</option>
				</select>
			</fieldset></td>
		</tr>
		<tr>
			<td><fieldset>
				<legend>Luz</legend>
				<input name="luz" type="radio" value="S" onchange="savCampo()"
					<?php echo checkPOST("luz", "S", $lindom->luz); ?>/>Sim
				<input name="luz" type="radio" value="N" onchange="savCampo()"
					<?php echo checkPOST("luz", "N", $lindom->luz); ?>/>N&atilde;o
				<input name="luz" type="radio" value="NA" onchange="savCampo()"
					<?php echo checkPOST("luz", "NA", $lindom->luz, $flag); ?>/>N&atilde;o Avaliado
			</fieldset></td>
			<td><fieldset>
				<legend>Presen&ccedil;a de Animais</legend>
				<input name="animais" type="radio" value="S" onchange="savCampo()" 
					<?php echo checkPOST("animais", "S", $lindom->animdom); ?>/>Sim
				<input name="animais" type="radio" value="N" onchange="savCampo()" 
					<?php echo checkPOST("animais", "N", $lindom->animdom); ?>/>N&atilde;o
				<input name="animais" type="radio" value="NA" onchange="savCampo()"
					<?php echo checkPOST("animais", "NA", $lindom->animdom); ?>/>N&atilde;o Avaliado
			</fieldset></td>
		</tr>
	</table>
</fieldset>

<fieldset style="width:590px">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsconddom" cols="66" onkeyup="savCampo()" <?php echo checkAssinado($linha->ass); ?>
		><?php echo printOBS($lindom->obs, $_POST['obsconddom']); ?></textarea>
</fieldset>
<br />