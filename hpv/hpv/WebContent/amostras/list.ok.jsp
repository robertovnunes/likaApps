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
	      	<div id="menuh-container">
				<%@include file="../logado/menu.jsp" %>
			</div>
			<div class="clear:both;">
			</div>			
			
			<div id="contentListar" >
				<h2>LISTAR</h2><!-- campo obrigatorio o h2 no css!!! -->

				<div id='resultadoListar'>
					<display:table requestURI="amostras.list.logic" name="${amostras}" export="true" id="amostra" list="${amostras}" pagesize="10" sort="list" class="displaytag">
						
						<display:column title="Formulario" sortable="true">${amostra.formulario.id}</display:column>
						<display:column title="DNA ÚTERO(cod barras)" sortable="true">${amostra.dnaUteroCodigoBarras}</display:column>
						<display:column title="DNA SANGUE(cod barras)"  sortable="true">${amostra.dnaSangueCodigoBarras}</display:column>
						<display:column title="DNA SORO-Alfa(cod barras)"  sortable="true">${amostra.dnaSoroAlfaCodigoBarras}</display:column>
						<display:column title="DNA SORO-Beta(cod barras)"  sortable="true">${amostra.dnaSoroBetaCodigoBarras}</display:column>
						<display:column title="LÂMINA(cod barras)"  sortable="true">${amostra.laminaCodigoBarras}</display:column>
						<display:column title="visualizar"><i style="color:gray;">(disabled)</i></display:column>
						<display:column title="editar"><a href="amostras.formulario.logic?formulario.id=${amostra.formulario.id}" style="color:blue;">editar</a></display:column>
						<display:column title="remover"><a href="amostras.remover.logic?formulario.id=${amostra.formulario.id}" style="color:red;">remover</a></display:column>
						
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

