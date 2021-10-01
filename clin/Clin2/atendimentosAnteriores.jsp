<%-- 
    Document   : atendimentosAnteriores
    Created on : 15/12/2009, 22:25:07
    Author     : Marcio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.ajax4jsf.org/rich" prefix="rich"%>
<%@ taglib uri="https://ajax4jsf.dev.java.net/ajax" prefix="a4j"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/menu.css" rel="stylesheet" type="text/css" />
        <link href="css/tabela.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <title>JSP Page</title>
    </head>
    <body>
        <f:view>
            <h:form>

                <a4j:outputPanel ajaxRendered="true" id="atendimentos">
                    <div id="listaAtendAnterior">

                        <h:dataTable value="#{atendimentoHandler.listaAtendimentos}" var="atend">
                            <h:column id="codigo">
                                <f:facet name="header">

                                    <h:outputText value="Atendimentos" style="  font-family: Verdana, Arial;
                                                  font-size: 11px;
                                                  color: #666;
                                                  font-weight: bold; margin-top:5px;"></h:outputText>

                                </f:facet>
                                <div align="center">
                                    <h:commandLink id="link1"   value="#{atend.numeroAtendimentoFormatado}" action="#{atendimentoAteriorHandler.carregarFichaQPDAnterior}"  actionListener="#{atendimentoAteriorHandler.mostrarFichaAtendAnterior}">
                                        <f:setPropertyActionListener target="#{atendimentoAteriorHandler.atendimentoAnterior}" value="#{atend}"/>
                                        <f:attribute name="ficha" value="QPD"/>
                                        <a4j:support reRender="atendimentos" event="oncomplete"/>
                                    </h:commandLink>
                                </div>
                            </h:column>
                        </h:dataTable>

                    </div>


                    <div style="margin-left:120px; margin-top:22px; float:inherit;  border-right:solid;
                         border-bottom:solid;
                         border-bottom-width:1px;
                         border-right-width:1px;
                         border-left:solid;
                         border-top:solid;
                         border-left:solid;
                         border-top:solid;
                         border-left-width:1px;
                         border-top-width:1px;
                         border-color:#BBD8EC; height:100px; width:760px;">

                        <h:panelGroup id="panel1">

                            <div align="left"  style="    font-family: Verdana, Arial;
                                 font-size: 11px;
                                 color: #666;
                                 font-weight: bold;
                                 margin-top: 5px; float:left; width:100%">

                                <h:panelGrid columns="3">
                                    <h:outputText  styleClass="diretorio" value="Atendimento #{atendimentoAteriorHandler.atendimentoAnterior.tipo}"/>
                                    <h:outputText  styleClass="diretorio" value="#{atendimentoAteriorHandler.atendimentoAnterior.numeroAtendimentoFormatado}"/>
                                </h:panelGrid>
                                <h:panelGrid columns="2">
                                    <h:outputText  styleClass="diretorio" value="Tipo de Consulta: "/>
                                    <h:outputText  styleClass="diretorio" value="#{atendimentoAteriorHandler.atendimentoAnterior.tipo}"/>
                                </h:panelGrid>
                                <h:panelGrid columns="4">
                                    <h:outputText  styleClass="diretorio" value="Data: "/>
                                    <h:outputText  styleClass="diretorio" value="#{atendimentoAteriorHandler.atendimentoAnterior.dataAtendimento}">
                                        <f:convertDateTime type="date" pattern="dd/MM/yyyy"/>
                                    </h:outputText>
                                    <h:outputText  styleClass="diretorio" value="Hora: "/>
                                    <h:outputText  styleClass="diretorio" value="#{atendimentoAteriorHandler.atendimentoAnterior.dataAtendimento}">
                                        <f:convertDateTime type="both" dateStyle="default" pattern="HH:mm:ss"/>
                                    </h:outputText>
                                </h:panelGrid>
                            </div>
                        </h:panelGroup>

                        <h:panelGrid columns="8">
                            <h:commandLink  value="QPD" actionListener="#{atendimentoAteriorHandler.mostrarFichaAtendAnterior}" action="#{atendimentoAteriorHandler.carregarFichaQPDAnterior}">

                                <f:attribute name="ficha" value="QPD"/>

                            </h:commandLink>

                            <h:commandLink value="HDA" actionListener="#{atendimentoAteriorHandler.mostrarFichaAtendAnterior}" action="#{atendimentoAteriorHandler.carregarFichaHDAAnterior}" >
                                <f:attribute name="ficha" value="HDA"/>

                            </h:commandLink>

                            <h:commandLink  value="IS" actionListener="#{atendimentoAteriorHandler.mostrarFichaAtendAnterior}" action="#{atendimentoAteriorHandler.carregarFichaISAnterior}" >
                                <f:attribute name="ficha" value="IS"/>

                            </h:commandLink>

                            <h:commandLink value="Antecedentes" actionListener="#{atendimentoAteriorHandler.mostrarFichaAtendAnterior}" action="#{atendimentoAteriorHandler.carregarFichaAntecedentesAnterior}" >
                                <f:attribute name="ficha" value="antecedentes"/>

                            </h:commandLink>

                            <h:commandLink  value="Problemas/Condutas" actionListener="#{atendimentoAteriorHandler.mostrarFichaAtendAnterior}" action="#{atendimentoAteriorHandler.carregarFichaProblemasCondutasAnterior}" >
                                <f:attribute name="ficha" value="problemasCondutas"/>

                            </h:commandLink>

                        </h:panelGrid>

                    </div>
                    <h:panelGroup id="fichas">
                        <div style="margin-left:120px; float:inherit;">
                            <div id="atendAnterior">

                                <f:subview id="subviewQPDAnterior" rendered="#{atendimentoAteriorHandler.mostrarQPDAnterior}">
                                    <jsp:include  page="qpdAnterior.jsp" />
                                </f:subview>


                                <f:subview id="subviewHDAAnterior" rendered="#{atendimentoAteriorHandler.mostrarHDAAnterior}">
                                    <jsp:include   page="/hdaAnterior.jsp"/>
                                </f:subview>


                                <f:subview id="subviewISAnterior"  rendered="#{atendimentoAteriorHandler.mostrarFichaISAnterior}">
                                    <jsp:include   page="isAnterior.jsp" />
                                </f:subview>


                                <f:subview id="subviewProblemasCondutasAnterior" rendered="#{atendimentoAteriorHandler.mostrarfichaProblemasCondutasAnterior}">
                                    <jsp:include   page="problemasCondutasAnterior.jsp" />
                                </f:subview>


                                <f:subview id="subviewAntecedentesAnterior"   rendered="#{atendimentoAteriorHandler.mostrarAtencedentesAnterior}">
                                    <jsp:include   page="antecedentesAnterior.jsp"/>
                                </f:subview>

                            </div>
                        </div>
                    </h:panelGroup>
                </a4j:outputPanel>
            </h:form>
        </f:view>
    </body>
</html>
