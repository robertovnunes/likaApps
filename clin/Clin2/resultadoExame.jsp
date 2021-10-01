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
                                </h:commandLink> > Buscar Paciente
                            </p>
                        </h:form>
                    </div>
                </div><!-- /#header -->

                <div id="page_content">
                    <div align="left" id="diretorio">
                        <h:outputText  styleClass="diretorio" value="Exames do Paciente"></h:outputText>
                    </div>

                    <div align="right" id="salvoPor">
                        <h:panelGroup styleClass="salvoPor" rendered="#{!exameHandler.resultadoAtual.assinado}">
                            <h:outputText value="Informado por: " rendered="#{exameHandler.resultadoAtual.informadoPor != null}" />
                            <h:outputText value="#{exameHandler.resultadoAtual.informadoPor.nome}" rendered="#{exameHandler.resultadoAtual.informadoPor != null}" />
                            <h:outputText value=" em: " rendered="#{exameHandler.resultadoAtual.informadoEm != null}" />
                            <h:outputText value="#{exameHandler.resultadoAtual.informadoEm}" rendered="#{exameHandler.resultadoAtual.informadoEm != null}">
                                <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                            </h:outputText>
                            <h:outputText value="Resultado ainda não Informado!" rendered="#{exameHandler.resultadoAtual.informadoPor == null}" />
                        </h:panelGroup>
                        <h:panelGroup styleClass="salvoPor" rendered="#{exameHandler.resultadoAtual.assinado}">
                            <h:outputText value="Assinado por: " rendered="#{exameHandler.resultadoAtual.informadoPor != null}" />
                            <h:outputText value="#{exameHandler.resultadoAtual.informadoPor.nome}" rendered="#{exameHandler.resultadoAtual.informadoPor != null}" />
                            <h:outputText value=" em: " rendered="#{exameHandler.resultadoAtual.assinadoEm != null}" />
                            <h:outputText value="#{exameHandler.resultadoAtual.assinadoEm}" rendered="#{exameHandler.resultadoAtual.assinadoEm != null}">
                                <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                            </h:outputText>
                        </h:panelGroup>
                    </div>                    

                    <jsp:include page="menuFichas1.jsp"></jsp:include>

                    <h:form>
                        <div id="center_section">
                            <a4j:outputPanel id="panelResultado" ajaxRendered="true">

                                <h:panelGroup id="resultadoEritrograma" rendered="#{exameHandler.mostrarResultadoEritrograma}">
                                    <h2> Resultado Eritrograma</h2>
                                    <div id="opcaoExame">
                                        <h:panelGrid columns="2" rendered="#{!exameHandler.resultadoAtual.assinado}" style="margin-botton:5px;">
                                            <h:outputText value="Data do Laudo:"/>
                                            <rich:calendar value="#{exameHandler.resultadoEritograma.dataResultado}" datePattern="dd/MM/yyyy" showApplyButton="false" cellWidth="24px" cellHeight="22px" style="width:150px"
                                                           enableManualInput="true" required="true" requiredMessage="É necessário informar a Data do resultado" converterMessage="Data do Laudo inválida!"/>
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

                                        <h:panelGrid columns="2" rendered="#{exameHandler.resultadoAtual.assinado}" style="margin-botton:5px;">
                                            <h:outputText value="Data do Laudo:"/>
                                            <h:outputText value="#{exameHandler.resultadoAtual.dataResultado}" style="font-weight:bold;">
                                                <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy"/>
                                            </h:outputText>
                                        </h:panelGrid>
                                        <h:panelGrid columns="2" rendered="#{exameHandler.resultadoAtual.assinado}">
                                            <h:outputText value="HM:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoEritograma.hm}" style="font-weight:bold;"/>
                                            <h:outputText value="HB:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoEritograma.hb}"  style="font-weight:bold;"/>
                                            <h:outputText value="HT:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoEritograma.ht}" style="font-weight:bold;"/>
                                            <h:outputText value="VCM:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoEritograma.vcm}" style="font-weight:bold;"/>
                                            <h:outputText value="HCM:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoEritograma.hcm}" style="font-weight:bold;"/>
                                            <h:outputText value="CHCM:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoEritograma.chcm}" style="font-weight:bold;"/>
                                        </h:panelGrid>

                                        <div style="color: red;">
                                            <h:messages style="color:red;" layout="table"/>
                                        </div>

                                    </div>

                                    <div id="subOpcaoExame">
                                        <h:panelGroup rendered="#{!exameHandler.exameAtual.solicitanteExterno}">

                                            <h:panelGrid columns="4" rendered="#{exameHandler.resultadoAtual.assinado}">
                                                <h:outputText value="Resultado informado por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoPor.nome}" style="font-weight:bold;">
                                                </h:outputText>
                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>
                                            </h:panelGrid>
                                            <rich:spacer/>
                                            <rich:spacer/>
                                            <h:panelGrid columns="4" >
                                                <h:outputText value="Solicitado por:" style="margin-right: 5px;"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.solicitadoPor.nome}" style="font-weight:bold; margin-right: 5px;"/>

                                                <h:outputText value="em:" style="margin-right: 5px;"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.dataExame}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy"/>
                                                </h:outputText>
                                            </h:panelGrid>

                                            <h:panelGrid columns="4" rendered="#{exameHandler.exameAtual.assinado}">
                                                <h:outputText value="Solicitação assinada por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoPor.nome}" style="font-weight:bold;"/>

                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>

                                            </h:panelGrid>


                                        </h:panelGroup>

                                        <h:panelGroup  rendered="#{exameHandler.exameAtual.solicitanteExterno}">

                                            <h:panelGrid columns="4" rendered="#{exameHandler.resultadoAtual.assinado}">
                                                <h:outputText value="Resultado informado por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoPor.nome}" style="font-weight:bold;">
                                                </h:outputText>
                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>
                                            </h:panelGrid>

                                            <h:panelGrid columns="6" rendered="#{exameHandler.exameAtual.solicitanteExterno}" >
                                                <h:outputText value="Solicitação Externa:" ></h:outputText>
                                                <h:selectBooleanCheckbox  value="true" disabled="true" >
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Médico Solicitante:" ></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.medicoSolicitanteExterno}" style="font-weight:bold;"/>
                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.dataExame}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy"/>
                                                </h:outputText>
                                            </h:panelGrid>



                                            <h:panelGrid columns="4" rendered="#{exameHandler.exameAtual.assinado}">
                                                <h:outputText value="Solicitação assinada por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoPor.nome}" style="font-weight:bold;"/>

                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>

                                            </h:panelGrid>

                                        </h:panelGroup>



                                    </div>

                                    <div align="center" style="margin-top:10px">
                                        <h:commandButton value="VOLTAR" styleClass="botaoBuscar" action="exames" immediate="true">
                                        </h:commandButton>

                                        <h:panelGroup rendered="#{!exameHandler.resultadoAtual.assinado}">
                                            <h:commandButton id="botaoSalvarEritro" value="SALVAR" styleClass="bt_save" action="#{exameHandler.salvarResultadoEritrograma}"  >

                                            </h:commandButton>
                                            <h:commandButton id="assinarEritro" value="ASSINAR" styleClass="bt_ok" action="#{exameHandler.assinarEritrograma}" disabled="#{!usuarioHandler.medico}">

                                            </h:commandButton>
                                        </h:panelGroup>
                                    </div>

                                </h:panelGroup>

                                <h:panelGroup id="resultadoHemograma" rendered="#{exameHandler.mostrarResultadoHemograma}">

                                    <h2> Resultado Hemograma</h2>
                                    <div id="opcaoExame">
                                        <h:panelGrid columns="2" rendered="#{!exameHandler.resultadoAtual.assinado}" style="margin-botton:5px;">
                                            <h:outputText value="Data do Laudo:"/>
                                            <rich:calendar value="#{exameHandler.resultadoHemograma.dataResultado}" datePattern="dd/MM/yyyy" showApplyButton="false" cellWidth="24px" cellHeight="22px"
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
                                        <h:panelGrid columns="2" rendered="#{exameHandler.resultadoAtual.assinado}" style="margin-botton:5px;">
                                            <h:outputText value="Data do Laudo:"/>
                                            <h:outputText value="#{exameHandler.resultadoAtual.dataResultado}" style="font-weight:bold;">
                                                <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy"/>
                                            </h:outputText>
                                        </h:panelGrid>
                                        <h:panelGrid columns="2" rendered="#{exameHandler.resultadoAtual.assinado}">
                                            <h:outputText value="Leuco:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoHemograma.leuco}" style="font-weight:bold;"/>
                                            <h:outputText value="Neutrófilo:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoHemograma.neutrofilos}"  style="font-weight:bold;"/>
                                            <h:outputText value="Linfocitos:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoHemograma.linfocitos}"  style="font-weight:bold;"/>
                                            <h:outputText value="Monocitos:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoHemograma.monocitos}"  style="font-weight:bold;"/>
                                            <h:outputText value="Eosinofilos:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoHemograma.eosinofilos}"  style="font-weight:bold;"/>
                                            <h:outputText value="Basofilos:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoHemograma.basofilos}"  style="font-weight:bold;"/>
                                            <h:outputText value="HM:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoHemograma.hm}"  style="font-weight:bold;"/>
                                            <h:outputText value="HB:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoHemograma.hb}"  style="font-weight:bold;"/>
                                            <h:outputText value="HT:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoHemograma.ht}"  style="font-weight:bold;"/>
                                            <h:outputText value="VCM:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoHemograma.vcm}"  style="font-weight:bold;"/>
                                            <h:outputText value="HCM:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoHemograma.hcm}"  style="font-weight:bold;"/>
                                            <h:outputText value="CHCM:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoHemograma.chcm}"  style="font-weight:bold;"/>
                                            <h:outputText value="PLT:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoHemograma.plt}"  style="font-weight:bold;"/>

                                        </h:panelGrid>

                                        <div style="color: red;">
                                            <h:messages style="color:red;" layout="table"/>
                                        </div>

                                    </div>

                                    <div id="subOpcaoExame">
                                        <h:panelGroup  rendered="#{!exameHandler.exameAtual.solicitanteExterno}">

                                            <h:panelGrid columns="4" rendered="#{exameHandler.resultadoAtual.assinado}">
                                                <h:outputText value="Resultado informado por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoPor.nome}" style="font-weight:bold;">
                                                </h:outputText>
                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>
                                            </h:panelGrid>
                                            <rich:spacer/>
                                            <rich:spacer/>
                                            <h:panelGrid columns="4" >
                                                <h:outputText value="Solicitado por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.solicitadoPor.nome}" style="font-weight:bold;"/>

                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.dataExame}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy"/>
                                                </h:outputText>
                                            </h:panelGrid>

                                            <h:panelGrid columns="4" rendered="#{exameHandler.exameAtual.assinado}">
                                                <h:outputText value="Solicitação assinada por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoPor.nome}" style="font-weight:bold;"/>

                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>

                                            </h:panelGrid>


                                        </h:panelGroup>

                                        <h:panelGroup  rendered="#{exameHandler.exameAtual.solicitanteExterno}">

                                            <h:panelGrid columns="4" rendered="#{exameHandler.resultadoAtual.assinado}">
                                                <h:outputText value="Resultado informado por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoPor.nome}" style="font-weight:bold;">
                                                </h:outputText>
                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>
                                            </h:panelGrid>

                                            <h:panelGrid columns="6" rendered="#{exameHandler.exameAtual.solicitanteExterno}" >
                                                <h:outputText value="Solicitação Externa:" ></h:outputText>
                                                <h:selectBooleanCheckbox  value="true" disabled="true" >
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Médico Solicitante:" ></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.medicoSolicitanteExterno}" style="font-weight:bold;"/>
                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.dataExame}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy"/>
                                                </h:outputText>
                                            </h:panelGrid>



                                            <h:panelGrid columns="4" rendered="#{exameHandler.exameAtual.assinado}">
                                                <h:outputText value="Solicitação assinada por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoPor.nome}" style="font-weight:bold;"/>

                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>

                                            </h:panelGrid>

                                        </h:panelGroup>



                                    </div>

                                    <div align="center" style="margin-top:10px">

                                        <h:commandButton value="VOLTAR" styleClass="botaoBuscar" action="exames" immediate="true">
                                        </h:commandButton>

                                        <h:panelGroup rendered="#{!exameHandler.resultadoAtual.assinado}">
                                            <h:commandButton id="botaoSalvarHemograma" value="SALVAR" styleClass="bt_save" action="#{exameHandler.salvarResultadoHemograma}">

                                            </h:commandButton>
                                            <h:commandButton id="assinarHemograma" value="ASSINAR" styleClass="bt_ok" action="#{exameHandler.assinarHemograma}" disabled="#{!usuarioHandler.medico}">

                                            </h:commandButton>
                                        </h:panelGroup>
                                    </div>

                                </h:panelGroup>


                                <h:panelGroup id="resultadoLeucograma" rendered="#{exameHandler.mostrarResultadoLeucograma}">
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
                                        <h:panelGrid columns="2" rendered="#{exameHandler.resultadoAtual.assinado}" style="margin-botton:5px;">
                                            <h:outputText value="Data do Laudo:"/>
                                            <h:outputText value="#{exameHandler.resultadoLeucograma.dataResultado}" style="font-weight:bold;">
                                                <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy"/>
                                            </h:outputText>
                                        </h:panelGrid>
                                        <h:panelGrid columns="2" rendered="#{exameHandler.resultadoAtual.assinado}">
                                            <h:outputText value="Leuco:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoLeucograma.leuco}" style="font-weight:bold;"/>
                                            <h:outputText value="Neutrófilo:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoLeucograma.neutrofilos}"  style="font-weight:bold;"/>
                                            <h:outputText value="Linfocitos:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoLeucograma.linfocitos}"  style="font-weight:bold;"/>
                                            <h:outputText value="Monocitos:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoLeucograma.monocitos}"  style="font-weight:bold;"/>
                                            <h:outputText value="Eosinofilos:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoLeucograma.eosinofilos}"  style="font-weight:bold;"/>
                                            <h:outputText value="Basofilos:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoLeucograma.basofilos}"  style="font-weight:bold;"/>

                                        </h:panelGrid>
                                        <div style="color: red;">
                                            <h:messages style="color:red;" layout="table"/>
                                        </div>

                                    </div>

                                    <div id="subOpcaoExame">
                                        <h:panelGroup  rendered="#{!exameHandler.exameAtual.solicitanteExterno}">

                                            <h:panelGrid columns="4" rendered="#{exameHandler.resultadoAtual.assinado}">
                                                <h:outputText value="Resultado informado por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoPor.nome}" style="font-weight:bold;">
                                                </h:outputText>
                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>
                                            </h:panelGrid>
                                            <rich:spacer/>
                                            <rich:spacer/>
                                            <h:panelGrid columns="4" >
                                                <h:outputText value="Solicitado por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.solicitadoPor.nome}" style="font-weight:bold;"/>

                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.dataExame}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy"/>
                                                </h:outputText>
                                            </h:panelGrid>

                                            <h:panelGrid columns="4" rendered="#{exameHandler.exameAtual.assinado}">
                                                <h:outputText value="Solicitação assinada por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoPor.nome}" style="font-weight:bold;"/>

                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>

                                            </h:panelGrid>


                                        </h:panelGroup>

                                        <h:panelGroup  rendered="#{exameHandler.exameAtual.solicitanteExterno}">

                                            <h:panelGrid columns="4" rendered="#{exameHandler.resultadoAtual.assinado}">
                                                <h:outputText value="Resultado informado por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoPor.nome}" style="font-weight:bold;">
                                                </h:outputText>
                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>
                                            </h:panelGrid>

                                            <h:panelGrid columns="6" rendered="#{exameHandler.exameAtual.solicitanteExterno}" >
                                                <h:outputText value="Solicitação Externa:" ></h:outputText>
                                                <h:selectBooleanCheckbox  value="true" disabled="true" >
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Médico Solicitante:" ></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.medicoSolicitanteExterno}" style="font-weight:bold;"/>
                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.dataExame}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy"/>
                                                </h:outputText>
                                            </h:panelGrid>



                                            <h:panelGrid columns="4" rendered="#{exameHandler.exameAtual.assinado}">
                                                <h:outputText value="Solicitação assinada por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoPor.nome}" style="font-weight:bold;"/>

                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>

                                            </h:panelGrid>

                                        </h:panelGroup>



                                    </div>
                                    <div align="center" style="margin-top:10px">

                                        <h:commandButton value="VOLTAR" styleClass="botaoBuscar" action="exames" immediate="true">
                                        </h:commandButton>

                                        <h:panelGroup rendered="#{!exameHandler.resultadoAtual.assinado}">
                                            <h:commandButton id="botaoSalvarLeucograma" value="SALVAR" styleClass="bt_save" action="#{exameHandler.salvarResultadoLeucograma}" >

                                            </h:commandButton>
                                            <h:commandButton id="assinarLeucograma" value="ASSINAR" styleClass="bt_ok" action="#{exameHandler.assinarLeucograma}" disabled="#{!usuarioHandler.medico}">

                                            </h:commandButton>
                                        </h:panelGroup>
                                    </div>
                                </h:panelGroup>

                                <h:panelGroup id="resultadoGenerico" rendered="#{exameHandler.mostrarResultadoGenerico}">
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
                                        <h:panelGrid columns="2" rendered="#{exameHandler.resultadoAtual.assinado}" style="margin-botton:5px;">
                                            <h:outputText value="Data do Laudo:"/>
                                            <h:outputText value="#{exameHandler.resultadoGenerico.dataResultado}" style="font-weight:bold;">
                                                <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy"/>
                                            </h:outputText>
                                        </h:panelGrid>
                                        <h:panelGrid columns="2" rendered="#{exameHandler.resultadoAtual.assinado}">
                                            <h:outputText value="#{exameHandler.resultadoGenerico.nome}"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoGenerico.dados}" style="font-weight:bold;"/>
                                        </h:panelGrid>
                                        <div style="color: red;">
                                            <h:messages style="color:red;" layout="table"/>
                                        </div>

                                    </div>

                                    <div id="subOpcaoExame">
                                        <h:panelGroup  rendered="#{!exameHandler.exameAtual.solicitanteExterno}">

                                            <h:panelGrid columns="4" rendered="#{exameHandler.resultadoAtual.assinado}">
                                                <h:outputText value="Resultado informado por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoPor.nome}" style="font-weight:bold;">
                                                </h:outputText>
                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>
                                            </h:panelGrid>
                                            <rich:spacer/>
                                            <rich:spacer/>
                                            <h:panelGrid columns="4" >
                                                <h:outputText value="Solicitado por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.solicitadoPor.nome}" style="font-weight:bold;"/>

                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.dataExame}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy"/>
                                                </h:outputText>
                                            </h:panelGrid>

                                            <h:panelGrid columns="4" rendered="#{exameHandler.exameAtual.assinado}">
                                                <h:outputText value="Solicitação assinada por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoPor.nome}" style="font-weight:bold;"/>

                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>

                                            </h:panelGrid>


                                        </h:panelGroup>

                                        <h:panelGroup  rendered="#{exameHandler.exameAtual.solicitanteExterno}">

                                            <h:panelGrid columns="4" rendered="#{exameHandler.resultadoAtual.assinado}">
                                                <h:outputText value="Resultado informado por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoPor.nome}" style="font-weight:bold;">
                                                </h:outputText>
                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>
                                            </h:panelGrid>

                                            <h:panelGrid columns="6" rendered="#{exameHandler.exameAtual.solicitanteExterno}" >
                                                <h:outputText value="Solicitação Externa:" ></h:outputText>
                                                <h:selectBooleanCheckbox  value="true" disabled="true" >
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Médico Solicitante:" ></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.medicoSolicitanteExterno}" style="font-weight:bold;"/>
                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.dataExame}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy"/>
                                                </h:outputText>
                                            </h:panelGrid>



                                            <h:panelGrid columns="4" rendered="#{exameHandler.exameAtual.assinado}">
                                                <h:outputText value="Solicitação assinada por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoPor.nome}" style="font-weight:bold;"/>

                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>

                                            </h:panelGrid>

                                        </h:panelGroup>



                                    </div>
                                    <div align="center" style="margin-top:10px">

                                        <h:commandButton value="VOLTAR" styleClass="botaoBuscar" action="exames" immediate="true">
                                        </h:commandButton>

                                        <h:panelGroup rendered="#{!exameHandler.resultadoAtual.assinado}">
                                            <h:commandButton id="botaoSalvarGenerico" value="SALVAR" styleClass="bt_save" action="#{exameHandler.salvarResultadoGenerico}">

                                            </h:commandButton>
                                            <h:commandButton id="assinarGenerico" value="ASSINAR" styleClass="bt_ok" action="#{exameHandler.assinarGenerico}" disabled="#{!usuarioHandler.medico}">

                                            </h:commandButton>
                                        </h:panelGroup>
                                    </div>

                                </h:panelGroup>


                                <h:panelGroup id="resultadoLonograma" rendered="#{exameHandler.mostrarResultadoLonograma}">

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
                                        <h:panelGrid columns="2" rendered="#{exameHandler.resultadoAtual.assinado}" style="margin-botton:5px;">
                                            <h:outputText value="Data do Laudo:"/>
                                            <h:outputText value="#{exameHandler.resultadoLonograma.dataResultado}" style="font-weight:bold;">
                                                <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy"/>
                                            </h:outputText>
                                        </h:panelGrid>
                                        <h:panelGrid columns="2" rendered="#{exameHandler.resultadoAtual.assinado}">
                                            <h:outputText value="K:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoLonograma.k}" style="font-weight:bold;"/>
                                            <h:outputText value="Na:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoLonograma.na}"  style="font-weight:bold;"/>
                                            <h:outputText value="RA:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoLonograma.ra}"  style="font-weight:bold;"/>
                                            <h:outputText value="Bicarbonato:"></h:outputText>
                                            <h:outputText value="#{exameHandler.resultadoLonograma.bicarbonato}"  style="font-weight:bold;"/>
                                        </h:panelGrid>
                                        <div style="color: red;">
                                            <h:messages style="color:red;" layout="table"/>
                                        </div>

                                    </div>

                                    <div id="subOpcaoExame">
                                        <h:panelGroup  rendered="#{!exameHandler.exameAtual.solicitanteExterno}">

                                            <h:panelGrid columns="4" rendered="#{exameHandler.resultadoAtual.assinado}">
                                                <h:outputText value="Resultado informado por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoPor.nome}" style="font-weight:bold;">
                                                </h:outputText>
                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>
                                            </h:panelGrid>
                                            <rich:spacer/>
                                            <rich:spacer/>
                                            <h:panelGrid columns="4" >
                                                <h:outputText value="Solicitado por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.solicitadoPor.nome}" style="font-weight:bold;"/>

                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.dataExame}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy"/>
                                                </h:outputText>
                                            </h:panelGrid>

                                            <h:panelGrid columns="4" rendered="#{exameHandler.exameAtual.assinado}">
                                                <h:outputText value="Solicitação assinada por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoPor.nome}" style="font-weight:bold;"/>

                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>

                                            </h:panelGrid>


                                        </h:panelGroup>

                                        <h:panelGroup  rendered="#{exameHandler.exameAtual.solicitanteExterno}">

                                            <h:panelGrid columns="4" rendered="#{exameHandler.resultadoAtual.assinado}">
                                                <h:outputText value="Resultado informado por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoPor.nome}" style="font-weight:bold;">
                                                </h:outputText>
                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.resultadoAtual.informadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>
                                            </h:panelGrid>

                                            <h:panelGrid columns="6" rendered="#{exameHandler.exameAtual.solicitanteExterno}" >
                                                <h:outputText value="Solicitação Externa:" ></h:outputText>
                                                <h:selectBooleanCheckbox  value="true" disabled="true" >
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Médico Solicitante:" ></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.medicoSolicitanteExterno}" style="font-weight:bold;"/>
                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.dataExame}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy"/>
                                                </h:outputText>
                                            </h:panelGrid>



                                            <h:panelGrid columns="4" rendered="#{exameHandler.exameAtual.assinado}">
                                                <h:outputText value="Solicitação assinada por:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoPor.nome}" style="font-weight:bold;"/>

                                                <h:outputText value="em:"></h:outputText>
                                                <h:outputText value="#{exameHandler.exameAtual.assinadoEm}" style="font-weight:bold;">
                                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                                </h:outputText>

                                            </h:panelGrid>

                                        </h:panelGroup>

                                    </div>
                                    <div align="center" style="margin-top:10px">
                                        <h:commandButton value="VOLTAR" styleClass="botaoBuscar" action="exames" immediate="true">
                                        </h:commandButton>

                                        <h:panelGroup rendered="#{!exameHandler.resultadoAtual.assinado}">
                                            <h:commandButton id="botaoSalvarLonograma" value="SALVAR" styleClass="bt_save" action="#{exameHandler.salvarResultadoLonograma}">
                                            </h:commandButton>
                                            <h:commandButton id="assinarLonograma" value="ASSINAR" styleClass="bt_ok" action="#{exameHandler.assinarLonograma}" disabled="#{!usuarioHandler.medico}">
                                            </h:commandButton>
                                        </h:panelGroup>
                                    </div>
                                </h:panelGroup>
                            </a4j:outputPanel>
                        </div>

                    </h:form>
                    <jsp:include page="rodape.jsp"></jsp:include>
                    </div>
            </div>
        </f:view>
    </body>
</html>