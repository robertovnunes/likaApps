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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
.rich-datascr {
	border: 1;
}

.rich-table-cell {
	
}

.rich-table-sortable-header {
	font-weight: bold;
}

td.rich-datascr-button {
	background-color: #fff;
	border-top: 1px;
	border-top-style: solid;
	text-decoration: none;
	border: 0px solid #ccc;
}

td.rich-datascr-button-dsbld {
	background-color: #fff;
}

.rich-datascr-ctrls-separator {
	padding-right: 5px;
}

.rich-dtascroller-table {
	background: #fff;
	border: 0;
}

.scroller {
	display: block;
	background-color: #fff;
	border: 1px solid #ccc;
	padding: 3px 3px;
	margin: 0px 5px 5px 5px;
	text-decoration: none;
}

.scroller:hover {
	background-color: #eee;
	text-decoration: underline;
}

td.rich-datascr-button-dsbld .scroller {
	background-color: #eee;
}

td.rich-datascr-inact {
	color: #000;
	border: 0;
}

td.rich-datascr-inact:hover {
	text-decoration: underline;
}

td.rich-datascr-act {
	text-decoration: underline;
}

td.rich-datascr-act {
	border: 0;
	font-weight: bold;
}
</style>

</head>
<body>
<f:subview id="visualizarGrupo">



	<fieldset><legend>Informações Gerais</legend>
	<div id="conteudoForm"><h:panelGroup>

		<h:panelGrid columns="1">
			<h:panelGroup>
				<h:outputText value="Nome:" />
				<br />

				<h:outputText value="#{grupoHandler.grupoAtual.nome}"
					styleClass="visualizar_texto" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{grupoHandler.grupoAtual.nome == ''}" />


			</h:panelGroup>
		</h:panelGrid>

		<h:panelGrid columns="5">
			<h:panelGroup>
				<h:outputText value="Grupo do CNPQ:" />
				<br />


				<h:outputText value="Sim" styleClass="visualizar_texto"
					rendered="#{grupoHandler.grupoAtual.grupoCnpq}" />

				<h:outputText value="Não" styleClass="visualizar_texto"
					rendered="#{!grupoHandler.grupoAtual.grupoCnpq}" />

			</h:panelGroup>

			<rich:spacer width="20"></rich:spacer>

			<h:panelGroup>
				<h:outputText value="Situação:" />
				<br />

				<h:outputText value="#{grupoHandler.grupoAtual.situacao}"
					styleClass="visualizar_texto" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{grupoHandler.grupoAtual.situacao == ''}" />


			</h:panelGroup>

			<rich:spacer width="20"></rich:spacer>

			<h:panelGroup>
				<h:outputText value="Data Desligamento:" />
				<br />

				<h:outputText value="#{grupoHandler.grupoAtual.dataEncerramento}"
					styleClass="visualizar_texto"
					rendered="#{grupoHandler.grupoAtual.dataEncerramento != null}">
					<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
				</h:outputText>

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{grupoHandler.grupoAtual.dataEncerramento == null}" />


			</h:panelGroup>
		</h:panelGrid>

		<h:panelGrid columns="1">

			<h:panelGroup id="panelResponsavel">
				<h:outputLabel value="Responsável:" />
				<br />

				<h:outputText id="resp"
					value="#{grupoHandler.grupoAtual.responsavel.nome}"
					rendered="#{grupoHandler.grupoAtual.responsavel != null}"
					styleClass="visualizar_texto" />

				<h:outputText styleClass="nao_informado"
					value="Nenhum Responsável associado."
					rendered="#{grupoHandler.grupoAtual.responsavel == null}" />





			</h:panelGroup>

		</h:panelGrid>



		<h:panelGrid columns="1">
			<h:panelGroup>
				<h:outputText value="Email:" />
				<br />
				<h:outputText value="#{grupoHandler.grupoAtual.email}"
					styleClass="visualizar_texto" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{grupoHandler.grupoAtual.email == ''}" />



			</h:panelGroup>






			<h:panelGroup>
				<h:outputText value="Site:" />
				<br />

				<h:outputText value="#{grupoHandler.grupoAtual.url}"
					styleClass="visualizar_texto" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{grupoHandler.grupoAtual.url == ''}" />


			</h:panelGroup>





			<h:panelGroup>
				<h:outputText value="Objetivo:" />
				<br />

				<h:outputText value="#{grupoHandler.grupoAtual.objetivo}"
					styleClass="visualizar_texto" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{grupoHandler.grupoAtual.objetivo == ''}" />


			</h:panelGroup>

			<h:panelGroup>
				<h:outputText value="Descrição:" />
				<br />

				<h:outputText value="#{grupoHandler.grupoAtual.descricao}"
					styleClass="visualizar_texto" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{grupoHandler.grupoAtual.descricao == ''}" />

			</h:panelGroup>


		</h:panelGrid>

	</h:panelGroup></div>
	</fieldset>

	<fieldset><legend>Integrantes</legend> <h:panelGroup
		id="integrantes">

		<h:panelGroup rendered="#{!empty grupoHandler.grupoAtual.integrantes}">

			<div id="lista_Visualizar"><rich:dataTable var="integrante"
				id="tabelaIntegrante" style="margin-left: 10px;" rows="10"
				value="#{grupoHandler.grupoAtual.integrantes}"
				styleClass="tabelaSemLinha" width="900px;">

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Nome"></h:outputText>
					</f:facet>
					<div style="width: 400px;"><h:outputText
						value="#{integrante.nome}" /></div>
				</rich:column>





			</rich:dataTable></div>

			<rich:datascroller id="dsIntegrante" fastControls="hide"
				for="tabelaIntegrante" renderIfSinglePage="false">

				<f:facet name="first">
					<h:outputText value="" styleClass="scrollerCell" />
				</f:facet>
				<f:facet name="first_disabled">
					<h:outputText value="" styleClass="scrollerCell" />
				</f:facet>
				<f:facet name="last">
					<h:outputText value="" styleClass="scrollerCell" />
				</f:facet>
				<f:facet name="last_disabled">
					<h:outputText value="" styleClass="scrollerCell" />
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


		</h:panelGroup>

		<h:panelGroup rendered="#{empty grupoHandler.grupoAtual.integrantes}">
			<ul style="padding-left: 38px;">
				<li><h:outputText style="color:red"
					value="Nenhum Integrante associado ao Grupo de Pesquisa" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup></fieldset>


	<fieldset><legend>Áreas de Pesquisas</legend> <h:panelGroup
		id="areas">


		<h:panelGroup
			rendered="#{!empty grupoHandler.grupoAtual.areasPesquisa}">

			<div id="lista_Visualizar"><rich:dataTable var="area"
				id="tabelaArea" style="margin-left: 10px;" rows="10"
				value="#{grupoHandler.grupoAtual.areasPesquisa}"
				styleClass="tabelaSemLinha" width="900px;">

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Nome"></h:outputText>
					</f:facet>
					<div style="width: 400px;"><h:outputText value="#{area.nome}" /></div>
				</rich:column>





			</rich:dataTable></div>

			<rich:datascroller id="dsArea" fastControls="hide" for="tabelaArea"
				renderIfSinglePage="false">

				<f:facet name="first">
					<h:outputText value="" styleClass="scrollerCell" />
				</f:facet>
				<f:facet name="first_disabled">
					<h:outputText value="" styleClass="scrollerCell" />
				</f:facet>
				<f:facet name="last">
					<h:outputText value="" styleClass="scrollerCell" />
				</f:facet>
				<f:facet name="last_disabled">
					<h:outputText value="" styleClass="scrollerCell" />
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


		</h:panelGroup>

		<h:panelGroup
			rendered="#{empty grupoHandler.grupoAtual.areasPesquisa}">
			<ul style="padding-left: 38px;">
				<li><h:outputText style="color:red"
					value="Nenhuma Área de Pesquisa associada ao Grupo de Pesquisa" /></li>
			</ul>
		</h:panelGroup>


	</h:panelGroup></fieldset>

	<fieldset><legend>Projetos</legend> <h:panelGroup
		id="projetos">
		<h:panelGroup rendered="#{!empty grupoHandler.grupoAtual.projetos}">

			<div id="lista_Visualizar"><rich:dataTable var="projeto"
				id="tabelaProjeto" style="margin-left: 10px;" rows="10"
				value="#{grupoHandler.grupoAtual.projetos}"
				styleClass="tabelaSemLinha" width="900px;">

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Nome"></h:outputText>
					</f:facet>
					<div style="width: 400px;"><h:outputText
						value="#{projeto.nome}" /></div>
				</rich:column>




			</rich:dataTable></div>

			<rich:datascroller id="dsProjetos" fastControls="hide"
				for="tabelaProjeto" renderIfSinglePage="false">

				<f:facet name="first">
					<h:outputText value="" styleClass="scrollerCell" />
				</f:facet>
				<f:facet name="first_disabled">
					<h:outputText value="" styleClass="scrollerCell" />
				</f:facet>
				<f:facet name="last">
					<h:outputText value="" styleClass="scrollerCell" />
				</f:facet>
				<f:facet name="last_disabled">
					<h:outputText value="" styleClass="scrollerCell" />
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


		</h:panelGroup>

		<h:panelGroup rendered="#{empty grupoHandler.grupoAtual.projetos}">
			<ul style="padding-left: 38px;">
				<li><h:outputText style="color:red"
					value="Nenhum Projeto associado ao Grupo de Pesquisa" /></li>
			</ul>
		</h:panelGroup>


	</h:panelGroup></fieldset>


</f:subview>
</body>
</html>

