<%@ page pageEncoding="ISO-8859-1" %>
<html>
	
	<head>
		<title>CenAS: Cenários de Aprendizagem</title>
		<link rel="stylesheet" href="css/internas.css" />

		<SCRIPT LANGUAGE="JavaScript">
			function mascara() {
				if(document.getElementById("dataFormulario").value.length == 2) {
					document.getElementById("dataFormulario").value += '/';
				}
				if(document.getElementById("dataFormulario").value.length == 5) {
					document.getElementById("dataFormulario").value += '/';
				}
			}
		</script>
	</head>

	<body>
	
	<%@ include file ="../cabecalho.jsp" %>
		<form name="novo" action="relatorio.cadastrarReferenciasBibliograficasProblema.logic" method="post">
		<div id="corpo">
			<%@ include file ="local.jsp" %>
			<div id="conteudo">
	  		       
				<div id="menu">
					<%@ include file="menu.jsp" %>
				</div>
				<div id="miolo">
					<h1>Problema: ${problema.titulo}</h1>

					<h4>Desenvolvimento | Refer&ecirc;ncia Bibliogr&aacute;fica</h4>
					
					<div style="margin:25px;">
						
						<input type="hidden" name="referenciaBibliografica.problema.idProblema" value="${problema.idProblema}">
						<input type="hidden" name="referenciaBibliografica.id" value="${referenciaBibliografica.id}">

						<table class="dados">
							<tr>
								<td class="title">T&iacute;tulo</td>
								<td class="content3">
									<input type="text" size="73" name="referenciaBibliografica.titulo" value="${referenciaBibliografica.titulo}" />
								</td>
							</tr>
							<tr>
								<td class="title">Autores</td>
								<td class="content3">
									<input type="text" size="73" name="referenciaBibliografica.autor" value="${referenciaBibliografica.autor}" />
								</td>
							</tr>
							<tr>
								<td class="title">Descrição</td>
								<td class="content3">
									<textarea cols="73" rows="5" name="referenciaBibliografica.descricao">${referenciaBibliografica.descricao}</textarea>
								</td>
							</tr>
							<tr>
								<td class="title">Editora</td>
								<td class="content3">
									<input type="text" size="73" name="referenciaBibliografica.editora" value="${referenciaBibliografica.editora}"/>
								</td>
							</tr>
							<tr>
								<td class="title">Ano</td>
								<td class="content3">
									<input type="text" size="4" name="referenciaBibliografica.ano" maxlength=4 value="${referenciaBibliografica.ano}" />
								</td>
							</tr>
							<tr>
								<td class="title">Edição</td>
								<td class="content3">
									<input type="text" size="4" name="referenciaBibliografica.edicao" maxlength=3 value="${referenciaBibliografica.edicao}"/>
								</td>
							</tr>
							<tr>
								<td class="title">URL</td>
								<td class="content3">
									<input type="text" size="73" name="referenciaBibliografica.url" value="${referenciaBibliografica.url}" />
								</td>
							</tr>
							<tr>
								<td class="title">Acesso</td>
								<td class="content3">
									<input type="text" id="dataFormulario" size="12" name="referenciaBibliografica.dataAcesso" onKeyUp="mascara()" maxlength=10 value="${referenciaBibliografica.dataAcesso}" > [ddmmaaaa]</td>
							</tr>
							<tr>
								<td class="actions" colspan="2">
									<input type="submit" value="Salvar" class="button" name="salvar">&nbsp;
									<input type="button" value="Cancelar" onclick="javascript:window.open('relatorio.exibirReferenciasBibliograficas.logic','_self');" class="button" />&nbsp;
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
