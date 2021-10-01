<?php
if ($error == 1){
    echo '<table width="620" bgcolor="#E8E8E8"><tr><td class="erro">';
	if ($_POST['nome'] == "" || $_POST['data'] == "" || $_POST['mae'] == "" || $_POST['ende'] == "" || $_POST['bair'] == "" ||
		$_POST['estado'] == "0" || $_POST['cidade'] == "0" || $_POST['cep'] == "")
		echo "*Os campos alterados n�o podem ficar vazios.<br />";
	if(validaData($_POST['data']) != ""){
		echo "*".validaData($_POST['data']).".<br />";
		$errnsc = 1;
	}
	if(!validaCEP($_POST['cep'])){
		echo "*O CEP informado &eacute; inv&aacute;lido.<br />";
		$errcep = 1;
	}
	echo "</td></tr></table><br />";
}
$arraymes = array('Janeiro','Fevereiro','Mar&ccedil;o','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro');
$contd = 1;
$contm = 1;
$conta = date(Y)-21;
?>


<form action="alterar_paciente.php?pr=<?php echo $pront; ?>" method="post" name="altpaciente" style="padding-left:45px;">
	<fieldset>
    <legend> Alterar Dados do Paciente </legend>		
    <table width="620">
    	<tr>
       		<td width="566" bgcolor="#E8E8E8" class="style5">
			<p />
        	<fieldset>
        		<legend style="font-family:Trebuchet MS; font-size:13px;font-color:">Dados Pessoais</legend>
            	<table width="570" class="style5">
            		<tr>
            			<td width="135" align="right">Nome:</td>
           	  			<td width="423"><input name="nome" size="65" maxlength="50" onkeyup="savCampo()" 
							value="<?php echo printCampo($paciente->nome, $_POST['nome']);?>"/></td>
            		</tr>
            		<tr>
            			<td align="right">Nascimento:</td>
            			<td><input name="data" size="12" onfocus="mudaLb(lbdt)" onkeypress="mascara(this,2)" onkeyup="savCampo()" 
							value="<?php if ($errnsc) echo printData($paciente->dtnasc); 
							else echo printCampo(printData($paciente->dtnasc), $_POST['data']); ?>" maxlength="10"/>
                             <SCRIPT LANGUAGE="JavaScript" ID="js19">
var cal19 = new CalendarPopup();
cal19.showYearNavigation();
cal19.showYearNavigationInput();
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript">writeSource("js19");</SCRIPT>
(dd/mm/aaaa)<A HREF="#" onClick="cal19.select(document.forms[0].data,'anchor19','dd/MM/yyyy'); return false;" TITLE="cal19.select(document.forms[0].data,'anchor19','MM/dd/yyyy'); return false;" NAME="anchor19" ID="anchor19"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></A>
                            </td>
            		</tr>
            		<tr>
              			<td align="right">Nome da M&atilde;e:</td>
              			<td><input name="mae" size="65" maxlength="50"value="<?php echo printCampo($paciente->mae,$_POST['mae']);?>"
							onkeyup="savCampo()"/></td>
            		</tr>
            		<tr>
              			<td align="right">Nome do Pai:</td>
              			<td><input name="pai" size="65" maxlength="50"value="<?php echo printCampo($paciente->pai,$_POST['pai']);?>"
							onkeyup="savCampo()"/></td>
            		</tr>
        		</table>
        	</fieldset>
        	<p />
        	<fieldset>
        		<legend>Endere&ccedil;o</legend>
            	<table width="570" class="style5">
              		<tr>
                		<td width="135" align="right" id="labelend">Endere&ccedil;o:</td>
                		<td colspan="5"><input name="ende" size="65" maxlength="50" onkeyup="savCampo()"
							value="<?php echo printCampo($paciente->ender,$_POST['ende']);?>"/></td>
              		</tr>
              		<tr>
                		<td align="right">Complemento:</td>
                		<td colspan="5"><input name="comp" size="30" maxlength="20" onkeyup="savCampo()" 
							value="<?php echo printCampo($paciente->compl,$_POST['comp']);?>"/></td>
              		</tr>
              		<tr>
                		<td align="right" id="labelbair">Bairro:</td>
                		<td colspan="5"><input name="bair" size="40" maxlength="30" onkeyup="savCampo()" 
							value="<?php echo printCampo($paciente->bairro,$_POST['bair']);?>"/></td>
              		</tr>
              		<tr>
                	<td align="right" id="labeluf">UF:</td>
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
						<td width="32" id="labelcep">CEP:</td>
						<td width="134"><input name="cep" size="11" maxlength="9" onkeyup="savCampo()" OnKeyPress="mascara(this,3)"
							value="<?php if ($errcep) echo $paciente->cep; else echo printCampo($paciente->cep,$_POST['cep']); ?>"/>
					  </td>
  		            </tr>
            	</table>
        	</fieldset>
            
        	<p />
        	<fieldset>
        	<table width="557">
            	<tr >
                	<td ><input name="voltar" type="submit" value="Voltar" 
						onclick="this.form.action='acesso_aluno.php'" style="margin-right:50px;"/></td>
                    <td ><input type="submit" value="Salvar"  name="salvar" style="margin-left:480px;"/></td>
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
