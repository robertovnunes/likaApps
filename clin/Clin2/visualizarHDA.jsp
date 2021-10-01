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
    </head>
    <body>
        <f:view>

            <div id="main_content">
                <div id="header">
                    <jsp:include page="header.jsp"/>
                    <jsp:include page="menuPaciente1.jsp"/>

                    <h:form id="location">
                        <p>
                            <h:commandLink action="pacientes">
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

                    <div align="left" id="diretorio" style="margin-bottom:15px;">
                        <h:outputText styleClass="diretorio" value="#{fichaHandler.menuFichas.atendimento}"></h:outputText>
                        <h:graphicImage  value="/images/nav.gif" />
                        <h:outputText styleClass="diretorio" value="HDA"></h:outputText>
                    </div>

                    <jsp:include page="menuFichas1.jsp"></jsp:include>
                    <div id="center_section">
                        <h:form>
                            <div id="conteudoAssinado">
                                <div id="topicoH2">
                                    <h2>Informações</h2>
                                </div>
                                <div id="espacoTextoAssinado">
                                    <h:outputText value="#{fichaHandler.fichaHDA.descricao}" escape="false"/>
                                </div>

                            </div>

                            <div id="conteudoAssinado">
                                <f:subview id="subviewAdendo">
                                    <jsp:include page="adendo.jsp"></jsp:include>
                                </f:subview>
                            </div>
                        </h:form>
                    </div>
                </div>                
                <jsp:include page="rodape.jsp"></jsp:include>
            </div>

        </f:view>
    </body>
</html>