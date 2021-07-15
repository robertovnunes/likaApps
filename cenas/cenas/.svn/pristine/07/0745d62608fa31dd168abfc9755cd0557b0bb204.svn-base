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
		<form name="novo" action="relatorio.cadastrarPlanoDesenvolvimentoProblema.logic" method="post">
		<div id="corpo">
			<%@ include file ="local.jsp" %>
			<div id="conteudo">
	  		       
				<div id="menu">
					<%@ include file="menu.jsp" %>
				</div>
				<div id="miolo">
					<h1>Problema: ${problema.titulo}</h1>

					<h4>Planejamento | Plano de Desenvolvimento</h4>
					
					<div style="margin:25px;">
						
						<input type="hidden" name="planoDesenvolvimento.problema.idProblema" value="${problema.idProblema}">
						<input type="hidden" name="planoDesenvolvimento.idPlanoDesenvolvimento" value="${planoDesenvolvimento.idPlanoDesenvolvimento}">

						<table class="dados">
							<tr>
								<td class="title">Data Prevista</td>
								<td class="content3">
								    <input type="text" size="12" maxlength="10" id="dataFormulario" name="planoDesenvolvimento.dataPrevista" value="${planoDesenvolvimento.dataPrevista}" onKeyUp="mascara()" /></td>
							</tr>
							<tr>
								<td class="title">Localiza&ccedil;&atilde;o</td>
								<td class="content3">
									<textarea cols="73" rows="3" name="planoDesenvolvimento.localizacao">${planoDesenvolvimento.localizacao}</textarea>
								</td>
							</tr>
							<tr>
								<td class="title">Atividade</td>
								<td class="content3">
									<textarea cols="73" rows="10" name="planoDesenvolvimento.atividade">${planoDesenvolvimento.atividade}</textarea>
								</td>
							</tr>
							<tr>
								<td class="actions" colspan="2">
									<input type="submit" value="Salvar" class="button" name="salvar">&nbsp;
									<input type="button" value="Cancelar" onclick="javascript:window.open('relatorio.exibirPlanoDesenvolvimento.logic','_self');" class="button" />&nbsp;
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
