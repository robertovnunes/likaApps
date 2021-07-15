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
<f:subview id="visualizarProjeto">



	<fieldset><legend>Informações Gerais</legend>
	<div id="conteudoForm"><h:panelGrid columns="1">
		<h:panelGroup>
			<h:outputLabel value="Nome:" for="nome" />
			<br />
			<h:outputText id="nome" value="#{projetoHandler.projetoAtual.nome}"
				styleClass="visualizar_texto" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{projetoHandler.projetoAtual.nome == ''}" />

		</h:panelGroup>


		<h:panelGrid columns="6">
			<h:panelGroup>
				<h:outputLabel value="Data início:" />
				<br />
				<h:outputText value="#{projetoHandler.projetoAtual.dataInicio}"
					styleClass="visualizar_texto"
					rendered="#{projetoHandler.projetoAtual.dataInicio != null}">
					<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
				</h:outputText>

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{projetoHandler.projetoAtual.dataInicio == null}" />

			</h:panelGroup>

			<rich:spacer width="10px;"></rich:spacer>

			<h:panelGroup>
				<h:outputLabel value="Data fim:" />
				<br />


				<h:outputText value="#{projetoHandler.projetoAtual.dataFim}"
					styleClass="visualizar_texto"
					rendered="#{projetoHandler.projetoAtual.dataInicio != null}">
					<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
				</h:outputText>

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{projetoHandler.projetoAtual.dataFim == null}" />
			</h:panelGroup>



			<h:panelGroup style="margin-left:73px;">
				<h:outputLabel value="Situação:" />
				<br />

				<h:outputText style="margin-left:73px;"
					value="#{projetoHandler.projetoAtual.situacaoAtual}"
					styleClass="visualizar_texto"
					rendered="#{projetoHandler.projetoAtual.situacaoAtual != ''}">
				</h:outputText>

				<h:outputText style="margin-left:73px;" value="Não informado"
					styleClass="nao_informado"
					rendered="#{projetoHandler.projetoAtual.situacaoAtual == ''}" />

			</h:panelGroup>

			<rich:spacer width="10px;"></rich:spacer>


			<h:panelGroup>
				<h:outputLabel value="Referência:" />
				<br />
				<h:outputText value="#{projetoHandler.projetoAtual.referencia}"
					styleClass="visualizar_texto"
					rendered="#{projetoHandler.projetoAtual.referencia != ''}">
				</h:outputText>

				<h:outputText value="Não informado" styleClass="nao_informado"
					rendered="#{projetoHandler.projetoAtual.referencia == ''}" />

			</h:panelGroup>
		</h:panelGrid>

		<h:panelGroup>
			<h:outputLabel value="Grupo de Pesquisa:" />
			<br />
			<h:outputText value="#{projetoHandler.projetoAtual.grupo.nome}"
				styleClass="visualizar_texto"
				rendered="#{projetoHandler.projetoAtual.grupo != null}">
			</h:outputText>

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{projetoHandler.projetoAtual.grupo == null}" />
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Descrição:" />
			<br />

			<h:outputText value="#{projetoHandler.projetoAtual.descricao}"
				styleClass="visualizar_texto"
				rendered="#{projetoHandler.projetoAtual.descricao != ''}">
			</h:outputText>

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{projetoHandler.projetoAtual.descricao == ''}" />

		</h:panelGroup>

		<br />
		<h:panelGrid columns="3" id="tipo">
			<h:panelGroup>
				<h:outputLabel value="Tipo:" style="margin-left:3px;" />
				<br />

				<h:outputText style="margin-left:5px;"
					value="#{projetoHandler.projetoAtual.tipo}"
					styleClass="visualizar_texto"
					rendered="#{projetoHandler.projetoAtual.tipo != ''}">
				</h:outputText>

				<h:outputText style="margin-left:5px;" value="Não informado"
					styleClass="nao_informado"
					rendered="#{projetoHandler.projetoAtual.tipo == ''}" />


				<h:panelGrid columns="2">
					<h:panelGroup>
						<h:outputLabel value="Valor LIKA (R$):" />
						<br />

						<h:outputText value="#{projetoHandler.projetoAtual.valor}"
							styleClass="visualizar_texto"
							rendered="#{projetoHandler.projetoAtual.valor != ''}">
						</h:outputText>

						<h:outputText value="Não informado" styleClass="nao_informado"
							rendered="#{projetoHandler.projetoAtual.valor == ''}" />


					</h:panelGroup>
					<h:panelGroup
						rendered="#{projetoHandler.projetoAtual.tipo == 'Externo'}">
						<h:outputLabel value="Valor Total (R$):" style="margin-left:50px;" />
						<br />

						<h:outputText style="margin-left:53px;"
							value="#{projetoHandler.projetoAtual.valorTotal}"
							styleClass="visualizar_texto"
							rendered="#{projetoHandler.projetoAtual.valorTotal != ''}">
						</h:outputText>

						<h:outputText style="margin-left:53px;" value="Não informado"
							styleClass="nao_informado"
							rendered="#{projetoHandler.projetoAtual.valorTotal == ''}" />



					</h:panelGroup>
				</h:panelGrid>
			</h:panelGroup>

			<rich:spacer width="100px;"></rich:spacer>
			<h:panelGrid columns="1">
				<h:panelGroup>
					<h:outputLabel value="Financiamento:" />
					<br />
					<h:outputText value="Sim" styleClass="visualizar_texto"
						rendered="#{projetoHandler.projetoAtual.financiamento}">
					</h:outputText>

					<h:outputText value="Não" styleClass="visualizar_texto"
						rendered="#{!projetoHandler.projetoAtual.financiamento}">
					</h:outputText>



				</h:panelGroup>
				<h:panelGroup
					rendered="#{projetoHandler.projetoAtual.financiamento}">
					<h:outputLabel value="Órgão Financiador:" />
					<br />
					<h:outputText
						value="#{projetoHandler.projetoAtual.orgaoFinanciador}"
						styleClass="visualizar_texto"
						rendered="#{projetoHandler.projetoAtual.orgaoFinanciador != ''}">
					</h:outputText>

					<h:outputText value="Não informado" styleClass="nao_informado"
						rendered="#{projetoHandler.projetoAtual.orgaoFinanciador == '' && projetoHandler.projetoAtual.financiamento}" />
				</h:panelGroup>

				<rich:spacer width="10px;" height="35px;"
					rendered="#{!projetoHandler.projetoAtual.financiamento}"></rich:spacer>

			</h:panelGrid>


		</h:panelGrid>

		<br />


		<h:panelGrid columns="3">
			<h:panelGroup>
				<h:outputLabel value="Gerente:" />
				<br />
				<h:outputText id="resp"
					value="#{projetoHandler.projetoAtual.gerente.nome}"
					rendered="#{projetoHandler.projetoAtual.gerente.nome != null}"
					styleClass="visualizar_texto" />

				<h:outputText styleClass="nao_informado"
					value="Nenhum Responsável associado."
					rendered="#{projetoHandler.projetoAtual.gerente == null}" />

			</h:panelGroup>

			<rich:spacer width="100px;"></rich:spacer>

			<h:panelGroup>
				<h:outputLabel value="Vice gerente:" />
				<br />
				<h:outputText
					value="#{projetoHandler.projetoAtual.viceGerente.nome}"
					rendered="#{projetoHandler.projetoAtual.viceGerente != null}"
					styleClass="visualizar_texto" />

				<h:outputText styleClass="nao_informado"
					value="Nenhum Vice Responsável associado."
					rendered="#{projetoHandler.projetoAtual.viceGerente == null}" />

			</h:panelGroup>

		</h:panelGrid>

	</h:panelGrid></div>
	</fieldset>

	<fieldset><legend>Integrantes</legend> <h:panelGroup
		id="panelLaboratorios">

		<h:panelGroup
			rendered="#{!empty projetoHandler.integrantesAdicionados}">


			<div id="lista_Visualizar"><rich:dataList var="pessoa"
				id="listaProjetos" value="#{projetoHandler.integrantesAdicionados}">

				<h:outputText value="#{pessoa.nome}" styleClass="label" />
				<br />
				<h:outputText value="Subprojeto: #{pessoa.nomeSubprojeto}">
				</h:outputText>


				<br />
				<br />
			</rich:dataList></div>

		</h:panelGroup>
		<h:panelGroup
			rendered="#{empty projetoHandler.integrantesAdicionados}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhum Integrante associado ao Projeto" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup></fieldset>

	<fieldset><legend>Áreas de Pesquisa</legend> <h:panelGroup
		id="panelAreas">
		<h:outputLabel value="Área de Pesquisa:" style="margin-left: 15px;" />
		<br />
		<h:outputText value="#{projetoHandler.projetoAtual.grandeArea.nome}"
			rendered="#{projetoHandler.projetoAtual.grandeArea != null}"
			styleClass="visualizar_texto" style="margin-left: 15px;" />

		<h:outputText styleClass="nao_informado"
			value="Nenhuma Área de Pesquisa associada."
			rendered="#{projetoHandler.projetoAtual.grandeArea == null}"
			style="margin-left: 15px;" />

		<br />
		<br />

		<h:outputLabel value="Sub áreas de Pesquisa:"
			style="margin-left: 15px;" />
		<br />

		<h:panelGroup
			rendered="#{!empty projetoHandler.projetoAtual.subAreasDePesquisas}">


			<div id="lista_Visualizar"><rich:dataList var="subArea"
				value="#{projetoHandler.projetoAtual.subAreasDePesquisas}">

				<h:outputText value="#{subArea.nome}" styleClass="label" />

				<br />
				<br />
			</rich:dataList></div>

		</h:panelGroup>

		<h:panelGroup
			rendered="#{empty projetoHandler.projetoAtual.subAreasDePesquisas}">
			<ul style="padding-left: 38px;">
				<li><h:outputText style="color:red"
					value="Nenhuma Sub área associada ao Projeto" /></li>
			</ul>
		</h:panelGroup>



	</h:panelGroup></fieldset>



	<fieldset><legend>Publicações</legend> <h:panelGroup
		id="panelPublicacoes">


		<h:panelGroup
			rendered="#{!empty projetoHandler.publicacoesAdicionadas}">


			<div id="lista_Visualizar"><rich:dataTable id="tabelaPub"
				rows="10" var="publicacao"
				value="#{projetoHandler.publicacoesAdicionadas}"
				style="margin-left: 10px;" styleClass="tabelaSemLinha"
				width="900px;">

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Título"></h:outputText>
					</f:facet>
					<div style="width: 460px;"><h:outputText
						value="#{publicacao.titulo}" /></div>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Tipo"></h:outputText>
					</f:facet>
					<div style="width: 100px;"><h:outputText
						value="#{publicacao.tipoPublicacao}" /></div>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Ano"></h:outputText>
					</f:facet>
					<div style="width: 100px;"><h:outputText
						value="#{publicacao.anoPublicacao}" /></div>
				</rich:column>


			</rich:dataTable></div>

			<rich:datascroller for="tabelaPub" fastControls="hide"
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
			rendered="#{empty projetoHandler.publicacoesAdicionadas}">
			<ul style="padding-left: 38px;">
				<li><h:outputText style="color:red"
					value="Nenhuma Publicação criada pelo Projeto" /></li>
			</ul>
		</h:panelGroup>




	</h:panelGroup></fieldset>


	<fieldset><legend>Equipamentos Adquiridos</legend> <h:panelGroup
		id="panelEquipamentos">


		<h:panelGroup
			rendered="#{!empty projetoHandler.projetoAtual.equipamentosAdiquiridos}">


			<div id="lista_Visualizar"><rich:dataTable var="equipamento"
				value="#{projetoHandler.projetoAtual.equipamentosAdiquiridos}"
				style="margin-left: 10px;" styleClass="tabelaSemLinha"
				width="900px;">

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Nome"></h:outputText>
					</f:facet>
					<div style="width: 200px;"><h:outputText
						value="#{equipamento.nome}" /></div>
				</rich:column>


				<rich:column>
					<f:facet name="header">
						<h:outputText value="Tombamento"></h:outputText>
					</f:facet>
					<div style="width: 150px;"><h:outputText
						value="#{equipamento.numeroTombamento}" /></div>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Situação"></h:outputText>
					</f:facet>
					<div style="width: 130px;"><h:outputText
						value="#{equipamento.status}" /></div>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Alocado no"></h:outputText>
					</f:facet>
					<div style="width: 200px;"><h:outputText
						value="#{equipamento.laboratorio.nome}"
						rendered="#{equipamento.laboratorio != null}" /> <h:outputText
						value="Não Informado"
						rendered="#{equipamento.laboratorio == null}" /></div>
				</rich:column>




			</rich:dataTable></div>

		</h:panelGroup>
		<h:panelGroup
			rendered="#{empty projetoHandler.projetoAtual.equipamentosAdiquiridos}">
			<ul style="padding-left: 38px;">
				<li><h:outputText style="color:red"
					value="Nenhuma Equipamento adquirido pelo Projeto" /></li>
			</ul>
		</h:panelGroup>





	</h:panelGroup></fieldset>


</f:subview>
</body>
</html>

