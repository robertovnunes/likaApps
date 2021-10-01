<?php
	$informante = consultaInformante($atend);
	$cid = $informante->idCid;
	$est = $informante->idEst;
	$sql_estados = listaEstado();
	//$cidad = consultaCidade($cid);
	$sql_parentesco = consultaParentesco();
	$sql_escolaridade = consultaEscolaridade();
	if ($_POST['estado'] != "" && $_POST['estado'] != "0") $sql_cidades = listaCidade($_POST['estado']); 
	else $sql_cidades = listaCidade($est);

	if ($flag){
		echo '<br /><table width="590" bgcolor="#E8E8E8"><tr>';
		if ($error){
			echo '<td class="erro">Preencha corretamente os campos destacados em vermelho.';
		} else if (!$error){
			echo '<td class="style4">Dados inseridos com sucesso.';
		}
		echo '<br /></td></tr></table><br />';
	}	
?>


<table width="550" class="style7" bgcolor="#E8E8E8">
	<tr>
    	<td>Cadastro de Informante</td>
    	<td>(*) Campos Obrigat&oacute;rios</td>
    </tr>
</table>
<br />
<fieldset style="width:590px" bgcolor="#E8E8E8">
	<legend>Dados Pessoais</legend>
    <table width="522" class="style5" bgcolor="#E8E8E8">
    	<tr>
        	<td width="100" align="right" id="lblnome" <?php if ($error && $_POST['nome'] == ""){echo 'class="erro"';}?>>Nome*:</td>
           	<td width="410"><input name="nome" onfocus="mudaLb(lblnome)" size="65" maxlength="50" onkeyup="savCampo()"
				value="<?php echo printOBS($informante->nome,$_POST['nome']); ?>" /></td>
      	</tr>
        <tr>
        	<td width="100" align="right" id="lblsexo" <?php if ($error && $_POST['sexo'] == ""){echo 'class="erro"';}?>>Sexo*:</td>
          	<td><input name="sexo" type="radio" value="M" id="radio" <?php echo checkPOST("sexo", "M", $informante->sexo);?>
				onfocus="mudaLb(lblsexo)" onchange="savCampo()" />Masculino
            <input name="sexo" type="radio" value="F" id="radio" <?php echo checkPOST("sexo", "F", $informante->sexo);?>
				onfocus="mudaLb(lblsexo)" onchange="savCampo()"/>Feminino</td>
       	</tr>
  	</table>
</fieldset>
<fieldset style="width:590px">
 	<legend>Endere&ccedil;o</legend>
   	<table width="549" class="style5" bgcolor="#E8E8E8">
    	<tr>
           	<td width="99" align="right" id="lblende" <?php if ($error && $_POST['ende'] == ""){echo 'class="erro"';}?>>
				Endere&ccedil;o*:</td>
            <td colspan="5"><input name="ende" size="65" maxlength="50" onfocus="mudaLb(lblende)" onkeyup="savCampo()"
				value="<?php echo printOBS($informante->ender, $_POST['ende']); ?>"/></td>
   		</tr>
	  	<tr>
   			<td align="right">Complemento:</td>
       		<td colspan="5"><input name="comp" size="25" maxlength="20" onkeyup="savCampo()"
				value="<?php echo printOBS($informante->compl,$_POST['comp']); ?>"/></td>
       	</tr>
       	<tr>
        	<td align="right" id="lblbairro" <?php if ($error && $_POST['bairro'] == ""){ echo 'class="erro"'; }?>>Bairro*:</td>
            <td colspan="5"><input name="bairro" size="40" maxlength="30" onfocus="mudaLb(lblbairro)" onkeyup="savCampo()"
				value="<?php echo printOBS($informante->bairro,$_POST['bairro']); ?>"/></td>
        </tr>
       	<tr>
        	<td align="right" id="lbluf" <?php if ($error && $_POST['estado'] == "0"){ echo'class="erro"'; }?>>UF*:</td>
        	
                		<td width="74"><select name="estado" onchange="Dados(this.value);savCampo()">
                  			<option value='0'>UF</option>
                  		<?php while ($dados = mysql_fetch_array($sql_estados)) { ?>
                  			<option value="<?php echo $dados['cod_estado']; ?>" <?php echo checkOpUF("estado", $dados['cod_estado'],$est);?>>
								<?php echo $dados['sigla']; ?></option>
    		        	<?php } ?>
               		  </select></td>
                		<td width="47" id="labelcid">Cidade:</td>
                		<td width="120"><select name="cidade" onchange="savCampo()">
							<option value='0' id="opcoes">Cidade</option>
						<?php while ($dados1 = mysql_fetch_array($sql_cidades)){ ?>
                        	<option value="<?php echo $dados1['cod_cidade']; ?>" <?php echo checkOpUF("cidade",$dados1['cod_cidade'],$cid);?>>
								<?php echo $dados1['descricao']; ?></option>
						<?php } ?>
					  </select></td>
						
           	<td width="41" align="right" id="lblcep" <?php if ($error && $_POST['cep'] == ""){ echo 'class="erro"'; }?>>*CEP:</td>
       		<td width="110"><input name="cep" size="11" maxlength="9" onfocus="mudaLb(lblcep)" onkeypress="mascara(this,3)" onkeyup="savCampo()" value="<?php echo printOBS($informante->cep, $_POST['cep']); ?>" /></td>
       	</tr>
	</table>
