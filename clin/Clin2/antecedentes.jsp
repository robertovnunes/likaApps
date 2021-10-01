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
        <script type="text/javascript" src="js/mascaras.js"></script>
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
         <style type="text/css">
            .visivel { display: block; }
            .panelGeral {
                border-right:none;
                border-bottom:none;
                border-left:solid;
                border-left-width:1px;
                background-color: transparent;
                border-color:#C1DAD7;
            }
            #opcaoFicha{
                border: 1px solid #BBD8EC;
                margin-bottom: 5px;
                margin-left: 10px;
                padding-bottom: 5px;
                padding-left: 5px;
                padding-top: 5px;
            }

            #opcaoFicha tr{
                vertical-align: middle;
            }

            #opcaoFicha input, #opcaoFicha textarea{
                margin: 5px;
                width: auto;
            }

            #opcaoFicha select{
                margin-left: 5px;
            }

            .testeTable td{
                width: 85px;
                text-align: center;
                vertical-align: middle;
            }

            .testeTable input{
                float: left;
            }

            .tableLayout input{
                float: left;
            }

            .tableLayout label{
                float: left;
                padding-top: 9px;
            }

            .tableLayout tr{
                height: 20px;
            }

            .tableLayout{
                vertical-align: middle;
            }

            .subopcao table label{
                float: left;
                padding-top: 9px;
                margin-right: 5px;
            }

            .subopcao table input{
                float: left;
            }

            .subopcao select{
                margin-left: 5px;
            }


        </style>
        <script type="text/javascript" language="javascript">
            $(document).ready(function () {
                jQuery.noConflict();
                jQuery("#PessoalIs").addClass('visivel');
                jQuery("a").live('click', function() {
                    var id = jQuery(this).attr('name');
                    jQuery(".visivel").removeClass("visivel").toggleClass('dnone');
                    jQuery("#" + id).addClass('visivel').toggleClass('dnone');
                });
            });
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
                        <h:outputText styleClass="diretorio" value="#{fichaHandler.menuFichas.atendimento}"></h:outputText>
                        <h:graphicImage  value="/images/nav.gif" />
                        <h:outputText styleClass="diretorio" value="Antecedentes"></h:outputText>
                    </div>

                    <div align="right" id="salvoPor">
                        <h:panelGroup styleClass="salvoPor" rendered="#{!fichaHandler.fichaAntecedentesAssinada}">
                            <h:outputText value="Salvo por: " rendered="#{fichaHandler.fichaAntecedentes.salvoPor != null}" />
                            <h:outputText value="#{fichaHandler.fichaAntecedentes.salvoPor.nome}" rendered="#{fichaHandler.fichaAntecedentes.salvoPor != null}" />
                            <h:outputText value="Ficha não Salva" rendered="#{fichaHandler.fichaAntecedentes.salvoPor == null}" />
                        </h:panelGroup>
                    </div>

                    <jsp:include page="menuFichas1.jsp"></jsp:include>

                    <div id="panelConfirmacao" align="center" style="margin-top: 15px;">
                        <h:messages id="confirmacao" errorClass="erroConfirmacao" infoClass="sucessoConfirmacao" layout="table" showSummary="true" showDetail="false" globalOnly="true"></h:messages>
                    </div>

                    <h:form>

                        <div id="center_section">

                            <a4j:status onstart="#{rich:component('wait1')}.show()"
                                        onstop="#{rich:component('wait1')}.hide()" />
                            <rich:modalPanel id="wait1" autosized="true" width="200" height="80" top="305"
                                             moveable="false" resizeable="false">
                                <f:facet name="header">
                                    <h:outputText value="Carregando..."/>
                                </f:facet>
                                <h:graphicImage value="images/loadingAnimation.gif"/>
                            </rich:modalPanel>


                            
                                <div id = "PessoalIs">
                                    <h2>Pessoal</h2>
                                <rich:panel headerClass="cabecalho" styleClass="panelGeral" >

                                    <a4j:outputPanel ajaxRendered="true" id="panelPessoal">

                                        <div id="opcaoFicha">

                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.HAS}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/> HAS
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.doencaCoronariana}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>Doença Cardio-vascular
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.CA}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>CA
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.DM}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>DM
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.TB}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>TB
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.hepatite}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>Hepatite
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.hemotransfusao}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>Hemotransfusão                                                
                                            </h:panelGrid>
                                            
                                                
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.dst}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="panelPessoal" event="onclick" />
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="DST:"/>
                                            </h:panelGrid>
                                                
                                            <h:panelGrid columns="1" rendered="#{fichaHandler.fichaAntecedentes.dst == true}">
                                                <h:inputTextarea onkeyup="limitaTamanho(this, 255)" cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.descricaoDST}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>
                                            </h:panelGrid>
                                                    
                                                
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.alergia}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="panelPessoal" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Alergias:"/>
                                            </h:panelGrid>

                                            <h:panelGrid columns="1" rendered="#{fichaHandler.fichaAntecedentes.alergia == true}">
                                                <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.descricaoAlergia}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>

                                            </h:panelGrid>
                                            <h:panelGrid columns="3">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.insuficienciaCardiaca}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="panelPessoal" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Insuficiência Cardíaca:"/>


                                                <h:selectOneMenu   rendered="#{fichaHandler.fichaAntecedentes.insuficienciaCardiaca == true}" value="#{fichaHandler.fichaAntecedentes.grauInsuficienciaCardiaca}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <f:selectItem itemValue="Grau 1" itemLabel="Grau 1" />
                                                    <f:selectItem itemValue="Grau 2" itemLabel="Grau 2" />
                                                    <f:selectItem itemValue="Grau 3" itemLabel="Grau 3" />
                                                    <f:selectItem itemValue="Grau 4" itemLabel="Grau 4" />
                                                </h:selectOneMenu>

                                            </h:panelGrid>

                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.patologiaTireoide}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="panelPessoal" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Patologias da Tireoide:"/>
                                            </h:panelGrid>

                                            <h:panelGrid columns="1" rendered="#{fichaHandler.fichaAntecedentes.patologiaTireoide == true}" >
                                                <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.descricaoPatologiaTireoide}" disabled="#{fichaHandler.fichaAntecedentesAssinada}" />

                                            </h:panelGrid>
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.cirurgias}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="panelPessoal" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Cirurgias:"/>
                                            </h:panelGrid>

                                            <h:panelGrid columns="1">
                                                <h:inputTextarea rendered="#{fichaHandler.fichaAntecedentes.cirurgias == true}" onkeyup="limitaTamanho(this,255)"  cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.descricaoCirurgias}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>

                                            </h:panelGrid>
                                                
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.internacoes}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="panelPessoal" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Internacoes:"/>
                                            </h:panelGrid>
                                            <h:panelGrid columns="1">
                                                <h:inputTextarea rendered="#{fichaHandler.fichaAntecedentes.internacoes == true}" onkeyup="limitaTamanho(this, 255)" cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.descricaoInternacoes}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>
                                            </h:panelGrid>
                                                
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.osteoporose}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="panelPessoal" event="onclick" />
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Osteoporose" />
                                            </h:panelGrid>
                                            <h:panelGrid columns="1" rendered="#{fichaHandler.fichaAntecedentes.osteoporose == true}">
                                                <h:inputTextarea value="#{fichaHandler.fichaAntecedentes.descricaoOsteoporose}" cols="50" rows="2" onkeyup="limitaTamanho(this, 255)" disabled="#{fichaHandler.fichaAntecedentesAssinada}" />
                                            </h:panelGrid>
                                           
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.fraturas}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="panelPessoal" event="onclick" />
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Fraturas" />
                                            </h:panelGrid>
                                            <h:panelGrid columns="1" rendered="#{fichaHandler.fichaAntecedentes.fraturas == true}">
                                                <h:inputTextarea value="#{fichaHandler.fichaAntecedentes.descricaoFraturas}" cols="50" rows="2" onkeyup="limitaTamanho(this, 255)" disabled="#{fichaHandler.fichaAntecedentesAssinada}" />
                                            </h:panelGrid>
                                                
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.outrosPessoal}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="panelPessoal" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Outros:"/>
                                            </h:panelGrid>

                                            <h:panelGrid columns="1" rendered="#{fichaHandler.fichaAntecedentes.outrosPessoal == true}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.descricaoOutrosPessoal}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>

                                            </h:panelGrid>

                                        </div>
                                    </a4j:outputPanel>
                                </rich:panel>
                                </div>
                                <div id="HabitosIs" class="dnone">
                                    <h2>Hábitos de Vida</h2>
                                <rich:panel headerClass="cabecalho" styleClass="panelGeral" >

                                    <a4j:outputPanel ajaxRendered="true" id="panelHabitos">

                                        <div id="opcaoFicha">
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.tabagismo}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="panelHabitos" event="onclick"/>
                                                    <a4j:support reRender="subopcaoTabagismo" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Tabagismo"/>
                                            </h:panelGrid>
                                            <div class="subopcao">
                                                <a4j:outputPanel ajaxRendered="true" id="subopcaoTabagismo" rendered="#{fichaHandler.fichaAntecedentes.tabagismo == true}">
                                                    <h:panelGrid columns="1">
                                                        <h:outputText value="Duração:"/>
                                                        <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.duracaoTabagismo}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>
                                                        <h:outputText value="Quantidade:"/>
                                                        <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.quantidadeTabagismo}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>
                                                    </h:panelGrid>
                                                </a4j:outputPanel>
                                            </div>
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.etilismo}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="panelHabitos" event="onclick"/>
                                                    <a4j:support reRender="subopcaoEtilismo" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Etilismo"/>
                                            </h:panelGrid>
                                            <div class="subopcao">
                                                <a4j:outputPanel ajaxRendered="true" id="subopcaoEtilismo" rendered="#{fichaHandler.fichaAntecedentes.etilismo == true}">
                                                    <h:panelGrid columns="1">
                                                        <h:outputText value="Duração:"/>
                                                        <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.duracaoEtilismo}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>
                                                        <h:outputText value="Quantidade:"/>
                                                        <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.quantidadeEtilismo}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>
                                                    </h:panelGrid>
                                                </a4j:outputPanel>
                                            </div>
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.drogas}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="panelHabitos" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Uso de Drogas"/>
                                            </h:panelGrid>
                                            <h:panelGrid columns="1" rendered="#{fichaHandler.fichaAntecedentes.drogas == true}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.descricaoDrogas}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>
                                            </h:panelGrid>

                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.outrosHabitos}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="panelHabitos" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Outros"/>
                                            </h:panelGrid>

                                            <h:panelGrid columns="1" rendered="#{fichaHandler.fichaAntecedentes.outrosHabitos == true}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.descricaoOutrosHabitos}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>

                                            </h:panelGrid>
                                            <h:panelGrid>
                                                <h:outputText value="Alimentação:" />
                                                <h:inputTextarea id="alimentacao" onkeyup="limitaTamanho(this, 255)" cols="80" rows="2" value="#{fichaHandler.fichaAntecedentes.alimentacao}" disabled="#{fichaHandler.fichaAntecedentesAssinada}" />
                                            </h:panelGrid>
                                            <h:panelGrid>
                                                <h:outputText value="Observações:"/>
                                                <h:inputTextarea id="observacoesHabitos" onkeyup="limitaTamanho(this,255)"  cols="80" rows="2" value="#{fichaHandler.fichaAntecedentes.observacoesHabitos}"   disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>
                                            </h:panelGrid>
                                        </div>
                                        
                                    </a4j:outputPanel>
                                </rich:panel>
                                    </div>
                                <div id="VacinacaoIs" class="dnone">
                                    <h2>Vacinação</h2>
                                <rich:panel headerClass="cabecalho" styleClass="panelGeral">
                                    <a4j:outputPanel ajaxRendered="true" id="panelVacinacao">

                                        <div id="opcaoFicha">
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.tetano}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>Tétano
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.hepatiteB}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>Hepatite B
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.pneumococo}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>Pneumococo
                                            </h:panelGrid>
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.outraImunizacao}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="panelVacinacao" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Outra imunização"/>
                                            </h:panelGrid>
                                            <h:panelGrid columns="1" rendered="#{fichaHandler.fichaAntecedentes.outraImunizacao == true}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.descricaoOutraImunizacao}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>
                                            </h:panelGrid>

                                        </div>
                                    </a4j:outputPanel>
                                </rich:panel>
                                    </div>
                                <div id="SociaisIs" class="dnone">
                                    <h2>Sociais(Epidemologia)</h2>
                                <rich:panel headerClass="cabecalho" styleClass="panelGeral" >
                                    <a4j:outputPanel ajaxRendered="true" id="panelSociais">

                                        <div id="opcaoFicha">
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.chagas}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>Chagas
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.esquistossomoses}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>Esquistossomose
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.TBsociais}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>TB
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.DSTsociais}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>DST
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.hepatiteSociais}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>Hepatite
                                            </h:panelGrid>
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.outrosEpidemiologia}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="panelSociais" event="onclick" />
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Outros" />
                                            </h:panelGrid>
                                            <h:panelGrid columns="1" rendered="#{fichaHandler.fichaAntecedentes.outrosEpidemiologia == true}">
                                                <h:inputTextarea value="#{fichaHandler.fichaAntecedentes.descricaoOutrosEpidemiologia}" cols="50" rows="2" onkeyup="limitaTamanho(this, 255)" disabled="#{fichaHandler.fichaAntecedentesAssinada}" />
                                            </h:panelGrid>
                                        </div>
                                    </a4j:outputPanel>
                                </rich:panel>
                                    </div>
                                <div id="MedicacaoIs" class="dnone">
                                    <h2>Medicações em Uso</h2>
                                <rich:panel headerClass="cabecalho" styleClass="panelGeral" >


                                    <div id="opcaoFicha">
                                        <h:inputTextarea value="#{fichaHandler.fichaAntecedentes.medicacoesEmUso}" cols="80" rows="6" disabled="#{fichaHandler.fichaAntecedentesAssinada}"></h:inputTextarea>
                                    </div>

                                </rich:panel>
                                    </div>
                                <div id="FamiliaresIs" class="dnone">
                                    <h2>Familiares</h2>
                                <rich:panel headerClass="cabecalho" styleClass="panelGeral">

                                    <a4j:outputPanel ajaxRendered="true" id="panelFamiliares">

                                        <div id="opcaoFicha">
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.HASfamiliares}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="descHas" event="onclick"/>
                                                </h:selectBooleanCheckbox> HAS
                                            </h:panelGrid>
                                            <h:panelGrid id="descHas"  columns="1" rendered="#{fichaHandler.fichaAntecedentes.HASfamiliares}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.descricaoHAS}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>
                                            </h:panelGrid>
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.doencaCoronarianaFamiliares}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="descCoronariana" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                Doença Cardio-vascular
                                            </h:panelGrid>

                                            <h:panelGrid id="descCoronariana"  columns="1" rendered="#{fichaHandler.fichaAntecedentes.doencaCoronarianaFamiliares}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.descricaoCoronariana}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>
                                            </h:panelGrid>

                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.CAfamiliares}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="descCa" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                CA
                                            </h:panelGrid>
                                            <h:panelGrid id="descCa"  columns="1" rendered="#{fichaHandler.fichaAntecedentes.CAfamiliares}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.descricaoCA}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>
                                            </h:panelGrid>


                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.DMfamiliares}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="descDM" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                DM
                                            </h:panelGrid>

                                            <h:panelGrid id="descDM"  columns="1" rendered="#{fichaHandler.fichaAntecedentes.DMfamiliares}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.descricaoDM}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>
                                            </h:panelGrid>

                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaAntecedentes.outrosFamiliares}" disabled="#{fichaHandler.fichaAntecedentesAssinada}">
                                                    <a4j:support reRender="descOutros" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Outros"/>
                                            </h:panelGrid>

                                            <h:panelGrid id="descOutros" columns="1" rendered="#{fichaHandler.fichaAntecedentes.outrosFamiliares == true}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaAntecedentes.descricaoOutrosFamiliares}" disabled="#{fichaHandler.fichaAntecedentesAssinada}"/>

                                            </h:panelGrid>

                                        </div>
                                    </a4j:outputPanel>
                                </rich:panel>
                                    </div>
                            

                            <div align="center" style="margin-top:50px">
                                <h:panelGrid columns="3">
                                    <h:commandButton styleClass="bt_cancel" style="margin-right: 10px;" value="CANCELAR" action="atendimentos" rendered="#{!fichaHandler.fichaAntecedentesAssinada}" ></h:commandButton>
                                    <h:commandButton styleClass="bt_save" style="margin-right: 10px;" value="SALVAR" action="#{fichaHandler.salvarFichaAntecedentes}" rendered="#{!fichaHandler.fichaAntecedentesAssinada}"></h:commandButton>
                                    <h:commandButton styleClass="botaoBuscar" value="ASSINAR" action="#{fichaHandler.assinarFichaAntecedentes}" rendered="#{!fichaHandler.fichaAntecedentesAssinada}" disabled="#{!usuarioHandler.medico}">
                                        <a4j:support reRender="adendosAntecedentes" event="oncomplete"/>
                                    </h:commandButton>
                                </h:panelGrid>
                            </div>



                        
                            <div id="conteudoAssinado">
                                <a4j:outputPanel id="adendosAntecedentes" rendered="#{fichaHandler.fichaAntecedentesAssinada}">
                                    <f:subview id="subviewAdendo">
                                        <jsp:include page="adendo.jsp"></jsp:include>
                                    </f:subview>
                                </a4j:outputPanel>
                            </div>

                        </div>

                    </h:form>
                </div>
                
                <jsp:include page="rodape.jsp"></jsp:include>
                
            </div>

        </f:view>
    </body>
</html>