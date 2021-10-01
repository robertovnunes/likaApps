<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.ajax4jsf.org/rich" prefix="rich"%>
<%@ taglib uri="https://ajax4jsf.dev.java.net/ajax" prefix="a4j"%>
<%@ taglib prefix="stella" uri="http://stella.caelum.com.br/faces"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>CLIN</title>
        <link rel="stylesheet" type="text/css" href="css/frmstyle.css" />
        <link rel="stylesheet" type="text/css" href="css/screen.css" />
        <script type="text/javascript" src="js/mascaras.js"></script>
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" language="javascript">
            window.onload = initializeLinks;
        </script>
    </head>
    <body>
        <f:view>
            <div id="main_content">
                <div id="header">
                    <jsp:include page="header.jsp"/>
                    <jsp:include page="menuUsuario1.jsp"/>
                    <h:form id="location">
                        <p>
                            <h:commandLink action="#{usuarioHandler.visaoUsuario}">
                                <h:outputText value="Usuários"/>
                            </h:commandLink> >
                            <h:outputText value="#{usuarioHandler.acaoAtual}"></h:outputText>
                        </p>
                    </h:form>
                </div><!-- /#header -->
                
                <div id="page_content">
                    <jsp:include page="latNavUsuarios.jsp"></jsp:include>
                    
                    <div id="center_section">

                        <div id="panelConfirmacao" align="center" style="margin-top: 15px;">
                            <h:messages id="confirmacao" errorClass="erroConfirmacao" infoClass="sucessoConfirmacao" layout="table" showSummary="true" showDetail="false" globalOnly="true"></h:messages>
                        </div>

                        <div class="title" style="margin-bottom: 20px">
                            <h2><h:outputText value="#{usuarioHandler.tituloAcao}"/></h2>
                        </div>

                        <h:form styleClass="frmstylizer">


                            <label class="full"> Nome <font color="red">&#42;</font> <h:inputText
                                    styleClass="textfield" id="nome"
                                    value="#{usuarioHandler.usuarioSelecionado.nome}" required="true"
                                    requiredMessage="Campo Nome é Obrigatório" maxlength="150"></h:inputText>
                            </label>

                            <label class="small" style="width: 112px">CPF<font
                                    color="red">&#42;</font> <h:inputText styleClass="textfield" id="cpf"
                                             value="#{usuarioHandler.usuarioSelecionado.CPF}" required="true"
                                             requiredMessage="Campo CPF é Obrigatório"
                                             onkeypress="mascara(this,cpf)" maxlength="14" style="width: 96px">
                                    <stella:validateCPF formatted="true" />
                                </h:inputText>
                            </label>

                            <h:outputLabel styleClass="small" style="width: 112px" value="Conselho" rendered="#{(usuarioHandler.usuarioSelecionadoMedico || usuarioHandler.usuarioSelecionadoEnfermeiro)}">
                                <font color="red">&#42;</font> <h:inputText styleClass="textfield" id="conselho"
                                             value="#{usuarioHandler.usuarioSelecionado.conselho}" required="true"
                                             requiredMessage="Campo Conselho é Obrigatório"
                                             maxlength="14" style="width: 96px" rendered="#{(usuarioHandler.usuarioSelecionadoMedico || usuarioHandler.usuarioSelecionadoEnfermeiro)}" immediate="#{!(usuarioHandler.usuarioSelecionadoEnfermeiro || usuarioHandler.usuarioSelecionadoMedico)}">

                                </h:inputText>
                            </h:outputLabel>

                            <label class="x-small"> Sexo <font color="red">&#42;</font> <h:selectOneMenu
                                    value="#{usuarioHandler.usuarioSelecionado.sexo}">
                                    <f:selectItem itemValue="M" itemLabel="Masculino" />
                                    <f:selectItem itemValue="F" itemLabel="Feminino" />
                                </h:selectOneMenu>
                            </label>

                            <br />

                            <label class="full"> Endereço <font color="red">&#42;</font><h:inputText
                                    styleClass="textfield" id="endereco"
                                    value="#{usuarioHandler.usuarioSelecionado.endereco}" required="true"
                                    requiredMessage="Campo Endereço é Obrigatório" maxlength="150">
                                </h:inputText>
                            </label>
                            <br />

                            <label class="x-small"> Telefone <font color="red">&#42;</font>
                                <h:inputText styleClass="textfield" id="telefone" value="#{usuarioHandler.usuarioSelecionado.telefone}" maxlength="9"  onkeypress="mascara(this,telefone)">

                                </h:inputText>
                            </label>

                            <label class="x-small" style="margin-left: 10px;"> Celular <font color="red">&#42;</font>
                                <h:inputText styleClass="textfield" id="celular" value="#{usuarioHandler.usuarioSelecionado.celular}" maxlength="9"  onkeypress="mascara(this,telefone)">
                                </h:inputText>
                            </label>

                            <label class="x-large" style="width: 518px; margin-left: 10px;"> E-mail <font color="red">&#42;</font>
                                <h:inputText styleClass="textfield" id="email"
                                             value="#{usuarioHandler.usuarioSelecionado.email}" required="true"
                                             requiredMessage="Campo Email é Obrigatório" maxlength="100">

                                </h:inputText>
                            </label>

                            <h:panelGroup id="grupoEdicaoUsuario" rendered="#{!usuarioHandler.administrador}">

                                <h:commandLink value="Alterar Senha" action="#{usuarioHandler.alterarSenha}" rendered="#{!usuarioHandler.mostrarAlterarSenhaPerfil}"/>

                                <h:outputLabel styleClass="small" style="width: 150px" rendered="#{usuarioHandler.mostrarAlterarSenhaPerfil}">
                                    Senha Atual
                                    <font color="red">&#42;</font>
                                    <h:inputSecret styleClass="textfield" id="senhaAtual"
                                                   value="#{usuarioHandler.usuarioSelecionado.senhaAntiga}" required="true"
                                                   requiredMessage="Campo Senha Atual é Obrigatório"
                                                   maxlength="20"  size="20" style="width: 120px" >
                                    </h:inputSecret>
                                </h:outputLabel>

                                <br />

                                <h:outputLabel styleClass="small" style="width: 150px" rendered="#{usuarioHandler.mostrarAlterarSenhaPerfil}" >Nova Senha<font
                                        color="red">&#42;</font> <h:inputSecret styleClass="textfield" id="novaSenha"
                                                   value="#{usuarioHandler.usuarioSelecionado.senha}" required="true"
                                                   requiredMessage="Campo Senha é Obrigatório"
                                                   maxlength="20"  size="20" style="width: 120px" >

                                    </h:inputSecret>
                                </h:outputLabel >
                                <br />
                                <h:outputLabel styleClass="small" style="width: 150px" rendered="#{usuarioHandler.mostrarAlterarSenhaPerfil}">
                                    Confirmação da Nova Senha
                                    <font color="red">&#42;</font>
                                    <h:inputSecret styleClass="textfield" id="confirmarNovaSenha"
                                                   value="#{usuarioHandler.usuarioSelecionado.confirmacaoSenha}" required="true"
                                                   requiredMessage="Campo Confirmação da Senha é Obrigatório"
                                                   maxlength="20" size="20" style="width: 120px" >

                                    </h:inputSecret>
                                </h:outputLabel>
                            </h:panelGroup>

                            <h:panelGroup id="grupoEdicaoAdm" rendered="#{usuarioHandler.administrador}">

                                <h:outputLabel styleClass="small" style="width: 150px">Login<font
                                        color="red">&#42;</font> <h:inputText styleClass="textfield" id="editarLogin"
                                                 value="#{usuarioHandler.usuarioSelecionado.login}" required="true"
                                                 requiredMessage="Campo Login é Obrigatório"
                                                 maxlength="20" size="20" style="width: 120px">

                                    </h:inputText>
                                </h:outputLabel>
                                <br />

                                <h:commandLink value="Alterar Senha" action="#{usuarioHandler.alterarSenha}" rendered="#{!usuarioHandler.mostrarAlterarSenhaAdm}"/>


                                <h:outputLabel styleClass="small" style="width: 150px" rendered="#{usuarioHandler.mostrarAlterarSenhaAdm}">
                                    Nova Senha<font
                                        color="red">&#42;</font> <h:inputSecret styleClass="textfield" id="novaSenhaAdm"
                                                   value="#{usuarioHandler.usuarioSelecionado.senha}" required="true"
                                                   requiredMessage="Campo Senha é Obrigatório"
                                                   maxlength="20"  size="20" style="width: 120px">

                                    </h:inputSecret>
                                </h:outputLabel>
                                <br />
                                <h:outputLabel styleClass="small" style="width: 150px" rendered="#{usuarioHandler.mostrarAlterarSenhaAdm}">
                                    Confirmação da Nova Senha<font
                                        color="red">&#42;</font> <h:inputSecret styleClass="textfield" id="confirmarNovaSenhaAdm"
                                                   value="#{usuarioHandler.usuarioSelecionado.confirmacaoSenha}" required="true"
                                                   requiredMessage="Campo Confirmação da Senha é Obrigatório"
                                                   maxlength="20" size="20" style="width: 120px">

                                    </h:inputSecret>
                                </h:outputLabel>



                            </h:panelGroup>
                            <br/>

                            <div id="necessario">*Campos obrigatórios
                                <h:panelGrid columns="1">
                                    <h:message for="nome"/>
                                    <h:message for="cpf"/>
                                    <h:message for="endereco"/>
                                    <h:message for="conselho"/>
                                    <h:message for="telefone"/>
                                    <h:message for="celular"/>
                                    <h:message for="email"/>
                                    <h:message for="editarLogin"/>
                                    <h:message for="novaSenhaAdm"/>
                                    <h:message for="confirmarNovaSenhaAdm"/>
                                    <h:message for="senhaAtual"/>
                                    <h:message for="novaSenha"/>
                                    <h:message for="confirmarNovaSenha"/>
                                </h:panelGrid>
                            </div>

                            <div align="center">
                                <h:panelGrid columns="2">
                                    <h:commandButton
                                        value="Cancelar" styleClass="bt_cancel" style="margin-right:10px;" action="#{usuarioHandler.cancelarCadastroUsuario}" immediate="true"></h:commandButton>
                                    <h:commandButton value="Salvar" styleClass="bt_save"
                                                     action="#{usuarioHandler.salvarEdicaoUsuario}">
                                    </h:commandButton>
                                </h:panelGrid>
                            </div>
                    </h:form>
                    </div>
                    <jsp:include page="rodape.jsp"></jsp:include>
            </div>
            </div>
        </f:view>
    </body>

</html>