</fieldset>
<fieldset style="width:550px">
	<legend>Outros</legend>
    <table width="536" class="style5" bgcolor="#E8E8E8">
<tr>
        	<td width="100" align="right" id="labelpar" <?php if ($error && $_POST['parent'] == "0"){
				echo 'class="erro"'; }?>>Parentesco*:</td>
            <td width="437"><select name="parent" onfocus="mudaLb(labelpar)" onchange="savCampo()">
            	<option value='0'>Selecione o Grau de Parentesco</option>
           	<?php while ($dados = mysql_fetch_array($sql_parentesco)) { ?>
               	<option value="<?php echo $dados['idParent']; ?>" <?php echo checkOption("parent", $dados['idParent'],
					$informante->idParent); ?>><?php echo $dados['tipo']; ?></option>
            <?php } ?>
          </select></td>
       	</tr>
        <tr>
        	<td align="right" id="labelesc" <?php if ($error && $_POST['escol'] == "0"){ 
				echo 'style="color:#CE0909"'; }?>>Escolaridade*:</td>
            <td><select name="escol" onfocus="mudaLb(labelesc)" onchange="savCampo()">
            	<option value='0'>Selecione o N&iacute;vel Escolar</option>
            <?php while ($dados1 = mysql_fetch_array($sql_escolaridade)) { ?>
            	<option value="<?php echo $dados1['idEsc']; ?>" <?php echo checkOption("escol", $dados1['idEsc'],
					$informante->idEsc);?>><?php echo $dados1['tipo']; ?></option>
            <?php } ?>
           	</select></td>
      	</tr>
        <tr>
        	<td align="right" valign="top" id="labelesc" >
				Observa&ccedil;&otilde;es:</td>
          	<td><textarea name="obsinfo" rows="4" cols="60" onfocus="mudaLb(labelobsinfo)" onkeyup="savCampo()"
				><?php echo printOBS($informante->obs, $_POST['obsinfo']); ?></textarea></td>
       	</tr>
</table>
</fieldset>
<br/>
<fieldset style="width:590px" style="background-color:#E8E8E8;">

    <table width="580" border="0" cellpadding="0" cellspacing="0" class="style5" bgcolor="#E8E8E8">
    	<tr>
		<td align="left"><input name="limpar" type="reset" value="Limpar" /></td>
        	<td  height="24" align="left"><input name="voltar" type="submit" value="Voltar" 
				onclick="this.form.action='acesso_aluno.php'" /></td>
            
            <td width="500" align="right"><input name="salvar" type="submit" value="Salvar" /></td>
	  		<input type="hidden" value="0" id="ctrl" />
       	</tr>
  	</table>
</fieldset>