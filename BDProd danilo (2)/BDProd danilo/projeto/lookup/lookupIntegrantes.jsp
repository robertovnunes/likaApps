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
<f:subview id="lookupIntegrantes">


	<div id="dialogNomeSubprojeto" title="Nome do Subprojeto"><h:form
		styleClass="niceform">

		<h:inputTextarea id="subprojeto" style="width:570px; height:50px;"
			value="#{projetoHandler.nomeSubProjeto}"
			onkeyup="this.value = this.value.substring(0, 200);" />

		<br />
		<div align="center"><h:panelGrid columns="2">





			<a4j:commandLink
				onclick="jQuery('#dialogNomeSubprojeto').dialog('close')">
				<h:graphicImage value="../css/images/cancelar.png" />
			</a4j:commandLink>


			<a4j:commandLink id="botaoSubprojeto"
				onclick="jQuery('#dialogNomeSubprojeto').dialog('close')"
				action="#{projetoHandler.adicionarIntegrantes}"
				reRender="panelIntegrantes">
				<h:graphicImage value="../css/images/adicionar.png" />
			</a4j:commandLink>



		</h:panelGrid></div>
	</h:form></div>


	<!-- ui-dialog -->
	<div id="dialogIntegrantes" title="Associar Integrante ao Projeto"><h:form
		styleClass="niceform">
		<div align="center" style="margin-bottom: 15px; margin-top: 15px;">

		<h:panelGroup>

			<h:inputText id="buscarNomePessoa" style="width: 400px"
				value="#{pessoaHandler.parametroConsulta}" />

			<a4j:commandButton id="botaoBuscarPessoa" value="Buscar"
				reRender="novoIntegrante" action="#{pessoaHandler.consultar}"
				onclick="this.disabled=true" oncomplete="this.disabled=false">
			</a4j:commandButton>
		</h:panelGroup> <a4j:outputPanel id="novoIntegrante">

			<h:panelGroup rendered="#{empty pessoaHandler.pessoas}">
				<div id="nenhum" align="center" style="color: red;"><h:outputText
					value="Nenhum Integrante econtrado. " /></div>
			</h:panelGroup>


			<rich:dataTable id="tabelaResultado" value="#{pessoaHandler.pessoas}"
				var="pessoa" cellpadding="2" cellspacing="2"
				style="width:580px; margin-top:15px;" rows="5" styleClass="mytable"
				rendered="#{!empty pessoaHandler.pessoas }">
				<rich:column id="nome">
					<f:facet name="header">
						<h:outputText value="Nome"></h:outputText>
					</f:facet>
					<div style="width: 450px"><h:outputText
						value="#{pessoa.nome}"></h:outputText></div>
				</rich:column>


				<rich:column id="opcoes">
					<f:facet name="header">
						<h:outputText value="Opções"></h:outputText>
					</f:facet>
					<div style="width: 60px" align="center"><a4j:commandLink
						ajaxSingle="true"
						onclick="jQuery('#dialogIntegrantes').dialog('close') "
						oncomplete="jQuery('#dialogNomeSubprojeto').dialog('open')"
						value="Selecionar" action="#{projetoHandler.adicionarIntegrante}"
						reRender="subprojeto">
						<f:setPropertyActionListener value="#{pessoa}"
							target="#{projetoHandler.pessoaAdicionada}" />
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
							<h:outputText value="Última" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="last_disabled">
							<h:outputText value="Última" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="previous">
							<h:outputText value="Anterior" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="previous_disabled">
							<h:outputText value="Anterior" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="next">
							<h:outputText value="Próxima" styleClass="scrollerCell" />
						</f:facet>
						<f:facet name="next_disabled">
							<h:outputText value="Próxima" styleClass="scrollerCell" />
						</f:facet>


					</rich:datascroller>
				</f:facet>

			</rich:dataTable>


		</a4j:outputPanel></div>
		<div align="center" style="margin-top: 10px"><h:panelGrid
			columns="2">

			<a4j:commandLink
				onclick="jQuery('#dialogIntegrantes').dialog('close')">
				<h:graphicImage value="../css/images/cancelar.png" />
			</a4j:commandLink>



		</h:panelGrid></div>
	</h:form></div>
</f:subview>
</body>
</html>

