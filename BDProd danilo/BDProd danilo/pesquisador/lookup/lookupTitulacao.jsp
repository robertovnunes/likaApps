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
<f:subview id="lookupTitulacao">




	<!-- ui-dialog -->
	<div id="dialogTitulacao" title="Adicionar Titulação ao Pesquisador"><h:form
		styleClass="niceform">



		<a4j:outputPanel id="novaTitulacao">

			<h:panelGrid columns="4" width="100%">
				<h:panelGroup>
					<h:outputLabel value="Titulação:" for="tit" />
					<br />
					<h:selectOneMenu id="tit" style="width:150px;"
						value="#{pesquisadorHandler.titulacaoAdicionada.titulacao}">
						<f:selectItem itemValue="Técnico" itemLabel="Técnico" />
						<f:selectItem itemValue="Graduação" itemLabel="Graduação" />
						<f:selectItem itemValue="Mestrado" itemLabel="Mestrado" />
						<f:selectItem itemValue="Doutorado" itemLabel="Doutorado" />
						<f:selectItem itemValue="Pós-Doutorado" itemLabel="Pós-Doutorado" />
					</h:selectOneMenu>
				</h:panelGroup>
				<h:panelGroup>
					<h:outputLabel value="Curso:" for="curso" />
					<br />
					<h:inputText id="curso" style="width:270px;" maxlength="100"
						value="#{pesquisadorHandler.titulacaoAdicionada.curso}" />
				</h:panelGroup>

				<h:panelGroup>
					<h:outputLabel value="Instituição:" for="inst" />
					<br />
					<h:inputText id="inst" style="width:270px;" maxlength="100"
						value="#{pesquisadorHandler.titulacaoAdicionada.instituicao}" />
				</h:panelGroup>

				<h:panelGroup>
					<h:outputLabel value="Conclusão:" for="conclusao" />
					<br />
					<h:inputText id="conclusao" style="width:50px;" maxlength="4"
						value="#{pesquisadorHandler.titulacaoAdicionada.conclusao}"
						onkeypress="mascara(this,soNumeros)" />
				</h:panelGroup>

			</h:panelGrid>


		</a4j:outputPanel>


		<div align="center" style="margin-top: 10px"><h:panelGrid
			columns="2">

			<a4j:commandLink onclick="jQuery('#dialogTitulacao').dialog('close')">
				<h:graphicImage value="../css/images/cancelar.png" />
			</a4j:commandLink>




			<a4j:commandLink onclick="jQuery('#dialogTitulacao').dialog('close')"
				action="#{pesquisadorHandler.adicionarTitulacao}"
				reRender="panelTitulacoes">
				<h:graphicImage value="../css/images/adicionar.png" />
			</a4j:commandLink>




		</h:panelGrid></div>



	</h:form></div>
</f:subview>
</body>
</html>

