<?php
    if ($x == "c")
    	echo '<div class="msgTelaAluno">Novo Paciente inserido com sucesso.</div>';
    else if ($x == "a")
    	echo '<div class="msgTelaAluno">Informações do paciente alteradas com sucesso.</div>';
?>

<?php
    if (sizeOf($lista) == 0)
        echo '<div class="msgTelaAluno">Não existem pacientes para esse aluno</div>';
    if ($error)
		echo '<div class="msgerro">Faltou preencher um valor.</div>';
	else {
		if ($_POST['buscar'] == "Buscar" && sizeOf($listacons) == 0)
			echo '<div class="msgerro">O paciente consultado n&atilde;o est&aacute; dispon&iacute;vel ou n&atilde;o existe.</div>';
		else if ($_POST['buscar'] == "Buscar" && sizeOf($listacons) > 0)
			echo '<div class="msgTelaAluno">Paciente encontrado.</div>';
	}
?> 

<div id="formListaPaciente">
<?php if ($x == "c"){ ?>
	<table id="tableConsultaPaciente">
    <thead class="bgsTCP">
		<tr class="styleTabelaConsultaPaciente stylebold">
			<td width="170">Paciente</td>
			<td>Prontu&aacute;rio</td>
			<td width="90">Data de Nasc.</td>
			<td width="170">Nome da M&atilde;e</td>
			<td>Observa&ccedil;&otilde;es</td>
		</tr>
	</thead>
	<tbody class="bgsTCP">
		<tr class="styleTabelaConsultaPaciente stylebold">
  			<td align="justify"><?php echo $paccad->getNome();?></td>
  			<td><?php echo $paccad->getID(); ?></td>
  			<td><?php echo $paccad->getDTNasc(); ?></td>
  			<td align="left"><?php echo $paccad->getMae(); ?></td>
  			<td>
                <table class="styleOpcoesConsultaPaciente">
                <tbody>
                    <tr align="center">
  					    <td><a href='alterar_paciente.php?pr=<?php echo $paccad->getID();?>'><img src=
  					        "images/icons/user.png" id="imgListaPaciente" title="Editar cadastro do paciente" /></a></td>
  					    <td><a href='historico_paciente.php?pr=<?php echo $paccad->getID();?>'><img src=
  					        "images/icons/list_users.gif" id="imgListaPaciente" title="Hist&oacute;rico do paciente" /></a></td>
  					    <td><a href='prontuario_paciente.php?at=<?php echo $_GET['at']; ?>'><img src="images/icons/page_edit.gif"
                              id="imgListaPaciente" title="&Uacute;ltimo Atendimento" /></a></td>
  					    <td><a href='lista_atendimentos.php?pr=<?php echo $paccad->getID();?>'><img src=
  					        "images/icons/folder.gif" id="imgListaPaciente" title="Atendimentos anteriores" /></a></td>
  				    </tr>
                </tbody>
  			    </table>
              </td>
  		  </tr>
	</tbody>
    </table>
	<br>
<?php } ?>	
    <form action="aluno.php" method="post" name="conspac" >
        <fieldset class="fieldconsulta">
  	        <legend class="fonttitulo">Consultar Pacientes</legend>
            <label id="cEsq"><input name="valor" value="<?php echo $_POST['valor'] ?>" size="50" maxlength="30" /></label>
            <label id="cCen">
                <select name="tipo">
  				    <option value="n" <?php echo $a; ?>>Nome</option>
  				    <option value="p" <?php echo $b; ?>>N&ordm; de Prontuario</option>
  				    <option value="m" <?php echo $c; ?>>Nome da M&atilde;e</option>
  	  		    </select>
            </label>
            <label id="cDir"><input name="buscar" type="submit" value="Buscar" /></label>
        </fieldset>
    </form>
