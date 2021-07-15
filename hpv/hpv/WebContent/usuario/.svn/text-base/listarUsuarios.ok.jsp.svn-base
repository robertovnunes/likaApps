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
	      	<div id="menuh-container">
		      	<%@include file="../logado/menu.jsp" %>
	      	</div>
			<div class="clear:both;">
			</div>			
			
			<div id="contentListar" >
				<h2>LISTAR USU&Aacute;RIOS</h2>
				<br/>

				<div class='resultadoListarUsuarios' style="margin-left: 0;" >
					<div>
						<fieldset>
							<legend style=""><strong>Usuarios</strong></legend>
								<display:table requestURI="usuario.listarUsuarios.logic" name="${usuarios}" export="true" id="usuario" list="${usuarios}" pagesize="10" sort="list" class="displaytag">
									<display:column title="Nome" sortable="true">${usuario.nome}</display:column>
									<display:column title="Login"  sortable="true">${usuario.login}</display:column>
									<display:column title="Email"  sortable="true">${usuario.email}</display:column>
									<display:column title="Administrador"  sortable="true">
										<c:if test="${usuario.acessoAdministrador == 'Y'}">sim</c:if>
										<c:if test="${usuario.acessoAdministrador == null || usuario.acessoAdministrador == 'N'}">não</c:if>
									</display:column>

									<display:column title="Clamídia"  sortable="true">
										<c:if test="${usuario.acessoViralClamidia == 'Y'}">sim</c:if>
										<c:if test="${usuario.acessoViralClamidia  == null || usuario.acessoViralClamidia == 'N'}">não</c:if>
									</display:column>
									<display:column title="HBV"  sortable="true">
										<c:if test="${usuario.acessoViralHbv == 'Y'}">sim</c:if>
										<c:if test="${usuario.acessoViralHbv  == null || usuario.acessoViralHbv == 'N'}">não</c:if>
									</display:column>
									<display:column title="HCV"  sortable="true">
										<c:if test="${usuario.acessoViralHcv == 'Y'}">sim</c:if>
										<c:if test="${usuario.acessoViralHcv  == null || usuario.acessoViralHcv == 'N'}">não</c:if>
									</display:column>
									<display:column title="HIV"  sortable="true">
										<c:if test="${usuario.acessoViralHiv == 'Y'}">sim</c:if>
										<c:if test="${usuario.acessoViralHiv  == null || usuario.acessoViralHiv == 'N'}">não</c:if>
									</display:column>
									<display:column title="HPV"  sortable="true">
										<c:if test="${usuario.acessoViralHpv == 'Y'}">sim</c:if>
										<c:if test="${usuario.acessoViralHpv  == null || usuario.acessoViralHpv == 'N'}">não</c:if>
									</display:column>
									<display:column title="Sífilis"  sortable="true">
										<c:if test="${usuario.acessoViralSifilis == 'Y'}">sim</c:if>
										<c:if test="${usuario.acessoViralSifilis  == null || usuario.acessoViralSifilis == 'N'}">não</c:if>
									</display:column>


									<display:column title="Formulário"  sortable="true">
										<c:if test="${usuario.acessoFormularioClinico == 'Y'}">sim</c:if>
										<c:if test="${usuario.acessoFormularioClinico  == null || usuario.acessoFormularioClinico == 'N'}">não</c:if>
									</display:column>
									<display:column title="Citopato"  sortable="true">
										<c:if test="${usuario.acessoCitopato == 'Y'}">sim</c:if>
										<c:if test="${usuario.acessoCitopato == null || usuario.acessoCitopato == 'N'}">não</c:if>
									</display:column>
									<display:column title="Amostras"  sortable="true">
										<c:if test="${usuario.acessoAmostras == 'Y'}">sim</c:if>
										<c:if test="${usuario.acessoAmostras == null || usuario.acessoAmostras == 'N'}">não</c:if>
									</display:column>
									<display:column title="Anexos"  sortable="true">
										<c:if test="${usuario.acessoAnexos == 'Y'}">sim</c:if>
										<c:if test="${usuario.acessoAnexos == null || usuario.acessoAnexos == 'N'}">não</c:if>
									</display:column>
									<display:column title="editar" media="html">
										<a href="usuario.formularioUsuario.logic?usuario.id=${usuario.id}"> <img src="./images/edit-user-16x16.png" /> </a>  
									</display:column>
									<display:column title="remover" media="html">
										<a href="javascript:confirma('${usuario.nome}', 'usuario.removerUsuario.logic?usuario.id=${usuario.id}');">
											<img src="./images/remove-user-16x16.png" />
										</a>	
										  
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

						</fieldset>
					</div>
					<br/>			
				</div>
			</div>
			<div id="footer" style="text-align: center; width: 750px;">
			 	<%@include file="../footer.jsp" %>
			</div>
		</div>
	
	</body>
	
</html>
