<?php 
	$linha = verHF($pront);
	$linfam = getValuesTablePr('familia',$pront);
	$lindom = getValuesTablePr('condicoesdomesticas',$pront);
	$lincbom = getCbo();
	$lincbop = getCbo();
	if ($flag){
		echo '<br /><table width="590" bgcolor="#E8E8E8"><tr>';
		if ($error)
			echo "<td class='erro'>Algum dos campos informados estão incorretos. O campo está destacado em vermelho.";	
		else echo "<td class='style4'>Dados inseridos com sucesso.";	
		echo "</td></tr></table><br />";
	}
?>
<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Familiar</td>
    	
    </tr>
</table>
<br/>
<fieldset style="width:590px;">
	<legend>Pais</legend>
    <table width="580">
		<tr class="style5">
			<td width="43" align="left"><p>Tipo de Uni&atilde;o:</p></td>
<td colspan="3" align="left"><select style="float:left;" name="uniaopais" onchange="savCampo('hf')">
				<option value="UE" <?php echo checkOption("uniaopais", "UE", $linfam->uniaopais); ?>>Uni&atilde;o Est&aacute;vel
				</option>
				<option value="C" <?php echo checkOption("uniaopais", "C", $linfam->uniaopais); ?>>Casamento</option>
				<option value="SJ" <?php echo checkOption("uniaopais", "SJ", $linfam->uniaopais);?>>Separa&ccedil;&atilde;o Judicial
				</option>
				<option value="O" <?php echo checkOption("uniaopais", "O", $linfam->uniaopais); ?>>Outros</option>
				<option value='NA' <?php echo checkOption("uniaopais", "NA", $linfam->uniaopais); ?>>Não Avaliado</option>
			</select></td>
	  </tr>
		<tr class="style5">
			<td width="43" align="left" id="lblidadmae" <?php if ($error && !$linha->ass && ($_POST['idademae'] <= "0" || 
				!is_numeric($_POST['idademae']))){ echo 'class="erro"'; }?>>Idade da M&atilde;e:</td>
	  	  <td width="3">
          <input name="idademae" size="3" maxlength="2"onkeyup="savCampo('hf')" onfocus="mudaLb(lblidadmae)" 
		  		value="<?php echo printCampo($linfam->idademae, $_POST['idademae']); ?>" /></td>
	 
  	  	  
  	  </tr>
      <tr class="style5">
       <td width="72" align="left" <?php if ($error && !$linha->ass && $_POST['profmae'] == "0") echo 'class="erro"'; ?>>
				Ocupa&ccedil;&atilde;o da M&atilde;e:</td>
      <td  >
      	<select name="profmae" onchange="savCampo('hf')" >
                  			<option value='0'>Selecione</option>
                  		<?php while ($dados = mysql_fetch_array($lincbom)) { ?>
                  			<option value="<?php echo $dados['cod']; ?>" <?php echo checkOpUF("profmae", $dados['cod'],$linfam->profmae);?> style="width:100px;">
								<?php echo $dados['descricao']; ?></option>
    		        	<?php } ?>
               		  </select>
      
     </td>
       </tr>
		<tr class="style5">
			<td width="43" align="left" id="lblidadpai" <?php if ($error && !$linha->ass && ($_POST['idadepai'] <= "0" || 
				!is_numeric($_POST['idadepai']))){ echo 'class="erro"'; }?>>Idade do Pai:</td>
		  <td width="3"><input name="idadepai" size="3" maxlength="2" onkeyup="savCampo('hf')" onfocus="mudaLb(lblidadpai)" 
				value="<?php echo printCampo($linfam->idadepai, $_POST['idadepai']); ?>"/></td>
			
		  
	  </tr>
      <tr class="style5">
      <td width="72" align="left" <?php if ($error && !$linha->ass && $_POST['profpai'] == "0") echo 'class="erro"'; ?>>
				Ocupa&ccedil;&atilde;o do Pai:</td>
      <td >
      <select name="profpai" onchange="savCampo('hf')">
                  			<option value='0' style="width:100px;">Selecione</option>
                  		<?php while ($dados = mysql_fetch_array($lincbop)) { ?>
                  			<option value="<?php echo $dados['cod']; ?>" <?php echo checkOpUF("profpai", $dados['cod'],$linfam->profpai);?> style="width:100px;">
								<?php echo $dados['descricao']; ?></option>
    		        	<?php } ?>
               		  </select>
      
     		</td>
      </tr>
		<tr class="style5">
			<td colspan="3"><fieldset style="width:565px;">
          <legend>Detalhes</legend><textarea  name="pais" cols="65" onkeyup="savCampo('hf')" onfocus="mudaLb(lbldet)"><?php echo printOBS($linfam->pais, $_POST['pais']); ?></textarea></fieldset></td>
            
            
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
		  	<td width="478" style="float:left;"><textarea name="avos" cols="60" onkeyup="savCampo('hf')" onfocus="mudaLb(lblavos)"><?php echo printOBS($linfam->avos, $_POST['avos']); ?></textarea></td>
		</tr>
		<tr class="style5">
			<td width="90" align="right" valign="top" id="lblirm" <?php if ($error && !$linha->ass && $_POST['irmaos']=="")
				 ?>>Irm&atilde;os:</td>
		  	<td width="478"  style="float:left;"><textarea name="irmaos" cols="60" onkeyup="savCampo('hf')" onfocus="mudaLb(lblirm)"><?php echo printOBS($linfam->irmaos, $_POST['irmaos']); ?></textarea></td>
		</tr>
		<tr class="style5">
			<td width="90" align="right" valign="top" id="lblout" <?php if ($error && !$linha->ass && $_POST['outros']=="")
				 ?>>Outros:</td>
		  <td width="478"  style="float:left;"><textarea name="outros" cols="60" onkeyup="savCampo('hf')" onfocus="mudaLb(lblout)"><?php echo printOBS($linfam->outros, $_POST['outros']); ?></textarea></td>
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
						<select name="tiporesid" onchange="savCampo('hf')" onfocus="mudaLb(lbltipores)">
							<option value='A' <?php echo checkOption("tiporesid", "A", $lindom->resid);?>>Alvenaria</option>
							<option value='T' <?php echo checkOption("tiporesid", "T", $lindom->resid); ?>>Taipa</option>
							<option value='B' <?php echo checkOption("tiporesid", "B", $lindom->resid); ?>>Barraco</option>
							<option value='NA' <?php echo checkOption("tiporesid", "NA", $lindom->resid); ?>>Não Avaliado</option>
						</select></td>
						<td width="167" id="lblncom" <?php if ($error && !$linha->ass && ($_POST['ncomodos'] <= "0" || 
							!is_numeric($_POST['ncomodos'])))?>>N&ordm; de C&ocirc;modos:
						<input name="ncomodos" size="4" maxlength="3" onfocus="mudaLb(lblncom)" onkeyup="savCampo('hf')"
							value="<?php echo printCampo($lindom->comod, $_POST['ncomodos']); ?>"/></td>
						<td width="181" id="lblnocup" <?php if ($error && !$linha->ass && ($_POST['nocupantes'] <= "0" || 
							!is_numeric($_POST['nocupantes'])))?>>N&ordm; de Ocupantes:
						<input name="nocupantes" size="4" maxlength="3" onfocus="mudaLb(lblnocup)" onkeyup="savCampo('hf')"
							value="<?php echo printCampo($lindom->ocup, $_POST['nocupantes']); ?>"/></td>
					</tr>
				</table>
			</fieldset></td>
		</tr>
	  	<tr>
			<td width="274"><fieldset style="width:274px">
				<legend>&Aacute;gua</legend>
				<input name="agua" type="radio" value="E" onchange="savCampo('hf')" <?php echo checkPOST("agua", "E",$lindom->agua);?>/>
					Encanada
				<input name="agua" type="radio" value="NE" onchange="savCampo('hf')"<?php echo checkPOST("agua","NE",$lindom->agua);?>/>
					N&atilde;o-encanada
				<input name="agua" type="radio" value="NA" onchange="savCampo('hf')"<?php echo checkPOST("agua","NA",$lindom->agua);?>/>
					N&atilde;o Avaliado
			</fieldset></td>
			<td width="259"><fieldset>
				<legend>Saneamento</legend>
				<select name="saneamento" onchange="savCampo('hf')">
					<option value="EE" <?php echo checkOption("saneamento", "EE", $lindom->sanea); ?>>Esgoto Encanado</option>
					<option value="FS" <?php echo checkOption("saneamento", "FS", $lindom->sanea); ?>>Fossa Séptica</option>
					<option value="EA" <?php echo checkOption("saneamento", "EA", $lindom->sanea); ?>>Esgoto a Céu Aberto</option>
					<option value="NA" <?php echo checkOption("saneamento", "NA", $lindom->sanea); ?>>Não Avaliado</option>
				</select>
			</fieldset></td>
		</tr>
		<tr>
			<td><fieldset>
				<legend>Luz</legend>
				<input name="luz" type="radio" value="S" onchange="savCampo('hf')"
					<?php echo checkPOST("luz", "S", $lindom->luz); ?>/>Sim
				<input name="luz" type="radio" value="N" onchange="savCampo('hf')"
					<?php echo checkPOST("luz", "N", $lindom->luz); ?>/>N&atilde;o
				<input name="luz" type="radio" value="NA" onchange="savCampo('hf')"
					<?php echo checkPOST("luz", "NA", $lindom->luz, $flag); ?>/>N&atilde;o Avaliado
			</fieldset></td>
			<td><fieldset>
				<legend>Presen&ccedil;a de Animais</legend>
				<input name="animais" type="radio" value="S" onchange="savCampo('hf')" 
					<?php echo checkPOST("animais", "S", $lindom->animdom); ?>/>Sim
				<input name="animais" type="radio" value="N" onchange="savCampo('hf')" 
					<?php echo checkPOST("animais", "N", $lindom->animdom); ?>/>N&atilde;o
				<input name="animais" type="radio" value="NA" onchange="savCampo('hf')"
					<?php echo checkPOST("animais", "NA", $lindom->animdom); ?>/>N&atilde;o Avaliado
			</fieldset></td>
		</tr>
	</table>
</fieldset>

<fieldset style="width:590px">
	<legend>Observa&ccedil;&otilde;es</legend>
	<textarea name="obsconddom" cols="66" onkeyup="savCampo('hf')" <?php echo checkAssinado($linha->ass); ?>
		><?php echo printOBS($lindom->obs, $_POST['obsconddom']); ?></textarea>
</fieldset>
<br />