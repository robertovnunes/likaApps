<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Clin</title>
       
        <link href="css/screen.css" rel="stylesheet" type="text/css" />
        <script src="js/tiny_mce/tiny_mce.js" type="text/javascript"></script>
        <script type="text/javascript">

            
            
               
                tinyMCE.init({
                    // General options
                    mode : "textareas",
                    theme : "advanced",
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
        <f:view>

            <div id="main_content">
                <div id="header">
                    
                    <jsp:include page="header.jsp"/>
                    <jsp:include page="menuPaciente1.jsp"/>

                    <h:form id="location">
                        <p><h:commandLink action="pacientes">
                            <h:outputText value="Pacientes"/>
                        </h:commandLink> >
                        <h:commandLink action="#{pacienteHandler.editarPaciente}">
                                    <h:outputText value="#{submenuPaciente.nomePacienteAtual}"/>
                                </h:commandLink> >
                        <h:outputText value="#{submenuPaciente.acaoPacienteAtual}"/>
                        </p>
                    </h:form>
                </div><!-- /#header -->
                <div id="page_content">                    

                    <div align="left" id="diretorio">
                        <h:outputText styleClass="diretorio" value="#{fichaHandler.menuFichas.atendimento}"></h:outputText>
                        <h:graphicImage  value="/images/nav.gif" />
                        <h:outputText styleClass="diretorio" value="HDA"></h:outputText>
                    </div>

                    <div align="right" id="salvoPor">
                        <h:outputText value="Salvo por: " rendered="#{fichaHandler.fichaHDA.salvoPor != null}" />
                        <h:outputText value="#{fichaHandler.fichaHDA.salvoPor.nome}" rendered="#{fichaHandler.fichaHDA.salvoPor != null}" />
                        <h:outputText value="Ficha não Salva" rendered="#{fichaHandler.fichaHDA.salvoPor == null}" />
                    </div>

                    <jsp:include page="menuFichas1.jsp"></jsp:include>                    

                    <div id="panelConfirmacao" align="center" style="margin-top: 15px;">
                        <h:messages id="confirmacao" errorClass="erroConfirmacao" infoClass="sucessoConfirmacao" layout="table" showSummary="true" showDetail="false" globalOnly="true"></h:messages>
                    </div>
                    <h:form>
                        <div id="center_section">
                            <h2>Histórico da Doença Atual</h2>
                            <h:inputTextarea value="#{fichaHandler.fichaHDA.descricao}" style="margin-left:10px; width:100%; height:400px;" />

                            <div align="center" style="margin-top:50px">
                                <h:panelGrid columns="3">
                                    <h:commandButton styleClass="bt_cancel" style="margin-right: 10px;" value="CANCELAR" action="atendimentos"></h:commandButton>
                                    <h:commandButton styleClass="bt_save" style="margin-right: 10px;" value="SALVAR" action="#{fichaHandler.salvarFichaHDA}"></h:commandButton>
                                    <h:commandButton styleClass="botaoBuscar" value="ASSINAR" action="#{fichaHandler.assinarFichaHDA}" disabled="#{!usuarioHandler.medico}"></h:commandButton>
                                </h:panelGrid>
                            </div>
                        </div>
                    </h:form>
                </div>                
                <jsp:include page="rodape.jsp"></jsp:include>
            </div>

        </f:view>
    </body>
</html>