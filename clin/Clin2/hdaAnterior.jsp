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
    <f:subview id="subviewHDAAnterior">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/menu.css" rel="stylesheet" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
        
            <h:form>
                <div id="topicoH2">
                    <h2>Ficha - HDA</h2>
                </div>

                <div style="margin-left:5px;">
                    <div id="tituloAtendAnterior">
                        <h:outputText  value="Informações"/>
                    </div>

                    <div id="textoAssinado">
                        <h:outputText  value="#{atendimentoAteriorHandler.fichaHDAAnterior.descricao}"  escape="false" rendered="#{atendimentoAteriorHandler.fichaHDAAnterior.descricao !=null && atendimentoAteriorHandler.fichaHDAAnterior.descricao != ''}"/>
                        <h:outputText  value="Não informado!"  style="color:red;" escape="false" rendered="#{atendimentoAteriorHandler.fichaHDAAnterior.descricao ==null || atendimentoAteriorHandler.fichaHDAAnterior.descricao == ''}"/>

                    </div>


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
