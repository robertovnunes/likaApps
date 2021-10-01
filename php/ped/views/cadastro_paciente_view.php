<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		if($("#hdIdCid").val() > 0){
			$.post(
				"alterar_cidades.php",
				{
					uf:$("#inpUF").val(),
					cid:$("#hdIdCid").val()
				},
				function(valor){
					$("#inpCid").html(valor);
				}
			)
		}
		$("#inpUF").change(function(){
            $("#inpCid").html('<option value="0">Carregando...</option>');
            $.post(
				"alterar_cidades.php",
				{
					uf:$(this).val(),
					cid:$("#hdIdCid").val()
				},
				function(valor){
					$("#inpCid").html(valor);
				}
			)
		})
	})
	
</script>
</head>

<div id="formCadastro">
	<form action="cadastro_paciente.php" method="post" name="cadpaciente">
<?php
if ($error && isset($errPac)){
	echo "<fieldset>
			<legend>Alerta</legend>
			<table bgcolor=\"#E8E8E8\" width=\"600\">
				<tr>
					<td class=\"stylePanelCadastro\">$errPac<input style=\"float:none;\" name=\"salvar2\" type=\"submit\" value=\"Salvar mesmo assim\" /></td>
				</tr>
			</table>
		</fieldset><br />";
}
?>
    <fieldset>
		<legend>Cadastrar Paciente</legend>
		<table bgcolor="#E8E8E8" width="600">
			<tr><td>
<?php
    if ($error){
		echo '<div class="msgerro">';
		echo isset($errNome) ? $errNome : '';
		echo isset($errSexo) ? $errSexo : '';
		echo isset($errData) ? $errData : '';
		echo isset($errCPF) ? $errCPF : '';
		echo isset($errMae) ? $errMae : '';
		//echo $errCEP;
		echo isset($errEnde) ? $errEnde : '';
		echo isset($errBair) ? $errBair : '';
		echo isset($errUF) ? $errUF : '';
		echo isset($errCid) ? $errCid : '';
		echo "</div>";
    }
