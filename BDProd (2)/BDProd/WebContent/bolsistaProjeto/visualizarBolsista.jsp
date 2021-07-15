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
<f:subview id="visualizarBolsista">





	<fieldset><legend>Informações Gerais</legend>

	<div
		style="float: left; width: 90px; margin-right: 40px; margin-top: 10px;">

	<h:graphicImage value="../images/foto.gif" width="120px" height="150px"
		rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.foto == null}" />
	<a4j:mediaOutput element="img" cacheable="false" session="false"
		createContent="#{funcionarioHandler.paint}" mimeType="image/jpeg"
		rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.foto != null}" /><br />

	</div>

	<div style="float: left; width: 780px; margin-top: 10px;"><h:panelGrid
		columns="2" width="100%">
		<h:panelGroup>
			<h:outputLabel value="Nome:" for="nome" />

			<h:outputText id="nome"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.nome}"
				styleClass="visualizar_texto" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Ass. Publicação:" for="assPublicacao" />
			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.nomePublicacao == ''}" />

			<h:outputText id="assPublicacao"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.nomePublicacao}"
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.nomePublicacao != ''}" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="6" width="90%">
		<h:panelGroup>
			<h:outputLabel value="CPF:" for="cpf" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.CPF == ''}" />

			<h:outputText id="cpf"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.CPF}"
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.CPF != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="RG:" for="rg" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.RG == ''}" />

			<h:outputText id="rg"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.RG}"
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.RG != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="UF:" for="uf" />

			<h:outputText id="uf"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.uf}"
				styleClass="visualizar_texto" />

		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Órgão Expedidor" for="orgao" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.orgaoExpedidor == ''}" />

			<h:outputText id="orgao"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.orgaoExpedidor}"
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.orgaoExpedidor != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Nascimento:" for="nascimento" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.nascimento == null}" />

			<h:outputText id="nascimento"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.nascimento}"
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.nascimento != null}">
				<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
			</h:outputText>
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Sexo:" for="sexo" />

			<h:outputText id="sexo"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.sexo}"
				styleClass="visualizar_texto" />
		</h:panelGroup>

	</h:panelGrid> <h:panelGrid columns="2" width="100%">
		<h:panelGroup>
			<h:outputLabel value="Nome do Pai:" for="nomePai" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.filiacaoPai == ''}" />

			<h:outputText id="nomePai"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.filiacaoPai}"
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.filiacaoPai != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Nome da Mãe:" for="nomeMae" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.filiacaoMae == ''}" />

			<h:outputText id="nomeMae"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.filiacaoMae}"
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.filiacaoMae != ''}" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="2" width="95%">
		<h:panelGroup>
			<h:outputLabel value="Endereço:" for="endereco" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.endereco == ''}" />


			<h:outputText id="endereco"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.endereco}"
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.endereco != ''}" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="CEP:" for="cep" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.endereco == ''}" />

			<h:outputText id="cep"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.CEP}"
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.endereco != ''}" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="3" width="80%">
		<h:panelGroup>
			<h:outputLabel value="Tel. Residencial:" for="telRes" />

			<h:outputText value=" - " styleClass="nao_informado"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.telefone == '' }" />

			<h:outputText id="dddRes"
				value="(#{ bolsistaProjetoHandler.bolsistaProjetoAtual.dddResidencial}) "
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.telefone != '' }" />
			<h:outputText id="telRes"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.telefone}"
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.telefone != '' }" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Tel. Comercial:" for="telCom" />

			<h:outputText value=" - " styleClass="nao_informado"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.foneComercial == '' }" />

			<h:outputText id="dddCom"
				value="(#{bolsistaProjetoHandler.bolsistaProjetoAtual.dddComercial})"
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.foneComercial != ''}" />


			<h:outputText id="telCom"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.foneComercial}"
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.foneComercial != '' }" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Celular:" for="telCom" />

			<h:outputText value=" - " styleClass="nao_informado"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.celular == '' }" />


			<h:outputText id="dddCel"
				value="(#{bolsistaProjetoHandler.bolsistaProjetoAtual.dddCelular}) "
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.celular != '' }" />
			<h:outputText id="cel"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.celular}"
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.celular != '' }" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid width="80%">
		<h:panelGroup>
			<h:outputLabel value="Email:" for="email" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.email == ''}" />

			<h:outputText id="email"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.email}"
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.email != ''}" />
		</h:panelGroup>
	</h:panelGrid> <h:panelGrid width="80%">
		<h:panelGroup>
			<h:outputLabel value="Currículo Lattes:" for="lattes" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.curriculoLattes == ''}" />


			<h:outputText id="lattes"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.curriculoLattes}"
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.curriculoLattes != ''}" />
		</h:panelGroup>
	</h:panelGrid></div>
	</fieldset>





	<fieldset><legend>Informaões LIKA</legend>

	<div id="conteudoForm"><h:panelGrid columns="5" width="100%">

		<h:panelGroup>
			<h:outputLabel value="Data de Admissão:" for="calendario" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.dataAdmissao == null}" />

			<h:outputText id="calendario"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.dataAdmissao}"
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.dataAdmissao != null}">
				<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
			</h:outputText>

		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Crachá:" for="cracha" />
			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.cracha == null}" />


			<h:outputText id="cracha"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.cracha.numeroCracha}"
				styleClass="visualizar_texto" />
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Situação:" for="situacao" />

			<h:outputText id="situacao"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.situacao}"
				styleClass="visualizar_texto">
			</h:outputText>
		</h:panelGroup>
		<h:panelGroup>
			<h:outputLabel value="Data de Desligamento:" for="calendario2" />

			<h:outputText value="Não informado" styleClass="nao_informado"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.dataDesligamento == null}" />

			<h:outputText id="calendario2"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.dataDesligamento}"
				styleClass="visualizar_texto"
				rendered="#{bolsistaProjetoHandler.bolsistaProjetoAtual.dataDesligamento != null}">
				<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
			</h:outputText>

		</h:panelGroup>
	</h:panelGrid> <h:panelGrid columns="4" width="506">


		<h:panelGroup>
			<h:outputLabel value="Orígem Bolsa:" for="origem" />


			<h:outputText id="origem"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.origemBolsa}"
				styleClass="visualizar_texto" />

		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Tipo da Bolsa:" for="tipo" />

			<h:outputText id="tipo"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.tipoBolsa}"
				styleClass="visualizar_texto" />
		</h:panelGroup>

		<h:panelGroup>
			<h:outputLabel value="Valor:" for="tipo" />

			<h:outputText id="valor"
				value="#{bolsistaProjetoHandler.bolsistaProjetoAtual.valorBolsa}"
				styleClass="visualizar_texto" />
		</h:panelGroup>


	</h:panelGrid></div>
	</fieldset>
</f:subview>
</body>
</html>

