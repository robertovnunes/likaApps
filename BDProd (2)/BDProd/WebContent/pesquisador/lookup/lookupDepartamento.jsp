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
<f:subview id="lookupDepartamento">




	<!-- ui-dialog -->
	<div id="dialogDepartamento"
		title="Associar Departamento ao Pesquisador"><h:form
		styleClass="niceform">


		<div align="center" style="margin-bottom: 15px; margin-top: 15px;">
		<h:panelGroup>

			<h:inputText id="buscarNomeDepartmaento" size="50"
				value="#{adminHandler.nomeDepartamento}" />


			<a4j:commandButton value="Buscar" reRender="novoDepartamento"
				action="#{adminHandler.listarDepartamentos}" />
		</h:panelGroup></div>


		<a4j:outputPanel id="novoDepartamento">


			<h:panelGroup rendered="#{empty areaHandler.subAreas }">
				<div id="nenhum" align="center" style="color: red;"><h:outputText
					value="Nenhuma Depa econtrada." /></div>
			</h:panelGroup>


			<rich:dataTable id="tabelaResultadoArea"
				value="#{areaHandler.subAreas}" var="subArea" cellpadding="2"
				cellspacing="2" style="width:580px" rows="5" styleClass="mytable"
				rendered="#{!empty areaHandler.subAreas }">
				<rich:column id="nome">
					<f:facet name="header">
						<h:outputText value="Nome"></h:outputText>
					</f:facet>
					<div style="width: 450px"><h:outputText
						value="#{subArea.nome}"></h:outputText></div>
				</rich:column>


				<rich:column id="opcoes">
					<f:facet name="header">
						<h:outputText value="Op????es"></h:outputText>
					</f:facet>
					<div style="width: 60px" align="center"><a4j:commandLink
						ajaxSingle="true" onclick="jQuery('#dialogAreas').dialog('close')"
						value="Selecionar" reRender="panelAreas"
						actionListener="#{pesquisadorHandler.adicionarAreaDePesquisa}">
						<f:attribute value="#{subArea}" name="area" />
					</a4j:commandLink></div>
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller fastControls="hide">

						<f:facet name="first">
							<h:outputText value="Primeira" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="first_disabled">
							<h:outputText value="Primeira" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="last">
							<h:outputText value="??ltima" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="last_disabled">
							<h:outputText value="??ltima" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="previous">
							<h:outputText value="Anterior" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="previous_disabled">
							<h:outputText value="Anterior" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="next">
							<h:outputText value="Pr??xima" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="next_disabled">
							<h:outputText value="Pr??xima" styleClass="scrollerCell" />
						</f:facet>


					</rich:datascroller>
				</f:facet>

			</rich:dataTable>


		</a4j:outputPanel>


		<div align="center" style="margin-top: 10px"><h:panelGrid
			columns="2">
			
			<a4j:commandLink onclick="jQuery('#dialogDepartamento').dialog('close')">
				<h:graphicImage value="../css/images/cancelar.png" />
			</a4j:commandLink>
			
			
		</h:panelGrid></div>




	</h:form></div>
</f:subview>
</body>
</html>

