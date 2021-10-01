<%--
    Document   : qpdAnterior
    Created on : 15/12/2009, 18:38:31
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
    <f:subview id="subviewProblemasCondutasAnterior">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link href="css/menu.css" rel="stylesheet" type="text/css" />-->
        <!--<link href="css/tabela.css" rel="stylesheet" type="text/css" />-->
        <title>JSP Page</title>
    </head>
    <body>
        
            <h:form>
                <div id="topicoH2">
                    <h2>Ficha - Problemas/Condutas</h2>
                </div>

                <div style="margin-left:5px;">


                    <div id="textoAssinado">

                        <h:outputText  value="Não informado!"   style="color:red;" escape="false" rendered="#{empty atendimentoAteriorHandler.fichaProblemasCondutasAnterior.problemasCondutas}"/>
                    </div>

                    <rich:dataTable id="tabelaResultado" value="#{atendimentoAteriorHandler.fichaProblemasCondutasAnterior.problemasCondutas}" var="problemasCondutas"
                                    styleClass="mytable"            cellpadding="2" cellspacing="2" style="width:750px; margin-top:0px;" rendered="#{!empty atendimentoAteriorHandler.fichaProblemasCondutasAnterior.problemasCondutas}">
                        <rich:column id="cid" >
                            <f:facet name="header">
                                <h:outputText value="CID-10"></h:outputText>
                            </f:facet>
                            <div style="width:290px">
                                <h:outputText value="#{problemasCondutas.CID} #{problemasCondutas.problema}"></h:outputText>
                            </div>
                        </rich:column>

                        <rich:column id="data">
                            <f:facet name="header">

                                <h:outputText value="Data">
                                </h:outputText>

                            </f:facet>
                            <div style="width:150px">
                                <h:outputText value="#{problemasCondutas.salvoEm}">
                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                </h:outputText>
                            </div>
                        </rich:column>

                        <rich:column id="usuario">
                            <f:facet name="header">

                                <h:outputText value="Salvo Por">
                                </h:outputText>

                            </f:facet>
                            <div style="width:150px">
                                <h:outputText value="#{problemasCondutas.salvoPor.nome}">
                                </h:outputText>
                            </div>
                        </rich:column>


                        <rich:column id="opcoes">
                            <f:facet name="header">
                                <h:outputText value="Opções"></h:outputText>
                            </f:facet>

                            <div style="width:60px">
                                <h:panelGrid columns="2" style="border:none;">
                                    <a4j:commandLink ajaxSingle="true" id="editarlink"
                                                     oncomplete="#{rich:component('panelProblemaConduta')}.show()" reRender="problemaConduta"   >
                                        <h:graphicImage value="/images/text_edit.png" width="20" height="20" />
                                        <f:setPropertyActionListener value="#{problemasCondutas}" target="#{atendimentoAteriorHandler.problemaCondutaAnterior}" />
                                    </a4j:commandLink>
                                </h:panelGrid>
                            </div>

                        </rich:column>
                    </rich:dataTable>


                    <rich:modalPanel id="panelProblemaConduta"  width="750" height="600" style="overflow: auto;" minHeight="400" minWidth="600" onshow="javascript:teste()">
                        <f:facet name="header">
                            <h:panelGroup>

                                <h:outputText value="Problema e Conduta"></h:outputText>
                            </h:panelGroup>
                        </f:facet>
                        <f:facet name="controls">
                            <h:panelGroup>
                                <h:outputLink value="#" onclick="#{rich:component('panelProblemaConduta')}.hide()">
                                    Fechar
                                </h:outputLink>
                            </h:panelGroup>
                        </f:facet>

                        <h:panelGroup id="problemaConduta">
                            <div class="title" style="margin-bottom: 15px; margin-top:5px;">
                                <h:outputText>Problema</h:outputText>
                            </div>

                            <div id="espacoTextoAssinado" style="width:680px">
                                <h:outputText value="CID: " style="font-weight:bold;"></h:outputText>
                                <h:outputText value="#{atendimentoAteriorHandler.problemaCondutaAnterior.CID}"/>

                                <br/>
                                <h:outputText value="Descrição:" style="font-weight:bold;"></h:outputText>
                                <h:outputText  value="#{atendimentoAteriorHandler.problemaCondutaAnterior.problema}"/>
                            </div>
                            <br/>
                            <div class="title" style="margin-bottom: 15px; margin-top:10px">
                                <h:outputText>Conduta</h:outputText>
                            </div>
                            <div id="espacoTextoAssinado" style="width:680px">
                                <h:outputText value="#{atendimentoAteriorHandler.problemaCondutaAnterior.conduta}" rendered="#{atendimentoAteriorHandler.problemaCondutaAnterior.conduta !=null && atendimentoAteriorHandler.problemaCondutaAnterior.conduta != ''}"/>
                                <h:outputText value="Não informado!" style="color: red;" rendered="#{atendimentoAteriorHandler.problemaCondutaAnterior.conduta == null || atendimentoAteriorHandler.problemaCondutaAnterior.conduta == ''}" />
                            </div>
                            <br/>

                            <div align="center" style="margin-top:10px">
                                <h:outputLink value="#"  onclick="#{rich:component('panelProblemaConduta')}.hide()">
                                    Fechar Janela
                                </h:outputLink>
                            </div>

                        </h:panelGroup>
                    </rich:modalPanel>


                    <div id="tituloAtendAnterior">
                        <h:outputText  value="Adendos"/>
                    </div>

                    <div  id="textoAssinado">

                        <h:outputText  value="Sem Adendos" style="color:red;" escape="false" rendered="#{empty atendimentoAteriorHandler.adendos}"/>

                        <rich:dataTable  value="#{atendimentoAteriorHandler.adendos}" var="adendo" style="border:none; margin-bottom:15px" width="100%" rendered="#{!empty atendimentoAteriorHandler.adendos}">
                            <rich:column style="border-right:none; border-bottom-style:dashed; width:100%;">
                                <h:outputText value="#{adendo.texto}" escape="false"/>
                                <h:outputText value="Autor: " style="font-weight:bold"/>
                                <h:outputText value="#{adendo.escritoPor.nome}"/>
                                <h:outputText value=", escrito em: " style="font-weight:bold"/>
                                <h:outputText value="#{adendo.dataAdendo}" escape="false">
                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                </h:outputText>
                            </rich:column>
                        </rich:dataTable>




                    </div>

                </div>
            </h:form>
       
    </body>
     </f:subview>
</html>
