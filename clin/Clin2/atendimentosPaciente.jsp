<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.ajax4jsf.org/rich" prefix="rich"%>
<%@ taglib uri="https://ajax4jsf.dev.java.net/ajax" prefix="a4j"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>CLIN</title>        
        <link rel="stylesheet" type="text/css" href="css/screen.css" />        
        <script type="text/javascript">
            window.onload = initializeLinks;
        </script>
    </head>
    <body>
        <f:view>
            <div id="main_content">
                 <div id="header">

                    <jsp:include page="header.jsp"/>
                    <jsp:include page="menuPaciente1.jsp"/>
                    

                    <div id="location">
                        <h:form>
                        <h:commandLink action="pacientes">
                            <h:outputText value="Pacientes"/>
                        </h:commandLink> > 
                        <h:commandLink action="#{pacienteHandler.editarPaciente}">
                            <h:outputText value="#{submenuPaciente.nomePacienteAtual}"/>
                        </h:commandLink> > Atendimentos
                        </h:form>
                    </div>
                </div><!-- /#header -->
                <div id="page_content">
                    
                    <jsp:include page="latNavPaciente.jsp"></jsp:include>
                    
                    <div id="center_section">
                        <h:form>

                            <div  id="nenhum" align="center" style="color:red;">
                                <h:outputText rendered="#{empty atendimentoHandler.listaAtendimentos}">Nenhum Atendimento encontrado</h:outputText>
                            </div>

                            <a4j:outputPanel id="tabela">

                                <h:panelGroup rendered="#{not empty atendimentoHandler.listaAtendimentos }">


                                    <!--<div class="title" style="margin-left: 65px; margin-bottom: 20px">
                                        <h:outputText value="Atendimentos do Paciente" />
                                    </div>-->
                                        <h2>Atendimentos do Paciente</h2>

                                    <div align="center">
                                        <rich:dataTable id="tabelaAtendimentos" value="#{atendimentoHandler.listaAtendimentos}" var="atendimento"
                                                        styleClass="estiloTabela" cellpadding="2" cellspacing="2" style="width: 709px" >

                                            <rich:column id="codigo" >
                                                <f:facet name="header">
                                                    <h:outputText value="Código" style="color: #FFFFFF; font-size: 13px;"></h:outputText>
                                                </f:facet>
                                                <div style="width:100px">
                                                    <h:commandLink immediate="true" value="#{atendimento.numeroAtendimentoFormatado}" action="#{fichaHandler.mostrarPrimeiraFicha}">
                                                        <f:setPropertyActionListener target="#{fichaHandler.atendimentoAtual}" value="#{atendimento}"/>
                                                        <f:setPropertyActionListener target="#{fichaHandler.menuFichas.submenu}" value="#{submenuPaciente}"/>
                                                    </h:commandLink>
                                                </div>
                                            </rich:column>

                                            <rich:column id="tipoConsulta" >
                                                <f:facet name="header">
                                                    <h:outputText value="Tipo de Consulta" style="color: #FFFFFF; font-size: 13px;"></h:outputText>
                                                </f:facet>
                                                <div style="width:120px">
                                                    <h:outputText value="#{atendimento.tipo}"></h:outputText>
                                                </div>
                                            </rich:column>

                                            <rich:column id="data">
                                                <f:facet name="header">

                                                    <h:outputText value="Data" style="color: #FFFFFF; font-size: 13px;">
                                                    </h:outputText>

                                                </f:facet>
                                                <div style="width:120px">
                                                    <h:outputText value="#{atendimento.dataAtendimento}">
                                                        <f:convertDateTime type="date" pattern="dd/MM/yyyy"/>
                                                    </h:outputText>
                                                </div>
                                            </rich:column>

                                            <rich:column id="hora">
                                                <f:facet name="header">
                                                    <h:outputText value="Hora" style="color: #FFFFFF; font-size: 13px;"></h:outputText>
                                                </f:facet>
                                                <div style="width:100px">
                                                    <h:outputText value="#{atendimento.dataAtendimento}">
                                                        <f:convertDateTime type="both" dateStyle="default" pattern="HH:mm:ss"/>
                                                    </h:outputText>
                                                </div>
                                            </rich:column>

                                            <rich:column id="autor">
                                                <f:facet name="header">
                                                    <h:outputText value="Autor" style="color: #FFFFFF; font-size: 13px;"></h:outputText>
                                                </f:facet>
                                                <div style="width:150px">
                                                    <h:outputText value="#{atendimento.criadoPor.nome}"></h:outputText>
                                                </div>
                                            </rich:column>
                                        </rich:dataTable>
                                    </div>
                                </h:panelGroup>
                            </a4j:outputPanel>
                        </h:form>
                    </div>                    
                    <jsp:include page="rodape.jsp"></jsp:include>
                    </div>
            </div>
        </f:view>
    </body>
</html>