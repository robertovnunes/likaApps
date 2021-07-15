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
				<li><h:commandLink value="Nova Função"
					action="#{sessionHandler.navigation.novoFuncao}"
					actionListener="#{adminHandler.novoFuncao}" /></li>

			</ul>
			</li>
		</ul>
		</div>

		<div id="content"><a4j:region id="regiao">

			<div align="center" style="margin-bottom: 20px; margin-top: 30px;">
			<h:panelGroup id="campo">


				<h:inputText id="textBuscaNome" style="width: 400px"
					value="#{adminHandler.nomeFuncao}" />



				<a4j:commandButton id="botaoBuscar" value="Buscar"
					action="#{adminHandler.listarFuncoes}" reRender="panel"
					onclick="this.disabled=true" oncomplete="this.disabled=false" />


			</h:panelGroup> <h:selectOneRadio value="Nome">
				<f:selectItem itemValue="Nome" itemLabel="Nome" />
			</h:selectOneRadio></div>

			<a4j:outputPanel id="panel">

				<h:panelGroup rendered="#{empty adminHandler.funcoes }">
					<div id="nenhum" align="center" style="color: red;"><h:outputText
						value="Nenhuma Função econtrada. " /></div>
				</h:panelGroup>

				<div align="center"><a4j:status for="regiao">
					<f:facet name="start">
						<h:graphicImage value="../css/images/carregando.gif" />
					</f:facet>
				</a4j:status></div>




				<h:panelGroup rendered="#{not empty adminHandler.funcoes }">
					<div class="titulo" style="margin-left: 15px; margin-bottom: 15px">
					<h:outputText value="Funções" /></div>

					<div style="margin-left: 10px;"><rich:dataTable
						id="tabelaResultado" value="#{adminHandler.funcoes}" var="funcao"
						cellpadding="2" cellspacing="2" style="width:600px" rows="10"
						styleClass="mytable">
						<rich:column id="nome">
							<f:facet name="header">
								<h:outputText value="Nome"></h:outputText>
							</f:facet>
							<div style="width: 420px"><h:outputText
								value="#{funcao.nome}"></h:outputText></div>
						</rich:column>

						<rich:column id="opcoes">
							<f:facet name="header">
								<h:outputText value="Opções"></h:outputText>
							</f:facet>
							<h:commandLink
								action="#{sessionHandler.navigation.visualizarFuncao}"
								actionListener="#{adminHandler.carregarFuncao}">
								<f:attribute name="idFuncao" value="#{funcao.idFuncao}" />
								<h:graphicImage value="../images/editar4.png"
									style="border:none;" title="Editar Função" alt="Editar Função"
									width="17" height="17"></h:graphicImage>


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
