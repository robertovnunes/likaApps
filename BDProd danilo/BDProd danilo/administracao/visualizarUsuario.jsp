<%-- 
    Document   : perfilPesquisador
    Created on : 21/03/2010, 16:25:05
    Author     : Marcio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.ajax4jsf.org/rich" prefix="rich"%>
<%@ taglib uri="https://ajax4jsf.dev.java.net/ajax" prefix="a4j"%>



<html>
<head>
<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />
</head>
<body>
<f:subview id="visualizarUsuario">





	<fieldset><legend>Informações Gerais</legend>

	<div id="conteudoForm"><h:panelGrid columns="1">
		<h:panelGroup>
			<h:outputLabel value="Login:" />
			<br />
			<h:outputText value="#{usuarioHandler.novoUsuario.login}"
				styleClass="visualizar_texto" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{usuarioHandler.novoUsuario.login == ''}" />

		</h:panelGroup>

		<h:panelGroup>
			<h:outputText value="Senha:" />
			<br />
			<h:outputText value="************" styleClass="visualizar_texto" />






		</h:panelGroup>


		<h:panelGroup>
			<h:outputText value="Perfil:" />
			<br />
			<h:outputText value="#{usuarioHandler.novoUsuario.perfil}"
				styleClass="visualizar_texto" />
		</h:panelGroup>


	</h:panelGrid> <h:panelGroup id="panelResponsavel"
		rendered="#{usuarioHandler.novoUsuario.perfil == 'Pesquisador'}">
		<h:outputLabel value="Pesquisador Associado ao Usuário:" />
		<br />
		<h:outputText styleClass="visualizar_texto"
			value="#{usuarioHandler.novoUsuario.pessoa.nome}"
			rendered="#{usuarioHandler.novoUsuario.pessoa!= null}" />

		<h:outputText style="color:red; margin-left:3px;"
			value="Nenhum Pesquisador associado."
			rendered="#{usuarioHandler.novoUsuario.pessoa == null}" />






	</h:panelGroup></div>

	</fieldset>












</f:subview>
</body>
</html>

