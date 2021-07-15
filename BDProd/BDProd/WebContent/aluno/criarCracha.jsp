<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.ajax4jsf.org/rich" prefix="rich"%>
<%@ taglib uri="https://ajax4jsf.dev.java.net/ajax" prefix="a4j"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%--
    This file is an entry point for JavaServer Faces application.
--%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/styleMenus.css" rel="stylesheet" type="text/css" />
<title>JSP Page</title>

</head>
<body>
<f:subview id="criarCracha">




	<!-- ui-dialog -->
	<div id="dialogCracha" title="Novo Crachá"><h:form
		styleClass="niceform">

		<h:panelGroup id="pCracha">

			<div style="margin-bottom: 15px; margin-top: 15px;"><h:panelGroup>
				<h:outputLabel value="Nome:" for="nome" />
				<br />
				<h:inputText id="nome" size="86"
					value="#{alunoHandler.alunoAtual.nome}" maxlength="60"
					disabled="true" />
			</h:panelGroup> <h:panelGrid columns="2">
				<h:panelGroup>
					<h:outputLabel value="Número:" for="numero" />
					<br />
					<h:inputText id="numero" size="20"
						value="#{alunoHandler.novoCracha.numeroCracha}" maxlength="10" />
				</h:panelGroup>

				<h:panelGroup>
					<h:outputLabel value="Data Emissão:" for="emissao" />
					<br />
					<h:inputText id="emissao"
						value="#{alunoHandler.novoCracha.dataEmissao}" size="15"
						maxlength="10" onkeypress="mascara(this,data)"
						converterMessage="Data no formato inválido. ex: 30/10/1987">
						<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
					</h:inputText>
				</h:panelGroup>


				<h:panelGroup>
					<h:outputLabel value="Situação:" for="situacaoCracha" />
					<br />
					<h:selectOneMenu id="situacaoCracha" style="width:150px;"
						value="#{alunoHandler.novoCracha.situacao}">
						<f:selectItem itemValue="em Atividade" itemLabel="em Atividade" />
						<f:selectItem itemValue="Desligado" itemLabel="Desligado" />
						<a4j:support event="onchange" ajaxSingle="true"
							reRender="des,desligamento"
							action="#{alunoHandler.mudarSituacaoCracha}" />

					</h:selectOneMenu>
				</h:panelGroup>


				<h:panelGroup id="des">
					<h:outputLabel value="Data Desligamento:" for="desligamento" />
					<br />
					<h:inputText id="desligamento"
						binding="#{alunoHandler.dataDesligamento}"
						disabled="#{alunoHandler.novoCracha.situacao != 'Desligado'}"
						value="#{alunoHandler.novoCracha.dataDesligamento}" size="15"
						maxlength="10" onkeypress="mascara(this,data)"
						converterMessage="Data no formato inválido. ex: 30/10/1987">
						<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
					</h:inputText>
				</h:panelGroup>

			</h:panelGrid></div>

		</h:panelGroup>


		<a4j:jsFunction name="ajaxValidator"
			data="#{facesContext.maximumSeverity.ordinal}"
			oncomplete="if (data !='2') if (data !='0' ) jQuery('#dialogCracha').dialog('close');" />


		<h:panelGroup id="msg">
			<h:message id="msg1" style="color:red; font-weight:bold;"
				for="emissao" />

			<h:message id="msg2" style="color:red; font-weight:bold;"
				for="desligamento" />
		</h:panelGroup>
		<div align="center" style="margin-top: 10px"><h:panelGrid
			columns="2">

			<a4j:commandLink onclick="jQuery('#dialogCracha').dialog('close')"
				action="#{alunoHandler.cancelarCracha}" reRender="panelCracha">
				<h:graphicImage value="../css/images/cancelar.png" />
			</a4j:commandLink>



			<a4j:commandLink action="#{alunoHandler.salvarCracha}"
				reRender="msg, panelCracha" oncomplete="ajaxValidator();">
				<h:graphicImage value="../css/images/adicionar.png" />
			</a4j:commandLink>


		</h:panelGrid></div>
	</h:form></div>
</f:subview>
</body>
</html>

