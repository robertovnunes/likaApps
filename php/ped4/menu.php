<?php 
if ($show == "al"){
	$msg = "PED > Aluno";
} else if ($show == "alp"){
	$msg = "PED > Aluno > Paciente";
} else if ($show == "ad"){
	$msg = "PED > Administrador";
} else if ($show == "pr"){
	$msg = "PED > Professor";
}else $msg= "";

if ($show != ""){
	$equipe = getEquipeAluno($usuario->getLogin());
}
?>

<?php if ($show != '') {
    		$nome = "<b>Aluno:  </b>".$usuario->getNome(); //".;
		$equipe = "<b>Equipe:</b>  ".$equipe->equipe;
    		echo "<div id='textoAluno'>
			".$nome."<br>"
                      .$equipe." </div>";
		

    	} 
	?>
      	


<table width="810" height="18" align="center" cellspacing="0" >
	<tr bgcolor="#629BD2">
    	<td width="800" class="style4" align="left" ><div id="linhaLogado">   <div id="textoLogado"> <?php echo $msg;?></div></div></td>
    
      	<td width="54"><?php if ($show != '') echo "<a href='logout.php'><span class='style4'>Sair</span></a>";?></td>
	</tr>
</table>
