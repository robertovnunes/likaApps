<%@ page pageEncoding="ISO-8859-1" %>
<html>
	
	<head>
		<title>CenAS: Cenários de Aprendizagem</title>
		<link rel="stylesheet" href="css/internas.css" />
	</head>

	<body>
	
	<%@ include file ="../cabecalho.jsp" %>
		<form name="novoGlossario" action="relatorio.cadastrarGlossarioProblema.logic" method="post">
		<div id="corpo">
			<%@ include file ="local.jsp" %>
			<div id="conteudo">
	  		       
				<div id="menu">
					<%@ include file="menu.jsp" %>
				</div>
				<div id="miolo">
					<h1>Problema: ${problema.titulo}</h1>

					<h4>Desenvolvimento | Gloss&aacute;rio</h4>
					
					<div style="margin:25px;">
						
						<input type="hidden" name="glossario.problema.idProblema" value="${problema.idProblema}">
						<input type="hidden" name="glossario.idGlossario" value="${glossario.idGlossario}">

						<table class="dados">
							<tr>
								<td class="title">Termo</td>
								<td class="content3">
								    <input type="text" size="74" name="glossario.termo" value="${glossario.termo}" /></td>
							</tr>
							<tr>
								<td class="title">Significado</td>
								<td class="content3">
									<textarea cols="73" rows="18" name="glossario.descricao">${glossario.descricao}</textarea>
								</td>
							</tr>
							<tr>
								<td class="actions" colspan="2">
									<input type="submit" value="Salvar" class="button" name="salvar">&nbsp;
									<input type="button" value="Cancelar" onclick="javascript:window.open('relatorio.exibirGlossario.logic','_self');" class="button" />&nbsp;
								</td>
							</tr>											
						</table>
					</div>
				</div>		    
			</div>		
			</form>
			<%@ include file ="../rodape.jsp" %>
		</div>
	</body>
</html>
