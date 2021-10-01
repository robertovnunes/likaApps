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
        <!--<script language="javascript" type="text/javascript" src="js/flash.js"></script>-->
        <link media="screen" rel="stylesheet" type="text/css" href="css/screen.css" />
        <script type="text/javascript" src="js/mascaras.js"></script>
        <script>
            window.onload = initializeLinks();
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
                    <jsp:include page="menuUsuario1.jsp"/>
                    <div id="location">
                        <p>
                            <h:form>
                                <h:commandLink action="#{usuarioHandler.visaoUsuario}">
                                    <h:outputText value="Usuários"/>
                                </h:commandLink> > Buscar Usuário
                            </h:form>
                        </p>
                    </div>
                </div><!-- /#header -->

                <div id="page_content">
                    <jsp:include page="latNavUsuarios.jsp"></jsp:include>

                    <div id="center_section">
                        <h:form>
                            <div id="panelConfirmacao" align="center" style="margin-top: 15px;">
                                <h:messages id="confirmacao" errorClass="erroConfirmacao" infoClass="sucessoConfirmacao" layout="table" showSummary="true" showDetail="false" globalOnly="true"></h:messages>
                            </div>
                            <div align="center" >
                            <h:panelGroup rendered="#{usuarioHandler.administrador}">
                                

                                    <h:inputText
                                        id="textBuscaLogin" style="width: 447px; float: left; margin-left: 90px" value="#{usuarioHandler.parametroConsulta}" rendered="#{usuarioHandler.mostrarPesquisaLogin}">
                                    </h:inputText>


                                    <h:inputText
                                        id="textBuscaNome" style="width: 447px; float: left; margin-left: 90px" value="#{usuarioHandler.parametroConsulta}" rendered="#{usuarioHandler.mostrarPesquisaNome}">
                                    </h:inputText>

                                    <h:inputText
                                        id="textBuscaCPF" style="width: 447px; float: left; margin-left: 90px" value="#{usuarioHandler.parametroConsulta}" rendered="#{usuarioHandler.mostrarPesquisaCPF}"
                                        onkeypress="mascara(this,cpf)" maxlength="14">
                                    </h:inputText>



                                    <h:commandButton id="botaoBuscar" value="Buscar"  action="#{usuarioHandler.consultar}" styleClass="botaoBuscar" style="float: left; margin-left: 20px;">
                                        <a4j:support reRender="tabelaResultado"></a4j:support>
                                        <a4j:support reRender="nenhum"></a4j:support>
                                    </h:commandButton>
                                    </h:panelGroup>
                                
                                    <br/>
                                    <br/>

                                    <h:selectOneRadio value="#{usuarioHandler.tipoSelecionado}" onclick='submit()' styleClass="opcaoBusca">
                                        <f:selectItems value="#{usuarioHandler.tiposDePesquisas}" />
                                    </h:selectOneRadio>
                            

                                    </div>


                                <div  id="nenhum" align="center" style="color:red;"><h:outputText rendered="#{empty usuarioHandler.usuariosListados}" value="Nenhum Usuário encontrado. "/>
                                    <br/>
                                    <h:messages/>
                                </div>

                                <br/>

                                <a4j:outputPanel id="tabela" rendered="#{not empty usuarioHandler.usuariosListados}">

                                    <div class="title" style="padding-left: 200px; margin-bottom: 15px">

                                        <h:outputText>Usuários</h:outputText>

                                    </div>

                                    <div align="center" >
                                        <rich:dataTable id="tabelaResultado" value="#{usuarioHandler.usuariosListados}" var="usr"
                                                        styleClass="estiloTabela" cellpadding="2" cellspacing="2" style="width: 709px" rows="5">
                                            <rich:column id="nome" >
                                                <f:facet name="header">
                                                    <h:outputText value="Nome" style="color: #FFFFFF"></h:outputText>
                                                </f:facet>
                                                    <h:outputText value="#{usr.nome}" style="color: #666"></h:outputText>
                                            </rich:column>

                                            <rich:column id="login">
                                                <f:facet name="header">
                                                    <h:outputText value="Login" style="color: #FFFFFF"></h:outputText>
                                                </f:facet>
                                                     <h:outputText value="#{usr.login}" style="color: #666"></h:outputText>
                                            </rich:column>

                                            <rich:column id="cpf">
                                                <f:facet name="header">
                                                    <h:outputText value="CPF" style="color: #FFFFFF"></h:outputText>
                                                </f:facet>
                                               
                                                    <h:outputText value="#{usr.CPF}" style="color: #666"></h:outputText>
                                               
                                            </rich:column>

                                            <rich:column id="opcoes">
                                                <f:facet name="header">
                                                    <h:outputText value="Opções" style="color: #FFFFFF"></h:outputText>
                                                </f:facet>

                                                

                                                    <h:commandLink action="#{usuarioHandler.editarOutroUsuario}"
                                                                   title="Alterar Cadastro do Paciente">
                                                        <f:setPropertyActionListener target="#{usuarioHandler.usuarioSelecionado}" value="#{usr}"/>
                                                        <h:graphicImage value="/img/icon_edit.gif"/>
                                                    </h:commandLink>
                                                

                                            </rich:column>

                                            <f:facet name="footer">
                                                <rich:datascroller />
                                            </f:facet>

                                        </rich:dataTable>
                                    </a4j:outputPanel>
                                </div>                            
                        </h:form>
                    </div> <!--ColLatContent-->                    
                    <jsp:include page="rodape.jsp"></jsp:include>
                </div>
            </div>
        </f:view>
    </body>

</html>