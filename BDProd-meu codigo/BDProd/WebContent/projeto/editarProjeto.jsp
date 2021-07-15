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

<script type="text/javascript">
	(function(jQuery) {

		jQuery(document)
				.ready(
						function() {

							jQuery('#teste')
									.jGrowl(
											"Atenção: As alterações realizadas só serão confirmadas após serem salvas!",
											{
												closer : false,
												sticky : false,
												glue : 'before',
												speed : 1500,
												theme : 'smoke',
												easing : 'easeInOutElastic',

												animateClose : {
													height : "hide",
													width : "show"
												}
											});

						});
	})(jQuery);
</script>

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
<f:subview id="editarProjeto">

	<div id="panelConfirmacao" align="center"><h:outputText
		style="color:red;"
		value="Alguns Campos Obrigatórios não Foram Preenchidos Corretamente!"
		rendered="#{facesContext.maximumSeverity.ordinal==2}" /> <br />
	<br />
	<h:messages style="color:red;" layout="table"></h:messages></div>


	<fieldset><legend>Informações Gerais</legend>
	<div id="conteudoForm"><h:panelGroup>
		<h:outputLabel value="Nome:" for="nome" />
		<br />
		<h:inputText id="nome" style="width:875px;"
			value="#{projetoHandler.projetoAtual.nome}" maxlength="250" />
	</h:panelGroup> <h:panelGrid columns="4">
		<h:panelGroup>
			<h:outputLabel value="Data início:" />
			<br />
			<rich:calendar value="#{projetoHandler.projetoAtual.dataInicio}"
				datePattern="dd/MM/yyyy" showApplyButton="false" cellWidth="24px"
				cellHeight="22px" enableManualInput="true"
				requiredMessage="É necessário informar a Data da Solicitação"
				converterMessage="Data de início inválida!" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Data fim:" />
			<br />
			<rich:calendar value="#{projetoHandler.projetoAtual.dataFim}"
				datePattern="dd/MM/yyyy" showApplyButton="false" cellWidth="24px"
				cellHeight="22px" enableManualInput="true"
				requiredMessage="É necessário informar a Data da Solicitação"
				converterMessage="Data de fim inválida!" />
		</h:panelGroup>



		<h:panelGroup style="margin-left:73px;">
			<h:outputLabel value="Situação:" />
			<br />
			<h:selectOneMenu id="situacao" style="margin-left:73px;"
				value="#{projetoHandler.projetoAtual.situacaoAtual}">
				<f:selectItem itemValue="em Andamento" itemLabel="em Andamento" />
				<f:selectItem itemValue="Concluído" itemLabel="Concluído" />
			</h:selectOneMenu>
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Referência:" />
			<br />
			<h:inputText style="width:300px;"
				value="#{projetoHandler.projetoAtual.referencia}" maxlength="150" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGroup id="panelGrupo">
		<h:outputLabel value="Grupo de Pesquisa:" />
		<br />
		<h:outputText styleClass="visualizar_texto"
			value="#{projetoHandler.projetoAtual.grupo.nome} - "
			rendered="#{projetoHandler.projetoAtual.grupo != null}" />

		<h:outputText style="color:red; margin-left:3px;"
			value="Nenhum Grupo de Pesquisa associado."
			rendered="#{projetoHandler.projetoAtual.grupo == null}" />

		<a4j:commandLink ajaxSingle="true" style="margin-top:3px;"
			rendered="#{projetoHandler.projetoAtual.grupo != null}"
			action="#{projetoHandler.removerGrupo}" reRender="panelGrupo">
			<h:graphicImage value="../images/cancel2.jpg"
				title="Remover Grupo de Pesquisa" alt="Remover Grupo de Pesquisa"
				width="15" height="15"></h:graphicImage>
		</a4j:commandLink>


		<br />
		<a4j:commandLink ajaxSingle="true" style="margin-left:3px;"
			rendered="#{projetoHandler.projetoAtual.grupo == null}"
			onclick="jQuery('#dialogGrupo').dialog('open')">
			<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
		</a4j:commandLink>

	</h:panelGroup> <br />
	<h:panelGroup>
		<h:outputLabel value="Descrição:" />
		<br />
		<h:inputTextarea id="descricao" style="width:770px; height: 100px;"
			value="#{projetoHandler.projetoAtual.descricao}" />
	</h:panelGroup> <br />
	<h:panelGrid columns="3" id="tipo">
		<h:panelGroup id="val">
			<h:outputLabel value="Tipo:" />
			<br />
			<h:selectOneRadio value="#{projetoHandler.projetoAtual.tipo}">
				<f:selectItem itemValue="Interno" itemLabel="Interno" />
				<f:selectItem itemValue="Externo" itemLabel="Externo" />
				<a4j:support reRender="val" event="onclick" ajaxSingle="true"
					action="#{projetoHandler.projetoExterno}" />
			</h:selectOneRadio>

			<h:panelGrid columns="2">
				<h:panelGroup>
					<h:outputLabel value="Valor LIKA (R$):" />
					<br />
					<h:inputText value="#{projetoHandler.projetoAtual.valor}" size="15"
						maxlength="30" />
				</h:panelGroup>
				<h:panelGroup
					rendered="#{projetoHandler.projetoAtual.tipo == 'Externo'}">
					<h:outputLabel value="Valor Total (R$):" style="margin-left:50px;" />
					<br />
					<h:inputText value="#{projetoHandler.projetoAtual.valorTotal}"
						size="15" style="margin-left:50px;" maxlength="30" />
				</h:panelGroup>
			</h:panelGrid>
		</h:panelGroup>

		<rich:spacer width="100px;"></rich:spacer>
		<h:panelGroup id="finan">
			<h:outputLabel value="Financiamento:" />
			<br />
			<h:selectOneRadio
				value="#{projetoHandler.projetoAtual.financiamento}">
				<f:selectItem itemValue="true" itemLabel="Sim" />
				<f:selectItem itemValue="false" itemLabel="Não" />
				<a4j:support reRender="finan" event="onclick" ajaxSingle="true"
					action="#{projetoHandler.projetoFinanciamento}" />
			</h:selectOneRadio>


			<h:panelGroup rendered="#{projetoHandler.projetoAtual.financiamento}">
				<h:outputLabel value="Órgão Financiador:" />
				<br />
				<h:inputText value="#{projetoHandler.projetoAtual.orgaoFinanciador}"
					size="30" maxlength="100" />
			</h:panelGroup>

			<rich:spacer width="10px;" height="35px;"
				rendered="#{!projetoHandler.projetoAtual.financiamento}"></rich:spacer>

		</h:panelGroup>


	</h:panelGrid> <br />

	<h:panelGrid columns="3" id="panelResponsavel">

		<h:panelGroup>
			<h:outputLabel value="Gerente:" />
			<br />
			<h:outputText styleClass="visualizar_texto"
				value="#{projetoHandler.projetoAtual.gerente.nome} - "
				rendered="#{projetoHandler.projetoAtual.gerente != null}" />

			<h:outputText style="color:red; margin-left:3px;"
				value="Nenhum Responsável associado."
				rendered="#{projetoHandler.projetoAtual.gerente == null}" />

			<a4j:commandLink ajaxSingle="true" style="margin-top:3px;"
				rendered="#{projetoHandler.projetoAtual.gerente != null}"
				actionListener="#{projetoHandler.removerResponsavel}"
				reRender="panelResponsavel">
				<f:attribute value="resp" name="resp" />
				<h:graphicImage value="../images/cancel2.jpg"
					title="Remover Responsável" alt="Remover Responsável" width="15"
					height="15"></h:graphicImage>
			</a4j:commandLink>


			<br />
			<a4j:commandLink ajaxSingle="true" style="margin-left:3px;"
				rendered="#{projetoHandler.projetoAtual.gerente == null}"
				onclick="jQuery('#dialogResponsavel').dialog('open')"
				action="#{projetoHandler.ehResp}">
				<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
			</a4j:commandLink>

		</h:panelGroup>


		<rich:spacer width="100px;"></rich:spacer>

		<h:panelGroup>
			<h:outputLabel value="Vice gerente:" />
			<br />
			<h:outputText styleClass="visualizar_texto"
				value="#{projetoHandler.projetoAtual.viceGerente.nome} - "
				rendered="#{projetoHandler.projetoAtual.viceGerente != null}" />

			<h:outputText style="color:red; margin-left:3px;"
				value="Nenhum Vice Responsável associado."
				rendered="#{projetoHandler.projetoAtual.viceGerente == null}" />

			<a4j:commandLink ajaxSingle="true" style="margin-top:3px;"
				rendered="#{projetoHandler.projetoAtual.viceGerente != null}"
				actionListener="#{projetoHandler.removerResponsavel}"
				reRender="panelResponsavel">
				<f:attribute value="vice" name="resp" />
				<h:graphicImage value="../images/cancel2.jpg"
					title="Remover Vice Responsável" alt="Remover Vice Responsável"
					width="15" height="15"></h:graphicImage>
			</a4j:commandLink>


			<br />
			<a4j:commandLink ajaxSingle="true" style="margin-left:3px;"
				rendered="#{projetoHandler.projetoAtual.viceGerente == null}"
				onclick="jQuery('#dialogResponsavel').dialog('open')"
				action="#{projetoHandler.ehVice}">
				<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
			</a4j:commandLink>

		</h:panelGroup>

	</h:panelGrid></div>
	</fieldset>

	<fieldset><legend>Integrantes</legend> <h:panelGroup
		id="panelIntegrantes">



		<h:panelGroup
			rendered="#{!empty projetoHandler.integrantesAdicionados}">


			<div id="lista"><rich:dataList var="pessoa" id="listaProjetos"
				value="#{projetoHandler.integrantesAdicionados}">

				<h:outputText value="#{pessoa.nome}" styleClass="label" />
				<a4j:commandLink ajaxSingle="true"
					actionListener="#{projetoHandler.removerIntegrante}"
					reRender="panelIntegrantes">
					<h:graphicImage value="../images/cancel2.jpg"
						title="Remover Integrante" alt="Remover Integrante" width="15"
						height="15"></h:graphicImage>
					<f:attribute name="pessoa" value="#{pessoa}" />
				</a4j:commandLink>
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

	</h:panelGroup>


	<div style="margin-right: 5px;" align="right"><a4j:commandLink
		ajaxSingle="true" hreflang="#" id="dialogIntegrantes_link"
		style="text-decoration: none"
		action="#{projetoHandler.adicionarIntegrante}"
		onclick="jQuery('#dialogIntegrantes').dialog('open')">
		<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
	</a4j:commandLink></div>
	</fieldset>


	<fieldset><legend>Áreas de Pesquisa</legend> <h:panelGroup
		id="panelAreas">

		<h:outputLabel value="Área de Pesquisa:" style="margin-left: 15px;" />
		<br />
		<h:outputText styleClass="visualizar_texto" style="margin-left: 15px;"
			value="#{projetoHandler.projetoAtual.grandeArea.nome} - "
			rendered="#{projetoHandler.projetoAtual.grandeArea != null}" />
		<h:outputText style="color:red; margin-left:18px;"
			value="Nenhuma Área de Pesquisa associada."
			rendered="#{projetoHandler.projetoAtual.grandeArea == null}" />
		<a4j:commandLink ajaxSingle="true"
			style="margin-top:3px; margin-left: 15px;"
			rendered="#{projetoHandler.projetoAtual.grandeArea != null}"
			actionListener="#{projetoHandler.removerGrandeArea}"
			reRender="panelAreas">
			<h:graphicImage value="../images/cancel2.jpg"
				title="Remover Área de Pesquisa" alt="Remover Área de Pesquisa"
				width="15" height="15"></h:graphicImage>
		</a4j:commandLink>
		<br />
		<a4j:commandLink ajaxSingle="true" style="margin-left:18px;"
			rendered="#{projetoHandler.projetoAtual.grandeArea== null}"
			onclick="jQuery('#dialogAreas').dialog('open')">
			<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
		</a4j:commandLink>

		<br />
		<br />

		<h:outputLabel value="Sub áreas de Pesquisa:"
			style="margin-left: 15px;" />

		<h:panelGroup
			rendered="#{!empty projetoHandler.projetoAtual.subAreasDePesquisas}">


			<div id="lista"><rich:dataList var="subArea"
				value="#{projetoHandler.projetoAtual.subAreasDePesquisas}">

				<h:outputText value="#{subArea.nome}" styleClass="label" />
				<a4j:commandLink ajaxSingle="true"
					actionListener="#{projetoHandler.removerSubArea}"
					reRender="panelAreas">
					<h:graphicImage value="../images/cancel2.jpg"
						title="Remover Sub área" alt="Remover Sub área" width="15"
						height="15"></h:graphicImage>
					<f:attribute name="subArea" value="#{subArea}" />
				</a4j:commandLink>
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

		<div style="margin-right: 5px;" align="right"><a4j:commandLink
			ajaxSingle="true" hreflang="#" style="text-decoration: none"
			onclick="jQuery('#dialogSubAreas').dialog('open')">
			<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
		</a4j:commandLink></div>
	</h:panelGroup></fieldset>


	<fieldset><legend>Publicações</legend> <h:panelGroup
		id="panelPublicacoes">


		<h:panelGroup
			rendered="#{!empty projetoHandler.publicacoesAdicionadas}">


			<div id="lista"><rich:dataTable id="tabelaPub" var="publicacao"
				rows="10" value="#{projetoHandler.publicacoesAdicionadas}"
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


				<rich:column>
					<div style="width: 170px;" align="right""><a4j:commandLink
						ajaxSingle="true" style="margin-right:5px;"
						actionListener="#{projetoHandler.editarPublicacao}"
						oncomplete="jQuery('#dialogNovaPublicacao').dialog('open')"
						rendered="#{publicacao.idPublicacao == null}" reRender="panel">
						<h:graphicImage value="../images/editar4.png"
							title="Editar Publicação" alt="Editar Publicação" width="17"
							height="17"></h:graphicImage>
						<f:attribute name="publicacao" value="#{publicacao}" />
					</a4j:commandLink> <a4j:commandLink ajaxSingle="true"
						actionListener="#{projetoHandler.removerPublicacao}"
						reRender="panelPublicacoes">
						<h:graphicImage value="../images/cancel2.jpg"
							title="Remover Publicação" alt="Remover Publicação" width="15"
							height="15"></h:graphicImage>
						<f:attribute name="publicacao" value="#{publicacao}" />
					</a4j:commandLink></div>
				</rich:column>







			</rich:dataTable></div>

			<rich:datascroller id="dsPub" fastControls="hide" for="tabelaPub"
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



		<div style="margin-right: 5px;" align="right"><a4j:commandLink
			ajaxSingle="true" hreflang="#" style="text-decoration: none"
			onclick="jQuery('#dialogTipoPublicacao').dialog('open')"
			reRender="panel">
			<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
		</a4j:commandLink></div>

	</h:panelGroup></fieldset>


	<fieldset><legend>Equipamentos Adquiridos</legend> <h:panelGroup
		id="panelEquipamentos">


		<h:panelGroup
			rendered="#{!empty projetoHandler.projetoAtual.equipamentosAdiquiridos}">


			<div id="lista"><rich:dataTable var="equipamento"
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

				<rich:column>
					<div style="width: 150px;" align="right""><a4j:commandLink
						ajaxSingle="true" style="margin-right:5px;"
						actionListener="#{projetoHandler.editarEquipamento}"
						oncomplete="jQuery('#dialogNovoEquipamento').dialog('open')"
						reRender="panelEquip">
						<h:graphicImage value="../images/editar4.png"
							title="Editar Equipamento" alt="Editar Equipamento" width="17"
							height="17"></h:graphicImage>
						<f:attribute name="equipamento" value="#{equipamento}" />
					</a4j:commandLink> <a4j:commandLink ajaxSingle="true"
						actionListener="#{projetoHandler.removerEquipamento}"
						reRender="panelEquipamentos">
						<h:graphicImage value="../images/cancel2.jpg"
							title="Remover Equipamento" alt="Remover Equipamento" width="15"
							height="15"></h:graphicImage>
						<f:attribute name="equipamento" value="#{equipamento}" />
					</a4j:commandLink></div>
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



		<div style="margin-right: 5px;" align="right"><a4j:commandLink
			ajaxSingle="true" hreflang="#" style="text-decoration: none"
			oncomplete="jQuery('#dialogNovoEquipamento').dialog('open')"
			action="#{projetoHandler.novoEquipamento}" reRender="panelEquip">
			<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
		</a4j:commandLink></div>

	</h:panelGroup></fieldset>



</f:subview>
</body>
</html>

