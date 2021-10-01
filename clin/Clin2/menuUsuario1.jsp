<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.ajax4jsf.org/rich" prefix="rich"%>
<%@ taglib uri="https://ajax4jsf.dev.java.net/ajax" prefix="a4j"%>
<%@ taglib prefix="stella" uri="http://stella.caelum.com.br/faces"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>    
    <body>
        <f:subview id="menuUsuario1">
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
                    </li>
                    <li><a href="#" class="contato">CONTATO</a></li>
                </ul>

            </div>
            <div id="search">
                <h:panelGroup id="search">
                    <h:panelGroup id="campo" styleClass="search">
                        <h:inputText
                            id="textBuscaLogin" style="width: 447px" value="#{usuarioHandler.parametroConsulta}" rendered="#{usuarioHandler.mostrarPesquisaLogin}">
                        </h:inputText>

                        <h:inputText
                            id="textBuscaNome" style="width: 447px" value="#{usuarioHandler.parametroConsulta}" rendered="#{usuarioHandler.mostrarPesquisaNome}">
                        </h:inputText>

                        <h:inputText
                            id="textBuscaCPF" style="width: 447px" value="#{usuarioHandler.parametroConsulta}" rendered="#{usuarioHandler.mostrarPesquisaCPF}"
                            onkeypress="mascara(this,cpf)" maxlength="14">
                        </h:inputText>

                        <a4j:commandButton id="more_options" styleClass="bt_plus" value="Mais Opcoes" action="#{usuarioHandler.trigger}" immediate="true" reRender="opcaoBusca">
                        </a4j:commandButton>
                    </h:panelGroup>


                    <h:panelGroup id="opcaoBusca">
                        <h:selectOneRadio value="#{usuarioHandler.tipoSelecionado}" layout="pageDirection" id="busca" rendered="#{usuarioHandler.maisOpcoes}" styleClass="search_options">
                            <f:selectItems value="#{usuarioHandler.tiposDePesquisas}"/>
                            <a4j:support reRender="campo" event="onclick" action="#{pacienteHandler.limparConsulta}" ajaxSingle="true" />
                        </h:selectOneRadio>
                    </h:panelGroup>
                    
                </h:panelGroup>
            </div>
            </h:form>
        </f:subview>
    </body>
</html>
