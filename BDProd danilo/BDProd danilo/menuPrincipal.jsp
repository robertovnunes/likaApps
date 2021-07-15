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

</head>
<body>
<f:subview id="menuPrincipal">
	<h:form>

		<div id="menu">
		<ul id="main">
			<li><rich:dropDownMenu direction="bottom-right"
				style="margin-top: -5px;" labelClass="teste">
				<f:facet name="label">
					<h:panelGroup>
						<h:outputText
							style="height: 30px; margin: 0; padding: 20px 15px 0 15px;
                                                      font-family: Arial, Helvetica, sans-serif;
                                                      font-size: 13px;
                                                      font-weight: normal;
                                                      color: #FFFFFF;"
							value="Pessoas" />
					</h:panelGroup>
				</f:facet>
				<rich:menuItem submitMode="ajax">
					<h:commandLink style="color: #737373;" value="Pesquisadores"
						action="#{sessionHandler.navigation.inicioPesquisador}">
					</h:commandLink>
				</rich:menuItem>
				<rich:menuSeparator id="menuSeparator" />
				<rich:menuItem submitMode="ajax">
					<h:commandLink style="color: #737373;" value="Alunos"
						action="#{sessionHandler.navigation.inicioAluno}">
					</h:commandLink>
				</rich:menuItem>
				<rich:menuSeparator id="menuSeparator2" />
				<rich:menuItem submitMode="ajax">
					<h:commandLink style="color: #737373;" value="Funcionários"
						action="#{sessionHandler.navigation.inicioFuncionario}">
					</h:commandLink>
				</rich:menuItem>

				<rich:menuSeparator id="menuSeparator3" />
				<rich:menuItem submitMode="ajax">
					<h:commandLink style="color: #737373;" value="Bolsistas"
						action="#{sessionHandler.navigation.inicioBolsista}">
					</h:commandLink>
				</rich:menuItem>
				<rich:menuSeparator id="menuSeparator4" />
				<rich:menuItem submitMode="ajax">
					<h:commandLink style="color: #737373;" value="Listar Emails"
						action="#{sessionHandler.navigation.relatorioEmail}" >
					</h:commandLink>
				</rich:menuItem>
				


			</rich:dropDownMenu></li>
			<li><rich:dropDownMenu direction="bottom-right"
				style="margin-top: -5px;" labelClass="teste">
				<f:facet name="label">
					<h:panelGroup>
						<h:outputText
							style="height: 30px; margin: 0; padding: 20px 15px 0 15px;
							background: url(../images/img06.gif) no-repeat left 24px;
                                                      font-family: Arial, Helvetica, sans-serif;
                                                      font-size: 13px;
                                                      font-weight: normal;
                                                      color: #FFFFFF;"
							value="Área de Pesquisa" />
					</h:panelGroup>
				</f:facet>
				<rich:menuItem submitMode="ajax">
					<h:commandLink style="color: #737373;" value="Área de Pesquisa"
						action="#{sessionHandler.navigation.inicioArea}">
					</h:commandLink>
				</rich:menuItem>
				<rich:menuSeparator />
				<rich:menuItem submitMode="ajax">
					<h:commandLink style="color: #737373;" value="Sub-área de Pesquisa"
						action="#{sessionHandler.navigation.inicioSubArea}">
					</h:commandLink>
				</rich:menuItem>
			</rich:dropDownMenu></li>
			<li><h:commandLink value="Equipamentos" styleClass="item"
				action="#{sessionHandler.navigation.inicioEquipamento}" /></li>
			<li><h:commandLink value="Laboratórios" styleClass="item"
				action="#{sessionHandler.navigation.inicioLab}" /></li>
			<li><h:commandLink value="Projetos" styleClass="item"
				action="#{sessionHandler.navigation.inicioProjeto}" /></li>
			<li><rich:dropDownMenu direction="bottom-right"
				style="margin-top: -5px;" labelClass="teste">
				<f:facet name="label">
					<h:panelGroup>
						<h:outputText
							style="height: 30px; margin: 0; padding: 20px 15px 0 15px;
                                                      font-family: Arial, Helvetica, sans-serif;
                                                      background: url(../images/img06.gif) no-repeat left 24px;
                                                      font-size: 13px;
                                                      font-weight: normal;
                                                      color: #FFFFFF;"
							value="Produções Científicas" />
					</h:panelGroup>
				</f:facet>
				<rich:menuItem submitMode="ajax">
					<h:commandLink style="color: #737373;" value="Periódico"
						action="#{sessionHandler.navigation.inicioPeriodico}"
						actionListener="#{publicacaoHandler.tipoDaPublicacao}">
						<f:attribute name="tipoPublicacao" value="Periódico" />
					</h:commandLink>
				</rich:menuItem>
				<rich:menuSeparator />
				<rich:menuItem submitMode="ajax">
					<h:commandLink style="color: #737373;" value="Anais de Eventos"
						action="#{sessionHandler.navigation.inicioAnais}"
						actionListener="#{publicacaoHandler.tipoDaPublicacao}">
						<f:attribute name="tipoPublicacao" value="Anais de Eventos" />
					</h:commandLink>
				</rich:menuItem>
				<rich:menuSeparator />
				<rich:menuItem submitMode="ajax">
					<h:commandLink style="color: #737373;" value="Livro"
						action="#{sessionHandler.navigation.inicioLivro}"
						actionListener="#{publicacaoHandler.tipoDaPublicacao}">
						<f:attribute name="tipoPublicacao" value="Livro" />
					</h:commandLink>
				</rich:menuItem>

				<rich:menuSeparator />
				<rich:menuItem submitMode="ajax">
					<h:commandLink style="color: #737373;" value="Relatórios"
						action="#{sessionHandler.navigation.inicioRelatoriosPublicacao}" />


				</rich:menuItem>

			</rich:dropDownMenu></li>
			<li><h:commandLink value="Grupo de Pesquisa" styleClass="item"
				action="#{sessionHandler.navigation.inicioGrupo}" /></li>
			<li><rich:dropDownMenu direction="bottom-right"
				style="margin-top: -5px;" labelClass="teste">
				<f:facet name="label">
					<h:panelGroup>
						<h:outputText
							style="height: 30px; margin: 0; padding: 15px 5px 0 5px;
							background: url(../images/img06.gif) no-repeat left 24px;
                                                      font-family: Arial, Helvetica, sans-serif;
                                                      font-size: 13px;
                                                      font-weight: normal;
                                                      color: #FFFFFF;"
							value="Administração" />
					</h:panelGroup>
				</f:facet>
				<rich:menuItem submitMode="ajax">
					<h:commandLink style="color: #737373;" value="Usuários"
						action="#{sessionHandler.navigation.inicioUsuario}">
					</h:commandLink>
				</rich:menuItem>
				<rich:menuSeparator />
				<rich:menuItem submitMode="ajax">
					<h:commandLink style="color: #737373;" value="Função"
						action="#{sessionHandler.navigation.inicioFuncao}">
					</h:commandLink>
				</rich:menuItem>

				<rich:menuSeparator />

				<rich:menuItem submitMode="ajax">
					<h:commandLink style="color: #737373;" value="Departamentos"
						action="#{sessionHandler.navigation.inicioDepartamento}">
					</h:commandLink>
				</rich:menuItem>

			</rich:dropDownMenu></li>
		</ul>


		<div class="localizacao" align="center">

		<div style="width: 90%; padding-top: 2px;" align="right"><h:outputLabel
			value="Bem-vindo, "
			style=" font-family: helvetica, 'Trebuchet MS', arial, sans-serif; font-size: 12px; font-weight: bold; color: #737373;"></h:outputLabel>
		<h:outputLabel value="#{sessionHandler.usuario.login}  - "
			style=" font-family: helvetica, 'Trebuchet MS', arial, sans-serif; font-size: 12px; font-weight: bold; color: #737373;"></h:outputLabel>
		<h:commandLink value="Sair" action="#{sessionHandler.logout}"
			style="font-family: Arial, Helvetica, sans-serif;
                                                      font-size: 12px;
                                                      font-weight: normal;
                                                      color: #737373;"></h:commandLink>


		</div>

		<h:outputText id="localizacao"
			value="#{sessionHandler.navigation.localizacao}"
			style=" font-family: helvetica, 'Trebuchet MS', arial, sans-serif; font-size: 13px; font-weight: bold; color: #737373;" />
		</div>
		</div>

	</h:form>





</f:subview>
</body>
</html>

