<%-- 
    Document   : Adendo
    Created on : 04/09/2009, 01:25:25
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
        <title>JSP Page</title>

        <script src="js/tiny_mce/tiny_mce.js" type="text/javascript"></script>
        <script type="text/javascript">


           
            tinyMCE.init({
                // General options
                mode : "textareas",
                theme : "advanced",
                editor_selector : "adendoClass",
                language : "pt",
                plugins : "pagebreak,style,layer,table,advhr,advlink,iespell,insertdatetime,contextmenu,paste,directionality,noneditable,xhtmlxtras,template,inlinepopups",
                // Theme options
                theme_advanced_buttons1 : "newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,formatselect,fontselect,fontsizeselect",
                theme_advanced_buttons2 : "bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,cleanup,|,insertdate,inserttime,preview,|,forecolor,backcolor",
                theme_advanced_toolbar_location : "bottom",
                theme_advanced_toolbar_align : "center",
                theme_advanced_statusbar_location : "bottom",
                theme_advanced_resizing : true,
                theme_advanced_path : false,
                // Example word content CSS (should be your site CSS) this one removes paragraph margins
                content_css : "css/word.css",

                // Drop lists for link/image/media/template dialogs
                template_external_list_url : "lists/template_list.js",
                external_link_list_url : "lists/link_list.js",
                external_image_list_url : "lists/image_list.js",
                media_external_list_url : "lists/media_list.js",

                // Replace values for the template plugin
                template_replace_values : {
                    username : "Some User",
                    staffid : "991234"
                }
            });
           



        </script>

    </head>
    <body>
        <f:subview id="subviewAdendo">
            <h:form>

                <div align="center" class="entrevistador">
                    <p><font color="#FF9834"><b>Entrevistado por:</b></font> 
                        <h:outputText value="#{fichaHandler.fichaSelecionada.assinadoPor.nome}" style="font-weight:bold;"/> em
                        <h:outputText value="#{fichaHandler.fichaSelecionada.salvoEm}" style="font-weight:bold;" escape="false">
                            <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                        </h:outputText>  
                    </p>
                </div>

                <div id="textoAdendo">
                    <h:outputLabel value="Adendos Escritos" rendered="#{not empty fichaHandler.fichaSelecionada.adendos}" >
                    </h:outputLabel>
                </div>

                <div  id="nenhum" style="margin-right: 20px; margin-bottom:20px; margin-top:20px">
                    <h:outputText rendered="#{empty fichaHandler.fichaSelecionada.adendos}" style="color:red; font-size:12px;" value="Nenhum Adendo Adicionado à Ficha"></h:outputText>
                </div>

                <div class="adendo" id="divAdendo">
                    <a4j:outputPanel id="saidaAdendos" rendered="true" ajaxRendered="true">
                        <rich:dataTable id="adendos" value="#{fichaHandler.fichaSelecionada.adendos}" var="adendo" style="border:none; margin-bottom:15px;" width="100%">
                            <rich:column style="border-right:none; border-bottom-style:dashed; width:100%;">
                                <div style="width:auto; overflow:auto; margin-right: 20px">
                                    <h:outputText value="#{adendo.texto}" escape="false"/>
                                    <h:outputText value="Autor: " style="font-weight:bold"/>
                                    <h:outputText value="#{adendo.escritoPor.nome}"/>
                                    <h:outputText value=", escrito em: " style="font-weight:bold"/>
                                    <h:outputText value="#{adendo.dataAdendo}" escape="false">
                                        <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                    </h:outputText>
                                </div>
                            </rich:column>
                        </rich:dataTable>
                    </a4j:outputPanel>


                    <h:inputTextarea  styleClass="adendoClass" style="width:100%; height: 200px"   value="#{adendoHandler.adendo.texto}" />
                    <br>
                    <div align="center">
                        <h:commandButton styleClass="botaoBuscar" id="botaoSalvar" value="Adicionar Adendo" actionListener="#{adendoHandler.salvarAdendo}">
                            <f:attribute name="ficha" value="#{fichaHandler.fichaSelecionada}"/>
                            <f:attribute name="usuario" value="#{usuarioHandler.usuario}"/>
                        </h:commandButton>
                    </div>


                </div>

            </h:form>




        </f:subview>
    </body>
</html>
