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
</head>
<body>
<f:subview id="visualizarFuncionario">





	<fieldset><legend>Informações Gerais</legend>

	<div
		style="float: left; width: 90px; margin-right: 40px; margin-top: 10px;">

	<h:graphicImage value="../images/foto.gif" width="120px" height="150px"
		rendered="#{funcionarioHandler.funcionarioAtual.foto == null}" /> <a4j:mediaOutput
		element="img" cacheable="false" session="false"
		createContent="#{funcionarioHandler.paint}" mimeType="image/jpeg"
		rendered="#{funcionarioHandler.funcionarioAtual.foto != null}" /><br />

	</div>

	<div style="float: left; width: 780px; margin-top: 10px;"><h:panelGrid
		columns="2" width="100%">
		<h:panelGroup>
			<h:outputLabel value="Nome:" for="nome" />

			<h:outputText id="nome"
				value="#{funcionarioHandler.funcionarioAtual.nome}"
				styleClass="visualizar_texto" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Ass. Publicação:" for="assPublicacao" />
			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{funcionarioHandler.funcionarioAtual.nomePublicacao == ''}" />

			<h:outputText id="assPublicacao"
				value="#{funcionarioHandler.funcionarioAtual.nomePublicacao}"
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.nomePublicacao != ''}" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="6" width="90%">
		<h:panelGroup>
			<h:outputLabel value="CPF:" for="cpf" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{funcionarioHandler.funcionarioAtual.CPF == ''}" />

			<h:outputText id="cpf"
				value="#{funcionarioHandler.funcionarioAtual.CPF}"
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.CPF != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="RG:" for="rg" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{funcionarioHandler.funcionarioAtual.RG == ''}" />

			<h:outputText id="rg"
				value="#{funcionarioHandler.funcionarioAtual.RG}"
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.RG != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="UF:" for="uf" />

			<h:outputText id="uf"
				value="#{funcionarioHandler.funcionarioAtual.uf}"
				styleClass="visualizar_texto" />

		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Órgão Expedidor" for="orgao" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{funcionarioHandler.funcionarioAtual.orgaoExpedidor == ''}" />

			<h:outputText id="orgao"
				value="#{funcionarioHandler.funcionarioAtual.orgaoExpedidor}"
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.orgaoExpedidor != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Nascimento:" for="nascimento" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{funcionarioHandler.funcionarioAtual.nascimento == null}" />

			<h:outputText id="nascimento"
				value="#{funcionarioHandler.funcionarioAtual.nascimento}"
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.nascimento != null}">
				<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
			</h:outputText>
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Sexo:" for="sexo" />

			<h:outputText id="sexo"
				value="#{funcionarioHandler.funcionarioAtual.sexo}"
				styleClass="visualizar_texto" />
		</h:panelGroup>

	</h:panelGrid> <h:panelGrid columns="2" width="100%">
		<h:panelGroup>
			<h:outputLabel value="Nome do Pai:" for="nomePai" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{funcionarioHandler.funcionarioAtual.filiacaoPai == ''}" />

			<h:outputText id="nomePai"
				value="#{funcionarioHandler.funcionarioAtual.filiacaoPai}"
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.filiacaoPai != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Nome da Mãe:" for="nomeMae" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{funcionarioHandler.funcionarioAtual.filiacaoMae == ''}" />

			<h:outputText id="nomeMae"
				value="#{funcionarioHandler.funcionarioAtual.filiacaoMae}"
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.filiacaoMae != ''}" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="2" width="95%">
		<h:panelGroup>
			<h:outputLabel value="Endereço:" for="endereco" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{funcionarioHandler.funcionarioAtual.endereco == ''}" />


			<h:outputText id="endereco"
				value="#{funcionarioHandler.funcionarioAtual.endereco}"
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.endereco != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="CEP:" for="cep" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{funcionarioHandler.funcionarioAtual.endereco == ''}" />

			<h:outputText id="cep"
				value="#{funcionarioHandler.funcionarioAtual.CEP}"
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.endereco != ''}" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="3" width="80%">
		<h:panelGroup>
			<h:outputLabel value="Tel. Residencial:" for="telRes" />

			<h:outputText value=" - " styleClass="nao_informado"
				rendered="#{funcionarioHandler.funcionarioAtual.telefone == '' }" />

			<h:outputText id="dddRes"
				value="(#{ funcionarioHandler.funcionarioAtual.dddResidencial}) "
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.telefone != '' }" />
			<h:outputText id="telRes"
				value="#{funcionarioHandler.funcionarioAtual.telefone}"
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.telefone != '' }" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Tel. Comercial:" for="telCom" />

			<h:outputText value=" - " styleClass="nao_informado"
				rendered="#{funcionarioHandler.funcionarioAtual.foneComercial == '' }" />

			<h:outputText id="dddCom"
				value="(#{funcionarioHandler.funcionarioAtual.dddComercial})"
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.foneComercial != ''}" />


			<h:outputText id="telCom"
				value="#{funcionarioHandler.funcionarioAtual.foneComercial}"
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.foneComercial != '' }" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Celular:" for="telCom" />

			<h:outputText value=" - " styleClass="nao_informado"
				rendered="#{funcionarioHandler.funcionarioAtual.celular == '' }" />


			<h:outputText id="dddCel"
				value="(#{funcionarioHandler.funcionarioAtual.dddCelular}) "
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.celular != '' }" />
			<h:outputText id="cel"
				value="#{funcionarioHandler.funcionarioAtual.celular}"
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.celular != '' }" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid width="80%">
		<h:panelGroup>
			<h:outputLabel value="Email:" for="email" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{funcionarioHandler.funcionarioAtual.email == ''}" />

			<h:outputText id="email"
				value="#{funcionarioHandler.funcionarioAtual.email}"
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.email != ''}" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid width="80%">
		<h:panelGroup>
			<h:outputLabel value="Currículo Lattes:" for="lattes" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{funcionarioHandler.funcionarioAtual.curriculoLattes == ''}" />


			<h:outputText id="lattes"
				value="#{funcionarioHandler.funcionarioAtual.curriculoLattes}"
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.curriculoLattes != ''}" />
		</h:panelGroup>
	</h:panelGrid></div>
	</fieldset>





	<fieldset><legend>Informaões LIKA</legend>

	<div id="conteudoForm"><h:panelGrid columns="5" width="100%">

		<h:panelGroup>
			<h:outputLabel value="Data de Admissão:" for="calendario" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{funcionarioHandler.funcionarioAtual.dataAdmissao == null}" />

			<h:outputText id="calendario"
				value="#{funcionarioHandler.funcionarioAtual.dataAdmissao}"
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.dataAdmissao != null}">
				<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
			</h:outputText>

		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Crachá:" for="cracha" />
			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{funcionarioHandler.funcionarioAtual.cracha == null}" />


			<h:outputText id="cracha"
				value="#{funcionarioHandler.funcionarioAtual.cracha.numeroCracha}"
				styleClass="visualizar_texto" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Situação:" for="situacao" />

			<h:outputText id="situacao"
				value="#{funcionarioHandler.funcionarioAtual.situacao}"
				styleClass="visualizar_texto">
			</h:outputText>
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Data de Desligamento:" for="calendario2" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{funcionarioHandler.funcionarioAtual.dataDesligamento == null}" />

			<h:outputText id="calendario2"
				value="#{funcionarioHandler.funcionarioAtual.dataDesligamento}"
				styleClass="visualizar_texto"
				rendered="#{funcionarioHandler.funcionarioAtual.dataDesligamento != null}">
				<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
			</h:outputText>

		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="1">

		<h:panelGroup>
			<h:outputLabel value="Funcao: " for="orientador" />
			<h:outputText
				value="#{funcionarioHandler.funcionarioAtual.funcao.nome}"
				rendered="#{funcionarioHandler.funcionarioAtual.funcao != null}"
				styleClass="visualizar_texto" />

			<h:outputText id="orientador" value="Não informado"
				styleClass="nao_informado"
				rendered="#{funcionarioHandler.funcionarioAtual.funcao == null}" />
		</h:panelGroup>
	</h:panelGrid></div>
	</fieldset>
</f:subview>
</body>
</html>

