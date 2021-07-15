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
				<li><h:commandLink value="Novo Pesquisador"
					action="#{sessionHandler.navigation.novoPesquisador}"
					actionListener="#{pesquisadorHandler.novoPesquisador}" /></li>
			</ul>
			</li>
		</ul>
		</div>

		<div id="content"><a4j:region id="regiao">

			<h:panelGroup id="grupoInfo">
				<div id="panelConfirmacao" align="center"><h:messages
					id="confirmacao" errorClass="erroConfirmacao"
					infoClass="sucessoConfirmacao" layout="table" showSummary="true"
					showDetail="false" globalOnly="true"></h:messages></div>
			</h:panelGroup>

			<div align="center" style="margin-bottom: 20px; margin-top: 30px;">
			<h:panelGroup id="campo">
				<h:selectOneMenu value="#{pesquisadorHandler.parametroConsulta}"
					rendered="#{pesquisadorHandler.mostrarPesquisaSexo}">
					<f:selectItem itemValue="M" itemLabel="Masculino" />
					<f:selectItem itemValue="F" itemLabel="Feminino" />
				</h:selectOneMenu>

				<h:inputText id="textBuscaNome" style="width: 400px"
					value="#{pesquisadorHandler.parametroConsulta}"
					rendered="#{pesquisadorHandler.mostrarPesquisaNome}" />

				<h:inputText id="textBuscaCPF" style="width: 400px"
					value="#{pesquisadorHandler.parametroConsulta}"
					rendered="#{pesquisadorHandler.mostrarPesquisaCPF}"
					onkeypress="mascara(this,cpf)" maxlength="14" />

				<a4j:commandButton id="botaoBuscar" value="Buscar"
					action="#{pesquisadorHandler.consultar}"
					reRender="panel, grupoInfo" onclick="this.disabled=true"
					oncomplete="this.disabled=false">
				</a4j:commandButton>


			</h:panelGroup> <h:selectOneRadio value="#{pesquisadorHandler.tipoSelecionado}">
				<f:selectItems value="#{pesquisadorHandler.tiposDePesquisas}" />
				<a4j:support reRender="campo" event="onclick"
					action="#{pesquisadorHandler.limparConsulta}" ajaxSingle="true"
					status="a" />
			</h:selectOneRadio></div>

			<a4j:outputPanel id="panel">

				<h:panelGroup
					rendered="#{empty pesquisadorHandler.pesquisadoresListados }">
					<div id="nenhum" align="center" style="color: red;"><h:outputText
						value="Nenhum Pesquisador econtrado. " /></div>
				</h:panelGroup>
				<div align="center"><a4j:status for="regiao">
					<f:facet name="start">
						<h:graphicImage value="../css/images/carregando.gif"
							rendered="#{empty pesquisadorHandler.pesquisadoresListados}" />
					</f:facet>
				</a4j:status></div>

				<h:panelGroup
					rendered="#{not empty pesquisadorHandler.pesquisadoresListados }">
					<div class="titulo" style="margin-left: 15px; margin-bottom: 15px">
					<h:outputText value="Pesquisadores" /></div>

					<div style="margin-left: 10px;"><rich:dataTable
						id="tabelaResultado"
						value="#{pesquisadorHandler.pesquisadoresListados}" var="pesq"
						cellpadding="2" cellspacing="2" style="width:600px" rows="10"
						styleClass="mytable">
						<rich:column id="nome">
							<f:facet name="header">
								<h:outputText value="Nome"></h:outputText>
							</f:facet>
							<div style="width: 220px"><h:outputText
								value="#{pesq.nome}"></h:outputText></div>
						</rich:column>

						<rich:column id="cpf">
							<f:facet name="header">
								<h:outputText value="CPF"></h:outputText>
							</f:facet>
							<div style="width: 70px"><h:outputText value="#{pesq.CPF}"></h:outputText>
							</div>
						</rich:column>


						<rich:column id="opcoes">
							<f:facet name="header">
								<h:outputText value="Opções"></h:outputText>
							</f:facet>
							<h:panelGroup>

								<h:commandLink
									action="#{sessionHandler.navigation.visualizarPesquisador}"
									actionListener="#{pesquisadorHandler.carregarPesquisador}">
									<f:attribute name="idPesquisador" value="#{pesq.idPessoa}" />
									<h:graphicImage value="../images/editar4.png"
										style="border:none;" title="Editar Pesquisador"
										alt="Editar Pesquisador" width="17" height="17"></h:graphicImage>
								</h:commandLink>

								<h:commandLink actionListener="#{pesquisadorHandler.deletar}"
									onclick="if (!confirm('Tem certeza que deseja remover #{pesq.nome} ?')) return false"
									style="margin-left:5px;">
									<f:attribute name="pesq" value="#{pesq}" />

									<h:graphicImage value="../images/cancel2.jpg"
										style="border:none;" title="Remover Pesquisador"
										alt="Remover Pesquisador" width="16" height="16"></h:graphicImage>

								</h:commandLink>
							</h:panelGroup>
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
