<?php
if ($error){
	echo '<table width="620" bgcolor="#E8E8E8"><tr><td class="erro">';
	if($_POST['nome'] == "")
		echo "*Preencha o nome.<br />";
	if(validaData($_POST['data']) != ""){
		echo "*".validaData($_POST['data']).".<br />";
		$errnsc = 1;
	}
	if($_POST['sexo'] == "")
		echo "*Selecione um Sexo.<br />";
	if(!validaCPF($_POST['cpf'])){
		echo "*Preencha um CPF v&aacute;lido.<br />";
		$errcpf = 1;
	}
	if($_POST['mae'] == "")
		echo "*Preencha o nome da m&atilde;e.<br />";
	if($_POST['ende'] == "")
		echo "*Preencha o endere&ccedil;o.<br />";
	if($_POST['bair'] == "")
		echo "*Preencha o bairro.<br />";
	if($_POST['estado'] == 0)
		echo "*Selecione o Estado.<br />";
	if($_POST['cidade'] == 0)
		echo "*Selecione a Cidade.<br />";
	if(!validaCEP($_POST['cep'])){
		echo "*Preencha um CEP v&aacute;lido.<br />";
		$errcep = 1;
	}
	echo "</td></tr></table><br />";
}	
$arraymes = array('Janeiro','Fevereiro','Mar&ccedil;o','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro',
	'Dezembro');
$contd = 1;
$contm = 1;
$conta = date(Y)-21;
?>

