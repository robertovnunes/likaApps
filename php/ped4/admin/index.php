<?php
	include $_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/validar_sessao_admin.php';
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>PED Admin</title>
		<script src="script/utils.js" type="text/javascript"></script>
		<script src="script/jquery-1.2.6.js" type="text/javascript"></script>
    	<script src="script/jquery.php.js" type="text/javascript"></script>
		<link rel="stylesheet" href="style/base.css" />
	</head>

	<body>
		
		<div id="top">
			<img src="img/ped.png" />
			<div>
				<span class="titulo">PED</span>
				<span class="descricao">Prontuário de Semiologia Pediátrica</span>
			</div>
		</div>
		
		<div id="funcao">
			<span class="descricao">PED > Admin</span>
			<span class='sair'><a href='utils/deslogar.php'>Sair</a></span>
		</div>
		
		<div id="conteudo">		
		
			<div id="menu">
				<ul>				
					<li><a href="professores.php">Professores</a></li>
					<li><a href="modulos.php">Módulos</a></li>
					<li><a href="turmas.php">Turmas</a></li>
					<li><a href="equipes.php">Equipes</a></li>
					<li><a href="alunos.php">Alunos</a></li>
				</ul>
			</div>
			
			<div id="right">
			</div>
			<div id="rodape">
				<img src="img/logoufpe1.png" width="32" height="32" class="ufpe"/> © Copyright PED 2008-2009
				<div class="fale"><a href="mailto:rosalie.belian@nutes.ufpe.br"><img src="img/email.png" width="32" height="32" class="ufpe"/>Fale Conosco</a></div>
			</div>
		</div>
	</body>
</html>
