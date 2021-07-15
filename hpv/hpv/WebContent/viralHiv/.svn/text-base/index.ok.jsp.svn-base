<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<%@include file="../head.jsp" %>
		<link href="css/displaytag.css" rel="stylesheet" type="text/css" />
	    <title>HPV-LIKA</title>
  	</head>
	<body>
	    <div id="container">
			<div id="top">
		        <%@include file="../top.jsp" %>
				
	      	</div>
	      	<%@include file="../selecionarMenuUsuario.jsp" %>

			<div class="clear:both;">
			</div>
			
			<div id="contentListar" >
				<h2>Laudos (HIV)</h2><!-- campo obrigatorio o h2 no css!!! -->
				<div id='cadastrarNovoTemplate'>
					<fieldset>
						<legend>Teste HIV</legend>
						<div>
							<a href='viralHiv.listarReagentesHIV.logic'>Reagentes para Teste HIV</a>
						</div>
					</fieldset>
				</div>
				<br></br>
				
				
				<div id='resultadoListar'>
					<display:table requestURI="viralHiv.index.logic" name="${formularios}" export="true" id="formulario" list="${formularios}" pagesize="10" sort="list" class="displaytag">
						<display:column title="Número do prontuário" sortable="true">${formulario.numeroProntuario}</display:column>
						<display:column title="Código barras" sortable="true">${formulario.codigoBarras}</display:column>
						<display:column title="Código PRONEX"  sortable="true">${formulario.codigoPronex}</display:column>
						<display:column title="Grupo Participante"  sortable="true">${formulario.grupoParticipante}</display:column>
						<display:column title="Laudo">
							<a href="viralHiv.formulario.logic?formulario.id=${formulario.id}">Resultado</a>
						</display:column>
						<display:column title=".PDF" media="">
							<c:if test="${formulario.laudoHiv.id != null}"> 
								<a href="viralHiv.gerarPdfLaudo.logic?formulario.id=${formulario.id}">.PDF</a>
							</c:if>
						</display:column>
											
						<display:column title="remover" media="">
							<c:if test="${formulario.laudoHiv.id != null}"> 
								<a href="#" onclick='removerLaudo("${formulario.laudoHiv.id}");'>remover</a>
							</c:if>
						</display:column>



						<display:setProperty name="paging.banner.placement" value="bottom" />
						<display:setProperty name="basic.empty.showtable" value="true" />
						<display:setProperty name="export.excel" value="true" />
						<display:setProperty name="export.xml" value="true" /> 
						<display:setProperty name="export.csv" value="false" />  
						<display:setProperty name="export.pdf" value="true" />  
						<display:setProperty name="export.excel.filename" value="lista.xls" /> 
						<display:setProperty name="export.pdf.filename" value="lista.pdf" />
					</display:table>
				</div>
				<script type="text/javascript">
					function removerLaudo(id){
						if(id != null && id != ""){
							window.location = "viralHiv.remove.logic?laudoHiv.id="+ id;
						}else alert("Não há laudo associado a este formulário!");
					}
				</script>

			</div>
			<div id="footer">
			 	<%@include file="../footer.jsp" %>
			</div>
		</div>
	
	</body>
	
</html>