?>
            <br />
			<span class="style7">(*) Campos Obrigat&oacute;rios</span>
			<br />
            <fieldset class="full">
                <legend>Dados Pessoais</legend>
				<div style="clear:both">
					<label id="lbNome" class="labdir2<?php echo $cerrNome; ?>">Nome*:</label>
					<input class="tam50" name="nome" onfocus="mudaLb(lbNome)" onkeyup="savCampo()" value="<?php echo $valCad[0]; ?>" maxlength="50" />
                </div>
				<div style="clear:both">
					<label id="lbSexo" class="labdir2<?php echo $cerrSexo; ?>">Sexo*:</label>
					<span>
						<input name="sexo" type="radio" value="M" <?php echo (isset ($sexoM) ? $sexoM : ''); ?> onfocus="mudaLb(lbSexo)" onchange="savCampo()"/><label>Masculino</label>
						<input name="sexo" type="radio" value="F" <?php echo (isset ($sexoF) ? $sexoF : ''); ?> onfocus="mudaLb(lbSexo)" onchange="savCampo()"/><label>Feminino</label>
					</span>
				</div>
				<div style="clear:both">
					<label id="lbDT" class="labdir2<?php echo $cerrData; ?>">Nascimento*:</label>
					<input class="tam15" name="data" maxlength="10" onkeypress="mascara(this,2)" value="<?php echo $valCad[1]; ?>" onkeyup="savCampo()" onfocus="mudaLb(lbDT)"/>
					<label id="lbdtt">(dd/mm/aaaa)</label>
						<SCRIPT LANGUAGE="JavaScript" ID="js19">
							var cal19 = new CalendarPopup();
							cal19.showYearNavigation();
							cal19.showYearNavigationInput();
						</SCRIPT>
						<SCRIPT LANGUAGE="JavaScript">writeSource("js19");</SCRIPT>
						<a href="#" onClick="cal19.select(document.forms[0].data,'anchor19','dd/MM/yyyy'); mudaLb(lbDT); return false;" title="cal19.select(document.forms[0].data,'anchor19','MM/dd/yyyy'); return false;" name="anchor19" id="anchor19">
						<img style="margin:5 0 0 5" src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>
				</div>
				<div style="clear:both">
					<label id="lbCPF" class="labdir2<?php echo $cerrCPF; ?>">CPF:</label>
					<input class="tam15" name="cpf" maxlength="14" OnKeyPress="mascara(this,1)" value="<?php echo $valCad[3]; ?>" onkeyup="savCampo()"/>
					<label id="lbCNS" class="labdir2">CNS:</label>
					<input class="tam20" name="cns" maxlength="15" value="<?php echo $valCad[2]; ?>" onkeyup="savCampo()"/>
                </div>
				<div style="clear:both">
					<label id="lbMae" class="labdir2<?php echo $cerrMae; ?>">Nome da M&atilde;e*:</label>
					<input class="tam50" name="mae" maxlength="50" value="<?php echo $valCad[5]; ?>" onfocus="mudaLb(lbMae)" onkeyup="savCampo()"/>
                </div>
				<div style="clear:both">
					<label id="lbPai" class="labdir2">Nome do Pai:</label>
					<input class="tam50" name="pai" maxlength="50" value="<?php echo $valCad[6];?>" onkeyup="savCampo()"/>
				</div>
			</fieldset>
			<br />
			<fieldset class="full">
				<legend>Endere&ccedil;o (Caso voc&ecirc; saiba o CEP, o sistema preencher&aacute; automaticamente)</legend>
				<div style="clear:both">
					<label id="lbCEP" class="labdir2<?php echo $cerrCEP; ?>">CEP:</label>
					<input id="inpCEP" class="tam10" name="cep" maxlength="9" value="<?php echo $valCad[13]; ?>" onfocus="mudaLb(lbCEP)" onkeyup="savCampo()" OnKeyPress="mascara(this,3)" /><a href="#cepResidencial" onclick="getCEP()"><img src="images/lupa.jpg" style="position:relative; padding-left:5px;padding-top:5px;" alt="Pesquisar Cep/PE"></a>
				</div>
				<div style="clear:both">
					<label id="lbEnd" class="labdir2<?php echo $cerrEnde; ?>">Logradouro*:</label>
					<input id="inpEnd" class="tam50" name="ende" onkeyup="savCampo()" onfocus="mudaLb(lbEnd)" value="<?php echo $valCad[7];?>" maxlength="50" />			</div>
				</div>
				<div style="clear:both">
					<label class="labdir2">N&uacute;mero:</label>
					<input class="tam5" name="num" onkeyup="savCampo()" value="<?php echo $valCad[8]; ?>" maxlength="4" />
					<label class="labdir2">Complemento:</label>
					<input class="tam30" name="comp" onkeyup="savCampo()" value="<?php echo $valCad[9]; ?>" maxlength="30" />
				</div>
				<div style="clear:both">
					<label id="lbBair" class="labdir2<?php echo $cerrBair; ?>">Bairro*:</label>
					<input id="inpBair" class="tam50" name="bair" value="<?php echo $valCad[10]; ?>" onkeyup="savCampo()" onfocus="mudaLb(lbBair)" maxlength="50"/>
				</div>
				
				<div>					
					<label id="lbUF" class="labdir2<?php echo $cerrUF; ?>">UF*:</label>
					<select id="inpUF" name="uf" value="<?php echo $valCad[12]; ?>" onkeyup="savCampo()" onfocus="mudaLb(lbUF)">		
						<option value="0">Escolha o estado</option>
						<?php 
						foreach($estados as $estado){
							if(isset($valCad) and $estado['id'] == $valCad[12])
								echo '<option value="'.$estado['id'].'" selected>'.$estado['nome'].'</option>';
							else
								echo '<option value="'.$estado['id'].'">'.$estado['nome'].'</option>';
						}
						?>
					</select>
				</div>
				
				<div>
					<input type="hidden" id="hdIdCid" value="<?php echo $valCad[11]; ?>" />
					<label id="lbCid" class="labdir2<?php echo $cerrCid; ?>">Cidade*:</label>
					<select id="inpCid" name="cidade" onkeyup="savCampo()" onfocus="mudaLb(lbCid)">
						<option value="0" disabled="disabled">Escolha um estado primeiro</option>
					</select>
				</div>            
			
			<?php /*
			<div style="clear:both">
					<label id="lbCid" class="labdir2<?php echo $cerrCid; ?>">Cidade*:</label>
					<input id="inpCid" class="tam30" name="cidade" value="<?php echo $valCad[11]; ?>" onkeyup="savCampo()" onfocus="mudaLb(lbCid)" maxlength="30"/>
					
					<label id="lbUF" class="labdir2<?php echo $cerrUF; ?>">UF*:</label>
					<input id="inpUF" class="tam5" name="uf" value="<?php echo $valCad[12]; ?>" onkeyup="savCampo()" onfocus="mudaLb(lbUF)" maxlength="2"/>
				</div>  */ ?>
				   
			</fieldset>
			<br />
			<fieldset class="full">
				<legend>Op&ccedil;&otilde;es</legend>
				<input name="limpar" type="reset" value="Limpar" />
				<input name="voltar" type="submit" value="Voltar" onclick="this.form.action='aluno.php'" />
				<div class="salvar">
					<input name="salvar" type="submit" value="Salvar" />
					<input type="hidden" value="0" id="ctrl" />
				</div>
			</fieldset>
        </td></tr></table>
    </fieldset>
	</form>
</div>