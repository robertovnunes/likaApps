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

<style type="text/css">
.rich-tab-inactive {
	cursor: pointer;
}

.rich-tabpanel-content {
	background-color: #F2F5F7;
	border-color: #C1DAD7;
}
</style>

</head>
<body>
<f:subview id="lookupNovaPublicacao">


	<div id="dialogTipoPublicacao" title="Tipo da Publicação"><h:form
		styleClass="niceform">

		<br />
		<br />
		<div align="center"><h:outputLabel value="Tipo da Publicação:"></h:outputLabel>
		<br />
		<h:selectOneMenu value="#{projetoHandler.tipoPublicacao}">
			<f:selectItem itemValue="Periódico"
				itemLabel="Artigo Publicado em Periódico" />
			<f:selectItem itemValue="Anais de Eventos"
				itemLabel="Trabalho Publicado em Anais de Eventos" />
			<f:selectItem itemValue="Livro" itemLabel="Livro" />

		</h:selectOneMenu> <br />
		<br />
		<br />
		<h:panelGrid columns="2">

			<a4j:commandLink
				onclick="jQuery('#dialogTipoPublicacao').dialog('close')">
				<h:graphicImage value="../css/images/cancelar.png" />
			</a4j:commandLink>


			<a4j:commandLink
				onclick="jQuery('#dialogTipoPublicacao').dialog('close') "
				oncomplete="jQuery('#dialogNovaPublicacao').dialog('open')"
				action="#{projetoHandler.novaPublicacao}" reRender="panel">
				<h:graphicImage value="../css/images/adicionar.png" />
			</a4j:commandLink>



		</h:panelGrid></div>
	</h:form></div>



	<!-- ui-dialog -->
	<div id="dialogNovaPublicacao" title="Nova Publicação"><h:form
		styleClass="niceform">
		<h:panelGroup id="panel">

			<rich:tabPanel switchType="client" style="margin-top:10px"
				headerClass="cabecalho">
				<rich:tab id="geralTab" label="Informações Gerais">

					<h:panelGroup
						rendered="#{projetoHandler.tipoPublicacao == 'Periódico'}">

						<h:panelGrid columns="1">
							<h:panelGroup>
								<h:outputText value="Titulo:" />
								<br />
								<h:inputText size="150" maxlength="250"
									value="#{projetoHandler.novaPublicacao.titulo}"></h:inputText>
							</h:panelGroup>
						</h:panelGrid>
						<h:panelGrid columns="4">
							<h:panelGroup>
								<h:outputText value="DOI:" />
								<br />
								<h:inputText size="80" maxlength="150"
									value="#{projetoHandler.novaPublicacao.DOI}"></h:inputText>

							</h:panelGroup>

							<rich:spacer width="20" />

							<h:panelGroup>
								<h:outputText value="Volume:" />
								<br />
								<h:inputText size="10"
									value="#{projetoHandler.novaPublicacao.volume}"></h:inputText>


							</h:panelGroup>


							<h:panelGroup>
								<h:outputText value="Série:" />
								<br />
								<h:inputText size="10"
									value="#{projetoHandler.novaPublicacao.serie}"></h:inputText>

							</h:panelGroup>

						</h:panelGrid>

						<h:panelGrid columns="4">
							<h:panelGroup>
								<h:outputText value="Projeto:" />
								<br />
								<h:inputText size="80"
									value="#{projetoHandler.novaPublicacao.projeto.nome}"
									disabled="true"></h:inputText>

							</h:panelGroup>

							<rich:spacer width="20" />

							<h:panelGroup>
								<h:outputText value="Página Inicial:" />
								<br />
								<h:inputText size="10"
									value="#{projetoHandler.novaPublicacao.paginaInicial}"></h:inputText>

							</h:panelGroup>

							<h:panelGroup>
								<h:outputText value="Página Final:" />
								<br />
								<h:inputText size="10"
									value="#{projetoHandler.novaPublicacao.paginaFinal}"></h:inputText>

							</h:panelGroup>


						</h:panelGrid>

						<h:panelGrid columns="5">
							<h:panelGroup>
								<h:outputText value="Idioma:" />
								<br />
								<h:inputText size="25"
									value="#{projetoHandler.novaPublicacao.pais}" />

							</h:panelGroup>

							<rich:spacer width="20" />

							<h:panelGroup>
								<h:outputText value="Ano Publicaçao:" />
								<br />
								<h:inputText size="10"
									value="#{projetoHandler.novaPublicacao.anoPublicacao}"
									maxlength="4" onkeypress="mascara(this,soNumeros)" />
							</h:panelGroup>


							<rich:spacer width="190" />

							<h:panelGroup>
								<h:outputText value="ISSN:" />
								<br />
								<h:inputText size="12"
									value="#{projetoHandler.novaPublicacao.ISSN}" />

							</h:panelGroup>



						</h:panelGrid>

						<h:panelGrid columns="1">
							<h:panelGroup>
								<h:outputText value="Link da Publicação:" />
								<br />
								<h:inputText size="80" maxlength="150"
									value="#{projetoHandler.novaPublicacao.linkPublicacao}" />

							</h:panelGroup>


							<h:panelGroup>
								<h:outputText value="Períodico:" />
								<br />
								<h:inputText size="80"
									value="#{projetoHandler.novaPublicacao.periodico}" />

							</h:panelGroup>


						</h:panelGrid>
					</h:panelGroup>



					<!--  Anais de Eventos -->

					<h:panelGroup
						rendered="#{projetoHandler.tipoPublicacao == 'Anais de Eventos'}">

						<h:panelGrid columns="1">
							<h:panelGroup>
								<h:outputText value="Titulo:" />
								<br />
								<h:inputText size="150" maxlength="250"
									value="#{projetoHandler.novaPublicacao.titulo}"></h:inputText>
							</h:panelGroup>
						</h:panelGrid>
						<h:panelGrid columns="4">
							<h:panelGroup>
								<h:outputText value="DOI:" />
								<br />
								<h:inputText size="80" maxlength="150"
									value="#{projetoHandler.novaPublicacao.DOI}"></h:inputText>

							</h:panelGroup>

							<rich:spacer width="20" />

							<h:panelGroup>
								<h:outputText value="Tipo:" />
								<br />
								<h:selectOneMenu value="#{projetoHandler.novaPublicacao.tipo}">
									<f:selectItem itemLabel="Internacional"
										itemValue="Internacional" />
									<f:selectItem itemLabel="Nacional" itemValue="Nacional" />
									<f:selectItem itemLabel="Regional" itemValue="Regional" />
									<f:selectItem itemLabel="Local" itemValue="Local" />
								</h:selectOneMenu>



							</h:panelGroup>


							<h:panelGroup>
								<h:outputText value="Natureza:" />
								<br />

								<h:selectOneMenu
									value="#{projetoHandler.novaPublicacao.natureza}">
									<f:selectItem itemLabel="Completo" itemValue="Completo" />
									<f:selectItem itemLabel="Resumo" itemValue="Resumo" />
									<f:selectItem itemLabel="Resumo Expandido"
										itemValue="Resumo Expandido" />

								</h:selectOneMenu>


							</h:panelGroup>

						</h:panelGrid>

						<h:panelGrid columns="4">
							<h:panelGroup>
								<h:outputText value="Projeto:" />
								<br />
								<h:inputText size="80"
									value="#{projetoHandler.novaPublicacao.projeto.nome}"
									disabled="true"></h:inputText>

							</h:panelGroup>

							<rich:spacer width="20" />


							<h:panelGroup>
								<h:outputText value="Volume:" />
								<br />
								<h:inputText size="10"
									value="#{projetoHandler.novaPublicacao.volume}"></h:inputText>


							</h:panelGroup>


							<h:panelGroup>
								<h:outputText value="Série:" />
								<br />
								<h:inputText size="10"
									value="#{projetoHandler.novaPublicacao.serie}"></h:inputText>

							</h:panelGroup>





						</h:panelGrid>

						<h:panelGrid columns="8">
							<h:panelGroup>
								<h:outputText value="Idioma:" />
								<br />
								<h:inputText size="25"
									value="#{projetoHandler.novaPublicacao.pais}" />

							</h:panelGroup>

							<rich:spacer width="10" />

							<h:panelGroup>
								<h:outputText value="Ano Publicaçao:" />
								<br />
								<h:inputText size="10"
									value="#{projetoHandler.novaPublicacao.anoPublicacao}"
									maxlength="4" onkeypress="mascara(this,soNumeros)" />
							</h:panelGroup>

							<rich:spacer width="10" />

							<h:panelGroup>
								<h:outputText value="País:" />
								<br />
								<h:inputText size="25"
									value="#{projetoHandler.novaPublicacao.localConferencia}" />

							</h:panelGroup>

							<rich:spacer width="40" />
							<h:panelGroup>
								<h:outputText value="Página Inicial:" />
								<br />
								<h:inputText size="10"
									value="#{projetoHandler.novaPublicacao.paginaInicial}"></h:inputText>

							</h:panelGroup>

							<h:panelGroup>
								<h:outputText value="Página Final:" />
								<br />
								<h:inputText size="10"
									value="#{projetoHandler.novaPublicacao.paginaFinal}"></h:inputText>

							</h:panelGroup>






						</h:panelGrid>

						<h:panelGrid columns="4">
							<h:panelGroup>
								<h:outputText value="Link da Publicação:" />
								<br />
								<h:inputText size="80" maxlength="150"
									value="#{projetoHandler.novaPublicacao.linkPublicacao}" />

							</h:panelGroup>

							<rich:spacer width="20" />


							<h:panelGroup>
								<h:outputText value="ISBN:" />
								<br />
								<h:inputText size="12"
									value="#{projetoHandler.novaPublicacao.ISBN}" />

							</h:panelGroup>


							<h:panelGroup>
								<h:outputText value="Fascículo:" />
								<br />
								<h:inputText size="12"
									value="#{projetoHandler.novaPublicacao.fasciculo}" />

							</h:panelGroup>

						</h:panelGrid>

						<h:panelGrid columns="1">

							<h:panelGroup>
								<h:outputText value="Nome do Evento:" />
								<br />
								<h:inputText size="40"
									value="#{projetoHandler.novaPublicacao.nomeEvento}" />

							</h:panelGroup>

							<h:panelGroup>
								<h:outputText value="Título dos Anais do Evento:" />
								<br />
								<h:inputText size="80"
									value="#{projetoHandler.novaPublicacao.tituloAnaisEvento}" />

							</h:panelGroup>

						</h:panelGrid>

						<h:panelGrid columns="3">

							<h:panelGroup>
								<h:outputText value="Cidade do Evento:" />
								<br />
								<h:inputText size="40"
									value="#{projetoHandler.novaPublicacao.cidadeEvento}" />

							</h:panelGroup>


							<h:panelGroup>
								<h:outputText value="Nome da Editora:" />
								<br />
								<h:inputText size="40"
									value="#{projetoHandler.novaPublicacao.nomeEditora}" />

							</h:panelGroup>

							<h:panelGroup>
								<h:outputText value="Cidade da Editora:" />
								<br />
								<h:inputText size="40"
									value="#{projetoHandler.novaPublicacao.cidadeEditora}" />

							</h:panelGroup>

						</h:panelGrid>


					</h:panelGroup>

					<!--  Livro -->

					<h:panelGroup
						rendered="#{projetoHandler.tipoPublicacao == 'Livro'}">

						<h:panelGrid columns="1">
							<h:panelGroup>
								<h:outputText value="Titulo:" />
								<br />
								<h:inputText size="150" maxlength="250"
									value="#{projetoHandler.novaPublicacao.titulo}"></h:inputText>
							</h:panelGroup>
						</h:panelGrid>
						<h:panelGrid columns="4">
							<h:panelGroup>
								<h:outputText value="DOI:" />
								<br />
								<h:inputText size="80" maxlength="150"
									value="#{projetoHandler.novaPublicacao.DOI}"></h:inputText>

							</h:panelGroup>

							<rich:spacer width="20" />

							<h:panelGroup>
								<h:outputText value="Número de Volume:" />
								<br />
								<h:inputText size="10"
									value="#{projetoHandler.novaPublicacao.volume}"></h:inputText>


							</h:panelGroup>


							<h:panelGroup>
								<h:outputText value="Número de Páginas" />
								<br />
								<h:inputText size="10"
									value="#{projetoHandler.novaPublicacao.paginaInicial}"></h:inputText>

							</h:panelGroup>

						</h:panelGrid>

						<h:panelGrid columns="4">
							<h:panelGroup>
								<h:outputText value="Projeto:" />
								<br />
								<h:inputText size="80"
									value="#{projetoHandler.novaPublicacao.projeto.nome}"
									disabled="true"></h:inputText>

							</h:panelGroup>

							<rich:spacer width="20" />

							<h:panelGroup>
								<h:outputText value="Série:" />
								<br />
								<h:inputText size="10"
									value="#{projetoHandler.novaPublicacao.serie}"></h:inputText>

							</h:panelGroup>

							<h:panelGroup>
								<h:outputText value="ISBN:" />
								<br />
								<h:inputText size="10"
									value="#{projetoHandler.novaPublicacao.ISBN}"></h:inputText>

							</h:panelGroup>


						</h:panelGrid>

						<h:panelGrid columns="5">
							<h:panelGroup>
								<h:outputText value="Idioma:" />
								<br />
								<h:inputText size="25"
									value="#{projetoHandler.novaPublicacao.pais}" />

							</h:panelGroup>

							<rich:spacer width="20" />

							<h:panelGroup>
								<h:outputText value="Ano Publicaçao:" />
								<br />
								<h:inputText size="10"
									value="#{projetoHandler.novaPublicacao.anoPublicacao}"
									maxlength="4" onkeypress="mascara(this,soNumeros)" />
							</h:panelGroup>





						</h:panelGrid>

						<h:panelGrid columns="1">
							<h:panelGroup>
								<h:outputText value="Link da Publicação:" />
								<br />
								<h:inputText size="80" maxlength="150"
									value="#{projetoHandler.novaPublicacao.linkPublicacao}" />

							</h:panelGroup>


							<h:panelGroup>
								<h:outputText value="País:" />
								<br />
								<h:inputText size="80"
									value="#{projetoHandler.novaPublicacao.localConferencia}" />

							</h:panelGroup>


						</h:panelGrid>



						<h:panelGrid columns="3">




							<h:panelGroup>
								<h:outputText value="Nome da Editora:" />
								<br />
								<h:inputText size="40"
									value="#{projetoHandler.novaPublicacao.nomeEditora}" />

							</h:panelGroup>

							<h:panelGroup>
								<h:outputText value="Cidade da Editora:" />
								<br />
								<h:inputText size="40"
									value="#{projetoHandler.novaPublicacao.cidadeEditora}" />

							</h:panelGroup>

						</h:panelGrid>

					</h:panelGroup>


				</rich:tab>

				<rich:tab id="autoresTab" label="Autores">

					<h:panelGroup id="autores">

						<h:panelGroup
							rendered="#{!empty projetoHandler.novaPublicacao.autores}">

							<div id="lista"><rich:dataTable var="autor"
								style="margin-left: 10px;"
								value="#{projetoHandler.novaPublicacao.autores}"
								styleClass="tabelaSemLinhaAzul" width="700px;">

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

								<rich:column>
									<div style="width: 50px;" align="right""><a4j:commandLink
										ajaxSingle="true"
										actionListener="#{projetoHandler.removerAutorDoLIKAPublicacao}"
										reRender="autores">
										<h:graphicImage value="../images/cancel2.jpg"
											title="Remover Autor" alt="Remover Autor" width="15"
											height="15"></h:graphicImage>
										<f:attribute name="autor" value="#{autor}" />
									</a4j:commandLink></div>
								</rich:column>


							</rich:dataTable></div>
						</h:panelGroup>

						<h:panelGroup
							rendered="#{empty projetoHandler.novaPublicacao.autores}"
							style="margin-bottom:50px;">
							<div id="nenhum" align="center" style="color: red;"><h:outputText
								value="Nenhum Autor adicionado. " /></div>
						</h:panelGroup>

					</h:panelGroup>




					<div align="right"><a4j:commandLink
						onclick="jQuery('#dialogTipoAutor').dialog('open')">
						<h:graphicImage value="../css/images/adicionar.png" />
					</a4j:commandLink></div>
				</rich:tab>

			</rich:tabPanel>
		</h:panelGroup>


		<div align="center" style="margin-top: 10px"><h:panelGrid
			columns="2">


			<a4j:commandLink
				onclick="jQuery('#dialogNovaPublicacao').dialog('close')">
				<h:graphicImage value="../css/images/cancelar.png" />
			</a4j:commandLink>

			<a4j:commandLink
				onclick="jQuery('#dialogNovaPublicacao').dialog('close')"
				action="#{projetoHandler.adicionarPublicacao}"
				oncomplete="#{rich:component('dsPub')}.last()"
				reRender="panelPublicacoes">
				<h:graphicImage value="../css/images/finalizar.png" />
			</a4j:commandLink>


		</h:panelGrid></div>




	</h:form></div>
</f:subview>
</body>
</html>

