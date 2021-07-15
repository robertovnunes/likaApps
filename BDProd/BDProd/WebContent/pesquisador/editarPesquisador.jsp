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
<%@ taglib prefix="stella" uri="http://stella.caelum.com.br/faces"%>



<html>
<head>
<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />

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


<style type="text/css">
.coluna {
	width: 50%;
}

.rich-fileupload-toolbar-decor,.rich-fileupload-toolbar-decor table,.rich-fileupload-list-overflow,.rich-fileupload-table,.rich-fileupload-table-td,.rich-fileupload-list-decor
	{
	background: transparent;
	border: 0px;
	padding: 0;
}

.rich-fileupload-button,.rich-fileupload-button-border {
	background: #BBD8EC;
	border-color: #BBD8EC;
	margin: -1px 0 0 -1px;
	position: relative;
	top: 0;
	left: 0;
}

.rich-fileupload-button-press,.rich-fileupload-button-light {
	background: #BBD8EC;
	border-color: #BBD8EC;
	margin: -1px 0 0 -1px;
	position: relative;
	top: 0;
	left: 0;
}
</style>

</head>
<body>
<f:subview id="editarPesquisador">




	<div id="panelConfirmacao" align="center"><h:outputText
		style="color:red;"
		value="Alguns Campos Obrigatórios não Foram Preenchidos Corretamente!"
		rendered="#{facesContext.maximumSeverity.ordinal==2}" /> <br />
	<br />
	<h:messages style="color:red;" layout="table"></h:messages></div>

	<fieldset><legend>Informações Gerais</legend>

	<div
		style="float: left; width: 90px; margin-right: 40px; margin-top: 10px;">



	<h:panelGroup id="foto">
		<h:graphicImage value="../images/foto.gif" width="120px"
			height="150px"
			rendered="#{pesquisadorHandler.pesquisadorAtual.foto == null}" />


		<a4j:mediaOutput element="img" cacheable="false" session="false"
			createContent="#{pesquisadorHandler.paint}" mimeType="image/jpeg"
			rendered="#{pesquisadorHandler.pesquisadorAtual.foto != null}" />
		<br />
		<div style="margin-left: 15px"><rich:fileUpload
			fileUploadListener="#{pesquisadorHandler.listener}" id="Alterar"
			immediateUpload="true" ajaxSingle="true"
			acceptedTypes="jpg, gif, png, bmp" allowFlash="true"
			addControlLabel="Adicionar..." clearAllControlLabel="Cancelar"
			clearControlLabel="Cancelar" stopEntryControlLabel="Parar"
			uploadControlLabel="Upload"
			addButtonClass="gp-fonte-padrao gp-fonte-botao" listHeight="0px"
			listWidth="137px" stopButtonClass="gp-fonte-padrao gp-fonte-botao"
			autoclear="true">
			<a4j:support event="onuploadcomplete" reRender="foto"
				action="editarPesquisador" />
		</rich:fileUpload></div>
	</h:panelGroup></div>
	<div style="float: left; width: 780px; margin-top: 10px;"><h:panelGrid
		columns="2" width="100%">
		<h:panelGroup>
			<h:outputLabel value="Nome:" for="nome" />
			<br />
			<h:inputText id="nome" style="width:600px;"
				value="#{pesquisadorHandler.pesquisadorAtual.nome}" maxlength="80"
				required="true"
				requiredMessage="Campo Nome não pode estar em branco">

			</h:inputText>
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Ass. Publicação:" for="assPublicacao" />
			<br />
			<h:inputText id="assPublicacao" style="width:150px;"
				value="#{pesquisadorHandler.pesquisadorAtual.nomePublicacao}"
				maxlength="50" />
		</h:panelGroup>
	</h:panelGrid> <h:message for="nome" style="color:red;" /> <br />

	<h:panelGrid columns="6" width="90%">
		<h:panelGroup>
			<h:outputLabel value="CPF:" for="cpf" />
			<br />
			<h:inputText id="cpf" size="15"
				value="#{pesquisadorHandler.pesquisadorAtual.CPF}"
				onkeypress="mascara(this,cpf)" maxlength="14">
				<stella:validateCPF formatted="true" />

			</h:inputText>

		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="RG:" for="rg" />
			<br />
			<h:inputText id="rg" size="10"
				value="#{pesquisadorHandler.pesquisadorAtual.RG}" maxlength="9"
				onkeypress="mascara(this,soNumeros)" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="UF:" for="uf" />
			<br />
			<h:selectOneMenu id="uf"
				value="#{pesquisadorHandler.pesquisadorAtual.uf}"
				style="width:80px;">
				<f:selectItem itemValue="AC" itemLabel="AC" />
				<f:selectItem itemValue="AL" itemLabel="AL" />
				<f:selectItem itemValue="AM" itemLabel="AM" />
				<f:selectItem itemValue="AP" itemLabel="AP" />
				<f:selectItem itemValue="BA" itemLabel="BA" />
				<f:selectItem itemValue="CE" itemLabel="CE" />
				<f:selectItem itemValue="DF" itemLabel="DF" />
				<f:selectItem itemValue="ES" itemLabel="ES" />
				<f:selectItem itemValue="GO" itemLabel="GO" />
				<f:selectItem itemValue="MA" itemLabel="MA" />
				<f:selectItem itemValue="MG" itemLabel="MG" />
				<f:selectItem itemValue="MS" itemLabel="MS" />
				<f:selectItem itemValue="MT" itemLabel="MT" />
				<f:selectItem itemValue="PA" itemLabel="PA" />
				<f:selectItem itemValue="PB" itemLabel="PB" />
				<f:selectItem itemValue="PE" itemLabel="PE" />
				<f:selectItem itemValue="PI" itemLabel="PI" />
				<f:selectItem itemValue="PR" itemLabel="PR" />
				<f:selectItem itemValue="RJ" itemLabel="RJ" />
				<f:selectItem itemValue="RN" itemLabel="RN" />
				<f:selectItem itemValue="RO" itemLabel="RO" />
				<f:selectItem itemValue="RR" itemLabel="RR" />
				<f:selectItem itemValue="RS" itemLabel="RS" />
				<f:selectItem itemValue="SC" itemLabel="SC" />
				<f:selectItem itemValue="SE" itemLabel="SE" />
				<f:selectItem itemValue="SP" itemLabel="SP" />
				<f:selectItem itemValue="TO" itemLabel="TO" />
			</h:selectOneMenu>
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Órgão Expedidor" for="orgao" />
			<br />
			<h:inputText id="orgao" size="11"
				value="#{pesquisadorHandler.pesquisadorAtual.orgaoExpedidor}"
				maxlength="8" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Nascimento:" for="nascimento" />
			<br />
			<h:inputText id="nascimento"
				value="#{pesquisadorHandler.pesquisadorAtual.nascimento}" size="12"
				maxlength="10" onkeypress="mascara(this,data)"
				converterMessage="Data no formato inválido. ex: 30/10/1987">
				<f:convertDateTime type="date" pattern="dd/MM/yyyy" />

			</h:inputText>


		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Sexo:" for="sexo" />
			<br />
			<h:selectOneMenu id="sexo"
				value="#{pesquisadorHandler.pesquisadorAtual.sexo}"
				style="width:100px;">
				<f:selectItem itemValue="Masculino" itemLabel="Masculino" />
				<f:selectItem itemValue="Feminino" itemLabel="Feminino" />
			</h:selectOneMenu>
		</h:panelGroup>

	</h:panelGrid> <h:panelGrid columns="3" columnClasses="coluna" width="100%">
		<h:message for="cpf" style="color:red;" />
		<h:message for="nascimento" style="color:red; margin-left:50px;" />
	</h:panelGrid> <h:panelGrid columns="2" width="100%">
		<h:panelGroup>
			<h:outputLabel value="Nome do Pai:" for="nomePai" />
			<br />
			<h:inputText id="nomePai" style="width:350px;"
				value="#{pesquisadorHandler.pesquisadorAtual.filiacaoPai}"
				maxlength="80" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Nome da Mãe" for="nomeMae" />
			<br />
			<h:inputText id="nomeMae" style="width:350px;"
				value="#{pesquisadorHandler.pesquisadorAtual.filiacaoMae}"
				maxlength="80" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="2" width="95%">
		<h:panelGroup>
			<h:outputLabel value="Endereço:" for="endereco" />
			<br />
			<h:inputText id="endereco" style="width:600px;"
				value="#{pesquisadorHandler.pesquisadorAtual.endereco}"
				maxlength="80" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="CEP:" for="cep" />
			<br />
			<h:inputText id="cep" size="15"
				value="#{pesquisadorHandler.pesquisadorAtual.CEP}" maxlength="9"
				onkeypress="mascara(this,ceep)" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="3" width="80%">
		<h:panelGroup>
			<h:outputLabel value="Tel. Residencial:" for="telRes" />
			<br />
			<h:inputText id="dddRes" size="1" maxlength="2"
				value="#{pesquisadorHandler.pesquisadorAtual.dddResidencial}"
				onkeypress="mascara(this,soNumeros)" />
			<h:inputText id="telRes" size="10"
				value="#{pesquisadorHandler.pesquisadorAtual.telefone}"
				maxlength="9" onkeypress="mascara(this,telefone)" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Tel. Comercial:" for="telCom" />
			<br />
			<h:inputText id="dddCom" size="1" maxlength="2"
				value="#{pesquisadorHandler.pesquisadorAtual.dddComercial}"
				onkeypress="mascara(this,soNumeros)" />
			<h:inputText id="telCom" size="10"
				value="#{pesquisadorHandler.pesquisadorAtual.foneComercial }"
				maxlength="9" onkeypress="mascara(this,telefone)" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Celular:" for="telCom" />
			<br />
			<h:inputText id="dddCel" size="1" maxlength="2"
				value="#{pesquisadorHandler.pesquisadorAtual.dddCelular }"
				onkeypress="mascara(this,soNumeros)" />
			<h:inputText id="cel" size="10"
				value="#{pesquisadorHandler.pesquisadorAtual.celular}" maxlength="9"
				onkeypress="mascara(this,telefone)" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid width="80%">
		<h:panelGroup>
			<h:outputLabel value="Email:" for="email" />
			<br />
			<h:inputText id="email" size="60"
				value="#{pesquisadorHandler.pesquisadorAtual.email}" maxlength="50">
				<f:validator validatorId="validadorEmail" />

			</h:inputText>
			<br />
			<h:message for="email" style="color:red;" />

		</h:panelGroup>
	</h:panelGrid> <h:panelGrid width="80%">
		<h:panelGroup>
			<h:outputLabel value="Currículo Lattes:" for="lattes" />
			<br />
			<h:inputText id="lattes" size="60"
				value="#{pesquisadorHandler.pesquisadorAtual.curriculoLattes}"
				maxlength="50" />
		</h:panelGroup>
	</h:panelGrid></div>
	</fieldset>


	<fieldset><legend>Formação</legend> <h:panelGroup
		id="panelTitulacoes">

		<h:panelGroup
			rendered="#{!empty pesquisadorHandler.pesquisadorAtual.titulacao}">

			<div id="lista"><rich:dataTable var="titulacao"
				id="listaTitulacao" style="margin-left: 10px;"
				value="#{pesquisadorHandler.pesquisadorAtual.titulacao}"
				styleClass="tabelaSemLinha" width="900px;">

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Titulação"></h:outputText>
					</f:facet>
					<div style="width: 100px;"><h:outputText
						value="#{titulacao.titulacao}" /></div>
				</rich:column>


				<rich:column>
					<f:facet name="header">
						<h:outputText value="Curso"></h:outputText>
					</f:facet>
					<div style="width: 250px;"><h:outputText
						value="#{titulacao.curso}" /></div>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Instituição"></h:outputText>
					</f:facet>
					<div style="width: 250px;"><h:outputText
						value="#{titulacao.instituicao}" /></div>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="Conclusão"></h:outputText>
					</f:facet>
					<div style="width: 30px;"><h:outputText
						value="#{titulacao.conclusao}" /></div>
				</rich:column>



				<rich:column>




					<div style="width: 200px;" align="right""><a4j:commandLink
						ajaxSingle="true" style="margin-right:5px;"
						actionListener="#{pesquisadorHandler.editarTitulacao}"
						oncomplete="jQuery('#dialogTitulacao').dialog('open')"
						reRender="novaTitulacao">
						<h:graphicImage value="../images/editar4.png"
							title="Editar Titulação" alt="Editar Titulação" width="17"
							height="17"></h:graphicImage>
						<f:attribute name="titulacao" value="#{titulacao}" />
					</a4j:commandLink> <a4j:commandLink ajaxSingle="true"
						actionListener="#{pesquisadorHandler.removerTitulacao}"
						reRender="panelTitulacoes">
						<h:graphicImage value="../images/cancel2.jpg"
							title="Remover Titulação" alt="Remover Titulação" width="15"
							height="15"></h:graphicImage>
						<f:attribute name="titulacao" value="#{titulacao}" />
					</a4j:commandLink></div>
				</rich:column>

			</rich:dataTable></div>

		</h:panelGroup>
		<h:panelGroup
			rendered="#{empty pesquisadorHandler.pesquisadorAtual.titulacao}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhuma Titulação adicionada ao Pesquisador" /></li>
			</ul>
		</h:panelGroup>
	</h:panelGroup>
	<div style="margin-right: 5px;" align="right"><a4j:commandLink
		ajaxSingle="true" id="addTit"
		oncomplete="jQuery('#dialogTitulacao').dialog('open')"
		action="#{pesquisadorHandler.novaTitulacao}" reRender="novaTitulacao">
		<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
	</a4j:commandLink></div>
	</fieldset>


	<fieldset><legend>Informações LIKA</legend>

	<div id="conteudoForm"><h:panelGrid columns="4" width="100%">

		<h:panelGroup>
			<h:outputLabel value="SIAPE:" for="siape" />
			<br />
			<h:inputText id="siape" size="15"
				value="#{pesquisadorHandler.pesquisadorAtual.SIAPE}" maxlength="10">
			</h:inputText>
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Instituição de Orígem:" for="instOrigem" />
			<br />
			<h:selectOneMenu id="instOrigem" style="width:280px;"
				value="#{pesquisadorHandler.pesquisadorAtual.instituicaoOrigem}"
				immediate="true">
				<f:selectItem itemLabel="Universidade Federal de Pernambuco"
					itemValue="Universidade Federal de Pernambuco" />
				<f:selectItem itemLabel="Outra" itemValue="Outra" />
				<a4j:support event="onchange" reRender="panelCentro"
					action="#{pesquisadorHandler.mudarInstituicaoOrigem}"
					ajaxSingle="true" />
			</h:selectOneMenu>
		</h:panelGroup>



		<h:panelGroup id="panelCentro">
			<h:outputLabel value="Centro:" for="centro" />
			<br />
			<h:selectOneMenu id="centro"
				disabled="#{!pesquisadorHandler.mostrarCentro}"
				value="#{pesquisadorHandler.pesquisadorAtual.departamento.idDepartamento}"
				valueChangeListener="#{pesquisadorHandler.mudarDepartamento}"
				style="width:280px;">
				<f:selectItems value="#{pesquisadorHandler.departamentos}" />
			</h:selectOneMenu>
		</h:panelGroup>



	</h:panelGrid> <h:panelGrid columns="5" width="100%">

		<h:panelGroup>
			<h:outputLabel value="Data de Admissão:" for="calendario" />
			<br />
			<rich:calendar
				value="#{pesquisadorHandler.pesquisadorAtual.dataAdmissao}"
				id="calendario" datePattern="dd/MM/yyyy" showApplyButton="false"
				cellWidth="24px" cellHeight="22px" enableManualInput="true"
				requiredMessage="É necessário informar a Data da Solicitação"
				converterMessage="Data da Solicitação inválida!" />
		</h:panelGroup>

		<h:panelGroup id="panelCracha">
			<h:outputLabel value="Crachá:" for="cracha" />
			<br />
			<a4j:commandLink id="cracha" style="margin-left:5px;"
				value="#{pesquisadorHandler.pesquisadorAtual.cracha.numeroCracha}"
				rendered="#{pesquisadorHandler.pesquisadorAtual.cracha != null}"
				oncomplete="jQuery('#dialogCracha').dialog('open')"
				title="Editar Crachá" reRender="pCracha"
				action="#{pesquisadorHandler.editarCracha}" immediate="true" />

			<a4j:commandLink style="margin-left:5px;"
				oncomplete="jQuery('#dialogCracha').dialog('open')"
				value="Novo Crachá" action="#{pesquisadorHandler.novoCracha}"
				rendered="#{pesquisadorHandler.pesquisadorAtual.cracha == null}"
				reRender="pCracha" immediate="true" />

		</h:panelGroup>


		<h:panelGroup>
			<h:outputLabel value="Situação:" for="situacao" />
			<br />
			<h:selectOneMenu id="situacao" style="width:150px;"
				value="#{pesquisadorHandler.pesquisadorAtual.situacao}">
				<f:selectItem itemValue="em Atividade" itemLabel="em Atividade" />
				<f:selectItem itemValue="Desligado" itemLabel="Desligado" />
			</h:selectOneMenu>
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Data de Desligamento:" for="calendario2" />
			<br />
			<rich:calendar
				value="#{pesquisadorHandler.pesquisadorAtual.dataDesligamento}"
				id="calendario2" datePattern="dd/MM/yyyy" showApplyButton="false"
				cellWidth="24px" cellHeight="22px" enableManualInput="true"
				requiredMessage="É necessário informar a Data da Solicitação"
				converterMessage="Data da Solicitação inválida!" />
		</h:panelGroup>
	</h:panelGrid>
	
	<h:panelGrid columns="1" width="100%">
		<h:panelGroup>
			<h:outputLabel value="Motivo Desligamento:" for="motivo" />
			<br />
			<h:inputText id="motivo" style="width:600px;"
				value="#{pesquisadorHandler.pesquisadorAtual.motivoDesligamento}" maxlength="200">
			</h:inputText>			
		</h:panelGroup>
	</h:panelGrid> 
	
	
	</div>

	</fieldset>



	<fieldset><legend>Áreas de Pesquisa</legend> <h:panelGroup
		id="panelAreas">

		<h:panelGroup id="listaAreas"
			rendered="#{!empty pesquisadorHandler.pesquisadorAtual.areasPesquisa}">
			<div id="lista"><rich:dataList var="area"
				value="#{pesquisadorHandler.pesquisadorAtual.areasPesquisa}">

				<h:outputText value="#{area.nome}" styleClass="label" />
				<a4j:commandLink ajaxSingle="true"
					actionListener="#{pesquisadorHandler.removerAreaDePesquisa}"
					reRender="panelAreas">
					<h:graphicImage value="../images/cancel2.jpg"
						title="Remover Área de Pesquisa" alt="Remover Área de Pesquisa"
						width="15" height="15"></h:graphicImage>
					<f:attribute name="area" value="#{area}" />
				</a4j:commandLink>
				<br />
				<br />
			</rich:dataList></div>
		</h:panelGroup>
		<h:panelGroup id="nenhumaArea"
			rendered="#{empty pesquisadorHandler.pesquisadorAtual.areasPesquisa}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhuma Área de Pesquisa associada ao Pesquisador" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup>

	<div style="margin-right: 5px;" align="right"><a4j:commandLink
		onclick="jQuery('#dialogAreas').dialog('open')"
		action="#{areaHandler.listarSubAreaPorNome}"
		reRender="novaArea">
		<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
	</a4j:commandLink></div>
	</fieldset>


	<fieldset><legend>Laboratórios</legend> <h:panelGroup
		id="panelLaboratorios">

		<h:panelGroup
			rendered="#{!empty pesquisadorHandler.pesquisadorAtual.laboratorios || !empty pesquisadorHandler.pesquisadorAtual.laboratorioGerenciado ||
			!empty pesquisadorHandler.pesquisadorAtual.laboratorioViceGerenciado
			}">


			<div id="lista"><rich:dataList
				value="#{pesquisadorHandler.pesquisadorAtual.laboratorioGerenciado}"
				var="lab" style="list-style-type: square">
				<h:outputText value="#{lab.nome}" styleClass="label" />
				<br />
				<h:outputText value="Função: Gerente" styleClass="label" />
				<br />
				<br />
			</rich:dataList> <rich:dataList
				value="#{pesquisadorHandler.pesquisadorAtual.laboratorioViceGerenciado}"
				var="lab" style="list-style-type: square">
				<h:outputText value="#{lab.nome}" styleClass="label" />
				<br />
				<h:outputText value="Função: Vice Gerente" styleClass="label" />
				<br />
				<br />
			</rich:dataList> <rich:dataList
				value="#{pesquisadorHandler.pesquisadorAtual.laboratorios}"
				var="lab">
				<h:outputText value="#{lab.nome}" styleClass="label" />
				<a4j:commandLink ajaxSingle="true"
					actionListener="#{pesquisadorHandler.removerLaboratorio}"
					reRender="panelLaboratorios">
					<h:graphicImage value="../images/cancel2.jpg"
						title="Remover Laboratório" alt="Remover Laboratório" width="15"
						height="15"></h:graphicImage>
					<f:attribute name="lab" value="#{lab}" />
				</a4j:commandLink>
				<br />
				<br />
			</rich:dataList></div>
		</h:panelGroup>
		<h:panelGroup
			rendered="#{empty pesquisadorHandler.pesquisadorAtual.laboratorios && empty pesquisadorHandler.pesquisadorAtual.laboratorioGerenciado &&
			empty pesquisadorHandler.pesquisadorAtual.laboratorioViceGerenciado}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhum Laboratório associado ao Pesquisador" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup>

	<div style="margin-right: 5px;" align="right"><a4j:commandLink
		ajaxSingle="true"
		onclick="jQuery('#dialogLaboratorios').dialog('open')"
		action="#{laboratorioHandler.listarPorNome}"
		reRender="novoLab">
		<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
	</a4j:commandLink></div>
	</fieldset>



	<fieldset><legend>Projetos</legend> <h:panelGroup
		id="panelProjetos">

		<h:panelGroup
			rendered="#{!empty pesquisadorHandler.projetosAdicionados || !empty pesquisadorHandler.pesquisadorAtual.projetoResponsavel || !empty pesquisadorHandler.pesquisadorAtual.projetoViceResponsavel}">


			<div id="lista"><rich:dataList
				value="#{pesquisadorHandler.pesquisadorAtual.projetoResponsavel}"
				var="proj" style="list-style-type: square">
				<h:outputText value="#{proj.nome}" styleClass="label" />
				<br />
				<h:outputText value="Função: Gerente" styleClass="label" />
				<br />
				<br />
			</rich:dataList> <rich:dataList
				value="#{pesquisadorHandler.pesquisadorAtual.projetoViceResponsavel}"
				var="proj" style="list-style-type: square">
				<h:outputText value="#{proj.nome}" styleClass="label" />
				<br />
				<h:outputText value="Função: Vice Gerente" styleClass="label" />
				<br />
				<br />
			</rich:dataList> <rich:dataList var="projeto" id="listaProjetos"
				value="#{pesquisadorHandler.projetosAdicionados}">

				<h:outputText value="#{projeto.nome}" styleClass="label" />
				<a4j:commandLink ajaxSingle="true"
					actionListener="#{pesquisadorHandler.removerProjeto}"
					reRender="panelProjetos">
					<h:graphicImage value="../images/cancel2.jpg"
						title="Remover Projeto" alt="Remover Projeto" width="15"
						height="15"></h:graphicImage>
					<f:attribute name="projeto" value="#{projeto}" />
				</a4j:commandLink>
				<br />
				<h:outputText value="Subprojeto: #{projeto.nomeSubprojeto}">
				</h:outputText>


				<br />
				<br />
			</rich:dataList></div>

		</h:panelGroup>
		<h:panelGroup
			rendered="#{empty pesquisadorHandler.projetosAdicionados && empty pesquisadorHandler.pesquisadorAtual.projetoResponsavel  && empty pesquisadorHandler.pesquisadorAtual.projetoViceResponsavel}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhum Projeto associado ao Pesquisador" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup>


	<div style="margin-right: 5px;" align="right"><a4j:commandLink
		ajaxSingle="true" hreflang="#" id="dialogProjetos_link"
		style="text-decoration: none"
		action="#{projetoHandler.listarPorNome}"
		reRender="novoProjeto"
		onclick="jQuery('#dialogProjetos').dialog('open')">
		<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
	</a4j:commandLink></div>

	</fieldset>


</f:subview>
</body>
</html>

