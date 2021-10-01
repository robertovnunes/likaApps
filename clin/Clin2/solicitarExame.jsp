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
        <style type="text/css">
            #opcaoExame input, #opcaoExame select{
                margin: 5px;
            }

            .rich-calendar-button{
                float: left;
            }

            #opcaoExame input[type='checkbox']{
                width: auto;
            }

            .tabela{
                margin-left: 5px;
            }

            .tabela td{
                width: 130px;
            }

            .tabela td img{
                float: left;                
            }
        </style>
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
                                </h:commandLink> > Buscar Paciente
                            </p>
                        </h:form>
                    </div>
                </div><!-- /#header -->

                <div id="page_content">
                    <div align="left" id="diretorio">
                        <h:outputText  styleClass="diretorio" value="Solicitar Exame"></h:outputText>
                    </div>

                    <jsp:include page="menuFichas1.jsp"></jsp:include>

                    <h:form>
                        <div id="center_section">
                            <a4j:outputPanel id="panelSolicitacao" ajaxRendered="true">
                                <h2> Solicitar Novo Exame </h2>
                                <div id="opcaoExame">
                                    <h:panelGrid columns="2" styleClass="tabela">
                                        <h:outputText value="Tipo do Exame: "/>
                                        <h:selectOneMenu value="#{exameHandler.exameAtual.nomeExame}">
                                            <a4j:support  event="onchange" reRender="resultadoEritrograma" action="#{exameHandler.criarResultadoExterno}" ajaxSingle="true"/>
                                            <f:selectItem itemValue="Eritrograma" itemLabel="Eritrograma" />
                                            <f:selectItem itemValue="Leucograma" itemLabel="Leucograma" />
                                            <f:selectItem itemValue="Hemograma" itemLabel="Hemograma" />
                                            <f:selectItem itemValue="Lonograma" itemLabel="Lonograma" />
                                            <f:selectItem itemValue="VHS" itemLabel="VHS" />
                                            <f:selectItem itemValue="PCR" itemLabel="PCR" />
                                            <f:selectItem itemValue="Glicemia jejum" itemLabel="Glicemia jejum" />
                                            <f:selectItem itemValue="Hemoglobina glicada" itemLabel="Hemoglobina glicada" />
                                            <f:selectItem itemValue="Na" itemLabel="Na" />
                                            <f:selectItem itemValue="K" itemLabel="K" />
                                            <f:selectItem itemValue="Cl" itemLabel="Cl" />
                                            <f:selectItem itemValue="P" itemLabel="P" />
                                            <f:selectItem itemValue="Mg" itemLabel="Mg" />
                                            <f:selectItem itemValue="Ca" itemLabel="Ca" />
                                            <f:selectItem itemValue="Alb" itemLabel="Alb" />
                                            <f:selectItem itemValue="Ur" itemLabel="Ur" />
                                            <f:selectItem itemValue="Cr" itemLabel="Cr" />
                                            <f:selectItem itemValue="TGO" itemLabel="TGO" />
                                            <f:selectItem itemValue="TGP" itemLabel="TGP" />
                                            <f:selectItem itemValue="FA" itemLabel="FA" />
                                            <f:selectItem itemValue="GGT" itemLabel="GGT" />
                                            <f:selectItem itemValue="DHL" itemLabel="DHL" />
                                            <f:selectItem itemValue="Amilase" itemLabel="Amilase" />
                                            <f:selectItem itemValue="Lipase" itemLabel="Lipase" />
                                            <f:selectItem itemValue="Bil totais" itemLabel="Bil totais" />
                                            <f:selectItem itemValue="Bil direta" itemLabel="Bil direta" />
                                            <f:selectItem itemValue="Bil indireta" itemLabel="Bil indireta" />
                                            <f:selectItem itemValue="colestrol T" itemLabel="colestrol T" />
                                            <f:selectItem itemValue="LDL" itemLabel="LDL" />
                                            <f:selectItem itemValue="HDL" itemLabel="HDL" />
                                            <f:selectItem itemValue="VLDL" itemLabel="VLDL" />
                                            <f:selectItem itemValue="Triglicerídeos" itemLabel="Triglicerídeos" />
                                            <f:selectItem itemValue="Ácido Úrico" itemLabel="Ácido Úrico" />
                                            <f:selectItem itemValue="TSH" itemLabel="TSH" />
                                            <f:selectItem itemValue="T4L" itemLabel="T4L" />
                                            <f:selectItem itemValue="PSA total" itemLabel="PSA total" />
                                            <f:selectItem itemValue="PSA livre" itemLabel="PSA livre" />
                                            <f:selectItem itemValue="FAN" itemLabel="FAN" />
                                            <f:selectItem itemValue="F. reumatóide" itemLabel="F. reumatóide" />
                                            <f:selectItem itemValue="TP/Ae" itemLabel="TP/Ae" />
                                            <f:selectItem itemValue="INR" itemLabel="INR" />
                                            <f:selectItem itemValue="TTPa" itemLabel="TTPa" />
                                            <f:selectItem itemValue="Outros" itemLabel="Outros" />
                                        </h:selectOneMenu>

                                        <h:outputText value="Data da solicitação: "/>
                                        <rich:calendar value="#{exameHandler.exameAtual.dataExame}" datePattern="dd/MM/yyyy" showApplyButton="false" cellWidth="24px" cellHeight="22px" style="width:155px; float: left;"
                                                       enableManualInput="true" requiredMessage="É necessário informar a Data da Solicitação" converterMessage="Data da Solicitação inválida!"/>

                                    </h:panelGrid>

                                    <h:panelGrid columns="2">
                                        <h:selectBooleanCheckbox value="#{exameHandler.exameAtual.solicitanteExterno}">
                                            <a4j:support  event="onclick" reRender="panelSolicitacao"  action="#{exameHandler.criarResultadoExterno}" ajaxSingle="true"/>
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Solicitação externa?"/>
                                    </h:panelGrid>


                                    <h:panelGrid columns="2" rendered="#{exameHandler.exameAtual.solicitanteExterno == true}">
                                        <h:outputText value="Médico Solicitante: "/>
                                        <h:inputText value="#{exameHandler.exameAtual.medicoSolicitanteExterno}" size="80" maxlength="100" disabled="#{!exameHandler.exameAtual.solicitanteExterno}" required="true" requiredMessage="O nome do Médico Solicitante externo é necessário!"/>
                                    </h:panelGrid>
                                </div>

                                <h:panelGroup id="resultadoEritrograma" rendered="#{exameHandler.exameAtual.nomeExame == 'Eritrograma' && exameHandler.exameAtual.solicitanteExterno}">
                                    <h2> Resultado Eritrograma</h2>
                                    <div id="opcaoExame">
                                        <h:panelGrid columns="2" rendered="#{!exameHandler.resultadoAtual.assinado}" style="margin-botton:5px;">
                                            <h:outputText value="Data do Laudo:"/>
                                            <rich:calendar value="#{exameHandler.resultadoEritograma.dataResultado}" datePattern="dd/MM/yyyy" showApplyButton="false" cellWidth="24px" cellHeight="22px" style="width:150px"
                                                           enableManualInput="true" required="true" requiredMessage="É necessário informar a Data do resultado!"/>
                                        </h:panelGrid>
                                        <h:panelGrid columns="2" rendered="#{!exameHandler.resultadoAtual.assinado}">
                                            <h:outputText value="HM:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoEritograma.hm}" maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  HM!"/>
                                            <h:outputText value="HB:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoEritograma.hb}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do HB!"/>
                                            <h:outputText value="HT:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoEritograma.ht}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do HT!"/>
                                            <h:outputText value="VCM:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoEritograma.vcm}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do VCM!"/>
                                            <h:outputText value="HCM:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoEritograma.hcm}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do HCM!"/>
                                            <h:outputText value="CHCM:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoEritograma.chcm}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do CHCM!"/>

                                        </h:panelGrid>
                                    </div>
                                </h:panelGroup>

                                <h:panelGroup id="resultadoHemograma" rendered="#{exameHandler.exameAtual.nomeExame == 'Hemograma' && exameHandler.exameAtual.solicitanteExterno}">

                                    <h2> Resultado Hemograma</h2>
                                    <div id="opcaoExame">
                                        <h:panelGrid columns="2" rendered="#{!exameHandler.resultadoAtual.assinado}" style="margin-botton:5px;">
                                            <h:outputText value="Data do Laudo:"/>
                                            <rich:calendar value="#{exameHandler.resultadoHemograma.dataResultado}" datePattern="dd/MM/yyyy" showApplyButton="false" cellWidth="24px" cellHeight="22px" style="width:150px"
                                                           enableManualInput="true" required="true" requiredMessage="É necessário informar a Data do resultado" converterMessage="Data do Laudo inválida!"/>
                                        </h:panelGrid>
                                        <h:panelGrid columns="2" rendered="#{!exameHandler.resultadoAtual.assinado}">
                                            <h:outputText value="Leuco:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoHemograma.leuco}" maxlength="20" size="20"/>
                                            <h:outputText value="Neutrófilo:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoHemograma.neutrofilos}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  Leuco!"/>
                                            <h:outputText value="Linfocitos:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoHemograma.linfocitos}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  Neutrófilo!"/>
                                            <h:outputText value="Monocitos:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoHemograma.monocitos}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  Linfocitos!"/>
                                            <h:outputText value="Eosinofilos:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoHemograma.eosinofilos}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  Monocitos!"/>
                                            <h:outputText value="Basofilos:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoHemograma.basofilos}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  Eosinofilos!"/>
                                            <h:outputText value="HM:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoHemograma.hm}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  HM!"/>
                                            <h:outputText value="HB:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoHemograma.hb}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  HB!"/>
                                            <h:outputText value="HT:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoHemograma.ht}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  HT!"/>
                                            <h:outputText value="VCM:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoHemograma.vcm}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  VCM!"/>
                                            <h:outputText value="HCM:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoHemograma.hcm}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  HCM!"/>
                                            <h:outputText value="CHCM:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoHemograma.chcm}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  CHCM!"/>
                                            <h:outputText value="PLT:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoHemograma.plt}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  PLT!"/>
                                        </h:panelGrid>
                                    </div>
                                </h:panelGroup>

                                <h:panelGroup id="resultadoLeucograma" rendered="#{exameHandler.exameAtual.nomeExame == 'Leucograma' && exameHandler.exameAtual.solicitanteExterno}">
                                    <h2> Resultado Leucograma</h2>
                                    <div id="opcaoExame">
                                        <h:panelGrid columns="2" rendered="#{!exameHandler.resultadoAtual.assinado}" style="margin-botton:5px;">
                                            <h:outputText value="Data do Laudo:"/>
                                            <rich:calendar value="#{exameHandler.resultadoLeucograma.dataResultado}" datePattern="dd/MM/yyyy" showApplyButton="false" cellWidth="24px" cellHeight="22px" style="width:150px"
                                                           enableManualInput="true" required="true" requiredMessage="É necessário informar a Data do resultado" converterMessage="Data do Laudo inválida!"/>
                                        </h:panelGrid>
                                        <h:panelGrid columns="2" rendered="#{!exameHandler.resultadoAtual.assinado}">
                                            <h:outputText value="Leuco:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoLeucograma.leuco}" maxlength="20" size="20"/>
                                            <h:outputText value="Neutrófilo:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoLeucograma.neutrofilos}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  Neutrófilo!"/>
                                            <h:outputText value="Linfocitos:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoLeucograma.linfocitos}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  Linfocitos!"/>
                                            <h:outputText value="Monocitos:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoLeucograma.monocitos}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  Monocitos!"/>
                                            <h:outputText value="Eosinofilos:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoLeucograma.eosinofilos}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  Eosinofilos!"/>
                                            <h:outputText value="Basofilos:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoLeucograma.basofilos}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  Basofilos!"/>
                                        </h:panelGrid>
                                    </div>
                                </h:panelGroup>


                                <h:panelGroup id="resultadoGenerico" rendered="#{(exameHandler.exameAtual.nomeExame != 'Leucograma' && exameHandler.exameAtual.nomeExame != 'Hemograma' && exameHandler.exameAtual.nomeExame != 'Eritrograma' && exameHandler.exameAtual.nomeExame != 'Lonograma') && exameHandler.exameAtual.solicitanteExterno}">
                                    <h2> <h:outputText value="Resultado #{exameHandler.exameAtual.nomeExame}"></h:outputText></h2>
                                    <div id="opcaoExame">

                                        <h:panelGrid columns="2" rendered="#{!exameHandler.resultadoAtual.assinado}" style="margin-botton:5px;">
                                            <h:outputText value="Data do Laudo:"/>
                                            <rich:calendar value="#{exameHandler.resultadoGenerico.dataResultado}" datePattern="dd/MM/yyyy" showApplyButton="false" cellWidth="24px" cellHeight="22px" style="width:150px"
                                                           enableManualInput="true" required="true" requiredMessage="É necessário informar a Data do resultado" converterMessage="Data do Laudo inválida!"/>
                                        </h:panelGrid>
                                        <h:panelGrid columns="1" rendered="#{!exameHandler.resultadoAtual.assinado}">
                                            <h:outputText value="#{exameHandler.exameAtual.nomeExame}"></h:outputText>
                                            <h:inputTextarea value="#{exameHandler.resultadoGenerico.dados}" cols="50" rows="3" onkeyup="limitaTamanho(this,100)" required="true" requiredMessage="É necessário informar o valor do resultado"/>
                                        </h:panelGrid>
                                    </div>
                                </h:panelGroup>


                                <h:panelGroup id="resultadoLonograma" rendered="#{exameHandler.exameAtual.nomeExame == 'Lonograma' && exameHandler.exameAtual.solicitanteExterno}">

                                    <h2>Resultado Lonograma</h2>
                                    <div id="opcaoExame">
                                        <h:panelGrid columns="2" rendered="#{!exameHandler.resultadoAtual.assinado}" style="margin-botton:5px;">
                                            <h:outputText value="Data do Laudo:"/>
                                            <rich:calendar value="#{exameHandler.resultadoLonograma.dataResultado}" datePattern="dd/MM/yyyy" showApplyButton="false" cellWidth="24px" cellHeight="22px" style="width:150px"
                                                           enableManualInput="true" required="true" requiredMessage="É necessário informar a Data do resultado" converterMessage="Data do Laudo inválida!"/>
                                        </h:panelGrid>
                                        <h:panelGrid columns="2" rendered="#{!exameHandler.resultadoAtual.assinado}">
                                            <h:outputText value="K:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoLonograma.k}" maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  K!"/>
                                            <h:outputText value="Na:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoLonograma.na}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  Na!"/>
                                            <h:outputText value="RA:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoLonograma.ra}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  RA!"/>
                                            <h:outputText value="Bicarbonato:"></h:outputText>
                                            <h:inputText value="#{exameHandler.resultadoLonograma.bicarbonato}"  maxlength="20" size="20" required="true" requiredMessage="É necessário informar o valor do  Bicarbonato!"/>
                                        </h:panelGrid>
                                    </div>
                                </h:panelGroup>

                                <div style="color: red;">
                                    <h:messages style="color:red;" layout="table"/>
                                </div>

                                <div align="center" style="margin-top:50px;">
                                    <h:panelGrid columns="2">
                                        <h:commandButton id="botaoCancelarSolicitacao" value="CANCELAR" styleClass="bt_cancel" style="margin-right: 10px;" action="exames" immediate="true">
                                        </h:commandButton>
                                        <h:commandButton id="botaoSalvarSolicitacao" value="SOLICITAR" styleClass="bt_ok" action="#{exameHandler.solicitarExame}" rendered="#{!exameHandler.exameAtual.solicitanteExterno}">
                                        </h:commandButton>
                                        <h:commandButton id="botaoSalvarSolicitacaoExterna" value="Inserir Solicitação externa" styleClass="bt_ok" action="#{exameHandler.solicitarExameExterno}" rendered="#{exameHandler.exameAtual.solicitanteExterno}">
                                        </h:commandButton>
                                    </h:panelGrid>
                                </div>
                            </a4j:outputPanel>
                        </div>
                    </h:form>                    
                        <jsp:include page="rodape.jsp"></jsp:include>
                </div>
            </div>
        </f:view>
    </body>
</html>