<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="CSS/menu.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<body>
<f:subview id="menuPacientes">
	<h:form>
		<div id="menu">
		<ul>
			<li><h:commandLink styleClass="clicado" action="pacientes">
				<h:outputText value="Pacientes"></h:outputText>
			</h:commandLink></li>
		</ul>
		<ul>
			<li><h:commandLink styleClass="outros" action="usuarios">
				<h:outputText value="Usuários"></h:outputText>
			</h:commandLink></li>
		</ul>
		</div>
		<div class="bordaBox"><strong class="b3"></strong><strong
			class="b4"></strong>
		<div id="submenu">
		<div id="submenu1"><h:commandLink styleClass="outros"
			action="cadastrar">
			<h:outputText value="Novo
		Paciente"></h:outputText>
		</h:commandLink><font color="#ffffff"> | </font> <h:commandLink styleClass="outros" action="buscarPaciente">
			<h:outputText value="Buscar
		Paciente"></h:outputText>
		</h:commandLink></div>
		<div align="right" id="usuario"><b>Usuário:</b> <h:outputText
			value="#{usuarioHandler.usuario.nome}"></h:outputText></div>

		</div>
		</div>
	</h:form>
</f:subview>
</body>
</html>