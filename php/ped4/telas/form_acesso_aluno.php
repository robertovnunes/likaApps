<?php
if ($x == "s")
	echo '<table width="625" bgcolor="#E8E8E8"><tr><td class="style4">Novo Paciente inserido com sucesso.</td></tr></table><br />';		
else if ($x == "a")
	echo '<table width="625" bgcolor="#E8E8E8"><tr><td class="style4">Cadastro do paciente alterado com sucesso.</td></tr></table><br />';
$busc = $_POST['buscar'];	
if ($busc == "Buscar") {
	if ($_POST['tipo'] == "n" && $_POST['valor'])
		$sql = consultaPacienteNome($_POST['valor']);
	else if ($_POST['tipo'] == "p" && $_POST['valor'])
		$sql = consultaPacientePr($_POST['valor']);
	else if ($_POST['tipo'] == "m" && $_POST['valor'])
		$sql = consultaPacienteMae($_POST['valor']);
		
} 

?>

<?php if (mysql_num_rows($sql_pacientes) == 0) echo "<br><br><br><br><br><center>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Não existem pacientes para esse aluno</center>";
	else{
	
	//Limito a busqueda
$TAMANHO_PAGINA = 20;

//examino a página a mostrar e o inicio do registo a mostrar
$pagina = $_GET["pagina"];
if (!$pagina) {
   $inicio = 0;
   $pagina=1;
}
else {
   $inicio = ($pagina - 1) * $TAMANHO_PAGINA;
} 


	//echo "".$sql_pacientes;
if ($busc == "Buscar"){
	if (!$_POST['valor'])
		echo '<table width="625" bgcolor="#E8E8E8"><tr><td class="erro">Insira um valor no campo.</td></tr></table><br />'; 
	else {
		if (mysql_num_rows($sql) == 0)
			echo '<table width="625" bgcolor="#E8E8E8"><tr><td class="erro">O paciente consultado n&atilde;o existe.</td></tr></table><br />';
		else
			echo '<table width="740" align="center" ><tr><td class="style4" align="center">Paciente encontrado.</td></tr></table><br />';
	}
}
?> 


<div id="listaPacientes" >
<form action="acesso_aluno.php" method="post" name="conspac" >
<fieldset class="fieldconsulta">
	<legend style="font-family:Trebuchet MS; font-size:15px;">Consultar Pacientes</legend>
	<table width="487">
		<tr>
	  		<td width="284"><input name="valor" value="<?php echo $_POST['valor'] ?>" size="50" maxlength="30" /></td>
	  		<td width="135" align="center"><select name="tipo">
				<option value="n" <?php if ($_POST['tipo'] == "n") echo "selected"; ?>>Nome</option>
				<option value="p" <?php if ($_POST['tipo'] == "p") echo "selected"; ?>>N&ordm; de Prontuario</option>
				<option value="m" <?php if ($_POST['tipo'] == "m") echo "selected"; ?>>Nome da M&atilde;e</option>
	  		</select></td>
	  		<td width="68" bgcolor="#D9E5F1" align="center"><input name="buscar" type="submit" value="Buscar" /></td>
		</tr>
	</table>
</fieldset>
</form>

<br />

<?php 
if ($busc == "Buscar" && $_POST['valor'] != ""){
	echo '<table width="625" cellspacing="2" >';
	while($dados = mysql_fetch_array($sql)){
		$atend = getUltimoAtendimento($dados['idPront']); ?>
		<tr bgcolor="#C0C0C0" class="style5">
			<td width="169" height="22"><font color="#263A5A"><b><?php echo $dados['nome'];?></font></b></td>
			<td width="63" align="center"><font color="#263A5A"><b><?php echo $dados['idPront'];?></font></b></td>
			<td width="90" align="center"><font color="#263A5A"><b><?php echo printData($dados['dtnasc']); ?></font></b></td>
			<td width="164"><font color="#263A5A"><b><?php echo $dados['mae'];?></font></b></td>
			<td width="115"><div align="center"><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr align="center">
					<td width="23"><a href='alterar_paciente.php?pr=<?php echo $dados['idPront'];?>'><img src=
					"images/icons/user.png" width="16" height="16" title="Editar cadastro do paciente" /></a></td>
					<td width="23"><a href='historico_paciente.php?pr=<?php echo $dados['idPront'];?>'><img src=
					"images/icons/list_users.gif" width="16" height="16" title="Hist&oacute;rico do paciente" /></a></td>
					<td width="23"><a href='prontuario_paciente.php?at=<?php echo $atend;?>'><img src="images/icons/page_edit.gif" width=
					"16" height="16" title="&Uacute;ltimo Atendimento" /></a></td>
					<td width="23"><a href='lista_atendimentos.php?pr=<?php echo $dados['idPront'];?>'><img src=
					"images/icons/folder.gif" width="16" height="16" title="Atendimentos anteriores" /></a></td>
				</tr>
			</table></div></td>
		</tr>
	<?php } 
	echo '</table>';
} ?>	
<br />

<table width="625" border="0"  bordercolor="666666"="0" cellspacing="2" >

<tr bgcolor="#F0F0F0" align="center" class="style7" >
		<td width="169" height="20" >Paciente</td>
		<td width="63" bgcolor="#F0F0F0" >Prontu&aacute;rio</td>
	  <td width="120" >Data de Nasc.</td>
		<td width="164" > Nome da M&atilde;e</td>
		<td width="115" >Observa&ccedil;&otilde;es</td>
	</tr>
<?php 

		//vejo o número total de campos que há na tabela com essa busqueda
		$ssql = "select * from pais " . $criterio;
		$rs = mysql_query($ssql,$conn);
		$num_total_registos = mysql_num_rows($sql_pacientes);
		//calculo o total de páginas
		$total_paginas = ceil($num_total_registos / $TAMANHO_PAGINA); 

		//construo a sentença SQL
		$sql_pacientes = SQLlistarPacientesLimit($usuario->getLogin(), $inicio, $TAMANHO_PAGINA);
	//	$ssql = "select * from pais " . $criterio . " limit " . $inicio . "," . $TAMANHO_PAGINA;
//		$rs = mysql_query($ssql);
		while ($arraypacientes = mysql_fetch_array($sql_pacientes)){
		   		   		   
			$atend = getUltimoAtendimento($arraypacientes['idPront']);	?>
			<tr bgcolor="#E8E8E8" class="style5" >
				<td height="22"><?php echo $arraypacientes['nome'];?></td>
				<td align="center"><?php echo $arraypacientes['idPront'];?></td>
				<td align="center"><?php echo printData($arraypacientes['dtnasc']); ?></td>
				<td><?php echo $arraypacientes['mae'];?></td>
				<td><div align="center"><table width="115" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr align="center">
						<td width="23"><a href='alterar_paciente.php?pr=<?php echo $arraypacientes['idPront'];?>'><img src=
						"images/icons/user.png" width="16" height="16" title="Editar cadastro do paciente" /></a></td>
						<td width="23"><a href='historico_paciente.php?pr=<?php echo $arraypacientes['idPront'];?>'><img src=
						"images/icons/list_users.gif" width="16" height="16" title="Hist&oacute;rico do paciente" /></a></td>
						<td width="23"><a href='prontuario_paciente.php?at=<?php echo $atend;?>'><img src="images/icons/page_edit.gif" width="16" height="16" title="&Uacute;ltimo Atendimento" /></a></td>
						<td width="23"><a href='lista_atendimentos.php?pr=<?php echo $arraypacientes['idPront'];?>'><img src=
						"images/icons/folder.gif" width="16" height="16" title="Atendimentos anteriores" /></a></td>
					</tr>
				</table></div></td>
			</tr>
		<?php } ?>
		</table>
		<?php    
			echo "<div id = 'tbpacientes'><div id='npaginas'>";
			
			$np = 0;
			 echo "<a href='acesso_aluno.php?pagina=1'>  Primeira </a> ";
			 if($pagina > 1) echo "<a href='acesso_aluno.php?pagina=".($pagina-1)."'>  << </a> ";
			 if(($total_paginas >=3) && (($total_paginas - $pagina)<2))				 echo "<a href='acesso_aluno.php?pagina=" . ($pagina-1) . "'>" . ($pagina-1 ). "</a> ";	   
		if ($total_paginas > 1){
  			 for ($i=$pagina;$i<=$total_paginas && $np<3;$i++){
			 	$np++;
    		  if ($pagina == $i)
         //se mostro o índice da página actual, não coloco link
        	 echo $pagina . " ";
     	 else{
         //se o índice não corresponde com a página mostrada actualmente, coloco o link para ir a essa página
			 
			 echo "<a href='acesso_aluno.php?pagina=" . $i . "'>" . $i . "</a> ";
			}			  			 
  		 }
		 if ( $pagina  < $total_paginas ) {
		// echo "<a href='acesso_aluno.php?pagina=".($pagina+1)."'>   </a> ";	
		 //	echo "<a href='acesso_aluno.php?pagina=" . ($pagina+1) . "'>" . ($pagina+1) . "</a> ";
		 	echo "<a href='acesso_aluno.php?pagina=".($pagina+1)."'>  >> </a> ";	   

			 

		}	
		 echo "<a href='acesso_aluno.php?pagina=$total_paginas> &Uacute;ltima </a>";
		} 
        
        
		//fechamos o conjunto de resultado e a conexão com a base de dados
		 mysql_free_result($sql_pacientes); 
	}	echo "</div></div>"?>
	
</div>