<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.ajax4jsf.org/rich" prefix="rich"%>
<%@ taglib uri="https://ajax4jsf.dev.java.net/ajax" prefix="a4j"%>
<%@ taglib prefix="stella" uri="http://stella.caelum.com.br/faces"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>CLIN</title>
        <link rel="stylesheet" type="text/css" href="css/screen.css" />        
        <script type="text/javascript" src="js/mascaras.js"></script>
        <script type="text/javascript">
            jQuery.noConflict();
            jQuery(document).ready(function(){

            });
        </script>
    </head>
    <body>
        <f:view>
            <div id="msg" class="alert dnone"> <!-- alterar apenas a classe .erro .confirm .alert -->
                <ul>
                    <li><img src="img/transparent.gif" class="icon_erro" />Mensagem de erro</li> <!-- colocar a classe da imagem também -->
                    <li><img src="img/transparent.gif" class="icon_alert" />Mensagem de alerta</li>
                    <li><img src="img/transparent.gif" class="icon_confirm" />Mensagem de confirmação</li>
                </ul>
            </div>
            <div id="main_content">
                <div id="header">  
                    <jsp:include page="header.jsp"/>                    
                    <jsp:include page="menuPaciente1.jsp"/>
                    
                    <div id="location">
                        <p>
                            <h:form>
                                <h:commandLink action="pacientes">
                                    <h:outputText value="Pacientes"/>
                                </h:commandLink> > Buscar Paciente
                            </h:form>
                        </p>
                    </div>                    
                </div><!-- /#header -->
                <div id="page_content">
                    
                    <jsp:include page="latNavPacientes.jsp"></jsp:include>

                    <div id="center_section">

                        <h:form>
                            <div id="panelConfirmacao" align="center" style="margin-top: 15px;">
                                <h:messages id="confirmacao" errorClass="erroConfirmacao" infoClass="sucessoConfirmacao" layout="table" showSummary="true" showDetail="false" globalOnly="true"></h:messages>
                            </div>
                            <div align="center" style="height: 79px">
                                <h:panelGroup id="campo">
                                    <h:selectOneMenu value="#{pacienteHandler.parametroConsulta}" rendered="#{pacienteHandler.mostrarPesquisaSexo}" style="float: left; margin-left: 220px">
                                        <f:selectItem itemValue="M" itemLabel="Masculino" />
                                        <f:selectItem itemValue="F" itemLabel="Feminino" />
                                    </h:selectOneMenu>
                                    <h:inputText id="textBuscaNomeMae" style="width: 447px; float: left; margin-left: 90px" value="#{pacienteHandler.parametroConsulta}" rendered="#{pacienteHandler.mostrarPesquisaNomeMae}"/>
                                    <h:inputText id="textBuscaNome" style="width: 447px; float: left; margin-left: 90px" value="#{pacienteHandler.parametroConsulta}" rendered="#{pacienteHandler.mostrarPesquisaNome}">
                                    </h:inputText>
                                    <h:inputText id="textBuscaCPF" style="width: 447px; float: left; margin-left: 90px" value="#{pacienteHandler.parametroConsulta}" rendered="#{pacienteHandler.mostrarPesquisaCPF}" onkeypress="mascara(this,cpf)" maxlength="14"/>
                                    <h:inputText id="textBuscaProntuario" style="width: 447px; float: left; margin-left: 90px" value="#{pacienteHandler.parametroConsulta}" rendered="#{pacienteHandler.mostrarPesquisaProntuario}" onkeypress="mascara(this,prontuario)" maxlength="9"/>
                                    <h:inputText style="width: 447px; float: left; margin-left: 90px" id="textBuscaNascimento" value="#{pacienteHandler.parametroConsulta}"  rendered="#{pacienteHandler.mostrarPesquisaNascimento}"
                                                 onkeypress="mascara(this,data)" maxlength="10" />

                                    <a4j:commandButton id="botaoBuscar" style="float: left; margin-left: 20px;" value="Buscar" action="#{pacienteHandler.consultar}" reRender="panel" styleClass="botaoBuscar">
                                    </a4j:commandButton>
                                </h:panelGroup>

                                <br/>
                                <br/>
                                <h:selectOneRadio value="#{pacienteHandler.tipoSelecionado}" styleClass="opcaoBusca">
                                    <f:selectItems value="#{pacienteHandler.tiposDePesquisas}"/>
                                    <a4j:support reRender="campo" event="onclick" action="#{pacienteHandler.limparConsulta}" ajaxSingle="true" />
                                </h:selectOneRadio>

                            </div>

                            <br/>
                            <br/>

                            <a4j:outputPanel  id="panel" ajaxRendered="true">

                                <h:panelGroup rendered="#{empty pacienteHandler.pacientesListados }">
                                    <div  id="nenhum" align="center" style="color:red;">
                                        <h:outputText  value="Nenhum Paciente encontrado. "/>
                                        <br/>
                                        <h:message  for="textBuscaNascimento"/>
                                    </div>
                                </h:panelGroup>


                                <h:panelGroup rendered="#{not empty pacienteHandler.pacientesListados }">
                                    
                                    <%--<h:outputText value="Pacientes"/>--%>
                                    
                                    <h2>Resultado da Pesquisa</h2>

                                    <div align="center" >

                                        <rich:dataTable id="tabelaResultado" value="#{pacienteHandler.pacientesListados}" var="pac"
                                                        styleClass="estiloTabela" cellpadding="2" cellspacing="2" style="width: 709px" rows="10">
                                            <rich:column id="nome">
                                                <f:facet name="header">
                                                    <h:outputText value="Nome" style="color: #FFFFFF; font-size: 13px;"></h:outputText>
                                                </f:facet>
                                                
                                                <h:outputText value="#{pac.nome}" style="color: #666;"></h:outputText>
                                                
                                            </rich:column>

                                            <rich:column id="prontuario">
                                                <f:facet name="header">
                                                    <h:outputText value="Prontuário" style="color: #FFFFFF; font-size: 13px;"></h:outputText>
                                                </f:facet>
                                                
                                                <h:outputText value="#{pac.prontuario}" style="color: #666"></h:outputText>
                                                
                                            </rich:column>

                                            <rich:column id="DataNascimento">
                                                <f:facet name="header">

                                                    <h:outputText value="Nascimento" style="color: #FFFFFF; font-size: 13px;">
                                                    </h:outputText>

                                                </f:facet>
                                                
                                                <h:outputText value="#{pac.dataNascimento}" style="color: #666">
                                                    <f:convertDateTime type="date" pattern="dd/MM/yyyy"/>
                                                </h:outputText>
                                                
                                            </rich:column>

                                            <rich:column id="NomeMae">
                                                <f:facet name="header">
                                                    <h:outputText value="Nome da Mãe" style="color: #FFFFFF; font-size: 13px;"></h:outputText>
                                                </f:facet>
                                                
                                                <h:outputText value="#{pac.nomeDaMae}" style="color: #666"></h:outputText>
                                                
                                            </rich:column>

                                            <rich:column id="opcoes">
                                                <f:facet name="header">
                                                    <h:outputText value="Opções" style="color: #FFFFFF; font-size: 13px;"></h:outputText>
                                                </f:facet>

                                                
                                                <h:commandLink action="#{pacienteHandler.editarPaciente}"
                                                               title="Alterar Cadastro do Paciente" style="margin:5px;" immediate="true">
                                                    <f:setPropertyActionListener target="#{pacienteHandler.paciente}" value="#{pac}"/>
                                                    <f:setPropertyActionListener target="#{atendimentoHandler.pacienteAtual}" value="#{pac}"/>
                                                    <f:setPropertyActionListener target="#{atendimentoAteriorHandler.paciente}" value="#{pac}"/>
                                                    <h:graphicImage value="/images/text_edit.png" width="20" height="20" />
                                                </h:commandLink>

                                                <h:commandLink style="margin:5px;" action="#{atendimentoHandler.atendimentosDoPaciente}" title="Atendimentos" immediate="true">
                                                    <f:setPropertyActionListener target="#{atendimentoHandler.pacienteAtual}" value="#{pac}"/>
                                                    <f:setPropertyActionListener target="#{pacienteHandler.paciente}" value="#{pac}"/>
                                                    <f:setPropertyActionListener target="#{atendimentoAteriorHandler.paciente}" value="#{pac}"/>
                                                    <h:graphicImage value="/images/prontuario.jpg" width="20" height="20" />
                                                </h:commandLink>

                                                

                                            </rich:column>

                                            <f:facet name="footer">
                                                <rich:datascroller fastControls="hide">

                                                    <f:facet name="first">
                                                        <h:outputText value="Primeira" styleClass="scrollerCell" style="background-color: #D0DFEC; color: #11518A; text-decoration: underline;"/>
                                                    </f:facet>
                                                    <f:facet name="first_disabled">
                                                        <h:outputText value="Primeira" styleClass="scrollerCell" />
                                                    </f:facet>
                                                    <f:facet name="last">
                                                        <h:outputText value="Última" styleClass="scrollerCell" style="background-color: #D0DFEC; color: #11518A; text-decoration: underline;"/>
                                                    </f:facet>
                                                    <f:facet name="last_disabled">
                                                        <h:outputText value="Última" styleClass="scrollerCell" />
                                                    </f:facet>
                                                    <f:facet name="previous">
                                                        <h:outputText value="Anterior" styleClass="scrollerCell" style="background-color: #D0DFEC; color: #11518A; text-decoration: underline;"/>
                                                    </f:facet>
                                                    <f:facet name="previous_disabled">
                                                        <h:outputText value="Anterior" styleClass="scrollerCell" />
                                                    </f:facet>
                                                    <f:facet name="next" >
                                                        <h:outputText value="Próxima" styleClass="scrollerCell" style="background-color: #D0DFEC; color: #11518A; text-decoration: underline;"/>
                                                    </f:facet>
                                                    <f:facet name="next_disabled">
                                                        <h:outputText value="Próxima" styleClass="scrollerCell" />
                                                    </f:facet>


                                                </rich:datascroller>
                                            </f:facet>

                                        </rich:dataTable>

                                    </h:panelGroup>
                                </div>
                            </a4j:outputPanel>
                        </h:form>


                    </div><!-- /#ColLatContent -->
                    
                    <jsp:include page="rodape.jsp"></jsp:include>
                    

                </div>

            </div>
        </f:view>
    </body>
</html>