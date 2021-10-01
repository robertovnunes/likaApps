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
    <f:subview id="subviewAntecedentesAnterior">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="css/menu.css" rel="stylesheet" type="text/css" />
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

            <h:form>
                <div id="topicoH2">
                    <h2>Ficha - Antecedentes</h2>
                </div>

                <div style="margin-left:5px;">

                    <rich:tabPanel switchType="client" headerClass="cabecalho">
                        <rich:tab id="pessoalTab" label="Pessoal" >


                            <div id="opcaoFicha">

                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.HAS}" disabled="true"/> HAS
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.doencaCoronariana}" disabled="true"/>Doença Coronariana
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.CA}" disabled="true"/>CA
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.DM}" disabled="true"/>DM
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.TB}" disabled="true"/>TB
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.hepatite}" disabled="true"/>Hepatite
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.hemotransfusao}" disabled="true"/>Hemotransfusão                                    
                                </h:panelGrid>
                                    
                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.dst}" disabled="true">
                                    
                                    </h:selectBooleanCheckbox>
                                    <h:outputText value="DST:"/>
                                </h:panelGrid>

                                <h:panelGrid columns="1" rendered="#{fichaHandler.fichaAntecedentes.dst == true}">
                                    <h:inputTextarea onkeyup="limitaTamanho(this, 255)" cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.descricaoDST}" disabled="true"/>
                                </h:panelGrid>

                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.alergia}" disabled="true">
                                    </h:selectBooleanCheckbox>
                                    <h:outputText value="Alergias:"/>
                                </h:panelGrid>

                                <h:panelGrid columns="1" rendered="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.alergia == true}">
                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.descricaoAlergia}" disabled="true"/>

                                </h:panelGrid>
                                <h:panelGrid columns="3">
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.insuficienciaCardiaca}" disabled="true">
                                    </h:selectBooleanCheckbox>
                                    <h:outputText value="Insuficiência Cardíaca:"/>


                                    <h:selectOneMenu   rendered="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.insuficienciaCardiaca == true}" value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.grauInsuficienciaCardiaca}" disabled="true">
                                        <f:selectItem itemValue="Grau 1" itemLabel="Grau 1" />
                                        <f:selectItem itemValue="Grau 2" itemLabel="Grau 2" />
                                        <f:selectItem itemValue="Grau 3" itemLabel="Grau 3" />
                                        <f:selectItem itemValue="Grau 4" itemLabel="Grau 4" />
                                    </h:selectOneMenu>

                                </h:panelGrid>

                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.patologiaTireoide}" disabled="true">
                                    </h:selectBooleanCheckbox>
                                    <h:outputText value="Patologias da Tireoide:"/>
                                </h:panelGrid>

                                <h:panelGrid columns="1" rendered="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.patologiaTireoide == true}" >
                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.descricaoPatologiaTireoide}" disabled="true" />

                                </h:panelGrid>
                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.cirurgias}" disabled="true">

                                    </h:selectBooleanCheckbox>
                                    <h:outputText value="Cirurgias:"/>
                                </h:panelGrid>

                                <h:panelGrid columns="1">
                                    <h:inputTextarea rendered="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.cirurgias == true}" onkeyup="limitaTamanho(this,255)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.descricaoCirurgias}" disabled="true"/>
                                </h:panelGrid>
                                    
                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.internacoes}" disabled="true">
                                        
                                    </h:selectBooleanCheckbox>
                                    <h:outputText value="Internacoes:"/>
                                </h:panelGrid>
                                <h:panelGrid columns="1">
                                    <h:inputTextarea rendered="#{fichaHandler.fichaAntecedentes.internacoes == true}" onkeyup="limitaTamanho(this, 255)" cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.descricaoInternacoes}" disabled="true"/>
                                </h:panelGrid>                                    
                                
                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.osteoporose}" disabled="true">
                                        
                                    </h:selectBooleanCheckbox>
                                    <h:outputText value="Osteoporose" />
                                </h:panelGrid>
                                <h:panelGrid columns="1" rendered="#{fichaHandler.fichaAntecedentes.osteoporose == true}">
                                    <h:inputTextarea value="#{fichaHandler.fichaAntecedentes.descricaoOsteoporose}" cols="50" rows="2" onkeyup="limitaTamanho(this, 255)" disabled="true" />
                                </h:panelGrid>

                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.fraturas}" disabled="true">
                                        
                                    </h:selectBooleanCheckbox>
                                    <h:outputText value="Fraturas" />
                                </h:panelGrid>
                                <h:panelGrid columns="1" rendered="#{fichaHandler.fichaAntecedentes.fraturas == true}">
                                    <h:inputTextarea value="#{fichaHandler.fichaAntecedentes.descricaoFraturas}" cols="50" rows="2" onkeyup="limitaTamanho(this, 255)" disabled="true" />
                                </h:panelGrid>
                                    
                                    
                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.outrosPessoal}" disabled="true">

                                    </h:selectBooleanCheckbox>
                                    <h:outputText value="Outros:"/>
                                </h:panelGrid>

                                <h:panelGrid columns="1" rendered="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.outrosPessoal == true}">
                                    <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.descricaoOutrosPessoal}" disabled="true"/>

                                </h:panelGrid>

                            </div>
                        </rich:tab>
                        <rich:tab id="habTab" label="Hábitos de Vida" >




                            <div id="opcaoFicha">
                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.tabagismo}" disabled="true">

                                    </h:selectBooleanCheckbox>
                                    <h:outputText value="Tabagismo"/>
                                </h:panelGrid>
                                <div class="subopcao">
                                    <h:panelGroup id="subopcaoTabagismo" rendered="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.tabagismo == true}">
                                        <h:panelGrid columns="1">
                                            <h:outputText value="Duração:"/>
                                            <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.duracaoTabagismo}" disabled="true"/>
                                            <h:outputText value="Quantidade:"/>
                                            <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.quantidadeTabagismo}" disabled="true"/>
                                        </h:panelGrid>
                                    </h:panelGroup>
                                </div>
                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.etilismo}" disabled="true">

                                    </h:selectBooleanCheckbox>
                                    <h:outputText value="Etilismo"/>
                                </h:panelGrid>
                                <div class="subopcao">
                                    <h:panelGroup id="subopcaoEtilismo" rendered="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.etilismo == true}">
                                        <h:panelGrid columns="1">
                                            <h:outputText value="Duração:"/>
                                            <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.duracaoEtilismo}" disabled="true"/>
                                            <h:outputText value="Quantidade:"/>
                                            <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.quantidadeEtilismo}" disabled="true"/>
                                        </h:panelGrid>
                                    </h:panelGroup>
                                </div>
                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.drogas}" disabled="true">

                                    </h:selectBooleanCheckbox>
                                    <h:outputText value="Uso de Drogas"/>
                                </h:panelGrid>
                                <h:panelGrid columns="1" rendered="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.drogas == true}">
                                    <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.descricaoDrogas}" disabled="true"/>
                                </h:panelGrid>

                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.outrosHabitos}" disabled="true">

                                    </h:selectBooleanCheckbox>
                                    <h:outputText value="Outros"/>
                                </h:panelGrid>

                                <h:panelGrid columns="1" rendered="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.outrosHabitos == true}">
                                    <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.descricaoOutrosHabitos}" disabled="true"/>

                                </h:panelGrid>
                                <h:panelGrid>
                                                <h:outputText value="Alimentação:" />
                                                <h:inputTextarea id="alimentacao" onkeyup="limitaTamanho(this, 255)" cols="80" rows="2" value="#{fichaHandler.fichaAntecedentes.alimentacao}" disabled="true" />
                                </h:panelGrid>
                                <h:panelGrid>
                                                <h:outputText value="Observações:"/>
                                                <h:inputTextarea id="observacoesHabitos" onkeyup="limitaTamanho(this,255)"  cols="80" rows="2" value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.observacoesHabitos}"   disabled="true"/>
                                </h:panelGrid>
                            </div>
                        </rich:tab>
                        <rich:tab id="vacTab" label="Vacinação" >



                            <div id="opcaoFicha">
                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.tetano}" disabled="true"/>Tétano
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.hepatiteB}" disabled="true"/>Hepatite B
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.pneumococo}" disabled="true"/>Pneumococo
                                </h:panelGrid>
                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.outraImunizacao}" disabled="true">

                                    </h:selectBooleanCheckbox>
                                    <h:outputText value="Outra imunização"/>
                                </h:panelGrid>
                                <h:panelGrid columns="1" rendered="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.outraImunizacao == true}">
                                    <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.descricaoOutraImunizacao}" disabled="true"/>
                                </h:panelGrid>

                            </div>
                        </rich:tab>
                        <rich:tab id="socTab" label="Sociais(Epidemiologia)" >



                            <div id="opcaoFicha">
                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.chagas}" disabled="true"/>Chagas
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.esquistossomoses}" disabled="true"/>Esquistossomose
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.TBsociais}" disabled="true"/>TB
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.DSTsociais}" disabled="true"/>DST
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.hepatiteSociais}" disabled="true"/>Hepatite
                                </h:panelGrid>
                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.outrosEpidemiologia}" disabled="true">
                                    
                                    </h:selectBooleanCheckbox>
                                    <h:outputText value="Outros" />
                                </h:panelGrid>
                                <h:panelGrid columns="1" rendered="#{fichaHandler.fichaAntecedentes.outrosEpidemiologia == true}">
                                    <h:inputTextarea value="#{fichaHandler.fichaAntecedentes.descricaoOutrosEpidemiologia}" cols="50" rows="2" onkeyup="limitaTamanho(this, 255)" disabled="true" />
                                </h:panelGrid>
                            </div>

                        </rich:tab>
                        <rich:tab id="medTab" label="Medicações em Uso" >



                            <div id="opcaoFicha">
                                <h:inputTextarea value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.medicacoesEmUso}" cols="80" rows="6" disabled="true"></h:inputTextarea>
                            </div>
                        </rich:tab>
                        <rich:tab id="famTab" label="Familiares" >




                            <div id="opcaoFicha">
                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.HASfamiliares}" disabled="true">

                                    </h:selectBooleanCheckbox> HAS
                                </h:panelGrid>
                                <h:panelGrid id="descHas"  columns="1" rendered="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.HASfamiliares}">
                                    <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.descricaoHAS}" disabled="true"/>
                                </h:panelGrid>
                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.doencaCoronarianaFamiliares}" disabled="true">

                                    </h:selectBooleanCheckbox>
                                    Doença Coronariana
                                </h:panelGrid>

                                <h:panelGrid id="descCoronariana"  columns="1" rendered="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.doencaCoronarianaFamiliares}">
                                    <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.descricaoCoronariana}" disabled="true"/>
                                </h:panelGrid>

                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.CAfamiliares}" disabled="true">

                                    </h:selectBooleanCheckbox>
                                    CA
                                </h:panelGrid>
                                <h:panelGrid id="descCa"  columns="1" rendered="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.CAfamiliares}">
                                    <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.descricaoCA}" disabled="true"/>
                                </h:panelGrid>


                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.DMfamiliares}" disabled="true">

                                    </h:selectBooleanCheckbox>
                                    DM
                                </h:panelGrid>

                                <h:panelGrid id="descDM"  columns="1" rendered="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.DMfamiliares}">
                                    <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.descricaoDM}" disabled="true"/>
                                </h:panelGrid>

                                <h:panelGrid columns="2">
                                    <h:selectBooleanCheckbox value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.outrosFamiliares}" disabled="true">

                                    </h:selectBooleanCheckbox>
                                    <h:outputText value="Outros"/>
                                </h:panelGrid>

                                <h:panelGrid columns="1" rendered="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.outrosFamiliares == true}">
                                    <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{atendimentoAteriorHandler.fichaAntecedentesAnterior.descricaoOutrosFamiliares}" disabled="true"/>

                                </h:panelGrid>

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

        </body>
    </f:subview>
</html>
