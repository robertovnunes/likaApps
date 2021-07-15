<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
<title>Clin</title>
</head>
<body>
<f:view>
	<h:form>
		<div id="main_content">
		<div id="top_banner"></div>
		<div id="page_content">
		<div class="content">
		<div id="left_section">
		
		<span
			style="color: #7B0E10; font-weight: bold; font-size: 14px; padding: 10px;">ACESSO
		RESTRITO <img src="images/user-icon.png" width="37" height="27"
			alt="user" title="user" />
		</span>
		<h:panelGrid columns="2"
			rowClasses="oddRows,evenRows">
			<h:outputText value="Login:" />
				<h:inputText required="true"  size="20" id="login"  maxlength="20" value="#{usuarioHandler.usuario.login}"
				requiredMessage="Campo Login é obrigatório!"/>
			<h:outputText value="Senha:" />
			<h:inputText  id = "senha" required="true" size="20"  maxlength="20" value="#{usuarioHandler.usuario.senha}"
			requiredMessage="Campo Senha é obrigatório!"/>
		</h:panelGrid>
		<h:panelGrid columns="1"
			rowClasses="oddRows,evenRows" style="width: 241px">
			 <h:commandLink action="logar">
			<h:outputText value="Esqueceu a senha?"></h:outputText>
		</h:commandLink>
		<h:commandButton value="Login" action="{usuarioHandler.login}" />

		</h:panelGrid>
		<div style="color: red;">
		<h:messages style="color:red;"/>
		</div>

		
		
		
		
		</div>
		<div id="right_section">
		
		<div class="title">BEM VINDO!</div>
		
		<p>----- Descrição ------</p>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
		do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
		ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
		aliquip ex ea commodo consequat. Duis aute irure dolor in
		reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
		pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
		culpa qui officia deserunt mollit anim id est laborum</p>
		
		</div>
		
		</div>
		</div>
		<div id="footer">
		<div id="copyrights"><a href="mailto:rosalie.belian@ufpe.br ">
		<img src="images/cartaComFundoAzul.jpg" width="28" height="19"
			title="Contato" align="right" alt="enviar E-mail"/></a> iDEIAS.&copy; All Rights Reserved
		2009</div>
		</div>
		</div>
	</h:form>
</f:view>
</body>
</html>