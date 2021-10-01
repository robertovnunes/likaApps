<%--
    Document   : qpdAnterior
    Created on : 15/12/2009, 18:38:31
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
        <style type="text/css">
            .rich-tab-inactive {
                cursor: pointer;
            }
            .rich-tabpanel-content {
                border-right:none;
                border-bottom:none;
                border-left:none;
                background-color: transparent;

            }
        </style>

    </head>
    <body>
        <f:subview id="subviewISAnterior">
            <h:form>
                <div id="topicoH2">
                    <h2>Ficha - IS</h2>
                </div>

                <div style="margin-left:5px;">

                    <rich:tabPanel switchType="client"  headerClass="cabecalho" >
                        <rich:tab id="geralTab" label="Geral" >

                            <h:panelGrid columns="2" styleClass="semqueixas">
                                <h:selectBooleanCheckbox id="geral" value="#{atendimentoAteriorHandler.fichaISAnteriror.geral}"  disabled="true" >
                                </h:selectBooleanCheckbox>
                                <h:outputText value="Sem Queixas"/>

                            </h:panelGrid>
                            <div id="opcaoFichaIS">
                                <h:panelGroup id="panelGeral" rendered="#{!atendimentoAteriorHandler.fichaISAnteriror.geral}">

                                    <h:panelGrid columns="2">
                                        <h:selectBooleanCheckbox id="febre" value="#{atendimentoAteriorHandler.fichaISAnteriror.febre}" disabled="true" >
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Febre"/>
                                    </h:panelGrid>
                                    <h:panelGroup  id="subopcaoFebre" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.febre == true}">
                                        <div class="subopcao">
                                            <div style="margin-bottom:10px">
                                                <h:panelGrid columns="2">
                                                    <h:outputText value="Duração(dias):"/>
                                                    <h:inputText id="duracao"  value="#{atendimentoAteriorHandler.fichaISAnteriror.duracaoFebre}" size="3" maxlength="3" disabled="#{atendimentoAteriorHandler.fichaISAnteriror.geral}"  />
                                                </h:panelGrid>

                                                <h:selectOneRadio id="selecaoContinua" value="#{atendimentoAteriorHandler.fichaISAnteriror.febreContinua}"  disabled="true" >
                                                    <f:selectItem id="RadioGroup1_0" itemLabel="Contínua" itemValue="true" />
                                                    <f:selectItem id="RadioGroup1_1" itemLabel="Intermitente" itemValue="false" />
                                                </h:selectOneRadio>
                                            </div>

                                            <div style="margin-bottom:10px">
                                                <h:outputText value="Aferida por termômetro:"/>
                                                <h:selectOneRadio id="selecaoAferida" value="#{atendimentoAteriorHandler.fichaISAnteriror.febreAferidaPorTermometro}"  disabled="true">
                                                    <f:selectItem id="AferidaPorTermometro1" itemLabel="Sim" itemValue="true" />
                                                    <f:selectItem id="AferidaPorTermometro2" itemLabel="Não" itemValue="false" />
                                                </h:selectOneRadio>
                                                <h:panelGrid columns="2">
                                                    <h:outputText value="Obs.:"/>
                                                    <h:inputTextarea id="febreObservacao" onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.febreObservacao}"  disabled="#{atendimentoAteriorHandler.fichaISAnteriror.geral}" />
                                                </h:panelGrid>
                                            </div>
                                        </div>
                                    </h:panelGroup>
                                    <h:panelGrid columns="2">
                                        <h:selectBooleanCheckbox id="anorexia" value="#{atendimentoAteriorHandler.fichaISAnteriror.anorexia}"  disabled="true" />
                                        <h:outputText value="Anorexia"/>
                                        <h:selectBooleanCheckbox id="astenia" value="#{atendimentoAteriorHandler.fichaISAnteriror.astenia}"  disabled="true" />
                                        <h:outputText value="Astenia"/>
                                        <h:selectBooleanCheckbox id="cefaleia" value="#{atendimentoAteriorHandler.fichaISAnteriror.cefaleiaGeral}"  disabled="true"/>
                                        <h:outputText value="Cefaléia"/>

                                        <h:selectBooleanCheckbox id="alteracaoPeso" value="#{atendimentoAteriorHandler.fichaISAnteriror.possuiAlteracaoPeso}"  disabled="true" >

                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Alteração de Peso"/>
                                    </h:panelGrid >

                                    <div class="subopcao">

                                        <h:panelGrid id="subOpcaoAltPeso" columns="4" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.possuiAlteracaoPeso == true}">
                                            <h:selectOneMenu id="selecaoPeso" value="#{atendimentoAteriorHandler.fichaISAnteriror.alteracaoPeso}"  disabled="true" >
                                                <f:selectItem itemValue="Ganho" itemLabel="Ganho" />
                                                <f:selectItem itemValue="Perda" itemLabel="Perda" />
                                            </h:selectOneMenu>
                                            <h:inputText  id="peso" maxlength="7" size="5" styleClass="campoPequeno" value="#{atendimentoAteriorHandler.fichaISAnteriror.peso}"  disabled="true">
                                                <f:convertNumber type="number"/>
                                            </h:inputText>
                                            <h:outputText value="KG"/>
                                            <h:message for="peso" errorStyle="color:red; margin-lef:5px;"/>
                                        </h:panelGrid>
                                    </div>

                                    <h:panelGrid>
                                        <h:outputText value="Outras informações:"/>
                                        <h:inputTextarea id="outrosGeral" onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoOutros}"   disabled="true" />
                                    </h:panelGrid>

                                </h:panelGroup>
                            </div>
                        </rich:tab>
                        <rich:tab id="pelosTab" label="Pêlos e Fâneros" >



                            <h:panelGrid columns="2" styleClass="semqueixas">
                                <h:selectBooleanCheckbox id="pelos" value="#{atendimentoAteriorHandler.fichaISAnteriror.pelosFaneros}"  disabled="true">
                                </h:selectBooleanCheckbox>
                                <h:outputText value="Sem Queixas"/>
                            </h:panelGrid>

                            <div id="opcaoFichaIS">
                                <h:panelGroup id="panelPelos" rendered="#{!atendimentoAteriorHandler.fichaISAnteriror.pelosFaneros}">
                                    <h:panelGrid columns="2">
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.sudorese}" disabled="true" >

                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Sudorese"/>
                                    </h:panelGrid>

                                    <h:panelGrid id="subOpcaoSudorese" columns="1" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.sudorese == true}">
                                        <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoSudorese}" disabled="true"  />

                                    </h:panelGrid>

                                    <h:panelGrid columns="2">
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.pruridoPelosFaneros}" disabled="true">

                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Prurido" />
                                    </h:panelGrid>

                                    <h:panelGrid id="subOpcaoPrurido" columns="1" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.pruridoPelosFaneros == true}">
                                        <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoPrurido}" disabled="true">
                                        </h:inputTextarea>
                                    </h:panelGrid>


                                    <h:panelGrid columns="2">
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.areaHipoAnestesia}" disabled="true">

                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Área de Hipo. ou Anestesia" />
                                    </h:panelGrid>


                                    <h:panelGrid id="subOpcaoArea" columns="1" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.areaHipoAnestesia == true}">
                                        <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoAreaHipoAnestesia}" disabled="true"/>

                                    </h:panelGrid>

                                    <h:panelGrid columns="2">
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.lesoesCutaneas}" disabled="true">

                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Lesões Cutâneas" />
                                    </h:panelGrid>




                                    <div class="subopcao">
                                        <h:panelGroup id="subOpcaoLesoes">


                                            <h:panelGrid columns="1" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.lesoesCutaneas == true}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoLesoesCutaneas}" disabled="true" />
                                            </h:panelGrid>

                                            <h:panelGrid id="subopcaoLesoesCutanes"  rendered="#{atendimentoAteriorHandler.fichaISAnteriror.lesoesCutaneas == true}">
                                                <h:selectOneRadio value="#{atendimentoAteriorHandler.fichaISAnteriror.lesoesCutaneasLocalizadas}" disabled="true" >
                                                    <f:selectItem id="LesoesCutaneas_0" itemLabel="Localizadas" itemValue="true" />
                                                    <f:selectItem id="LesoesCutaneas_1" itemLabel="Disseminadas" itemValue="false" />
                                                </h:selectOneRadio>
                                                <h:panelGrid columns="1">
                                                    <h:outputText value="Descrições" />
                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoLesoesCutaneasLocalizadas}" disabled="true" />
                                                </h:panelGrid>
                                                <h:panelGrid columns="2">
                                                    <h:outputText value="Tipo de Lesão:" />
                                                    <h:selectOneMenu value="#{atendimentoAteriorHandler.fichaISAnteriror.tipoDeLesao}" disabled="true">
                                                        <f:selectItem itemValue="Nenhuma" itemLabel="Nenhuma" />
                                                        <f:selectItem itemValue="Mácula" itemLabel="Mácula" />
                                                        <f:selectItem itemValue="Pápula" itemLabel="Pápula" />
                                                        <f:selectItem itemValue="Vesícula" itemLabel="Vesícula" />
                                                        <f:selectItem itemValue="Bolha" itemLabel="Bolha" />
                                                        <f:selectItem itemValue="Pústula" itemLabel="Pústula" />
                                                        <f:selectItem itemValue="Abcesso" itemLabel="Abcesso" />
                                                        <f:selectItem itemValue="Petéquias" itemLabel="Petéquias" />
                                                        <f:selectItem itemValue="Equimose" itemLabel="Equimose" />
                                                        <f:selectItem itemValue="Telangiectasias" itemLabel="Telangiectasias" />
                                                        <f:selectItem itemValue="Atrofia" itemLabel="Atrofia" />
                                                        <f:selectItem itemValue="Liquenificação" itemLabel="Liquenificação" />
                                                        <f:selectItem itemValue="Urticária" itemLabel="Urticária" />
                                                        <f:selectItem itemValue="Outras" itemLabel="Outras" />
                                                    </h:selectOneMenu>
                                                </h:panelGrid>
                                            </h:panelGrid>
                                        </h:panelGroup>
                                    </div>
                                    <h:panelGrid columns="2">
                                        <h:selectBooleanCheckbox id="alteracoesPelos"  value="#{atendimentoAteriorHandler.fichaISAnteriror.alteracoesPelosCabelos}" disabled="true">

                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Alterações nos Pelos ou Cabelos" />
                                    </h:panelGrid>
                                    <h:panelGrid id="subOpcaoPelos"  columns="1" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.alteracoesPelosCabelos == true}">
                                        <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoAlteracoesPelosCabelos}" disabled="true"/>

                                    </h:panelGrid>
                                    <h:panelGrid>
                                        <h:outputText value="Outras informações:" />
                                        <h:inputTextarea id="outrosPelos" onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoOutrosPelosFaneros}" disabled="true"  />
                                    </h:panelGrid>
                                </h:panelGroup>
                            </div>
                        </rich:tab>
                        <rich:tab id="cabecaTab" label="Cabeça e Pescoço" >


                            <h:panelGrid columns="2" styleClass="semqueixas">
                                <h:selectBooleanCheckbox id="cabeca" value="#{atendimentoAteriorHandler.fichaISAnteriror.cabecaPescoco}" disabled="true">
                                </h:selectBooleanCheckbox>
                                <h:outputText value="Sem Queixas"/>
                            </h:panelGrid>
                            <div id="opcaoFichaIS">
                                <h:panelGroup id="panelCabeca" rendered="#{!atendimentoAteriorHandler.fichaISAnteriror.cabecaPescoco}">
                                    <h:panelGrid columns="2">
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.dorCabecaPescoco}" disabled="true"/>
                                        <h:outputText value="Dor" />
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.alteracoesMovimento}"  disabled="true"/>
                                        <h:outputText value="Alterações no Movimento" />
                                    </h:panelGrid>
                                    <h:outputText value="Olhos:" styleClass="topicoIS"/>


                                    <div class="subopcao">
                                        <h:panelGrid columns="4">
                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.dorOcularCefaleia}"  disabled="true"/>
                                            <h:outputText value="Dor Ocular e Cefaléia" />

                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.sensacaoCorpoEstranho}"  disabled="true"/>
                                            <h:outputText value="Sensação de corpo estranho" />


                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.queimacao}"  disabled="true" />
                                            <h:outputText value="Queimação ou Ardência" />
                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.lacrimejamento}"  disabled="true" />
                                            <h:outputText value="Lacrimejamento" />

                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.sensacaoOlhoSeco}"  disabled="true" />
                                            <h:outputText value="Sensação de Olho Seco" />


                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.alteracaoAcuidadeVisual}"  disabled="true"/>
                                            <h:outputText value="Alteração da acuidade visual" />

                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.diplopia}"  disabled="true"/>
                                            <h:outputText value="Diplopia" />


                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.fotofobia}"  disabled="true" />
                                            <h:outputText value="Fotofobia" />


                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.nistagmo}"  disabled="true"/>
                                            <h:outputText value="Nistagmo" />

                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.escotomas}"  disabled="true"/>
                                            <h:outputText value="Escótomas" />

                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.secrecao}"  disabled="true" />
                                            <h:outputText value="Secreção" />


                                        </h:panelGrid>
                                    </div>
                                    <h:outputText value="Ouvidos:" styleClass="topicoIS"/>

                                    <div class="subopcao">
                                        <h:panelGrid columns="2">
                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.dorOuvidos}"  disabled="true" />
                                            <h:outputText value="Dor" />

                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.otorragia}"  disabled="true" />
                                            <h:outputText value="Otorragia" />

                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.alteracaoAcuidadeAuditiva}"  disabled="true" />
                                            <h:outputText value=" Alteração da acuidade auditiva" />


                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.zumbido}"  disabled="true" />
                                            <h:outputText value="Zumbido" />


                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.pruridoOuvido}"  disabled="true" />
                                            <h:outputText value="Prurido" />
                                        </h:panelGrid>
                                    </div>
                                    <h:panelGrid>
                                        <h:outputText value="Outras informações:" />
                                        <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoOutrosOuvido}"  disabled="true"  />
                                    </h:panelGrid>
                                </h:panelGroup>
                            </div>
                        </rich:tab>
                        <rich:tab id="arTab" label="AR" >


                            <h:panelGrid columns="2" styleClass="semqueixas">
                                <h:selectBooleanCheckbox id="ar" value="#{atendimentoAteriorHandler.fichaISAnteriror.ar}" disabled="true" onclick="desmarcarAr()">
                                </h:selectBooleanCheckbox>
                                <h:outputText value="Sem Queixas"/>

                            </h:panelGrid>
                            <div id="opcaoFichaIS">
                                <h:panelGroup id="panelAr" rendered="#{!atendimentoAteriorHandler.fichaISAnteriror.ar}">
                                    <h:panelGrid columns="2">
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.epitaxe}"  disabled="true" />
                                        <h:outputText value="Epitaxe"/>
                                    </h:panelGrid>
                                    <h:panelGrid columns="2">
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.alteracoesOlfato}"  disabled="true">

                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Alterações de Olfato"/>
                                    </h:panelGrid>

                                    <h:panelGrid id="subAlteracoes" columns="1" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.alteracoesOlfato == true}">
                                        <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoAlteracoesOlfato}" disabled="true"/>

                                    </h:panelGrid>
                                    <h:panelGrid columns="3">
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.tosse}" disabled="true">

                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Tosse"/>
                                        <h:selectOneMenu id="subTosse" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.tosse == true}" value="#{atendimentoAteriorHandler.fichaISAnteriror.tipoTosse}" disabled="true">
                                            <f:selectItem itemValue="Nenhuma" itemLabel="Nenhuma" />
                                            <f:selectItem itemValue="Seca" itemLabel="Seca" />
                                            <f:selectItem itemValue="Produtiva - Serosa" itemLabel="Produtiva - Serosa"/>
                                            <f:selectItem itemValue="Produtiva - Mucoide" itemLabel="Produtiva - Mucoide"/>
                                            <f:selectItem itemValue="Produtiva - Mucopurolenta" itemLabel="Produtiva - Mucopurolenta"/>
                                        </h:selectOneMenu>
                                        <rich:spacer id="spacerTosse" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.tosse == false}"/>
                                    </h:panelGrid>

                                    <h:panelGrid columns="2">
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.hemoptise}"  disabled="true"/>
                                        <h:outputText value="Hemoptise"/>
                                    </h:panelGrid>
                                    <h:panelGrid columns="2">

                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.expectoracao}"  disabled="true">

                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Expectoração"/>

                                    </h:panelGrid >
                                    <h:panelGrid  id="subExpec" columns="1" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.expectoracao == true}">
                                        <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoExpectoracao}" disabled="true"/>
                                    </h:panelGrid>

                                    <h:panelGrid columns="3">

                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.dispneia}"  disabled="true">
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Dispneia"/>

                                        <h:selectOneMenu id="subDisp" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.dispneia == true}" value="#{atendimentoAteriorHandler.fichaISAnteriror.tipoDispneia}" disabled="true">
                                            <f:selectItem itemValue="Nenhuma" itemLabel="Nenhuma"/>
                                            <f:selectItem itemValue="Ortopnéia" itemLabel="Ortopnéia"/>
                                            <f:selectItem itemValue="DPN" itemLabel="DPN"/>
                                            <f:selectItem itemValue="Platipnéia" itemLabel="Platipnéia"/>
                                            <f:selectItem itemValue="Trepopnéia" itemLabel="Trepopnéia"/>
                                            <f:selectItem itemValue="Aos esforços" itemLabel="Aos esforços"/>
                                        </h:selectOneMenu>
                                        <rich:spacer id="spacerDisp" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.dispneia == false}"/>

                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.dorToracica}" disabled="true">
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Dor Torácica"/>
                                        <h:selectOneMenu id="subDor" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.dorToracica == true}" value="#{atendimentoAteriorHandler.fichaISAnteriror.tipoDorToracica}"  disabled="true">
                                            <f:selectItem itemValue="Nenhuma" itemLabel="Nenhuma"/>
                                            <f:selectItem itemValue="Constrictiva" itemLabel="Constrictiva"/>
                                            <f:selectItem itemValue="Lancinante" itemLabel="Lancinante"/>
                                            <f:selectItem itemValue="Em queimação" itemLabel="Em queimação"/>
                                            <f:selectItem itemValue="Outras" itemLabel="Outras"/>
                                        </h:selectOneMenu>
                                        <rich:spacer id="spacerDor" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.dorToracica == false}"/>
                                    </h:panelGrid>
                                    <div class="subopcao">
                                        <h:panelGrid id="subopcaoDorToracica" columns="1" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.dorToracica== true}">
                                            <h:outputText value="Localização:"/>
                                            <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.localizacaoDorToracica}"  disabled="true"/>
                                        </h:panelGrid>

                                    </div>

                                    <h:panelGrid>
                                        <h:outputText value="Outras informações:"/>

                                        <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoOutrosAR}"disabled="true"/>
                                    </h:panelGrid>
                                </h:panelGroup>
                            </div>
                        </rich:tab>
                        <rich:tab id="acTab" label="ACV" >

                            <h:panelGrid columns="2" styleClass="semqueixas">
                                <h:selectBooleanCheckbox id="acv" value="#{atendimentoAteriorHandler.fichaISAnteriror.acv}"  disabled="true" onclick="desmarcarACV()">
                                </h:selectBooleanCheckbox>
                                <h:outputText value="Sem Queixas"/>
                            </h:panelGrid>
                            <div id="opcaoFichaIS">
                                <h:panelGroup id="panelAcv" rendered="#{!atendimentoAteriorHandler.fichaISAnteriror.acv}">
                                    <h:panelGrid columns="2">
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.precordalgia}"  disabled="true">

                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Precordalgia" />
                                    </h:panelGrid>
                                    <div class="subopcao">
                                        <h:panelGrid  id="subopcaoPrecordalgia" columns="1" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.precordalgia == true}">
                                            <h:outputText value="Tipo da dor" />
                                            <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.tipoDorPrecordalgia}" disabled="true"/>
                                            <h:outputText value="Frequência" />
                                            <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.frequenciaDorPrecordalgia}"  disabled="true"/>
                                        </h:panelGrid>
                                    </div>
                                    <h:panelGrid columns="2">
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.palpitacoes}"  disabled="true"/>
                                        <h:outputText value="Palpitações" />

                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.dpn}"  disabled="true"/>
                                        <h:outputText value="DPN" />

                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.ortopneia}"   disabled="true"/>
                                        <h:outputText value="Ortopnéia" />

                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.edemaMMII}"   disabled="true"/>
                                        <h:outputText value="Edema MMII" />

                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.desmaio}"  disabled="true"/>
                                        <h:outputText value="Desmaio" />
                                    </h:panelGrid>
                                    <h:panelGrid >
                                        <h:outputText value="Outras informações:" />

                                        <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoOutrosACV}"  disabled="true"/>
                                    </h:panelGrid>
                                </h:panelGroup>

                            </div>

                        </rich:tab>
                        <rich:tab id="agiTab" label="AGI" >




                            <h:panelGrid columns="2" styleClass="semqueixas">
                                <h:selectBooleanCheckbox id="agi" value="#{atendimentoAteriorHandler.fichaISAnteriror.agi}"  disabled="true" onclick="desmarcarAGI()">
                                </h:selectBooleanCheckbox>
                                <h:outputText value="Sem Queixas"/>
                            </h:panelGrid>
                            <div id="opcaoFichaIS">
                                <h:panelGroup id="panelAgi" rendered="#{!atendimentoAteriorHandler.fichaISAnteriror.agi}">
                                    <h:panelGrid columns="4">
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.sialose}" disabled="true"/>
                                        <h:outputText value="Sialose"/>

                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.halitose}"   disabled="true"/>
                                        <h:outputText value="Halitose"/>


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.regurgitacao}"  disabled="true"/>
                                        <h:outputText value="Regurgitação"/>


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.eructacao}" disabled="true" />
                                        <h:outputText value="Eructação"/>


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.soluco}"  disabled="true"/>
                                        <h:outputText value="Soluço"/>


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.pirose}" disabled="true" />
                                        <h:outputText value="Pirose"/>


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.nauseas}"   disabled="true"/>
                                        <h:outputText value="Náuseas"/>


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.hematemese}"   disabled="true"/>
                                        <h:outputText value="Hematêmese"/>


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.melena}"  disabled="true"/>
                                        <h:outputText value="Melena"/>


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.hematoquezia}"  disabled="true"/>
                                        <h:outputText value="Hematoquezia"/>


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.disfagia}"   disabled="true"/>
                                        <h:outputText value="Disfagia"/>


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.odinofagia}"   disabled="true" />
                                        <h:outputText value="Odinofagia"/>

                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.incontinenciaFecal}"  disabled="true"/>
                                        <h:outputText value="Incontinência fecal"/>


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.constipacao}"  disabled="true"/>
                                        <h:outputText value="Constipação"/>


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.dorAbdominal}"   disabled="true">
                                            <a4j:support reRender="subDorAbdominal" event="onclick"/>

                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Dor abdominal"/>
                                    </h:panelGrid>



                                    <div class="subopcao">

                                        <h:panelGrid id="subDorAbdominal" columns="1" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.dorAbdominal == true}">
                                            <h:outputText value="Localização:"/>

                                            <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.localizacaoDorAbdominal}"  disabled="true"/>
                                        </h:panelGrid>

                                    </div>


                                    <h:panelGrid columns="2">
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.alteracoesApetite}"  disabled="true">

                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Alterações do apetite"/>
                                    </h:panelGrid>


                                    <h:panelGrid id="subAlteracoesApetite"  columns="1" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.alteracoesApetite == true}">
                                        <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoAlteracoesApetite}" disabled="true"/>


                                    </h:panelGrid>
                                    <h:panelGrid columns="2">
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.vomitos}"   disabled="true">

                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Vômitos"/>
                                    </h:panelGrid>

                                    <h:panelGrid id="subVomitos" columns="1" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.vomitos == true}">
                                        <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoVomitos}" disabled="true"/>

                                    </h:panelGrid>


                                    <h:panelGrid>
                                        <h:outputText value="Outras informações:"/>
                                        <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoOutrosAGI}"  disabled="true"/>
                                    </h:panelGrid>
                                </h:panelGroup>
                            </div>
                        </rich:tab>
                        <rich:tab id="aguTab" label="AGU" >


                            <h:panelGrid columns="2" styleClass="semqueixas">
                                <h:selectBooleanCheckbox id="agu" value="#{atendimentoAteriorHandler.fichaISAnteriror.agu}"  disabled="true" onclick="desmarcarAGU()">
                                </h:selectBooleanCheckbox>
                                <h:outputText value="Sem Queixas"/>
                            </h:panelGrid>
                            <div id="opcaoFichaIS">
                                <h:panelGroup id="panelAgu" rendered="#{!atendimentoAteriorHandler.fichaISAnteriror.agu}">


                                    <h:panelGrid columns="4">
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.disuria}"  disabled="true"/>
                                        <h:outputText value="Disúria" />

                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.poliaciuria}"  disabled="true"/>
                                        <h:outputText value="Poliaciúria" />

                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.poliuria}" disabled="true"/>
                                        <h:outputText value="Poliúria" />

                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.nicturia}" disabled="true"/>
                                        <h:outputText value="Nictúria" />

                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.hematuria}"  disabled="true"/>
                                        <h:outputText value="Hematúria" />

                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.alteracaoCorUrina}"  disabled="true"/>
                                        <h:outputText value="Alteração de cor da urina" />

                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.alteracaoCheiroUrina}"  disabled="true"/>
                                        <h:outputText value="Alteração de cheiro da urina" />


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.urgenciaMiccional}"  disabled="true"/>
                                        <h:outputText value="Urgência Miccional" />


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.incontinenciaUrinaria}"  disabled="true"/>
                                        <h:outputText value="Incontinência urinária" />

                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.corrimentoVaginal}"  disabled="true"/>
                                        <h:outputText value="Corrimento vaginal" />

                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.pruridoVaginal}"  disabled="true"/>
                                        <h:outputText value="Prurido vaginal" />


                                    </h:panelGrid>

                                    <h:outputText value="Mamas:" styleClass="topicoIS"/>

                                    <div class="subopcao">
                                        <h:panelGrid columns="2">
                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.dorMamas}"  disabled="true" >

                                            </h:selectBooleanCheckbox>
                                            <h:outputText value="Dor" />
                                        </h:panelGrid>

                                        <h:panelGrid id="subMamas"  columns="1"  rendered="#{atendimentoAteriorHandler.fichaISAnteriror.dorMamas == true}">
                                            <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoDorMamas}" disabled="true"/>

                                        </h:panelGrid>

                                        <h:panelGrid columns="2">
                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.nodulos}" disabled="true">

                                            </h:selectBooleanCheckbox>
                                            <h:outputText value="Nódulos" />
                                        </h:panelGrid>


                                        <h:panelGrid id="subNodulos" columns="1" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.nodulos == true}">
                                            <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoNodulos}" disabled="true"/>

                                        </h:panelGrid>
                                        <h:panelGrid columns="2">
                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.secrecaoPapilar}"  disabled="true"/>
                                            <h:outputText value="Secreção Papilar" />
                                        </h:panelGrid>

                                    </div>
                                    <h:panelGrid>
                                        <h:outputText value="Outras informações:" />
                                        <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoOutrosAGU}"  disabled="true"/>
                                    </h:panelGrid>
                                </h:panelGroup>
                            </div>

                        </rich:tab>
                        <rich:tab id="ameTab" label="AME" >


                            <h:panelGrid columns="2" styleClass="semqueixas">
                                <h:selectBooleanCheckbox id="ame" value="#{atendimentoAteriorHandler.fichaISAnteriror.ame}"  disabled="true" onclick="desmarcarAME()">
                                </h:selectBooleanCheckbox>
                                <h:outputText value="Sem Queixas"/>
                            </h:panelGrid>
                            <div id="opcaoFichaIS">
                                <h:panelGroup id="panelAme" rendered="#{!atendimentoAteriorHandler.fichaISAnteriror.ame}">
                                    <h:outputText value="Articulações:" styleClass="topicoIS"/>

                                    <div class="subopcao">
                                        <h:panelGrid columns="2">
                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.dorArticulacoes}"  disabled="true"/>
                                            <h:outputText value="Dor" />

                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.rigidezArticular}"   disabled="true"/>
                                            <h:outputText value="Rigidez Articular" />

                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.matinal}"  disabled="true">

                                            </h:selectBooleanCheckbox>
                                            <h:outputText value="Matinal" />
                                        </h:panelGrid>
                                    </div>
                                    <div class="subopcao">

                                        <h:panelGrid id="subopcaoMatinal" columns="1" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.matinal == true}">
                                            <h:outputText value="Duração:" />
                                            <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.duracaoMatinal}"  disabled="true"/>
                                        </h:panelGrid>

                                    </div>

                                    <h:outputText value="Músculos:" styleClass="topicoIS"/>
                                    <div class="subopcao">
                                        <h:panelGrid columns="2">
                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.fraqueza}"   disabled="true"/>
                                            <h:outputText value="Fraqueza" />
                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.atrofia}"  disabled="true"/>
                                            <h:outputText value="Atrofia" />



                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.hipertrofia}"   disabled="true"/>
                                            <h:outputText value="Hipertrofia" />
                                            <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.espasmos}"   disabled="true"/>
                                            <h:outputText value="Espasmos" />
                                        </h:panelGrid>
                                    </div>

                                    <h:panelGrid>
                                        <h:outputText value="Outras informações:" />
                                        <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoOutrosAME}"   disabled="true"/>
                                    </h:panelGrid>
                                </h:panelGroup>
                            </div>

                        </rich:tab>
                        <rich:tab id="snTab" label="SN" >



                            <h:panelGrid columns="2" styleClass="semqueixas">
                                <h:selectBooleanCheckbox id="sn" value="#{atendimentoAteriorHandler.fichaISAnteriror.sn}" disabled="true">
                                </h:selectBooleanCheckbox>
                                <h:outputText value="Sem Queixas"/>
                            </h:panelGrid>
                            <div id="opcaoFichaIS">
                                <h:panelGroup id="panelSn" rendered="#{!atendimentoAteriorHandler.fichaISAnteriror.sn}">


                                    <h:panelGrid columns="4">
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.cefaleia}"   disabled="true"/>
                                        <h:outputText value="Cefaléia" />


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.tonturaVertigem}" disabled="true"/>
                                        <h:outputText value="Tontura e vertigem" />


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.convulsoes}"  disabled="true"/>
                                        <h:outputText value="Convulsões" />


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.alteracoesMemoria}"   disabled="true"/>
                                        <h:outputText value="Alterações da memória" />


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.transtornosVisuais}"  disabled="true"/>
                                        <h:outputText value="Transtornos visuais" />


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.transtornosAuditivos}"  disabled="true"/>
                                        <h:outputText value="Transtornos auditivos" />


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.transtornosMarcha}"   disabled="true"/>
                                        <h:outputText value="Transtornos da marcha" />


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.deficitForca}"  disabled="true"/>
                                        <h:outputText value="Déficit de força" />

                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.alteracoesSensibilidade}"   disabled="true"/>
                                        <h:outputText value="Alterações de sensibilidade" />


                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.transtornosEsfincterianos}"   disabled="true"/>
                                        <h:outputText value="Transtornos esfincterianos" />
                                    </h:panelGrid>

                                    <h:panelGrid columns="2">
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.incontinencias}"  disabled="true">

                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Incontinências" />

                                    </h:panelGrid>

                                    <h:panelGrid id="subIncon" columns="1" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.incontinencias == true}">
                                        <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoIncontinencias}"  disabled="true"/>

                                    </h:panelGrid>

                                    <h:panelGrid columns="2">
                                        <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaISAnteriror.transtornosSono}"   disabled="true">
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Transtornos do sono" />
                                    </h:panelGrid>

                                    <h:panelGrid id="subTrans" columns="1" rendered="#{atendimentoAteriorHandler.fichaISAnteriror.transtornosSono == true}">
                                        <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoTranstornosSono}"  disabled="true"/>
                                    </h:panelGrid>

                                    <h:panelGrid>
                                        <h:outputText value="Outras informações:" />
                                        <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{atendimentoAteriorHandler.fichaISAnteriror.descricaoOutrosSN}" disabled="true"/>
                                    </h:panelGrid>
                                </h:panelGroup>
                            </div>
                        </rich:tab>
                    </rich:tabPanel>

                    <div id="tituloAtendAnterior">
                        <h:outputText  value="Adendos"/>
                    </div>

                    <div  id="textoAssinado">
                        <h:outputText  value="Sem Adendos" style="color:red;" escape="false" rendered="#{empty atendimentoAteriorHandler.adendos}"/>
                        <rich:dataTable  value="#{atendimentoAteriorHandler.adendos}" var="adendo" style="border:none; margin-bottom:15px" width="100%" rendered="#{!empty atendimentoAteriorHandler.adendos}">
                            <rich:column style="border-right:none; border-bottom-style:dashed; width:100%;">
                                <h:outputText value="#{adendo.texto}" escape="false"/>
                                <h:outputText value="Autor: " style="font-weight:bold"/>
                                <h:outputText value="#{adendo.escritoPor.nome}"/>
                                <h:outputText value=", escrito em: " style="font-weight:bold"/>
                                <h:outputText value="#{adendo.dataAdendo}" escape="false">
                                    <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                </h:outputText>
                            </rich:column>
                        </rich:dataTable>
                    </div>

                </div>
            </h:form>
        </f:subview>
    </body>
</html>
