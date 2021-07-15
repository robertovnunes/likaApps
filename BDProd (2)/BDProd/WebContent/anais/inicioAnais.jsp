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

<f:view>
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<link href="../css/styleMenus.css" rel="stylesheet" type="text/css" />
	<link href="../css/tabela.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/mascaras.js"></script>

	<title>BD-Prod</title>
	</head>
	<body>
	<div id="wrapper"><f:subview id="menuPrincipal">
		<jsp:include page="../menuPrincipal.jsp"></jsp:include>
	</f:subview> <!-- start header --> <!-- end header --> <!-- start page -->
	<div id="page"><h:form>





		<div id="sidebar1" class="sidebar">
		<ul>
			<li>
			<h2>Opções</h2>
			<ul>
				<li><h:commandLink value="Novo Anais de Eventos"
					action="#{sessionHandler.navigation.novoAnais}"
					actionListener="#{publicacaoHandler.novaPublicacao}">
					<f:attribute name="tipoPublicacao" value="Anais de Eventos" />
				</h:commandLink></li>
			</ul>
			</li>
		</ul>
		</div>

		<div id="content"><a4j:region id="regiao">
			<div id="panelConfirmacao" align="center"><h:messages
				id="confirmacao" errorClass="erroConfirmacao"
				infoClass="sucessoConfirmacao" layout="table" showSummary="true"
				showDetail="false" globalOnly="true"></h:messages></div>

			<div align="center" style="margin-bottom: 20px; margin-top: 30px;">
			<h:panelGroup id="campo">

				<h:inputText id="textBuscaNome" style="width: 400px"
					value="#{publicacaoHandler.parametroPesquisa}" />


				<a4j:commandButton id="botaoBuscar" value="Buscar"
					action="#{publicacaoHandler.consultar}" reRender="panel"
					onclick="this.disabled=true" oncomplete="this.disabled=false" />


			</h:panelGroup> <h:selectOneRadio value="#{publicacaoHandler.tipoSelecionado}">
				<f:selectItems value="#{publicacaoHandler.tiposDePesquisas}" />
				<a4j:support reRender="campo" event="onclick"
					action="#{publicacaoHandler.limparConsulta}" ajaxSingle="true" />
			</h:selectOneRadio></div>

			<a4j:outputPanel id="panel">

				<h:panelGroup rendered="#{empty publicacaoHandler.publicacoes }">
					<div id="nenhum" align="center" style="color: red;"><h:outputText
						value="Nenhum Anais de Eventos econtrado. " /></div>
				</h:panelGroup>

				<div align="center"><a4j:status for="regiao">
					<f:facet name="start">
						<h:graphicImage value="../css/images/carregando.gif" />
					</f:facet>
				</a4j:status></div>



				<h:panelGroup rendered="#{not empty publicacaoHandler.publicacoes }">
					<div class="titulo" style="margin-left: 15px; margin-bottom: 15px">
					<h:outputText value="Anais de Eventos" /></div>

					<div style="margin-left: 10px;"><rich:dataTable
						id="tabelaResultado" value="#{publicacaoHandler.publicacoes}"
						var="publicacao" cellpadding="2" cellspacing="2"
						style="width:600px" rows="10" styleClass="mytable">
						<rich:column id="nome">
							<f:facet name="header">
								<h:outputText value="Título"></h:outputText>
							</f:facet>
							<div style="width: 550px"><h:outputText
								value="#{publicacao.titulo}"></h:outputText></div>
						</rich:column>

						<rich:column id="tipo">
							<f:facet name="header">
								<h:outputText value="Tipo"></h:outputText>
							</f:facet>
							<div style="width: 50px"><h:outputText
								value="#{publicacao.tipoPublicacao}"></h:outputText></div>
						</rich:column>


						<rich:column id="opcoes">
							<f:facet name="header">
								<h:outputText value="Opções"></h:outputText>
							</f:facet>
							<h:commandLink
								action="#{sessionHandler.navigation.visualizarAnais}"
								actionListener="#{publicacaoHandler.carregarPublicacao}">
								<f:attribute name="idPublicacao"
									value="#{publicacao.idPublicacao}" />
								<h:graphicImage value="../images/editar4.png"
									style="border:none;" title="Editar Publicação"
									alt="Editar Publicação" width="17" height="17"></h:graphicImage>

							</h:commandLink>
						</rich:column>

						<f:facet name="footer">
							<rich:datascroller fastControls="hide" status="b">

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

					</rich:dataTable></div>

				</h:panelGroup>

			</a4j:outputPanel>
		</a4j:region></div>
		<!-- end sidebars -->
		<div style="clear: both;">&nbsp;</div>

	</h:form></div>
	<!-- end page --></div>
	<div id="footer"></div>
	</body>
	</html>
</f:view>
