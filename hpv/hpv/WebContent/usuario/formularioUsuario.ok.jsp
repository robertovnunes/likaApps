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
	      	<div id="menuh-container">
		      	<%@include file="../logado/menu.jsp" %>
	      	</div>
			<div class="clear:both;">
			</div>			
			
			<div id="contentListar" style="">
				<h2 style="text-align: center;">CADASTRAR NOVO USUÁRIO</h2><!-- campo obrigatorio o h2 no css!!! -->	
				<form action="usuario.addUsuario.logic" method="post" >
					<input type="hidden" value="${usuario.id}" name="usuario.id" />
					

					<ul class="erro">
						<c:forEach var="error" items="${errors.iterator}">
							<li>${error.key}</li>
						</c:forEach>
					</ul>

						<table align="center" >
							<tr>
								<td><strong>Nome:</strong></td>
								<td><input type='text' name='usuario.nome' maxlength='100' class='textfieldLongo' value="${usuario.nome}"/></td>
							</tr>
							<tr>
								<td><strong>Login:</strong> </td>
								<td><input type='text' name='usuario.login' maxlength='100' class='textfieldLongo' value="${usuario.login}"/></td>
							</tr>
							<tr>
								<td><strong>Senha:</strong> </td>
								<td><input type='password' name='usuario.senha' maxlength='100'  class='textfieldLongo' value="${usuario.senha}"/></td>
							</tr>
							<tr>
								<td><strong>Email:</strong></td>
								<td><input type='text' name='usuario.email' maxlength='100'  class='textfieldLongo' value="${usuario.email}"/></td>
							</tr>
							<tr>
								<td align="left" valign="top"><strong>Privilégios</strong></td>
								<td>
									<input type="checkbox" name="usuario.acessoAdministrador" value="Y" <c:if test="${usuario.acessoAdministrador == 'Y'}">checked="checked"</c:if>>Administrador<br>
									<input type="checkbox" name="usuario.acessoFormularioClinico" value="Y" <c:if test="${usuario != null && usuario.acessoFormularioClinico == 'Y'}">checked="checked"</c:if>>Formulário clínico<br>
																										
									<input type="checkbox" name="usuario.acessoViralClamidia" value="Y" <c:if test="${usuario.acessoViralClamidia == 'Y'}">checked="checked"</c:if>>Viral Clamídia<br>
									<input type="checkbox" name="usuario.acessoViralHbv" value="Y" <c:if test="${usuario.acessoViralHbv == 'Y'}">checked="checked"</c:if>>Viral HBV<br>
									<input type="checkbox" name="usuario.acessoViralHcv" value="Y" <c:if test="${usuario.acessoViralHcv == 'Y'}">checked="checked"</c:if>>Viral HCV<br>
									<input type="checkbox" name="usuario.acessoViralHiv" value="Y" <c:if test="${usuario.acessoViralHiv == 'Y'}">checked="checked"</c:if>>Viral HIV<br>
									<input type="checkbox" name="usuario.acessoViralHpv" value="Y" <c:if test="${usuario.acessoViralHpv == 'Y'}">checked="checked"</c:if>>Viral HPV<br>
									<input type="checkbox" name="usuario.acessoViralSifilis" value="Y" <c:if test="${usuario.acessoViralSifilis == 'Y'}">checked="checked"</c:if>>Viral Sífilis<br>

									<input type="checkbox" name="usuario.acessoCitopato" value="Y" <c:if test="${usuario.acessoCitopato == 'Y'}">checked="checked"</c:if>>Citopato<br>
									<input type="checkbox" name="usuario.acessoAmostras" value="Y" <c:if test="${usuario.acessoAmostras == 'Y'}">checked="checked"</c:if>>Amostras<br>
									<input type="checkbox" name="usuario.acessoAnexos" value="Y" <c:if test="${usuario.acessoAnexos == 'Y'}">checked="checked"</c:if>>Anexos do formulário<br>
								</td>
							</tr>
							<tr >
								<td colspan="2" align="left" style="padding-top: 10px;"><input type='submit' value='confirmar' /></td>
							</tr>
						</table>
				</form>
				<br/>
			</div>
			<div id="footer">
			 	<%@include file="../footer.jsp" %>
			</div>
		</div>
	
	</body>
	
</html>