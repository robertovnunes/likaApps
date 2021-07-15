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






</head>
<body>
<f:subview id="editarUsuario">


	<div id="panelConfirmacao" align="center"><h:outputText
		style="color:red;"
		value="Alguns Campos Obrigatórios não Foram Preenchidos Corretamente!"
		rendered="#{facesContext.maximumSeverity.ordinal==2}" /> <br />
	<br />
	<h:messages style="color:red;" layout="table"></h:messages></div>




	<fieldset><legend>Informações Gerais</legend>

	<div id="conteudoForm"><h:panelGrid columns="1">
		<h:panelGroup>
			<h:outputLabel value="Login:" />
			<br />
			<h:inputText required="true" style="width:143px;" id="login"
				maxlength="20" value="#{usuarioHandler.novoUsuario.login}"
				requiredMessage="Campo Login é obrigatório!" />

		</h:panelGroup>

		<h:panelGroup>
			<h:outputText value="Senha Antiga:" />
			<br />
			<h:inputSecret required="true" style="width:143px;" maxlength="20"
				value="#{usuarioHandler.novoUsuario.senhaAntiga}"
				requiredMessage="Campo Senha Antiga é obrigatório!" />

		</h:panelGroup>


		<h:panelGroup>
			<h:outputText value="Nova Senha:" />
			<br />
			<h:inputSecret required="true" style="width:143px;" maxlength="20"
				value="#{usuarioHandler.novoUsuario.senha}"
				requiredMessage="Campo Nova Senha é obrigatório!" />

		</h:panelGroup>

		<h:panelGroup>
			<h:outputText value="Confirmação da Senha:" />
			<br />
			<h:inputSecret required="true" style="width:143px;" maxlength="20"
				value="#{usuarioHandler.novoUsuario.confirmacaoSenha}"
				requiredMessage="Campo Confirmação Senha é obrigatório!" />

		</h:panelGroup>



		<h:panelGroup>
			<h:outputLabel value="Perfil:" for="perfil" />
			<br />
			<h:selectOneMenu id="perfil"
				value="#{usuarioHandler.novoUsuario.perfil}" immediate="true">
				<f:selectItem itemValue="Administrativo" itemLabel="Administrativo" />
				<f:selectItem itemValue="Pesquisador" itemLabel="Pesquisador" />
				<a4j:support event="onchange" reRender="panelResponsavel"
					action="#{usuarioHandler.acao}" ajaxSingle="true" />
			</h:selectOneMenu>
		</h:panelGroup>



		<a4j:outputPanel id="panelResponsavel">
			<h:panelGroup
				rendered="#{usuarioHandler.novoUsuario.perfil == 'Pesquisador'}">
				<h:outputLabel value="Pesquisador Associado ao Usuário:" />
				<br />
				<h:outputText styleClass="visualizar_texto"
					value="#{usuarioHandler.novoUsuario.pessoa.nome}"
					rendered="#{usuarioHandler.novoUsuario.pessoa!= null}" />

				<h:outputText style="color:red; margin-left:3px;"
					value="Nenhum Pesquisador associado."
					rendered="#{usuarioHandler.novoUsuario.pessoa == null}" />

				<a4j:commandLink ajaxSingle="true" style="margin-top:3px;"
					rendered="#{usuarioHandler.novoUsuario.pessoa != null}"
					actionListener="#{usuarioHandler.removerPesquisador}"
					reRender="panelResponsavel">
					<h:graphicImage value="../images/cancel2.jpg"
						title="Remover Pesquisador" alt="Remover Pesquisador" width="15"
						height="15"></h:graphicImage>
				</a4j:commandLink>


				<br />
				<a4j:commandLink ajaxSingle="true" style="margin-left:3px;"
					rendered="#{usuarioHandler.novoUsuario.pessoa == null}"
					onclick="jQuery('#dialogResponsavel').dialog('open')">
					<h:graphicImage value="../css/images/adicionar.png"></h:graphicImage>
				</a4j:commandLink>

			</h:panelGroup>
		</a4j:outputPanel>







	</h:panelGrid></div>

	</fieldset>




</f:subview>
</body>
</html>

