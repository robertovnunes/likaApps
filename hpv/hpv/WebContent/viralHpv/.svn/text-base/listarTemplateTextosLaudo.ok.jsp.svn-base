<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<%@include file="../head.jsp" %>
		<link href="css/displaytag.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="./javascripts/mensagemConfirmacaoExclusao.js"></script>
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
				<h2>LISTAR</h2>
				<div>
					<fieldset>
						<legend>Templates</legend>
						<a href='viralHpv.formularioTemplateTextoLaudo.logic'>adicionar novo template de laudo do HPV</a>
					</fieldset>
				</div>
				<br></br>
				<div id='resultadoListar'>
					<display:table requestURI="viralHpv.listarTemplateTextosLaudo.logic" name="${templateTextosLaudos}" export="false" id="templateTextosLaudo" list="${templateTextosLaudos}" pagesize="30" sort="list" class="displaytag">
						<display:column title="Cod." sortable="true">${templateTextosLaudo.id}</display:column>
						<display:column title="Texto"  sortable="true">${templateTextosLaudo.texto}</display:column>
						<display:column title="editar"><a href="viralHpv.formularioTemplateTextoLaudo.logic?templateTextosLaudo.id=${templateTextosLaudo.id}">editar</a></display:column>
						<display:column title="remover">
							<a href="javascript:confirma('o template ${templateTextosLaudo.texto}', 'viralHpv.removerTemplateTextoLaudo.logic?templateTextosLaudo.id=${templateTextosLaudo.id}');">
								<img src="./images/remove-user-16x16.png" />
							</a>
						</display:column>						
						<display:setProperty name="paging.banner.placement" value="bottom" />
						<display:setProperty name="basic.empty.showtable" value="true" />
					</display:table>
				</div>
			</div>
			<div id="footer">
			 	<%@include file="../footer.jsp" %>
			</div>
		</div>
	
	</body>
	
</html>
