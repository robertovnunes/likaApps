<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.ajax4jsf.org/rich" prefix="rich"%>
<%@ taglib uri="https://ajax4jsf.dev.java.net/ajax" prefix="a4j"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="css/menu.css" rel="stylesheet" type="text/css" />
        <title>Insert title here</title>
    </head>
    <body>
        <f:subview id="subMenuPaciente">
            <h:form>

                <div id="menuPac" align="center">
                    <div class="menuPacGeral">
                        <h:panelGrid columns="9">
                            <h:outputText value="Paciente  " styleClass="subTitulo"/>
                            &nbsp;
                            <h:graphicImage value="images/nav.gif" alt=""/>
                            &nbsp;
                            <h:outputText value="#{submenuPaciente.nomePacienteAtual}" styleClass="subTitulo"/>
                            &nbsp;
                            <h:graphicImage  value="images/nav.gif" alt=""/>
                            &nbsp;
                            <h:outputText value="#{submenuPaciente.acaoPacienteAtual}" styleClass="subTitulo"/>
                        </h:panelGrid>
                    </div>
                    <div align="center">
                        <h:panelGrid columns="5">
                            <rich:dropDownMenu direction="bottom-right" >
                                <f:facet name="label">
                                    <h:panelGroup>
                                        <h:outputText value="Novo Atendimento" style=" color:#003399; font-family: Verdana, Arial; font-size: 12px;
                                                      font-weight:400;"/>
                                    </h:panelGroup>
                                </f:facet>
                                <rich:menuItem submitMode="ajax" >
                                    <h:commandLink  style=" color:#003399;" value="Atendimento Completo" actionListener="#{fichaHandler.criarNovoAtendimentoCompleto}" action="#{atendimentoHandler.criarAtendimentoCompleto}">
                                        <f:attribute name="paciente" value="#{atendimentoHandler.pacienteAtual}"/>
                                        <f:setPropertyActionListener target="#{fichaHandler.menuFichas.submenu}" value="#{submenuPaciente}"/>
                                    </h:commandLink>
                                </rich:menuItem>
                                <rich:menuSeparator id="menuSeparator" />
                                <rich:menuItem submitMode="ajax">
                                    <h:commandLink  style=" color:#003399;" value="Retorno" actionListener="#{fichaHandler.criarNovoAtendimentoRetorno}" action="#{atendimentoHandler.criarAtendimentoRetorno}">
                                        <f:attribute name="paciente" value="#{atendimentoHandler.pacienteAtual}"/>
                                        <f:setPropertyActionListener target="#{fichaHandler.menuFichas.submenu}" value="#{submenuPaciente}"/>
                                    </h:commandLink>
                                </rich:menuItem>
                            </rich:dropDownMenu>

                            <h:outputText style=" color:#000000;" value="|"></h:outputText>

                            <h:commandLink action="#{atendimentoHandler.atendimentosDoPaciente}" >
                                <f:setPropertyActionListener target="#{atendimentoHandler.pacienteAtual}" value="#{pacienteHandler.paciente}"/>
                                <h:outputText style=" color:#003399;" value="Atendimentos"></h:outputText>
                            </h:commandLink>

                            <h:outputText style=" color:#000000;" value="|"></h:outputText>

                            <h:commandLink action="#{pacienteHandler.editarPaciente}">
                                <h:outputText style=" color:#003399;" value="Editar Cadastro"></h:outputText>

                            </h:commandLink>
                        </h:panelGrid>
                    </div>

                </div>
                <div class="bordaBox">
                    <strong class="b4" style="background-color: #BBD8EC; border-left-color: #BBD8EC; border-right-color: #BBD8EC;"></strong>
                    <strong class="b3" style="background-color: #BBD8EC; border-left-color: #BBD8EC; border-right-color: #BBD8EC;"></strong>
                    <strong class="b2" style="background-color: #BBD8EC; border-left-color: #BBD8EC; border-right-color: #BBD8EC;"></strong>
                    <strong class="b1" style="background-color: #BBD8EC; border-left-color: #BBD8EC; border-right-color: #BBD8EC;"></strong>
                </div>
            </h:form>
        </f:subview>
    </body>
</html>