<form action="cadastro_paciente.php" method="post" name="cadpaciente" style="left:73px;position:relative;">
<fieldset> <legend> Cadastrar Paciente </legend>
<table width="620">
	<tr class="style5">
    	<td bgcolor="#E8E8E8"><br /><table width="550">
        	<tr class="style5">
            	
                <td><b><font color="333333">(*) Campos Obrigat&oacute;rios</font></b></td>
            </tr>
        </table>
        <br />
        <fieldset style="width:580">
        <legend>Dados Pessoais</legend>
        <table width="584" class="style5">
        	<tr>
           		<td align="right" width="105" id="lbnome" <?php if ($error && $_POST['nome'] == ""){ echo 'class="erro"'; }?>>Nome*:				</td>
              	<td colspan="2"><input name="nome" onfocus="mudaLb(lbnome)" onkeyup="savCampo()"
			  		value="<?php echo $_POST['nome']; ?>" size="65" maxlength="50" /></td>
            </tr>
            <tr>
            	<td align="right" id="lbsexo" <?php if ($error && $_POST['sexo'] == ""){ echo 'class="erro"'; }?>>Sexo*:</td>
                <td><input name="sexo" type="radio" value="M" <?php if ($_POST['sexo'] == "M"){ echo "checked='checked'"; }?>
					onfocus="mudaLb(lbsexo)" onchange="savCampo()"/> Masculino
              	<input name="sexo" type="radio" value="F" <?php if ($_POST['sexo'] == "F"){ echo "checked='checked'"; }?> 	
					onfocus="mudaLb(lbsexo)" onchange="savCampo()"/> Feminino</td>
                <td width="279"><span id="lbdt" <?php if ($error && $errnsc){ echo 'class="erro"'; }?>>Nascimento*:</span>
             		<input name="data" size="12" maxlength="10" onkeypress="mascara(this,2)" value="<?php echo $_POST['data']; ?>" onkeyup="savCampo()" onfocus="mudaLb(lbdt)"/> (dd/mm/aaaa) </td>
            </tr>
            <tr>
                <td width="105" align="right" id="lbcpf" <?php if ($error && $errcpf){ echo 'class="erro"'; }?>>CPF:</td>
              <td width="179"><input name="cpf" maxlength="14" OnKeyPress="mascara(this,1)" value="<?php echo $_POST['cpf']; ?>"	onkeyup="savCampo()" onfocus="mudaLb(lbcpf)"/></td>
            	<td>CNS:<input name="cns" maxlength="15" value="<?php echo $_POST['cns']; ?>" onkeyup="savCampo()"/></td>
            </tr>
            <tr>
              <td align="right" id="lbmae" <?php if ($error && $_POST['mae'] == ""){ echo 'class="erro"'; }?>> Nome da M&atilde;e*:</td>
            	<td colspan="2"><input name="mae" size="65" maxlength="50" value="<?php echo $_POST['mae']; ?>" 
					onfocus="mudaLb(lbmae)" onkeyup="savCampo()"/></td>
            </tr>
            <tr>
              <td align="right">Nome do Pai:</td>
              <td colspan="2"><input name="pai" size="65" maxlength="50" value="<?php echo $_POST['pai']; ?>" 
					onkeyup="savCampo()"/></td>
            </tr>
        </table>
        </fieldset>
        <br />
        <fieldset style="width:580">
        	<legend>Endere&ccedil;o</legend>
            <table width="570" class="style5">
            	<tr>
                	<td width="105" align="right" id="lbend" <?php if ($error && $_POST['ende'] == ""){ echo 'class="erro"'; } ?>>
						Endere&ccedil;o*:</td>
                    <td colspan="5"><input name="ende" size="65" maxlength="50" value="<?php echo $_POST['ende']; ?>"
						onfocus="mudaLb(lbend)" onkeyup="savCampo()" /></td>
               	</tr>
                <tr>
                	<td align="right">Complemento:</td>
                    <td colspan="5"><input name="comp" size="25" maxlength="20" value="<?php echo $_POST['comp']; ?>" 
						onkeyup="savCampo()"/></td>
                </tr>
                <tr>
                	<td align="right" id="lbbair" <?php if ($error && $_POST['bair'] == ""){ echo 'class="erro"';}?>>Bairro*:</td>
                    <td colspan="5"><input name="bair" size="40" maxlength="30" value="<?php echo $_POST['bair']; ?>" 
						onfocus="mudaLb(lbbair)" onkeyup="savCampo()"/></td>
                </tr>
                <tr>
                	<td align="right" id="lbuf" <?php if ($error && $_POST['estado'] == 0){echo 'class="erro"';}?>>UF*:</td>
                    <td width="87"><select name="estado" onfocus="mudaLb(lbuf);" onchange="Dados(this.value);savCampo()">
                    	<option value='0'>UF</option>
                    <?php while ($dados = mysql_fetch_array($sql_estados)) { ?>
                        <option value="<?php echo $dados['idEst']; ?>" <?php echo checkOption("estado", $dados['idEst'], "");?>>
							<?php echo $dados['estado']; ?></option>
                    <?php } ?>
               	  </select></td>
                    <td width="55" id="lbcid" <?php if ($error && $_POST['cidade'] == 0){ echo 'class="erro"';}?>>Cidade*:</td>
                    <td width="116"><select name="cidade" onfocus="mudaLb(lbcid)" onchange="savCampo()">
                    	<option value='0' id="opcoes">Cidade</option>
                    <?php while ($dados1 = mysql_fetch_array($sql_cidades)){ ?>
                        <option value="<?php echo $dados1['idCid']; ?>" <?php echo checkOption("cidade",$dados1['idCid'],"");?>>
							<?php echo $dados1['cidade']; ?></option>
					<?php } ?>
               	  </select></td>
                    <td width="41" id="lbcep" <?php if ($error && $errcep){ echo 'class="erro"'; }?>>CEP*:               
                    </td>
                    
                  	<td width="138"><input name="cep" size="11" maxlength="9" value="<? echo $_POST['cep']; ?>" 
						onfocus="mudaLb(lbcep)" onkeyup="savCampo()" OnKeyPress="mascara(this,3)"/>
						<a href="#cepResidencial" onclick="pesquisarCep(<?php echo $_POST['cep']; ?>)"><img src="images/lupa.jpg" alt="Pesquisar Cep/PE"> </a></td>
						<td> </td>
            	</tr>
       		</table>
     	</fieldset>
        <br />
        <fieldset style="width:580">
			
        	<table>
            	<tr>
                	<td  align="left"><input name="limpar" type="reset" value="Limpar" /></td>
                    <td width="140" align="left"><input name="voltar" type="submit" value="Voltar" 
						onclick="this.form.action =	'acesso_aluno.php'" /></td>
                    <td width="370" align="right"><input name="salvar" type="submit" value="Salvar" /></td>
					<input type="hidden" value="0" id="ctrl" />
                </tr>
            </table>
   		</fieldset>
        <br />
        </td>
  	</tr>
</table>
</fieldset>
</form>