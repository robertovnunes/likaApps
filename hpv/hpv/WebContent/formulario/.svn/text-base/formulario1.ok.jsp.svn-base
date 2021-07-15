<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
	   	<%@include file="../head.jsp" %>
		<title>HPV-LIKA</title>
		<script type="text/javascript" src="./javascripts/scriptSoNumeros.js"></script>
		<script type="text/javascript" src="./javascripts/scriptFormatarData.js"></script>
  	</head>

	<body>
	    <div id="container">
			<div id="top">
		        <%@include file="../top.jsp" %>
	      	</div>
	      	<%@include file="../selecionarMenuUsuario.jsp" %>
			
			<div class="clear:both;">
			</div>
			<div id="leftnav" style="min-height: 500px;">
	      		<%@include file="leftnav.jsp" %>
			</div>
			
			
			<div id="content">
				<h2>1. DADOS DE IDENTIFICA&Ccedil;&Atilde;O</h2>
				
				<c:if test="${usuarioDaSessao.acessoAdministrador != null && usuarioDaSessao.acessoAdministrador == 'Y'}">
				<br>
				<select>
						<option selected="selected">Ultimas modificações:</option>
						<c:forEach var="modificacao" items="${formulario.modificacoes}">
						<c:if test="${modificacao.etapa == 1 }">
						<option>${modificacao.usuario.login} em ${modificacao.dataModificacao}</option>
						</c:if>
					</c:forEach>
							
				</select>
				</c:if>
				<br>
				<br>
				<ul class="erro">
					<c:forEach var="error" items="${errors.iterator}">
						<li>${error.key}</li>
					</c:forEach>
				</ul>
				<form action="formulario.addFormulario1.logic" method = "post">

					<input type="hidden" name="formulario.id" value="${formulario.id}"/>
					<input type="hidden" name="historicoModificacoes.user" value="${usuarioDaSessao.id}" />
					
					<table class="block" id="tabelaFormulario" >

						<tr>
							<td class="block">Código PRONEX</td>
							<td class="block"><input name="formulario.codigoPronex" value="${formulario.codigoPronex}" maxlength="29" style="width:100%;"/></td>
						</tr>

						<tr>
							<td class="block">Data</td>
							<td class="block"><input name="formulario.data" type="text" onkeyup="this.value=formateadata(this.value);" maxlength="10" value="${formulario.data}" style="width:80px;"/></td>
						</tr>

						<tr>
							<td class="block">Local Coleta</td>
							<td class="block"><input name="formulario.localColeta" value="${formulario.localColeta}" maxlength="100" style="width:100%;"/></td>
						</tr>

						<tr>
							<td class="block">Grupo do participante</td>
							<td class="block">
								<select name="formulario.grupoParticipante" >
									<c:forEach var="grupo" items="${gruposParticipantes}">
										<option value="${grupo}" <c:if test="${formulario.grupoParticipante == grupo}"> selected = 'true'</c:if>>${grupo}</option>
									</c:forEach>
								</select>
							</td>
						</tr>

						<tr>
							<td class="block">Número do prontuário</td>
							<td class="block"><input name="formulario.numeroProntuario" onkeyup="this.value=doDecimal(this.value);" maxlength="30" value="${formulario.numeroProntuario}" style="width:100%;"/></td>
						</tr>
						
						<tr>
							<td class="block">Código de barras</td>
							<td class="block"><input type='text' name='formulario.codigoBarras' value='${formulario.codigoBarras}' maxlength='20' style="width:100%;"/></td>
						</tr>

						<tr>
							<td>	 </td>
							<td><br/></td>
						</tr>
						<%@include file="util/limparSalvar.jsp" %>
					</table>
				</form>
			</div>		
			<div id="footer">
			 	<%@include file="../footer.jsp" %>
			</div>
		</div>
	</body>
</html>