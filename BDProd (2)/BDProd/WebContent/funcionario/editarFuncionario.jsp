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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
<f:subview id="editarFuncionario">


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
			rendered="#{funcionarioHandler.funcionarioAtual.foto == null}" />


		<a4j:mediaOutput element="img" cacheable="false" session="false"
			createContent="#{funcionarioHandler.paint}" mimeType="image/jpeg"
			rendered="#{funcionarioHandler.funcionarioAtual.foto != null}" />
		<br />
		<div style="margin-left: 15px"><rich:fileUpload
			fileUploadListener="#{funcionarioHandler.listener}" id="Alterar"
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
				value="#{funcionarioHandler.funcionarioAtual.nome}" maxlength="80"
				required="true"
				requiredMessage="Campo Nome não pode estar em branco">

			</h:inputText>
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Ass. Publicação:" for="assPublicacao" />
			<br />
			<h:inputText id="assPublicacao" style="width:150px;"
				value="#{funcionarioHandler.funcionarioAtual.nomePublicacao}"
				maxlength="50" />
		</h:panelGroup>
	</h:panelGrid> <h:message for="nome" style="color:red;" /> <br />

	<h:panelGrid columns="6" width="90%">
		<h:panelGroup>
			<h:outputLabel value="CPF:" for="cpf" />
			<br />
			<h:inputText id="cpf" size="15"
				value="#{funcionarioHandler.funcionarioAtual.CPF}"
				onkeypress="mascara(this,cpf)" maxlength="14">
				<stella:validateCPF formatted="true" />

			</h:inputText>
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="RG:" for="rg" />
			<br />
			<h:inputText id="rg" size="10"
				value="#{funcionarioHandler.funcionarioAtual.RG}" maxlength="9"
				onkeypress="mascara(this,soNumeros)" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="UF:" for="uf" />
			<br />
			<h:selectOneMenu id="uf"
				value="#{funcionarioHandler.funcionarioAtual.uf}"
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
				value="#{funcionarioHandler.funcionarioAtual.orgaoExpedidor}"
				maxlength="8" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Nascimento:" for="nascimento" />
			<br />
			<h:inputText id="nascimento"
				value="#{funcionarioHandler.funcionarioAtual.nascimento}" size="12"
				maxlength="10" onkeypress="mascara(this,data)"
				converterMessage="Data no formato inválido. ex: 30/10/1987">
				<f:convertDateTime type="date" pattern="dd/MM/yyyy" />

			</h:inputText>
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Sexo:" for="sexo" />
			<br />
			<h:selectOneMenu id="sexo"
				value="#{funcionarioHandler.funcionarioAtual.sexo}"
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
			<h:outputLabel value="Nome do Pai:" for="nomePai" />
			<br />
			<h:inputText id="nomePai" style="width:350px;"
				value="#{funcionarioHandler.funcionarioAtual.filiacaoPai}"
				maxlength="80" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Nome da Mãe" for="nomeMae" />
			<br />
			<h:inputText id="nomeMae" style="width:350px;"
				value="#{funcionarioHandler.funcionarioAtual.filiacaoMae}"
				maxlength="80" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="2" width="95%">
		<h:panelGroup>
			<h:outputLabel value="Endereço:" for="endereco" />
			<br />
			<h:inputText id="endereco" style="width:600px;"
				value="#{funcionarioHandler.funcionarioAtual.endereco}"
				maxlength="80" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="CEP:" for="cep" />
			<br />
			<h:inputText id="cep" size="15"
				value="#{funcionarioHandler.funcionarioAtual.CEP}" maxlength="9"
				onkeypress="mascara(this,ceep)" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="3" width="80%">
		<h:panelGroup>
			<h:outputLabel value="Tel. Residencial:" for="telRes" />
			<br />
			<h:inputText id="dddRes" size="1" maxlength="2"
				value="#{funcionarioHandler.funcionarioAtual.dddResidencial}"
				onkeypress="mascara(this,soNumeros)" />
			<h:inputText id="telRes" size="10"
				value="#{funcionarioHandler.funcionarioAtual.telefone}"
				maxlength="9" onkeypress="mascara(this,telefone)" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Tel. Comercial:" for="telCom" />
			<br />
			<h:inputText id="dddCom" size="1" maxlength="2"
				value="#{funcionarioHandler.funcionarioAtual.dddComercial}"
				onkeypress="mascara(this,soNumeros)" />
			<h:inputText id="telCom" size="10"
				value="#{funcionarioHandler.funcionarioAtual.foneComercial }"
				maxlength="9" onkeypress="mascara(this,telefone)" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Celular:" for="telCom" />
			<br />
			<h:inputText id="dddCel" size="1" maxlength="2"
				value="#{funcionarioHandler.funcionarioAtual.dddCelular }"
				onkeypress="mascara(this,soNumeros)" />
			<h:inputText id="cel" size="10"
				value="#{funcionarioHandler.funcionarioAtual.celular}" maxlength="9"
				onkeypress="mascara(this,telefone)" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid width="80%">
		<h:panelGroup>
			<h:outputLabel value="Email:" for="email" />
			<br />
			<h:inputText id="email" size="60"
				value="#{funcionarioHandler.funcionarioAtual.email}" maxlength="50">
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
				value="#{funcionarioHandler.funcionarioAtual.curriculoLattes}"
				maxlength="50" />
		</h:panelGroup>
	</h:panelGrid></div>
	</fieldset>

	<fieldset><legend>Informações LIKA</legend>

	<div id="conteudoForm"><h:panelGrid columns="4" width="100%">


		<h:panelGrid columns="5" width="100%">

			<h:panelGroup>
				<h:outputLabel value="Data de Admissão:" for="calendario" />
				<br />
				<rich:calendar
					value="#{funcionarioHandler.funcionarioAtual.dataAdmissao}"
					id="calendario" datePattern="dd/MM/yyyy" showApplyButton="false"
					cellWidth="24px" cellHeight="22px" enableManualInput="true"
					requiredMessage="É necessário informar a Data da Solicitação"
					converterMessage="Data da Solicitação inválida!" />
			</h:panelGroup>

		</h:panelGrid>

		<h:panelGroup id="panelCracha">
			<h:outputLabel value="Crachá:" for="cracha" />
			<br />
			<a4j:commandLink id="cracha" style="margin-left:5px;"
				value="#{funcionarioHandler.funcionarioAtual.cracha.numeroCracha}"
				rendered="#{funcionarioHandler.funcionarioAtual.cracha != null}"
				oncomplete="jQuery('#dialogCracha').dialog('open')" immediate="true"
				title="Editar Crachá" reRender="pCracha"
				action="#{funcionarioHandler.editarCracha}" />

			<a4j:commandLink style="margin-left:5px;"
				oncomplete="jQuery('#dialogCracha').dialog('open')"
				value="Novo Crachá" action="#{funcionarioHandler.novoCracha}"
				rendered="#{funcionarioHandler.funcionarioAtual.cracha == null}"
				reRender="pCracha" immediate="true" />

		</h:panelGroup>


		<h:panelGroup>
			<h:outputLabel value="Situação:" for="situacao" />
			<br />
			<h:selectOneMenu id="situacao" style="width:150px;"
				value="#{funcionarioHandler.funcionarioAtual.situacao}">
				<f:selectItem itemValue="em Atividade" itemLabel="em Atividade" />
				<f:selectItem itemValue="Desligado" itemLabel="Desligado" />
			</h:selectOneMenu>
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Data de Desligamento:" for="calendario2" />
			<br />
			<rich:calendar
				value="#{funcionarioHandler.funcionarioAtual.dataDesligamento}"
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
				value="#{funcionarioHandler.funcionarioAtual.motivoDesligamento}" maxlength="200">
			</h:inputText>			
		</h:panelGroup>
	</h:panelGrid> 
	
	 <h:panelGroup id="panelFuncao">
		<h:outputLabel value="Função: " for="funcao" />
		<br />
		<a4j:commandLink id="funcao" value="Adicionar Função"
			rendered="#{funcionarioHandler.funcionarioAtual.funcao == null}"
			onclick="jQuery('#dialogFuncao').dialog('open')" ajaxSingle="true"
			title="Adicionar Função" />

		<h:outputText
			value="#{funcionarioHandler.funcionarioAtual.funcao.nome} - "
			rendered="#{funcionarioHandler.funcionarioAtual.funcao != null}" />


		<a4j:commandLink onclick="jQuery('#dialogFuncao').dialog('open')"
			value="Editar"
			rendered="#{funcionarioHandler.funcionarioAtual.funcao != null}" />


	</h:panelGroup></div>
	</fieldset>
</f:subview>
</body>
</html>

