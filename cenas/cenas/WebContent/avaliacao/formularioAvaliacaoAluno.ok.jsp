<%@ page pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/formatarString.tld" prefix="m" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<html>

<head> 
	<title>CenAS: Cen?rios de Aprendizagem</title>
	<link rel="stylesheet" href="css/internas.css" />

	<script language="javascript">

		function mudarPontoParaVirgula() {
			var inputDA = document.getElementById("inputDA");
			var inputDC = document.getElementById("inputDC");

			inputDA.value = inputDA.value.replace(".", ",");	
			inputDC.value = inputDC.value.replace(".", ",");
		}
	
	</script>

</head>
<body>

<%@ include file ="../cabecalho.jsp" %>

	<div id="corpo">
                
		<div id="conteudo">
		
			<h4>Avalia??o | ${aluno.nome}</h4>
			
			<form name="form" action="avaliacao.cadastrarAvaliacao.logic" method="post"
						onsubmit="return confirma(this)" style="text-align:center; ">
				
				<div style="margin:25px;">
					<input type="hidden" name="avaliacao.idAvaliacao" value="${avaliacao.idAvaliacao}">
					<input type="hidden" name="avaliacao.aluno.id" value="${aluno.id}" /> 
					<div style="width: 495px; margin-left: 93px;" align="center">
						<%@ include file="../erros.jsp" %>
					</div>
					<table id="dados" style="text-align: left;" class="dados" align="center">
						<tr>
							<td class="title">Dom?nio Afetivo</td>
							<td class="content3">
								<input id="inputDA" name="avaliacao.dominioAcademico" value="${avaliacao.dominioAcademico}" size="5" maxlength="5" onkeyup="this.value=converter(this.value);"/>
								
							</td>
						</tr>
						<tr>
							<td class="title">Dom?nio Cognitivo</td>
							<td class="content3">
								<input id="inputDC" name="avaliacao.dominioCognitivo" value="${avaliacao.dominioCognitivo}" size="5" maxlength="5" onkeyup="this.value=converter(this.value);"/>
							</td>
						</tr>
						<tr>
							<td class="actions" colspan="2">
								<input type="submit" value="Salvar" class="button" />&nbsp;
								<input type="button" value="Cancelar" onClick="javascript:history.back()" class="button" />
							</td>
						</tr>
					</table>

				</div>
			</form>
	
		</div>
			<%@ include file ="../rodape.jsp" %>
	    </div>
<script>
function converter(temp){

	var retorno = "";
	var i = 0;
	
	for( i = 0; i < temp.length; i++){
		 if(temp.charAt(i) >= 0 && temp.charAt(i) <= 9){
			 retorno += temp.charAt(i);
		 }
		 else if(temp.charAt(i) == "," || temp.charAt(i) == "."){
			 retorno += ".";
		 }
		 else{
			 retorno = "F";
			 break;
		 }
	 }	
	 return retorno;
}
</script>
</body>
</html>
