<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<%@include file="../head.jsp" %>
		<link href="css/displaytag.css" rel="stylesheet" type="text/css" />
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
				<h2>Amostras</h2><!-- campo obrigatorio o h2 no css!!! -->

				<div id='resultadoListar'>
					<display:table requestURI="amostras.index.logic" name="${formularios}" export="true" id="formulario" list="${formularios}" pagesize="10" sort="list" class="displaytag">
						<display:column title="Número do prontuário" sortable="true">${formulario.numeroProntuario}</display:column>
						<display:column title="Código barras" sortable="true">${formulario.codigoBarras}</display:column>
						<display:column title="Código PRONEX"  sortable="true">${formulario.codigoPronex}</display:column>
						<display:column title="Grupo Participante"  sortable="true">${formulario.grupoParticipante}</display:column>
						<display:column title="Amostras"><a href="amostras.formulario.logic?formulario.id=${formulario.id}">amostras</a></display:column>
						
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