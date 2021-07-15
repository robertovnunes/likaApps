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
<f:subview id="editarAluno">


	<div id="panelConfirmacao" align="center"><h:outputText
		style="color:red;"
		value="Alguns Campos Obrigatórios não Foram Preenchidos Corretamente!"
		rendered="#{facesContext.maximumSeverity.ordinal==2}" /> <br />
	<br />
	<h:messages style="color:red;" layout="table"></h:messages></div>


	<div align="center"><h:panelGrid columns="2">
		<h:outputText value="Tipo do Aluno: " />
		<h:selectOneRadio value="#{alunoHandler.alunoAtual.tipoAluno}">
			<f:selectItems value="#{alunoHandler.tipoAlunos}" />
		</h:selectOneRadio>

	</h:panelGrid></div>

	<fieldset><legend>Informações Gerais</legend>

	<div
		style="float: left; width: 90px; margin-right: 40px; margin-top: 10px;">



	<h:panelGroup id="foto">
		<h:graphicImage value="../images/foto.gif" width="120px"
			height="150px" rendered="#{alunoHandler.alunoAtual.foto == null}" />


		<a4j:mediaOutput element="img" cacheable="false" session="false"
			createContent="#{alunoHandler.paint}" mimeType="image/jpeg"
			rendered="#{alunoHandler.alunoAtual.foto != null}" />
		<br />
		<div style="margin-left: 15px"><rich:fileUpload
			fileUploadListener="#{alunoHandler.listener}" id="Alterar"
			immediateUpload="true" ajaxSingle="true"
			acceptedTypes="jpg, gif, png, bmp" allowFlash="true"
			addControlLabel="Adicionar..." clearAllControlLabel="Cancelar"
			clearControlLabel="Cancelar" stopEntryControlLabel="Parar"
			uploadControlLabel="Upload"
			addButtonClass="gp-fonte-padrao gp-fonte-botao" listHeight="0px"
			listWidth="137px" stopButtonClass="gp-fonte-padrao gp-fonte-botao"
			autoclear="true">
			<a4j:support event="onuploadcomplete" reRender="foto" />
		</rich:fileUpload></div>
	</h:panelGroup></div>
	<div style="float: left; width: 780px; margin-top: 10px;"><h:panelGrid
		columns="2" width="100%">
		<h:panelGroup>
			<h:outputLabel value="Nome:" for="nome" />
			<br />
			<h:inputText id="nome" style="width:600px;"
				value="#{alunoHandler.alunoAtual.nome}" maxlength="80"
				required="true"
				requiredMessage="Campo Nome não pode estar em branco">
			</h:inputText>
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Ass. Publicação:" for="assPublicacao" />
			<br />
			<h:inputText id="assPublicacao" style="width:150px;"
				value="#{alunoHandler.alunoAtual.nomePublicacao}" maxlength="50" />
		</h:panelGroup>
	</h:panelGrid> <h:message for="nome" style="color:red;" /> <br />

	<h:panelGrid columns="6" width="90%">
		<h:panelGroup>
			<h:outputLabel value="CPF:" for="cpf" />
			<br />
			<h:inputText id="cpf" size="15"
				value="#{alunoHandler.alunoAtual.CPF}"
				onkeypress="mascara(this,cpf)" maxlength="14">
				<stella:validateCPF formatted="true" />

			</h:inputText>
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="RG/Passaporte:" for="rg" />
			<br />
			<h:inputText id="rg" size="10" value="#{alunoHandler.alunoAtual.RG}"
				maxlength="13" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="UF:" for="uf" />
			<br />
			<h:selectOneMenu id="uf" value="#{alunoHandler.alunoAtual.uf}"
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
				value="#{alunoHandler.alunoAtual.orgaoExpedidor}" maxlength="8" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Nascimento:" for="nascimento" />
			<br />
			<h:inputText id="nascimento"
				value="#{alunoHandler.alunoAtual.nascimento}" size="12"
				maxlength="10" onkeypress="mascara(this,data)"
				converterMessage="Data no formato inválido. ex: 30/10/1987">
				<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
			</h:inputText>
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Sexo:" for="sexo" />
			<br />
			<h:selectOneMenu id="sexo" value="#{alunoHandler.alunoAtual.sexo}"
				style="width:100px;">
				<f:selectItem itemValue="Masculino" itemLabel="Masculino" />
				<f:selectItem itemValue="Feminino" itemLabel="Feminino" />
			</h:selectOneMenu>
		</h:panelGroup>

	</h:panelGrid> <h:panelGrid columns="3" columnClasses="coluna" width="100%">
		<h:message for="cpf" style="color:red;" />
		<h:message for="nascimento" style="color:red; margin-left:70px;" />
	</h:panelGrid> <h:panelGrid columns="2" width="100%">
		<h:panelGroup>
			<h:outputLabel value="Nome da Mãe" for="nomeMae" />
			<br />
			<h:inputText id="nomeMae" style="width:350px;"
				value="#{alunoHandler.alunoAtual.filiacaoMae}" maxlength="80" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Nome do Pai:" for="nomePai" />
			<br />
			<h:inputText id="nomePai" style="width:350px;"
				value="#{alunoHandler.alunoAtual.filiacaoPai}" maxlength="80" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="2" width="95%">
		<h:panelGroup>
			<h:outputLabel value="Endereço:" for="endereco" />
			<br />
			<h:inputText id="endereco" style="width:600px;"
				value="#{alunoHandler.alunoAtual.endereco}" maxlength="80" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="CEP:" for="cep" />
			<br />
			<h:inputText id="cep" size="15"
				value="#{alunoHandler.alunoAtual.CEP}" maxlength="9"
				onkeypress="mascara(this,ceep)" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="3" width="80%">
		<h:panelGroup>
			<h:outputLabel value="Tel. Residencial:" for="telRes" />
			<br />
			<h:inputText id="dddRes" size="1" maxlength="2"
				value="#{alunoHandler.alunoAtual.dddResidencial}"
				onkeypress="mascara(this,soNumeros)" />
			<h:inputText id="telRes" size="10"
				value="#{alunoHandler.alunoAtual.telefone}" maxlength="9"
				onkeypress="mascara(this,telefone)" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Tel. Comercial:" for="telCom" />
			<br />
			<h:inputText id="dddCom" size="1" maxlength="2"
				value="#{alunoHandler.alunoAtual.dddComercial}"
				onkeypress="mascara(this,soNumeros)" />
			<h:inputText id="telCom" size="10"
				value="#{alunoHandler.alunoAtual.foneComercial }" maxlength="9"
				onkeypress="mascara(this,telefone)" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Celular:" for="telCom" />
			<br />
			<h:inputText id="dddCel" size="1" maxlength="2"
				value="#{alunoHandler.alunoAtual.dddCelular }"
				onkeypress="mascara(this,soNumeros)" />
			<h:inputText id="cel" size="10"
				value="#{alunoHandler.alunoAtual.celular}" maxlength="9"
				onkeypress="mascara(this,telefone)" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid width="80%">
		<h:panelGroup>
			<h:outputLabel value="Email:" for="email" />
			<br />
			<h:inputText id="email" size="60"
				value="#{alunoHandler.alunoAtual.email}" maxlength="50">
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
				value="#{alunoHandler.alunoAtual.curriculoLattes}" maxlength="50" />
		</h:panelGroup>
	</h:panelGrid></div>
	</fieldset>


	<fieldset><legend>Formação</legend> <h:panelGroup
		id="panelTitulacoes">

		<h:panelGroup rendered="#{!empty alunoHandler.alunoAtual.titulacao}">

			<div id="lista"><rich:dataTable var="titulacao"
				id="listaTitulacao" style="margin-left: 10px;"
				value="#{alunoHandler.alunoAtual.titulacao}"
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
					<div style="width: 200px;"><h:outputText
						value="#{titulacao.instituicao}" /></div>
				</rich:column>
				
				<rich:column>
					<f:facet name="header">
						<h:outputText value="Início"></h:outputText>
					</f:facet>
					<div style="width: 30px;"><h:outputText
						value="#{titulacao.inicio}" /></div>
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
						actionListener="#{alunoHandler.editarTitulacao}"
						oncomplete="jQuery('#dialogTitulacao').dialog('open')"
						reRender="novaTitulacao">
						<h:graphicImage value="../images/editar4.png"
							title="Editar Titulação" alt="Editar Titulação" width="17"
							height="17"></h:graphicImage>
						<f:attribute name="titulacao" value="#{titulacao}" />
					</a4j:commandLink> <a4j:commandLink ajaxSingle="true"
						actionListener="#{alunoHandler.removerTitulacao}"
						reRender="panelTitulacoes">
						<h:graphicImage value="../images/cancel2.jpg"
							title="Remover Titulação" alt="Remover Titulação" width="15"
							height="15"></h:graphicImage>
						<f:attribute name="titulacao" value="#{titulacao}" />
					</a4j:commandLink></div>
				</rich:column>

			</rich:dataTable></div>

		</h:panelGroup>
		<h:panelGroup rendered="#{empty alunoHandler.alunoAtual.titulacao}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhuma Titulação adicionada ao Aluno" /></li>
			</ul>
		</h:panelGroup>
	</h:panelGroup>
	<div style="margin-right: 5px;" align="right"><a4j:commandLink
		ajaxSingle="true" id="addTit"
		oncomplete="jQuery('#dialogTitulacao').dialog('open')"
		action="#{alunoHandler.novaTitulacao}" reRender="novaTitulacao">
		<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
	</a4j:commandLink></div>
	</fieldset>


	<fieldset><legend>Informações LIKA</legend>

	<div id="conteudoForm"><h:panelGrid columns="3" width="100%">



		<h:panelGroup>
			<h:outputLabel value="Instituição de Orígem:" for="instOrigem" />
			<br />
			<h:selectOneMenu id="instOrigem" style="width:280px;"
				value="#{alunoHandler.alunoAtual.instituicaoOrigem}"
				immediate="true">
				<f:selectItem itemLabel="Universidade Federal de Pernambuco"
					itemValue="Universidade Federal de Pernambuco" />
				<f:selectItem itemLabel="Outra" itemValue="Outra" />
				<a4j:support event="onchange" reRender="panelCentro"
					action="#{alunoHandler.mudarInstituicaoOrigem}" ajaxSingle="true" />
			</h:selectOneMenu>
		</h:panelGroup>



		<a4j:outputPanel id="panelCentro">
			<h:outputLabel value="Centro:" for="centro" />
			<br />
			<h:selectOneMenu id="centro"
				disabled="#{!alunoHandler.mostrarCentro}"
				value="#{alunoHandler.alunoAtual.departamento.idDepartamento}"
				valueChangeListener="#{alunoHandler.mudarDepartamento}"
				style="width:380px;">
				<f:selectItems value="#{alunoHandler.departamentos}" />
			</h:selectOneMenu>
		</a4j:outputPanel>



	</h:panelGrid> 
	
	<h:panelGrid columns="5" width="100%">


		<h:panelGroup>
			<h:outputLabel value="Data de Admissão:" for="calendario" />
			<br />
			<rich:calendar value="#{alunoHandler.alunoAtual.dataAdmissao}"
				id="calendario" datePattern="dd/MM/yyyy" showApplyButton="false"
				cellWidth="24px" cellHeight="22px" enableManualInput="true"
				requiredMessage="É necessário informar a Data da Solicitação"
				converterMessage="Data da Solicitação inválida!" />
		</h:panelGroup>


		<h:panelGroup id="panelCracha">
			<h:outputLabel value="Crachá:" for="cracha" />
			<br />
			<a4j:commandLink id="cracha" style="margin-left:5px;"
				value="#{alunoHandler.alunoAtual.cracha.numeroCracha}"
				rendered="#{alunoHandler.alunoAtual.cracha != null}"
				oncomplete="jQuery('#dialogCracha').dialog('open')"
				title="Editar Crachá" reRender="pCracha"
				action="#{alunoHandler.editarCracha}" immediate="true" />

			<a4j:commandLink style="margin-left:5px;"
				oncomplete="jQuery('#dialogCracha').dialog('open')"
				value="Novo Crachá" action="#{alunoHandler.novoCracha}"
				rendered="#{alunoHandler.alunoAtual.cracha == null}"
				reRender="pCracha" immediate="true" />

		</h:panelGroup>


		<h:panelGroup>
			<h:outputLabel value="Situação:" for="situacao" />
			<br />
			<h:selectOneMenu id="situacao" style="width:150px;"
				value="#{alunoHandler.alunoAtual.situacao}">
				<f:selectItem itemValue="em Atividade" itemLabel="em Atividade" />
				<f:selectItem itemValue="Desligado" itemLabel="Desligado" />
			</h:selectOneMenu>			
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Data de Desligamento:" for="calendario2" />
			<br />
			<rich:calendar value="#{alunoHandler.alunoAtual.dataDesligamento}"
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
				value="#{alunoHandler.alunoAtual.motivoDesligamento}" maxlength="200">
			</h:inputText>			
		</h:panelGroup>
	</h:panelGrid> 
	
	


	<div style="float: left; width: auto; margin-bottom: 5px;"><h:panelGroup
		id="panelOrientador">
		<h:outputLabel value="Orientador:" for="orientador" />
		<br />
		<a4j:commandLink id="orientador" style="margin-left:5px;"
			value="Adicionar Orientador"
			rendered="#{alunoHandler.alunoAtual.orientador == null}"
			onclick="jQuery('#dialogOrientador').dialog('open')"
			ajaxSingle="true" title="Adicionar Orientador" />

		<h:outputText style="margin-left:5px;"
			value="#{alunoHandler.alunoAtual.orientador.nome} - "
			rendered="#{alunoHandler.alunoAtual.orientador != null}" />


		<a4j:commandLink onclick="jQuery('#dialogOrientador').dialog('open')"
			value="Editar"
			rendered="#{alunoHandler.alunoAtual.orientador != null}" />

	</h:panelGroup></div>

	<h:panelGrid columns="1"
		style="float: left; width:auto; margin-left:50px;">

		<h:panelGroup>

			<h:outputLabel value="Bolsista:" for="bolsista" />
			<br />
			<h:selectOneRadio id="bolsista"
				value="#{alunoHandler.alunoAtual.possuiBolsa}">
				<f:selectItem itemLabel="Sim" itemValue="true" />
				<f:selectItem itemLabel="Não" itemValue="false" />
			</h:selectOneRadio>

		</h:panelGroup>
		<h:panelGrid columns="2">
			<h:panelGroup>
				<h:outputLabel value="Orígem Bolsa:" for="origem" />
				<br />
				<h:selectOneMenu id="origem"
					value="#{alunoHandler.alunoAtual.origemBolsa}">
					<f:selectItem itemLabel="Nenhuma" itemValue="Nenhuma" />
					<f:selectItem itemLabel="CNPQ" itemValue="CNPQ" />
					<f:selectItem itemLabel="Capes" itemValue="Capes" />
					<f:selectItem itemLabel="UFPE/Proacad" itemValue="UFPE/Proacad" />
					<f:selectItem itemLabel="FACEPE" itemValue="FACEPE" />
					<f:selectItem itemLabel="FINEPE" itemValue="FINEPE" />
					<f:selectItem itemLabel="UFPE/PROEXT" itemValue="UFPE/FINEPE" />
					<f:selectItem itemLabel="Outra" itemValue="Outra" />
				</h:selectOneMenu>

			</h:panelGroup>

			<h:panelGroup>
				<h:outputLabel value="Tipo da Bolsa:" for="tipo" />
				<br />
				<h:selectOneMenu id="tipo"
					value="#{alunoHandler.alunoAtual.tipoOrigemBolsa}">
					<f:selectItem itemLabel="Nenhuma" itemValue="Nenhuma" />
					<f:selectItem itemLabel="Estágio" itemValue="Estágio" />
					<f:selectItem itemLabel="Apoio Acadêmico"
						itemValue="Apoio Acadêmico" />
					<f:selectItem itemLabel="IC" itemValue="IC" />
					<f:selectItem itemLabel="Bolsista I" itemValue="Bolsista I" />
					<f:selectItem itemLabel="Bolsista DTI" itemValue="Bolsista DTI" />
					<f:selectItem itemLabel="Pós-Graduação" itemValue="Pós-Graduação" />
					<f:selectItem itemLabel="Outra" itemValue="Outra" />
				</h:selectOneMenu>
			</h:panelGroup>
			
			

	</fieldset>
			
		</h:panelGrid>
	</h:panelGrid></div>




	</fieldset>



	<fieldset><legend>Áreas de Pesquisa</legend> <h:panelGroup
		id="panelAreas">

		<h:panelGroup id="listaAreas"
			rendered="#{!empty alunoHandler.alunoAtual.areasPesquisa}">
			<div id="lista"><rich:dataList var="area"
				value="#{alunoHandler.alunoAtual.areasPesquisa}">

				<h:outputText value="#{area.nome}" styleClass="label" />
				<a4j:commandLink ajaxSingle="true"
					actionListener="#{alunoHandler.removerAreaDePesquisa}"
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
			rendered="#{empty alunoHandler.alunoAtual.areasPesquisa}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhuma Área de Pesquisa associada ao Aluno" /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup>

	<div style="margin-right: 5px;" align="right"><a4j:commandLink
	    ajaxSingle="true"
		onclick="jQuery('#dialogAreas').dialog('open')"
		action="#{areaHandler.listarSubAreaPorNome}"
		reRender="novaArea">
		<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
	</a4j:commandLink></div>
	</fieldset>


	<fieldset><legend>Laboratórios</legend> <h:panelGroup
		id="panelLaboratorios">

		<h:panelGroup
			rendered="#{!empty alunoHandler.alunoAtual.laboratorios}">


			<div id="lista"><rich:dataList
				value="#{alunoHandler.alunoAtual.laboratorios}" var="lab">
				<h:outputText value="#{lab.nome}" styleClass="label" />
				<a4j:commandLink ajaxSingle="true"
					actionListener="#{alunoHandler.removerLaboratorio}"
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
		<h:panelGroup rendered="#{empty alunoHandler.alunoAtual.laboratorios}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhum Laboratório associado ao Aluno" /></li>
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



	<fieldset><legend>Projetos</legend>

	<div id="lista"><h:panelGroup id="panelProjetos">

		<h:panelGroup
			rendered="#{!empty alunoHandler.projetosAdicionados || !empty alunoHandler.alunoAtual.projetosSimples}">


			<rich:dataList var="projeto" id="listaProjetos"
				value="#{alunoHandler.projetosAdicionados}">

				<h:outputText value="#{projeto.nome}" styleClass="label" />
				<a4j:commandLink ajaxSingle="true"
					actionListener="#{alunoHandler.removerProjetoCompleto}"
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
			</rich:dataList>


			<rich:dataList var="projeto" id="listaProjetosSimples"
				value="#{alunoHandler.alunoAtual.projetosSimples}"
				style="list-style-type: square">

				<h:outputText value="#{projeto.nome}" styleClass="label" />
				<a4j:commandLink ajaxSingle="true"
					actionListener="#{alunoHandler.removerProjetoSimples}"
					reRender="panelProjetosSimples">
					<h:graphicImage value="../images/cancel2.jpg"
						title="Remover Projeto" alt="Remover Projeto" width="15"
						height="15"></h:graphicImage>
					<f:attribute name="projeto" value="#{projeto}" />
				</a4j:commandLink>
				<br />
				<h:outputText value="Duração: #{projeto.duracao}" />
				<h:outputText value=" #{projeto.tipoDuracao} " />
				<h:outputText value=" - " />
				<h:outputText value=" Subprojeto: #{projeto.subprojeto}">
				</h:outputText>


				<br />
				<br />
			</rich:dataList>


		</h:panelGroup>
		<h:panelGroup
			rendered="#{empty alunoHandler.projetosAdicionados && empty alunoHandler.alunoAtual.projetosSimples}">
			<ul style="padding-left: 23px;">
				<li><h:outputText style="color:red"
					value="Nenhum tipo de Projeto associado." /></li>
			</ul>
		</h:panelGroup>

	</h:panelGroup></div>


	<div style="margin-right: 5px;" align="right"><a4j:commandLink
		ajaxSingle="true" hreflang="#" id="dialogProjetos_link"
		style="text-decoration: none"
		action="#{alunoHandler.adicionarProjeto}"
		onclick="jQuery('#dialogTipoProjeto').dialog('open')">
		<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
	</a4j:commandLink></div>
	
	


</f:subview>
</body>
</html>

