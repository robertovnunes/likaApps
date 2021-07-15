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
<f:subview id="editarBolsista">


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
			rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.foto == null}" />


		<a4j:mediaOutput element="img" cacheable="false" session="false"
			createContent="#{bolsistaProjetoHandler.paint}" mimeType="image/jpeg"
			rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.foto != null}" />
		<br />
		<div style="margin-left: 15px"><rich:fileUpload
			fileUploadListener="#{bolsistaProjetoHandler.listener}" id="Alterar"
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
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.nome}"
				maxlength="80" required="true"
				requiredMessage="Campo Nome não pode estar em branco">

			</h:inputText>
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Ass. Publicação:" for="assPublicacao" />
			<br />
			<h:inputText id="assPublicacao" style="width:150px;"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.nomePublicacao}"
				maxlength="50" />
		</h:panelGroup>
	</h:panelGrid> <h:message for="nome" style="color:red;" /> <h:panelGrid columns="6"
		width="90%">
		<h:panelGroup>
			<h:outputLabel value="CPF:" for="cpf" />
			<br />
			<h:inputText id="cpf" size="15"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.CPF}"
				onkeypress="mascara(this,cpf)" maxlength="14">
				<stella:validateCPF formatted="true" />

			</h:inputText>
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="RG:" for="rg" />
			<br />
			<h:inputText id="rg" size="10"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.RG}"
				maxlength="9" onkeypress="mascara(this,soNumeros)" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="UF:" for="uf" />
			<br />
			<h:selectOneMenu id="uf"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.uf}"
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
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.orgaoExpedidor}"
				maxlength="8" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Nascimento:" for="nascimento" />
			<br />
			<h:inputText id="nascimento"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.nascimento}"
				size="12" maxlength="10" onkeypress="mascara(this,data)"
				converterMessage="Data no formato inválido. ex: 30/10/1987">
				<f:convertDateTime type="date" pattern="dd/MM/yyyy" />


			</h:inputText>
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Sexo:" for="sexo" />
			<br />
			<h:selectOneMenu id="sexo"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.sexo}"
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
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.filiacaoPai}"
				maxlength="80" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Nome da Mãe" for="nomeMae" />
			<br />
			<h:inputText id="nomeMae" style="width:350px;"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.filiacaoMae}"
				maxlength="80" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="2" width="95%">
		<h:panelGroup>
			<h:outputLabel value="Endereço:" for="endereco" />
			<br />
			<h:inputText id="endereco" style="width:600px;"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.endereco}"
				maxlength="80" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="CEP:" for="cep" />
			<br />
			<h:inputText id="cep" size="15"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.CEP}"
				maxlength="9"
				onkeypress="mascara(this,ceep)" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="3" width="80%">
		<h:panelGroup>
			<h:outputLabel value="Tel. Residencial:" for="telRes" />
			<br />
			<h:inputText id="dddRes" size="1" maxlength="2"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.dddResidencial}"
				onkeypress="mascara(this,soNumeros)" />
			<h:inputText id="telRes" size="10"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.telefone}"
				maxlength="9" onkeypress="mascara(this,telefone)" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Tel. Comercial:" for="telCom" />
			<br />
			<h:inputText id="dddCom" size="1" maxlength="2"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.dddComercial}"
				onkeypress="mascara(this,soNumeros)" />
			<h:inputText id="telCom" size="10"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.foneComercial }"
				maxlength="9" onkeypress="mascara(this,telefone)" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Celular:" for="telCom" />
			<br />
			<h:inputText id="dddCel" size="1" maxlength="2"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.dddCelular }"
				onkeypress="mascara(this,soNumeros)" />
			<h:inputText id="cel" size="10"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.celular}"
				maxlength="9" onkeypress="mascara(this,telefone)" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid width="80%">
		<h:panelGroup>
			<h:outputLabel value="Email:" for="email" />
			<br />
			<h:inputText id="email" size="60"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.email}"
				maxlength="50">
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
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.curriculoLattes}"
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
					value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.dataAdmissao}"
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
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.cracha.numeroCracha}"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.cracha != null}"
				oncomplete="jQuery('#dialogCracha').dialog('open')"
				ajaxSingle="true" title="Editar Crachá" reRender="pCracha"
				action="#{bolsistaProjetoHandler.editarCracha}" immediate="true" />

			<a4j:commandLink style="margin-left:5px;"
				oncomplete="jQuery('#dialogCracha').dialog('open')"
				value="Novo Crachá" action="#{bolsistaProjetoHandler.novoCracha}"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.cracha == null}"
				reRender="pCracha" immediate="true" />

		</h:panelGroup>



		<h:panelGroup>
			<h:outputLabel value="Situação:" for="situacao" />
			<br />
			<h:selectOneMenu id="situacao" style="width:150px;"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.situacao}">
				<f:selectItem itemValue="em Atividade" itemLabel="em Atividade" />
				<f:selectItem itemValue="Desligado" itemLabel="Desligado" />
			</h:selectOneMenu>
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Data de Desligamento:" for="calendario2" />
			<br />
			<rich:calendar
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.dataDesligamento}"
				id="calendario2" datePattern="dd/MM/yyyy" showApplyButton="false"
				cellWidth="24px" cellHeight="22px" enableManualInput="true"
				requiredMessage="É necessário informar a Data da Solicitação"
				converterMessage="Data da Solicitação inválida!" />
		</h:panelGroup>



	</h:panelGrid> <h:panelGrid columns="3" width="506">


		<h:panelGroup>
			<h:outputLabel value="Orígem Bolsa:" for="origem" />
			<br />
			<h:selectOneMenu id="origem"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.origemBolsa}">
				<f:selectItem itemLabel="Nenhuma" itemValue="Nenhuma" />
				<f:selectItem itemLabel="CNPQ" itemValue="CNPQ" />
				<f:selectItem itemLabel="Capes" itemValue="Capes" />
				<f:selectItem itemLabel="Proacad" itemValue="Proacad" />
				<f:selectItem itemLabel="FACEPE" itemValue="FACEPE" />
				<f:selectItem itemLabel="FINEPE" itemValue="FINEPE" />
				<f:selectItem itemLabel="Outra" itemValue="Outra" />
			</h:selectOneMenu>

		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Tipo da Bolsa:" for="tipo" />
			<br />
			<h:selectOneMenu id="tipo"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.tipoBolsa}">
				<f:selectItem itemLabel="Nenhuma" itemValue="Nenhuma" />
				<f:selectItem itemLabel="Bolsista I" itemValue="Bolsista I" />
				<f:selectItem itemLabel="Bolsista DTI" itemValue="Bolsista DTI" />
				<f:selectItem itemLabel="Outra" itemValue="Outra" />
			</h:selectOneMenu>
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Valor da Bolsa:" for="valor" />
			<br />
			<h:inputText id="valor"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.valorBolsa}"
				size="10"></h:inputText>

		</h:panelGroup>


	</h:panelGrid></div>
	</fieldset>
</f:subview>
</body>
</html>

