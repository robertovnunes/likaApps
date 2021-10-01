<div id="formCadastro">
<form action="lista_atendimentos.php?pr=<?php echo $pront; ?>" method="post">
	<fieldset>
    	<legend>Atendimentos</legend>
        <table bgcolor="#E8E8E8" width="600"><tr><td>
			<br />
<?php
    if ($flag && !$error)
    	echo '<div class="msgTelaAluno">Novo atendimento criado.</div><br />';
    else if ($flag && $error)
    	echo '<div class="msgerro">Houve algum erro.</div><br />';
?>
			<fieldset class="full">
            	<legend><?php echo $pac->getNome();?></legend>
                <div class="titHist">
                    <label class="labdir2" style="margin-top:8px">Hist&oacute;rico:</label>
					<label style="margin-top:8px"><img src="images/icons/list_users.gif" onmouseover="javascript:this.style.cursor='pointer'" width="16" height="16" onclick="javascript:location.href='historico_paciente.php?pr=<?php echo $pront; ?>'"/></label>
                    <input name="novoatend" type="submit" value="Criar Novo Atendimento" style="margin-left:200px;" />
                </div>
                <div style="clear:both">
                    <table class="styleListaAtendimentos">
                    <thead class= "stylebold">
                        <tr>
                            <td>Criado Por</td>
                            <td>Data de Cria&ccedil;&atilde;o</td>
                            <td>&Uacute;ltima Altera&ccedil;&atilde;o</td>
                            <td>Consulta</td>
                        </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($listaatend as $t){ ?>
                   	    <tr align="center">
                    	    <td><?php echo $t['nome']; ?></td>
                            <td><?php echo $fachada->printData($t['dthr'],0,10)." ".$fachada->printHora($t['dthr'],10);?></td>
                            <td><?php echo $fachada->printData($t['dthralt'],0,10)." ".$fachada->printHora($t['dthralt'],10);?></td>
                            <td><img src="images/icons/page_edit.gif" onclick="javascript:location.href='prontuario_paciente.php?at=<?php echo $t['idAtend']; ?>'" onmouseover="javascript:this.style.cursor='pointer'" width="16" height="16" /></td>
                 	    </tr>
    			    <?php } ?>
                    </tbody>
                    </table>
                </div>
            </fieldset>
			<br />
            <fieldset class="full">
        	    <legend>Opções</legend>
                <input name="voltar" type="submit" value="Voltar" onclick="this.form.action='aluno.php'" />
            </fieldset>
        </td></tr></table>
    </fieldset>
</form>
</div>