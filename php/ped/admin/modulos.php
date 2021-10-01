<?php
	include ($_SERVER['DOCUMENT_ROOT'].'/ped/admin/utils/validar_sessao_admin.php');
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>PED Admin</title>
		<script src="script/utils.js" type="text/javascript"></script>
		<script src="script/jquery-1.2.6.js" type="text/javascript"></script>
    	<script src="script/jquery.php.js" type="text/javascript"></script>
		<script src="script/modulo.js" type="text/javascript"></script>
		<link rel="stylesheet" href="style/base.css" />
	</head>

	<body id="modulo">
		
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
				<h3>Módulos</h3>		
				<div class="botao-popup">
					<a>Formulário Módulo</a>
				</div>
				<div class="popup">
					<form>
						<div>
							<label for="nome" >Nome: </label>
							<input class="entrada-grande" type="text" name="nome"></input>
						</div>
						<div>
							<label for="objetivo">Objetivo: </label>
							<input class="entrada-grande" type="text" name="objetivo"></input>
						</div>
						<div>
							<label for="descricao">Descrição: </label>
							<input class="entrada-grande" type="text" name="descricao"></input>
						</div>
						<button class="inserir">inserir</button>
						<button class="buscar">buscar</button>
					</form>
				</div>
				
				<p id="lista-carregando">
					<img src="img/spinner_odd.gif" alt=""/> Carregando lista de módulos...
				</p>
				<p id="lista-vazia">
					Não há módulos.
				</p>
				<p id="lista-busca-carregando">
					<img src="img/spinner_odd.gif" alt=""/> Carregando lista de módulos...
				</p>
				<p id="lista-busca-vazia">
					Nenhum módulo encontrado.
				</p>
				<table id="tabela" class="lista"">
					<tr>
						<th class="linha_pequena">Nome</th>
						<th class="linha_pequena">Objetivo</th>
						<th class="linha_pequena">Descrição</th>
						<th class="linha_acoes">Ações</th>
					</tr>
					<tr class="template even">
						<td class="linha_nome"></td>
						<td class="linha_objetivo"></td>
						<td class="linha_descricao"></td>
						<td>
							<a href="editar" class='editar'><img src='img/editar.png' title='editar' alt='editar'/></a>
							<a href="remover" class='remover'><img src='img/remover.png' title='remover' alt='remover'/></a>
							<img class="carregando" src="img/spinner_even.gif" alt="Carregando" title="Carregando..."/>
						</td>
					</tr>
					<tr class="template_editar even">
						<td colspan=3>
							<div>
								<label for="nome" >Nome: </label>
								<input class="entrada-grande" type="text" name="nome"></input>
							</div>
							<div>
								<label for="objetivo">Objetivo: </label>
								<input class="entrada-grande" type="text" name="objetivo"></input>
							</div>
							<div>
								<label for="descricao">Descrição: </label>
								<input class="entrada-grande" type="text" name="descricao"></input>
							</div>
						</td>
						<td>
							<a href="salvar" class='salvar'><img src='img/salvar.png' title='salvar' alt='salvar'/></a>
							<a href="cancelar" class='cancelar'><img src='img/cancelar.png' title='cancelar' alt='cancelar'/></a>
							<img class="carregando" src="img/spinner_even.gif" alt="Carregando" title="Carregando..."/>
						</td>
					</tr>			
				</table>
			</div>
			<div id="rodape">
				<img src="img/logoufpe1.png" width="32" height="32" class="ufpe"/> © Copyright PED 2008-2009
				<div class="fale"><a href="mailto:rosalie.belian@nutes.ufpe.br"><img src="img/email.png" width="32" height="32" class="ufpe"/>Fale Conosco</a></div>
			</div>
		</div>
	</body>
</html>