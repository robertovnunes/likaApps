<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Clin</title>
        <link rel="stylesheet" type="text/css" href="css/screen.css" />       
        <script type="text/javascript" src="js/mascaras.js"></script>
    </head>
    <body>
        <f:view>

            <div id="main_content">
                <div id="header">

                    <jsp:include page="header.jsp"/>
                    <jsp:include page="menuPaciente1.jsp"/>


                    <div id="location">
                        <h:form>
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
                    </div>
                </div><!-- /#header -->

                <div id="page_content">

                    <div align="left" id="diretorio">
                        <h:outputText  styleClass="diretorio" value="Exames do Paciente"></h:outputText>
                    </div>

                    <br/>

                    <jsp:include page="menuFichas1.jsp"></jsp:include>

                    <div id="panelConfirmacao" align="center" style="margin-top: 15px;">
                        <h:messages id="confirmacao" errorClass="erroConfirmacao" infoClass="sucessoConfirmacao" layout="table" showSummary="true" showDetail="false" globalOnly="true"></h:messages>
                    </div>
                    <h:form>

                        <div id="center_section">
                            <a4j:outputPanel id="panelExames" ajaxRendered="true">
                                <h:panelGroup rendered="#{not empty exameHandler.examesDoPaciente}">

                                    <h:outputText><h2 style="margin-left:5px;">Exames Solicitados</h2></h:outputText>

                                    <div align="center">

                                        <rich:dataTable id="tabelaResultado" value="#{exameHandler.examesDoPaciente}" var="exame"
                                                        styleClass="estiloTabela" cellpadding="2" cellspacing="2" style="width: 709px; margin-top:0px;">
                                            <rich:column id="exame" >
                                                <f:facet name="header">
                                                    <h:outputText value="Exame" style="color: #FFFFFF; font-size: 13px;"></h:outputText>
                                                </f:facet>
                                                
                                                <h:outputText value="#{exame.nomeExame}" style="color: #666"></h:outputText>
                                                
                                            </rich:column>

                                            <rich:column id="situacao">
                                                <f:facet name="header">
                                                    <h:outputText value="Situação" style="color: #FFFFFF; font-size: 13px;"></h:outputText>
                                                </f:facet>
                                                
                                                <h:outputText value="#{exame.situacao}" style="color: #666"></h:outputText>
                                                
                                            </rich:column>

                                            <rich:column id="data">
                                                <f:facet name="header">

                                                    <h:outputText value="Data Solicitação" style="color: #FFFFFF; font-size: 13px;">
                                                    </h:outputText>

                                                </f:facet>
                                                
                                                <h:outputText value="#{exame.dataExame}" style="color: #666">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy"/>
                                                </h:outputText>
                                                
                                            </rich:column>

                                            <rich:column id="dataResultado">
                                                <f:facet name="header">

                                                    <h:outputText value="Data Resultado" style="color: #FFFFFF; font-size: 13px;">
                                                    </h:outputText>

                                                </f:facet>
                                                
                                                    <h:outputText value="#{exame.resultadoExame.dataResultado}" rendered="#{exame.resultadoExame != null}" style="color: #666">
                                                        <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy"/>
                                                    </h:outputText>
                                                    <h:outputText value="-" rendered="#{exame.resultadoExame == null}" style="color: #666"/>
                                                
                                            </rich:column>



                                            <rich:column id="solicitado">
                                                <f:facet name="header">

                                                    <h:outputText value="Solicitado por" style="color: #FFFFFF; font-size: 13px;">
                                                    </h:outputText>

                                                </f:facet>
                                                
                                                    <h:outputText value="#{exame.solicitadoPor.nome}" style="color: #666">
                                                    </h:outputText>
                                                
                                            </rich:column>


                                            <rich:column id="opcoes">
                                                <f:facet name="header">
                                                    <h:outputText value="Opções" style="color: #FFFFFF; font-size: 13px;"></h:outputText>
                                                </f:facet>
                                                
                                                    <h:panelGrid columns="3" style="border:none; border-width:0px;" border="0">
                                                        <a4j:commandLink immediate="true"  ajaxSingle="true" id="silicitacao" oncomplete="#{rich:component('panelAssinar')}.show()" rendered="#{!exame.assinado && usuarioHandler.medico}">
                                                            <h:graphicImage value="/images/solicitar.png" width="20" height="20" />
                                                            <f:setPropertyActionListener value="#{exame}" target="#{exameHandler.exameAtual}" />
                                                        </a4j:commandLink>


                                                        <h:commandLink immediate="true" id="editarlink"
                                                                       action="#{exameHandler.carregarResultadoExame}">
                                                            <h:graphicImage value="/images/text_edit.png" width="20" height="20" />
                                                            <f:setPropertyActionListener value="#{exame}" target="#{exameHandler.exameAtual}" />
                                                        </h:commandLink>

                                                        <h:commandLink immediate="true" id="removerLink"
                                                                         action="#{exameHandler.removerExame}" onclick="return confirm('Tem certeza que deseja remover este exame?')">
                                                            <h:graphicImage value="images/icon_cancelar.gif" width="15" height="15"  rendered="#{!exame.assinado}"/>
                                                            <f:setPropertyActionListener value="#{exame}" target="#{exameHandler.exameAtual}" />
                                                        </h:commandLink>
                                                    </h:panelGrid>
                                                

                                            </rich:column>

                                            <f:facet name="footer">
                                                <f:facet name="footer">

                                                    <h:commandLink value="Solicitar Exame" action="#{exameHandler.novoExame}" immediate="true">
                                                    </h:commandLink>


                                                </f:facet>
                                            </f:facet>
                                        </rich:dataTable>
                                    </div>
                                </h:panelGroup>


                                <h:panelGroup id="panelNenhum"  rendered="#{empty exameHandler.examesDoPaciente}">
                                    <div  id="nenhum" align="center" style="color:red;">
                                        <h:outputText  value="Nenhum Exame cadastrado. "/>
                                        <br/>
                                        <br/>
                                        <h:commandLink value="Solicitar Exame" action="#{exameHandler.novoExame}" immediate="true"/>
                                    </div>
                                </h:panelGroup>
                            </a4j:outputPanel>

                            <rich:modalPanel id="panelAssinar" width="350" height="150" top="250" left="500">
                                <f:facet name="header">
                                    <h:panelGroup>
                                        <h:outputText value="Assinar Solicitaçao"></h:outputText>
                                    </h:panelGroup>
                                </f:facet>
                                <f:facet name="controls">
                                    <h:panelGroup>
                                        <h:outputLink value="#" id="fecharPanel" onclick="#{rich:component('panelAssinar')}.hide()">
                                            Fechar
                                        </h:outputLink>
                                    </h:panelGroup>
                                </f:facet>

                                <h:panelGroup>
                                    <p><b> Deseja assinar a solicitação?</b> </p>
                                    <p>Obs.: Nenhuma alteração na solicitação poderá ser realizada. </p>
                                    <div align="center">
                                        <h:panelGrid columns="2">
                                            <h:commandButton  value="NÃO" styleClass="bt_cancel" style="margin-right: 20px;" onclick="#{rich:component('panelAssinar')}.hide();" immediate="true">
                                            </h:commandButton>
                                            <h:commandButton  value="SIM" styleClass="bt_ok" style="margin-left: 20px;" action="#{exameHandler.assinarSolicitacao}" onclick="#{rich:component('panelAssinar')}.hide();" immediate="true">
                                            </h:commandButton>
                                        </h:panelGrid>

                                    </div>

                                </h:panelGroup>
                            </rich:modalPanel>
                        </div>
                    </h:form>
                </div>
                    <jsp:include page="rodape.jsp"></jsp:include>
                    
            </div>
        </f:view>
    </body>
</html>