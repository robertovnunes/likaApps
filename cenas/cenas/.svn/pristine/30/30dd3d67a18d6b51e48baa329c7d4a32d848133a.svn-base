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
		</SCRIPT>
	</head>

	<body>
	
	<%@ include file ="../cabecalho.jsp" %>
		<form name="novo" action="relatorio.cadastrarMaterialPesquisadoProblema.logic" method="post">
		<div id="corpo">
			<%@ include file ="local.jsp" %>
			<div id="conteudo">
	  		       
				<div id="menu">
					<%@ include file="menu.jsp" %>
				</div>
				<div id="miolo">
					<h1>Problema: ${problema.titulo}</h1>

					<h4>Planejamento | Material Pesquisado</h4>
					
					<div style="margin:25px;">
						
						<input type="hidden" name="materialPesquisado.problema.idProblema" value="${problema.idProblema}">
						<input type="hidden" name="materialPesquisado.idMaterialPesquisado" value="${materialPesquisado.idMaterialPesquisado}">

						<table class="dados">
							<tr>
								<td class="title">Data de Acesso</td>
								<td class="content3">
								    <input type="text" size="12" maxlength="10" id="dataFormulario" name="materialPesquisado.dataAcesso" value="${materialPesquisado.dataAcesso}" onKeyUp="mascara()" /></td>
							</tr>
							<tr>
								<td class="title">Link</td>
								<td class="content3">
									<input type="text" size="73" name="materialPesquisado.link" value="${materialPesquisado.link}"/>
								</td>
							</tr>
							<tr>
								<td class="title">Resumo</td>
								<td class="content3">
									<textarea cols="73" rows="10" name="materialPesquisado.material">${materialPesquisado.material}</textarea>
								</td>
							</tr>
							<tr>
								<td class="actions" colspan="2">
									<input type="submit" value="Salvar" class="button" name="salvar">&nbsp;
									<input type="button" value="Cancelar" onclick="javascript:window.open('relatorio.exibirMaterialPesquisado.logic','_self');" class="button" />&nbsp;
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
