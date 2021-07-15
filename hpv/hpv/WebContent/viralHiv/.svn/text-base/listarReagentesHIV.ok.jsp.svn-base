<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<%@include file="../head.jsp" %>
		<link href="css/displaytag.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="./javascripts/removerItemGenerico.js"></script>
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
				<div id='cadastrarNovoTemplate'>
					<fieldset>
						<legend>Cadastrar</legend>
						<div>
							<a href='viralHiv.formularioReagenteHIV.logic'>Cadastrar Novo Reagente para Teste HIV</a>
						</div>
					</fieldset>
				</div>
				<br></br>
				
				
				<div id='resultadoListar'>
					<display:table requestURI="viralHiv.listarReagentesHIV.logic" name="${reagentes}" export="true" id="reagenteHIV" list="${reagentes}" pagesize="30" sort="list" class="displaytag">
						<display:column title="Teste" maxLength="30">${reagenteHIV.reagente}</display:column>
						<display:column title="Data Atualização Dados Reagente"  sortable="true">${reagenteHIV.dataCadastro}</display:column>
						<display:column title="editar"><a href="viralHiv.formularioReagenteHIV.logic?reagenteHIV.id=${reagenteHIV.id}">editar</a></display:column>
						<display:column title="remover">
							<c:if test="${reagenteHIV.id != null}">
								<a href="#" onclick="removerItemGenerico(' o reagente ${reagenteHIV.reagente}', 'viralHiv.removerReagenteHIV.logic?reagenteHIV.id=${reagenteHIV.id}');">remover</a>
							</c:if>
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
