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

        <script type="text/javascript">
            function copiar(){
                var texto = document.getElementById('formulario:suggest').value;

                var i=0;
                while (texto.charAt(i) != ' ') {
                    i++;
                }
                document.getElementById('formulario:suggestCid').value = texto.substr(0,i);
                document.getElementById('formulario:suggestProblema').value = texto.substr(i+1);
            }
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
                        <h:outputText  styleClass="diretorio" value="#{fichaHandler.menuFichas.atendimento}"></h:outputText>
                        <h:graphicImage  styleClass="diretorio" value="/images/nav.gif" />
                        <h:outputText  styleClass="diretorio" value="Problemas/Condutas"></h:outputText>
                    </div>

                    <div align="right" id="salvoPor">
                        <h:panelGroup styleClass="salvoPor" rendered="#{!fichaHandler.fichaProblemasCondutasAssinada}">
                            <h:outputText value="Salvo por: " rendered="#{fichaHandler.fichaProblemasCondutas.salvoPor != null}" />
                            <h:outputText value="#{fichaHandler.fichaProblemasCondutas.salvoPor.nome}" rendered="#{fichaHandler.fichaProblemasCondutas.salvoPor != null}" />
                            <h:outputText value="Ficha não Salva" rendered="#{fichaHandler.fichaProblemasCondutas.salvoPor == null}" />
                        </h:panelGroup>
                    </div>

                     <jsp:include page="menuFichas1.jsp"></jsp:include>

                    <div id="panelConfirmacao" align="center" style="margin-top: 15px;">
                        <h:messages id="confirmacao" errorClass="erroConfirmacao" infoClass="sucessoConfirmacao" layout="table" showSummary="true" showDetail="false" globalOnly="true"></h:messages>
                    </div>

                    <div id="center_section">
                        <h:form id="formulario">
                            <div id="content">
                            <a4j:outputPanel id="tabela" rendered="#{not empty fichaHandler.fichaProblemasCondutas.problemasCondutas}">

                                <h2 style="margin-left:5px;">Problemas e Condutas</h2>

                                <div align="center">

                                    <rich:dataTable id="tabelaResultado" value="#{fichaHandler.fichaProblemasCondutas.problemasCondutas}" var="problemasCondutas"
                                                    styleClass="estiloTabela"            cellpadding="2" cellspacing="2" style="width:709px; margin-top:0px;">
                                        <rich:column id="cid" >
                                            <f:facet name="header">
                                                <h:outputText value="CID-10" style="color: #FFFFFF"></h:outputText>
                                            </f:facet>

                                            <h:outputText value="#{problemasCondutas.CID} #{problemasCondutas.problema}" style="color: #666;"></h:outputText>

                                        </rich:column>

                                        <rich:column id="data">
                                            <f:facet name="header">

                                                <h:outputText value="Data" style="color: #FFFFFF;">
                                                </h:outputText>

                                            </f:facet>

                                                <h:outputText value="#{problemasCondutas.salvoEm}" style="color: #666;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>

                                        </rich:column>

                                        <rich:column id="usuario">
                                            <f:facet name="header">

                                                <h:outputText value="Salvo Por" style="color: #FFFFFF;">
                                                </h:outputText>

                                            </f:facet>

                                                <h:outputText value="#{problemasCondutas.salvoPor.nome}" style="color: #666;">
                                                </h:outputText>

                                        </rich:column>


                                        <rich:column id="opcoes">
                                            <f:facet name="header">
                                                <h:outputText value="Opções" style="color: #FFFFFF"></h:outputText>
                                            </f:facet>


                                                <h:panelGrid columns="2" style="border:none;">
                                                    <a4j:commandLink ajaxSingle="true" id="editarlink"
                                                                     oncomplete="#{rich:component('panelProblemaConduta')}.show()" reRender="problemaConduta"   >
                                                        <h:graphicImage value="/images/text_edit.png" width="20" height="20" />
                                                        <f:setPropertyActionListener value="#{problemasCondutas}" target="#{fichaHandler.problemaCondutaAtual}" />
                                                        <f:setPropertyActionListener target="#{cidHandler.cidAtual}" value=""/>
                                                    </a4j:commandLink>

                                                    <h:commandLink id="removerLink" onclick="return confirm('Tem certeza que deseja remover esta conduta?')"
                                                                     action="#{fichaHandler.removerProblemaConduta}" rendered="#{!fichaHandler.fichaProblemasCondutasAssinada}">
                                                        <h:graphicImage value="images/icon_cancelar.gif" width="15" height="15"  />
                                                        <f:setPropertyActionListener value="#{problemasCondutas}" target="#{fichaHandler.problemaCondutaAtual}" />
                                                    </h:commandLink>
                                                </h:panelGrid>


                                        </rich:column>

                                        <f:facet name="footer">
                                            <a4j:commandLink ajaxSingle="true" id="adicionarlink"
                                                             oncomplete="#{rich:component('panelProblemaConduta')}.show()" reRender="problemaConduta"   action="#{fichaHandler.novoProblemaConduta}" rendered="#{!fichaHandler.fichaProblemasCondutasAssinada}">
                                                Adicionar Problema e Conduta
                                                <f:setPropertyActionListener target="#{cidHandler.cidAtual}" value=""/>
                                            </a4j:commandLink>
                                        </f:facet>
                                    </rich:dataTable>
                                </a4j:outputPanel>
                            </div>



                            <h:panelGroup id="panelNenhum" rendered="#{empty fichaHandler.fichaProblemasCondutas.problemasCondutas}">
                                <div  id="nenhum" style="color:red;" align="center">
                                    <h:outputText  value="Nenhum Problema/Conduta cadastrado. "/>
                                    <br/>
                                    <br/>

                                    <a4j:commandLink ajaxSingle="true" id="link"
                                           oncomplete="#{rich:component('formulario:panelProblemaConduta')}.show()" reRender="problemaConduta"  style="margin-left:20px;" action="#{fichaHandler.novoProblemaConduta}" >
                                           Adicionar Problema e Conduta
                                           <f:setPropertyActionListener target="#{cidHandler.cidAtual}" value=""/>
                                    </a4j:commandLink>
                                </div>
                            </h:panelGroup>


                            <rich:modalPanel id="panelProblemaConduta"  width="750" height="600" style="overflow: auto;" minHeight="400" minWidth="600" onshow="javascript:teste()">
                                <f:facet name="header">
                                    <h:panelGroup>

                                        <h:outputText value="Problema e Conduta"></h:outputText>
                                    </h:panelGroup>
                                </f:facet>
                                <f:facet name="controls">
                                    <h:panelGroup>
                                        <h:outputLink value="#" id="fechar" onclick="#{rich:component('panelProblemaConduta')}.hide()">
                                            Fechar
                                        </h:outputLink>
                                    </h:panelGroup>
                                </f:facet>

                                <a4j:outputPanel id="problemaConduta">
                                    <h:panelGrid columns="1" style="width: 100%">
                                        <h:panelGroup rendered="#{!fichaHandler.fichaProblemasCondutasAssinada}">
                                            <h:panelGrid columns="2">
                                                <h:outputLabel value="Pesquisar CID: " style="padding-bottom: 5px;"></h:outputLabel>
                                                <h:inputText autocomplete="off" id="suggest" style="float: left; width: 100%; margin-left: 5px;" maxlength="200" size="100" value="#{cidHandler.cidAtual}"></h:inputText>
                                                <rich:suggestionbox  onselect="copiar()" for="suggest" fetchValue="#{suggest.cid} #{suggest.descricao}" suggestionAction="#{cidHandler.autocomplete}"  var="suggest" height="150" width="650" >

                                                    <h:column>
                                                        <h:outputText value="#{suggest.cid}"/>
                                                    </h:column>

                                                    <h:column>
                                                        <h:outputText value="#{suggest.descricao}" />
                                                    </h:column>

                                                </rich:suggestionbox>
                                            </h:panelGrid>


                                            <div class="title" style="margin-bottom: 15px; margin-top:5px; padding-top:10px; font-weight:bold;">
                                                <h:outputText>Problema</h:outputText>
                                            </div>
                                            <div style="margin-bottom: 5px; margin-top:5px;">

                                               <h:panelGrid columns="2">
                                                    <h:outputLabel value="CID: " style="padding-bottom: 5px;"/>
                                                    <h:inputText style="width: 70px; margin-left: 5px; margin-bottom: 5px;"value="#{fichaHandler.problemaCondutaAtual.CID}" id="suggestCid" size="5" readonly="true" disabled="true" ></h:inputText>
                                                    <h:outputLabel value="Doença: " style="padding-bottom: 5px;"/>
                                                    <h:inputText id="suggestProblema" style="width: 100%; margin-left: 5px;" size="100" value="#{fichaHandler.problemaCondutaAtual.problema}" disabled="true"/>
                                                </h:panelGrid>
                                            </div>

                                            <br/>
                                            <div class="title" style="margin-bottom: 15px; margin-top:10px">
                                                <h:outputText>Conduta</h:outputText>
                                            </div>
                                            <h:inputTextarea  style="width: 718px;" cols="85" rows="10"  value="#{fichaHandler.problemaCondutaAtual.conduta}" />
                                            <br/>

                                        </h:panelGroup>

                                        <h:panelGroup rendered="#{fichaHandler.fichaProblemasCondutasAssinada}">
                                            <div class="title" style="margin-bottom: 15px; margin-top:5px;">
                                                <h:outputText>Problema</h:outputText>
                                            </div>

                                            <div id="espacoTextoAssinado" style="width:680px">
                                                <h:outputText value="CID: " style="font-weight:bold;"></h:outputText>
                                                <h:outputText value="#{fichaHandler.problemaCondutaAtual.CID}"></h:outputText>
                                                <br/>
                                                <h:outputText value="Descrição:" style="font-weight:bold;"></h:outputText>
                                                <h:outputText  value="#{fichaHandler.problemaCondutaAtual.problema}"/>
                                            </div>
                                            <br/>
                                            <div class="title" style="margin-bottom: 15px; margin-top:10px">
                                                <h:outputText>Conduta</h:outputText>
                                            </div>
                                            <div id="espacoTextoAssinado" style="width:680px">
                                                <h:outputText value="#{fichaHandler.problemaCondutaAtual.conduta}" />
                                            </div>
                                            <br/>

                                            <div align="center" style="margin-top:10px">
                                                <h:outputLink value="#"  onclick="#{rich:component('panelProblemaConduta')}.hide()">
                                                    Fechar Janela
                                                </h:outputLink>
                                            </div>
                                        </h:panelGroup>

                                        <h:panelGroup rendered="#{!fichaHandler.fichaProblemasCondutasAssinada}">
                                            <div align="center" style="margin-top:10px">
                                                <h:panelGrid columns="1">
                                                    <h:commandButton id="botaoSalvar" value="SALVAR" styleClass="bt_save" action="#{fichaHandler.adicionarProblemaConduta}" onclick="#{rich:component('panelProblemaConduta')}.hide();" rendered="#{fichaHandler.problemaCondutaAtual.idProblemasCondutas == null}" actionListener="#{fichaHandler.adicionarCid}">
                                                        <f:attribute name="cid" value="#{cidHandler.cidAtual}"/>
                                                    </h:commandButton>
                                                    <h:commandButton id="botaoEditar" value="SALVAR" styleClass="bt_save" action="#{fichaHandler.editarProblemaConduta}" onclick="#{rich:component('panelProblemaConduta')}.hide()" rendered="#{fichaHandler.problemaCondutaAtual.idProblemasCondutas != null}" actionListener="#{fichaHandler.atualizarCid}">
                                                        <f:attribute name="cid" value="#{cidHandler.cidAtual}"/>
                                                    </h:commandButton>
                                                </h:panelGrid>

                                                <div align="center" style="margin-top:10px">
                                                    <h:outputLink value="#"  onclick="#{rich:component('panelProblemaConduta')}.hide()">
                                                        Fechar Janela
                                                    </h:outputLink>
                                                </div>

                                            </div>
                                            <br/>
                                        </h:panelGroup>
                                    </h:panelGrid>
                                </a4j:outputPanel>
                            </rich:modalPanel>


                            <div align="center" style="margin-top:50px">
                                <h:panelGrid columns="3" rendered="#{!empty fichaHandler.fichaProblemasCondutas.problemasCondutas}">
                                    <h:commandButton styleClass="bt_cancel" style="margin-right: 10px;" value="CANCELAR" action="atendimentos" rendered="false"></h:commandButton>
                                    <h:commandButton styleClass="bt_save" style="margin-right: 10px;" value="SALVAR" action="#{fichaHandler.salvarFichaProblemasCondutas}" rendered="false"></h:commandButton>
                                    <h:commandButton styleClass="botaoBuscar" value="ASSINAR" action="#{fichaHandler.assinarFichaProblemasCondutas}" rendered="#{!fichaHandler.fichaProblemasCondutasAssinada}" disabled="#{!usuarioHandler.medico}">
                                        <a4j:support reRender="adendosIS" event="oncomplete"/>
                                    </h:commandButton>
                                </h:panelGrid>
                            </div>
                            </div>
                        <div id="conteudoAssinado">
                            <a4j:outputPanel id="adendosProblemasCondutas" rendered="#{fichaHandler.fichaProblemasCondutasAssinada}">
                                <f:subview id="subviewAdendo">
                                    <jsp:include page="adendo.jsp"></jsp:include>
                                </f:subview>
                            </a4j:outputPanel>
                        </div>
                    </h:form>
                    </div>
                        <jsp:include page="rodape.jsp"></jsp:include>
                    </div>
            </div>
        </f:view>
    </body>
</html>