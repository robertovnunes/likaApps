<%-- 
    Document   : login
    Created on : 11/03/2010, 10:33:05
    Author     : Marcio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<f:view>
	<html>
	<head>

	<meta http-equiv="Cont ent-Type" content="text/html; charset=UTF-8">
	<title>BD-Prod</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
	<div id="wrapper">
	<div id="login"></div>
	<!-- start page -->
	<div id="page"><h:form>
		<!-- start content -->
		<div id="loginContent" align="center"><h:panelGroup>
			<h:panelGrid>
				<h:graphicImage value="images/lika.jpg" width="250" height="75"
					alt="Lika" title="Lika" style="margin-bottom: 40px;" />
			</h:panelGrid>

			<span
				style="color: #7B0E10; font-weight: bold; font-size: 14px; padding: 10px;">ACESSO
			RESTRITO<h:graphicImage value="images/user-icon.png" width="37"
				height="27" alt="user" title="user" /> </span>
			<h:panelGrid columns="2">
				<h:outputText value="Login:" />
				<h:inputText required="true" style="width:143px;" id="login"
					maxlength="20" value="#{sessionHandler.usuario.login}"
					requiredMessage="Campo Login é obrigatório!" />
				<h:outputText value="Senha:" />
				<h:inputSecret id="senha" required="true" style="width:143px;"
					maxlength="20" value="#{sessionHandler.usuario.senha}"
					requiredMessage="Campo Senha é obrigatório!" />
			</h:panelGrid>

			<h:panelGrid columns="1">
				<h:commandLink value="Esqueceu a senha?" action="esqueceuSenha"
					immediate="true">
				</h:commandLink>
				<h:commandButton value="Login" action="#{sessionHandler.login}">


					<f:setPropertyActionListener value="#{sessionHandler.navigation}"
						target="#{areaHandler.navigation}" />

					<f:setPropertyActionListener value="#{sessionHandler.navigation}"
						target="#{bolsistaProjetoHandler.navigation}" />

					<f:setPropertyActionListener value="#{sessionHandler.navigation}"
						target="#{pesquisadorHandler.navigation}" />

					<f:setPropertyActionListener value="#{sessionHandler.navigation}"
						target="#{funcionarioHandler.navigation}" />

					<f:setPropertyActionListener value="#{sessionHandler.navigation}"
						target="#{alunoHandler.navigation}" />

					<f:setPropertyActionListener value="#{sessionHandler.navigation}"
						target="#{equipamentoHandler.navigation}" />

					<f:setPropertyActionListener value="#{sessionHandler.navigation}"
						target="#{laboratorioHandler.navigation}" />

					<f:setPropertyActionListener value="#{sessionHandler.navigation}"
						target="#{projetoHandler.navigation}" />

					<f:setPropertyActionListener value="#{sessionHandler.navigation}"
						target="#{publicacaoHandler.navigation}" />

					<f:setPropertyActionListener value="#{sessionHandler.navigation}"
						target="#{grupoHandler.navigation}" />

					<f:setPropertyActionListener value="#{sessionHandler.navigation}"
						target="#{usuarioHandler.navigation}" />

					<f:setPropertyActionListener value="#{sessionHandler.navigation}"
						target="#{adminHandler.navigation}" />

				</h:commandButton>
			</h:panelGrid>


			<h:panelGrid columns="1">
				<div style="color: red;"><h:messages style="color:red;"
					layout="table" /></div>
			</h:panelGrid>
		</h:panelGroup></div>
		<!-- end content -->

		<div style="clear: both;">&nbsp;</div>
	</h:form></div>
	<!-- end page --></div>
	<div id="footer"></div>
	</body>
	</html>
</f:view>