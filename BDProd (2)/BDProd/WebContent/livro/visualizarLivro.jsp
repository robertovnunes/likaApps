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
<f:subview id="visualizarLivro">



	<fieldset><legend>Informações Gerais</legend>
	<div id="conteudoForm"><h:panelGrid columns="1">
		<h:panelGrid columns="1">
			<h:panelGroup>
				<h:outputText value="Titulo:" />
				<br />
				<h:outputText id="nome"
					value="#{publicacaoHandler.publicacaoAtual.titulo}"
					styleClass="visualizar_texto" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{publicacaoHandler.publicacaoAtual.titulo == ''}" />
			</h:panelGroup>
		</h:panelGrid>
		<h:panelGrid columns="7">
			<h:panelGroup>
				<h:outputText value="DOI:" />
				<br />
				<h:outputText value="#{publicacaoHandler.publicacaoAtual.DOI}"
					styleClass="visualizar_texto" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{publicacaoHandler.publicacaoAtual.DOI == ''}" />



			</h:panelGroup>

			<rich:spacer width="50" />

			<h:panelGroup>
				<h:outputText value="Número de Volume:" />
				<br />

				<h:outputText value="#{publicacaoHandler.publicacaoAtual.volume}"
					styleClass="visualizar_texto" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{publicacaoHandler.publicacaoAtual.volume == ''}" />



			</h:panelGroup>

			<rich:spacer width="20" />

			<h:panelGroup>
				<h:outputText value="Número de Páginas" />
				<br />
				<h:outputText
					value="#{publicacaoHandler.publicacaoAtual.paginaInicial}"
					styleClass="visualizar_texto" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{publicacaoHandler.publicacaoAtual.paginaInicial == ''}" />


			</h:panelGroup>


		</h:panelGrid>

		<h:panelGrid columns="4">
			<h:panelGroup>
				<h:outputText value="Projeto:" />
				<br />
				<h:outputText
					value="#{publicacaoHandler.publicacaoAtual.projeto.nome}"
					styleClass="visualizar_texto"
					rendered="#{publicacaoHandler.publicacaoAtual.projeto != null}" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{publicacaoHandler.publicacaoAtual.projeto == null}" />

			</h:panelGroup>




		</h:panelGrid>

		<h:panelGrid columns="7">
			<h:panelGroup>
				<h:outputText value="Idioma:" />
				<br />

				<h:outputText value="#{publicacaoHandler.publicacaoAtual.pais}"
					styleClass="visualizar_texto" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{publicacaoHandler.publicacaoAtual.pais == ''}" />



			</h:panelGroup>

			<rich:spacer width="20" />

			<h:panelGroup>
				<h:outputText value="Ano Publicaçao:" />
				<br />

				<h:outputText
					value="#{publicacaoHandler.publicacaoAtual.anoPublicacao}"
					styleClass="visualizar_texto" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{publicacaoHandler.publicacaoAtual.anoPublicacao == ''}" />



			</h:panelGroup>

			<rich:spacer width="20" />

			<h:panelGroup>
				<h:outputText value="Série:" />
				<br />

				<h:outputText value="#{publicacaoHandler.publicacaoAtual.serie}"
					styleClass="visualizar_texto" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{publicacaoHandler.publicacaoAtual.serie == ''}" />




			</h:panelGroup>

			<h:panelGroup>
				<h:outputText value="ISBN:" />
				<br />

				<h:outputText value="#{publicacaoHandler.publicacaoAtual.ISBN}"
					styleClass="visualizar_texto" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{publicacaoHandler.publicacaoAtual.ISBN == ''}" />



			</h:panelGroup>



		</h:panelGrid>

		<h:panelGrid columns="1">
			<h:panelGroup>
				<h:outputText value="Link da Publicação:" />
				<br />

				<h:outputText
					value="#{publicacaoHandler.publicacaoAtual.linkPublicacao}"
					styleClass="visualizar_texto" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{publicacaoHandler.publicacaoAtual.linkPublicacao == ''}" />



			</h:panelGroup>


			<h:panelGroup>
				<h:outputText value="País:" />
				<br />

				<h:outputText
					value="#{publicacaoHandler.publicacaoAtual.localConferencia}"
					styleClass="visualizar_texto" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{publicacaoHandler.publicacaoAtual.localConferencia == ''}" />



			</h:panelGroup>


		</h:panelGrid>



		<h:panelGrid columns="3">

			<h:panelGroup>
				<h:outputText value="Nome da Editora:" />
				<br />

				<h:outputText
					value="#{publicacaoHandler.publicacaoAtual.nomeEditora}"
					styleClass="visualizar_texto" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{publicacaoHandler.publicacaoAtual.nomeEditora == ''}" />




			</h:panelGroup>

			<rich:spacer width="20" />

			<h:panelGroup>
				<h:outputText value="Cidade da Editora:" />
				<br />

				<h:outputText
					value="#{publicacaoHandler.publicacaoAtual.cidadeEditora}"
					styleClass="visualizar_texto" />

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{publicacaoHandler.publicacaoAtual.cidadeEditora == ''}" />




			</h:panelGroup>

		</h:panelGrid>

	</h:panelGrid></div>
	</fieldset>

	<fieldset><legend>Autores</legend> <h:panelGroup
		id="autores">

		<h:panelGroup
			rendered="#{!empty publicacaoHandler.publicacaoAtual.autores}">

			<div id="lista_Visualizar"><rich:dataTable var="autor"
				rows="10" id="tabelaAutor" style="margin-left: 10px;"
				value="#{publicacaoHandler.publicacaoAtual.autores}"
				styleClass="tabelaSemLinha" width="900px;">

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Nome"></h:outputText>
					</f:facet>
					<div style="width: 400px;"><h:outputText
						value="#{autor.nome}" /></div>
				</rich:column>


				<rich:column>
					<f:facet name="header">
						<h:outputText value="Nome na Publicação"></h:outputText>
					</f:facet>
					<div style="width: 250px;"><h:outputText
						value="#{autor.nomePublicacao}" /></div>
				</rich:column>




			</rich:dataTable></div>

			<rich:datascroller id="dsAutor" fastControls="hide" for="tabelaAutor"
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
			rendered="#{empty publicacaoHandler.publicacaoAtual.autores}">
			<ul style="padding-left: 38px;">
				<li><h:outputText style="color:red"
					value="Nenhum Autor associado à Publicação" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup></fieldset>


</f:subview>
</body>
</html>

