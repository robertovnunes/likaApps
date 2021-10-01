<form action="lista_atendimentos.php?pr=<?php echo $pront; ?>" method="post" name="cadpaciente" id="cadpaciente" style="padding-left:45px; padding-bottom:100px;">
<fieldset>
<legend>Atendimentos Anteriores</legend>
<table width="660" class="style5" >
	<tr>
    	<td width="700" bgcolor="#F0F0F0" ><fieldset style="width:634px;">
        	<legend style="font-family:Trebuchet MS; font-size:15px;font-color:"><?php echo $pac->nome;?></legend>
            <table width="634px;" class="style5">
            	<tr >
                	<td width="235">Hist&oacute;rico: <img src="images/icons/list_users.gif"
						onmouseover="javascript:this.style.cursor='pointer'" width="16" height="16"
						onclick="javascript:location.href='historico_paciente.php?pr=<?php echo $pront; ?>'"/></td>
              	    <td width="243" ><input name="novoatend" type="submit" value="Criar Novo Atendimento" style="margin-left:243px;" /></td>
            	</tr>
          	</table>
			<br />
			<table width="634px;" class="style5">
            	<tr bgcolor="#EEEEEE" align="center">
               		<td width="147">Criado Por</td>
                    <td width="127" >Data de Cria&ccedil;&atilde;o</td>
                    <td width="131" >&Uacute;ltima Altera&ccedil;&atilde;o</td>
                    <td width="80" >Consulta</td>
              	</tr>
			<?php while ($arrayatend = mysql_fetch_array($listaatend)){ ?>
               	<tr align="center">
                	<td ><?php echo $arrayatend['nome']; ?></span></div></td>
                    <td ><?php echo printData($arrayatend['dthr'],0,10)." ".printHora($arrayatend['dthr'],10);?></td>
                    <td ><?php echo printData($arrayatend['dthralt'],0,10)." ".printHora($arrayatend['dthralt'],10);?>
					</td>
                    <td><img src="images/icons/page_edit.gif" onclick="javascript:location.href='prontuario_paciente.php?at=<?php
						echo $arrayatend['idAtend']; ?>'" onmouseover="javascript:this.style.cursor='pointer'" width="16" 
						height="16" /></td>
             	</tr>
			<?php } ?>
            </table>
	        <br />
  		</fieldset>
            
        	<p />
        	<fieldset style="width: 634px;">
        	<table width="557">
            	<tr >
                	<td ><input name="voltar" type="submit" value="Voltar" 
						onclick="this.form.action='acesso_aluno.php'" /></td>
                 				
               	</tr>
          	</table>
      	</fieldset>
        <br />
  	</td></tr>
</table>
</fieldset>
</form>