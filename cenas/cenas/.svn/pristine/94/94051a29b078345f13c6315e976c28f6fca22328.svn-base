<%@ page pageEncoding="ISO-8859-1" %>
<html>

	<head> 
		<title>CenAS: Cenários de Aprendizagem</title>
		<link rel="stylesheet" href="css/internas.css" />
	</head>
	
	<body>
	

	<%@ include file ="../cabecalho.jsp" %>
		<div id="corpo">
			<%@ include file ="local.jsp" %>
			<div id="conteudo">
	  		    <div id="menu">
					<%@ include file="menu.jsp" %>
				</div>
				<div id="miolo">
				
					<h1>Problema: ${problema.titulo }</h1>
					<h4>Desenvolvimento | Conclus&atilde;o e Avalia&ccedil;&atilde;o</h4>
						
					<form name="atualizar" action="relatorio.cadastrarConclusaoAvaliacaoProblema.logic" method="post">
					<input type="hidden" name="problema.idProblema" value="${problema.idProblema }">
					<div style="margin:25px;">
				       <textarea name="problema.conclusaoAvaliacao" cols="95" rows="24">${problema.conclusaoAvaliacao}</textarea>
				       <br><br>
						<input type="submit" value="Salvar" class="button" name="salvar">
						<input type="button" value="Cancelar" class="button" name="cancel" onclick="javascript:history.back();">
					
					</div>
				     </form>
				</div>
				
			</div>		
			<%@ include file ="../rodape.jsp" %>
		    </div>
	</body>
</html>
