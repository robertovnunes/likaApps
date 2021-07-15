<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<%@include file="../head.jsp" %>
		<link href="css/displaytag.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="./javascripts/removerLaudo.js"></script>
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
				<h2>LISTAR</h2><!-- campo obrigatorio o h2 no css!!! -->
				
				<div id='resultadoListar'>
					<display:table requestURI="viralClamidia.list.logic" name="${laudosClamidia}" export="true" id="laudoClamidia" list="${laudosClamidia}" pagesize="30" sort="list" class="displaytag">
						<display:column title="N&uacute;mero do prontu&aacute;rio" sortable="true">${laudoClamidia.formulario.numeroProntuario}</display:column>
						<display:column title="C&oacute;digo PRONEX"  sortable="true">${laudoClamidia.formulario.codigoPronex}</display:column>
						<display:column title="Grupo Participante"  sortable="true">${laudoClamidia.formulario.grupoParticipante}</display:column>
						<display:column title="Data coleta"  sortable="true">${laudoClamidia.dataColeta}</display:column>
						<display:column title="Data entrega"  sortable="true">${laudoClamidia.dataEntrega}</display:column>
						<display:column title="Data Atualização Laudo"  sortable="true" >${laudoClamidia.dataAtualizacaoLaudo}</display:column>
						<display:column title=".PDF"  sortable="true" >
							.PDF
						</display:column>
						
						<display:column title="Resultado"  sortable="true">${laudoClamidia.resultado}</display:column>
						<display:column title="Código"  sortable="true">${laudoClamidia.codigo}</display:column>
						<display:column title="visualizar"><i style="color:red;">disabled</i></display:column>
						<display:column title="editar"><a href="viralClamidia.formulario.logic?formulario.id=${laudoClamidia.formulario.id}">editar</a></display:column>
						
						<display:column title="remover" media="">
							<c:if test="${formulario.laudoClamidia.id != null}"> 
								<a href="#" onclick='removerLaudo("${laudoClamidia.formulario.numeroProntuario}","viralClamidia.remove.logic?laudoClamidia.id=${formulario.laudoClamidia.id}");'>remover</a>
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


			</div>
			<div id="footer">
			 	<%@include file="../footer.jsp" %>
			</div>
		</div>
	
	</body>
	
</html>
