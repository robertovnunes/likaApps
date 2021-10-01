<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.ajax4jsf.org/rich" prefix="rich"%>
<%@ taglib uri="https://ajax4jsf.dev.java.net/ajax" prefix="a4j"%>
<%@ taglib prefix="stella" uri="http://stella.caelum.com.br/faces"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>    
    <body>
        <f:subview id="menuPaciente1">
            <h:form>
                <div id="nav">
                    <ul>
                        <li>
                            <h:commandLink styleClass="pacientes" action="pacientes">
                                    <h:outputText value="PACIENTES"/>
                            </h:commandLink>
                        <li>
                            <h:commandLink styleClass="usuarios" action="#{usuarioHandler.visaoUsuario}">
                                    <h:outputText value="USUÁRIOS"/>
                            </h:commandLink>
                        <li><a href="#" class="contato">CONTATO</a></li>
                    </ul>

                </div>
                <div id="search">
                    <h:panelGroup id="search">
                        <h:panelGroup id="campo" styleClass="search">
                            <h:inputText id="textBuscaNomeMae" styleClass="input" value="#{pacienteHandler.parametroConsulta}" rendered="#{pacienteHandler.mostrarPesquisaNomeMae}"/>
                            <h:inputText id="textBuscaNome" styleClass="input" value="#{pacienteHandler.parametroConsulta}" rendered="#{pacienteHandler.mostrarPesquisaNome}" >
                            </h:inputText>
                            <h:selectOneMenu value="#{pacienteHandler.parametroConsulta}" rendered="#{pacienteHandler.mostrarPesquisaSexo}">
                                <f:selectItem itemValue="M" itemLabel="Masculino" />
                                <f:selectItem itemValue="F" itemLabel="Feminino" />
                            </h:selectOneMenu>
                            <h:inputText id="textBuscaCPF" styleClass="input" value="#{pacienteHandler.parametroConsulta}" rendered="#{pacienteHandler.mostrarPesquisaCPF}" onkeypress="mascara(this,cpf)" maxlength="14"/>
                            <h:inputText id="textBuscaProntuario" styleClass="input" value="#{pacienteHandler.parametroConsulta}" rendered="#{pacienteHandler.mostrarPesquisaProntuario}" onkeypress="mascara(this,prontuario)" maxlength="9"/>
                            <h:inputText styleClass="input" id="textBuscaNascimento" value="#{pacienteHandler.parametroConsulta}"  rendered="#{pacienteHandler.mostrarPesquisaNascimento}"
                                         onkeypress="mascara(this,data)" maxlength="10" />

                            <a4j:commandButton id="more_options" styleClass="bt_plus" value="Mais Opcoes" action="#{pacienteHandler.trigger}" immediate="true" reRender="optionPanel">
                            </a4j:commandButton>
                        </h:panelGroup>
                        <h:panelGroup id="optionPanel">
                            <h:selectOneRadio value="#{pacienteHandler.tipoSelecionado}" layout="pageDirection" id="opcaoBusca"  styleClass="search_options" rendered="#{pacienteHandler.maisOpcoes}">
                                <f:selectItems value="#{pacienteHandler.tiposDePesquisas}"/>
                                <a4j:support reRender="campo" event="onclick" action="#{pacienteHandler.limparConsulta}" ajaxSingle="true" />
                            </h:selectOneRadio>
                        </h:panelGroup>
                    </h:panelGroup>
                </div>
            </h:form>
        </f:subview>
    </body>
</html>