<?php if (sizeOf($listacons) > 0){ ?>
    <br />
	<table id="tableConsultaPaciente">
    <thead class="bgsTCP">
		<tr class="styleTabelaConsultaPaciente stylebold">
			<td width="170">Paciente</td>
			<td>Prontu&aacute;rio</td>
			<td width="90">Data de Nasc.</td>
			<td width="170">Nome da M&atilde;e</td>
			<td>Observa&ccedil;&otilde;es</td>
		</tr>
	</thead>
<?php foreach ($listacons as $t){
	$atend = $fachada->getUltimoAtendimento($t['idPront']); ?>
	<tbody class="bgsTCP">
		<tr class="styleTabelaConsultaPaciente stylebold">
  			<td align="justify"><?php echo $t['nome'];?></td>
  			<td><?php echo $t['idPront'];?></td>
  			<td><?php echo $t['dtnasc']; ?></td>
  			<td align="left"><?php echo $t['mae'];?></td>
  			<td>
                <table class="styleOpcoesConsultaPaciente">
                <tbody>
                    <tr align="center">
  					    <td><a href='alterar_paciente.php?pr=<?php echo $t['idPront'];?>'><img src=
  					        "images/icons/user.png" id="imgListaPaciente" title="Editar cadastro do paciente" /></a></td>
  					    <td><a href='historico_paciente.php?pr=<?php echo $t['idPront'];?>'><img src=
  					        "images/icons/list_users.gif" id="imgListaPaciente" title="Hist&oacute;rico do paciente" /></a></td>
  					    <td><a href='prontuario_paciente.php?at=<?php echo $atend;?>'><img src="images/icons/page_edit.gif"
                              id="imgListaPaciente" title="&Uacute;ltimo Atendimento" /></a></td>
  					    <td><a href='lista_atendimentos.php?pr=<?php echo $t['idPront'];?>'><img src=
  					        "images/icons/folder.gif" id="imgListaPaciente" title="Atendimentos anteriores" /></a></td>
  				    </tr>
                </tbody>
  			    </table>
              </td>
  		  </tr>
	</tbody>
		<?php } ?>
    </table>
    <?php } ?>

<br />

<table id="tableConsultaPaciente">
    <thead class="bgsTCP1" style="color:#000">
        <tr class="styleTabelaConsultaPaciente stylebold">
  	        <td width="170">Paciente</td>
  		    <td>Prontu&aacute;rio</td>
  	        <td width="90">Data de Nasc.</td>
  	        <td width="170">Nome da M&atilde;e</td>
  		    <td>Observa&ccedil;&otilde;es</td>
  	    </tr>
    </thead>
<?php
	foreach ($lista1 as $t){
   		$atend = $fachada->getUltimoAtendimento($t['idPront']); ?>
    <tbody class="bgsTCP1">
        <tr class="styleTabelaConsultaPaciente">
  		    <td align="justify"><?php echo $t['nome'];?></td>
  			<td><?php echo $t['idPront'];?></td>
  			<td><?php echo $t['dtnasc']; ?></td>
  			<td align="left"><?php echo $t['mae'];?></td>
  			<td>
                <table class="styleOpcoesConsultaPaciente">
                <tbody>
                    <tr align="center">
  					    <td><a href='alterar_paciente.php?pr=<?php echo $t['idPront'];?>'><img src="images/icons/user.png" id="imgListaPaciente" title="Editar dados do paciente" /></a></td>
  					    <td><a href='historico_paciente.php?pr=<?php echo $t['idPront'];?>'><img src="images/icons/list_users.gif" id="imgListaPaciente" title="Hist&oacute;rico do paciente" /></a></td>
  					    <td><a href='prontuario_paciente.php?at=<?php echo $atend;?>'><img src="images/icons/page_edit.gif" id="imgListaPaciente" title="&Uacute;ltimo Atendimento" /></a></td>
  					    <td><a href='lista_atendimentos.php?pr=<?php echo $t['idPront'];?>'><img src="images/icons/folder.gif" id="imgListaPaciente" title="Atendimentos anteriores" /></a></td>
  				    </tr>
                </tbody>
  			    </table>
            </td>
  		</tr>
    </tbody>
  	<?php } ?>
</table>
<div id="tbpacientes">
	<div id="npaginas">
<?php if($pagina == 1) { 
	echo "Primeira ";
} else if($pagina > 1) { ?>
	<a href="aluno.php?pagina=1">Primeira</a>
	<a href='aluno.php?pagina=<?php echo $pagina-1; ?>'><<</a>
<?php } 
	if ($total_paginas > 1){
		for ($i = $pagina-1; $i <= $total_paginas && $np < 3 ; $i++){
			$np++;
			if ($pagina == $i){
			//se mostro o índice da página actual, não coloco link
				if ($pagina != 1 && $pagina != 10)
					echo $pagina . " ";
			}else{
				//se o índice não corresponde com a página mostrada actualmente, coloco o link para ir a essa página
				if ($i != 0)
					echo "<a href='aluno.php?pagina=" . $i . "'>" . $i . "</a> ";
			}			  			 
		}
	}?>
<?php if($pagina < $total_paginas) { 
	if ($pagina != $total_paginas - 1){ ?>
		<a href='aluno.php?pagina=<?php echo $pagina+2; ?>'>>></a>
	<?php } ?>
	<a href='aluno.php?pagina=<?php echo $total_paginas; ?>'>&Uacute;ltima</a>
<?php } else if($pagina == $total_paginas) { echo "&Uacute;ltima"; }?>	
	</div>
</div>
</div>
<br />
