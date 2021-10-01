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
            #opcaoFichaIS{
                border: 1px solid #BBD8EC;
                margin-bottom: 5px;
                margin-left: 10px;
                padding-bottom: 5px;
                padding-left: 5px;
                padding-top: 5px;
            }

            #opcaoFichaIS tr{
                vertical-align: middle;
            }

            #opcaoFichaIS input, #opcaoFichaIS textarea{
                margin: 5px;
                width: auto;
            }

            #opcaoFichaIS select{
                margin-left: 5px;
            }

            .testeTable td{
                width: 90px;
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
            jQuery(document).ready(function () {
                jQuery.noConflict();                
                jQuery("#GeralIs").addClass('visivel');
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
                        <h:outputText styleClass="diretorio" value="IS"></h:outputText>
                    </div>
                    <div align="right" id="salvoPor">
                        <h:panelGroup styleClass="salvoPor" rendered="#{!fichaHandler.fichaIsAssinada}">
                            <h:outputText value="Salvo por: " rendered="#{fichaHandler.fichaIS.salvoPor != null}" />
                            <h:outputText value="#{fichaHandler.fichaIS.salvoPor.nome}" rendered="#{fichaHandler.fichaIS.salvoPor != null}" />
                            <h:outputText value="Ficha não Salva" rendered="#{fichaHandler.fichaIS.salvoPor == null}" />
                        </h:panelGroup>
                    </div>

                    
                    <jsp:include page="menuFichas1.jsp"></jsp:include>
                    
                    

                    <div id="panelConfirmacao" align="center" style="margin-top: 15px;">
                        <h:messages id="confirmacao" errorClass="erroConfirmacao" infoClass="sucessoConfirmacao" layout="table" showSummary="true" showDetail="false" globalOnly="true"></h:messages>
                    </div>
                    <h:form id="formulario">

                        <a4j:jsFunction name="desmarcarGeral" reRender="panelGeral">
                            <a4j:actionparam name="param1" assignTo="#{fichaHandler.fichaIS.febre}" value="false" />
                            <a4j:actionparam name="param2" assignTo="#{fichaHandler.fichaIS.anorexia}" value="false" />
                            <a4j:actionparam name="param3" assignTo="#{fichaHandler.fichaIS.astenia}" value="false" />
                            <a4j:actionparam name="param4" assignTo="#{fichaHandler.fichaIS.cefaleiaGeral}" value="false" />
                            <a4j:actionparam name="param5" assignTo="#{fichaHandler.fichaIS.possuiAlteracaoPeso}" value="false" />
                            <a4j:actionparam name="param6" assignTo="#{fichaHandler.fichaIS.descricaoOutros}" value="Sem queixas" />
                            <a4j:actionparam name="param6" assignTo="#{fichaHandler.fichaIS.febreObservacao}" value="Sem queixas" />

                        </a4j:jsFunction>

                        <a4j:jsFunction name="desmarcarPelosFaneros" reRender="panelPelos">
                            <a4j:actionparam name="param1" assignTo="#{fichaHandler.fichaIS.sudorese}" value="false" />
                            <a4j:actionparam name="param2" assignTo="#{fichaHandler.fichaIS.descricaoSudorese}" value="Sem queixas" />
                            <a4j:actionparam name="param3" assignTo="#{fichaHandler.fichaIS.pruridoPelosFaneros}" value="false" />
                            <a4j:actionparam name="param4" assignTo="#{fichaHandler.fichaIS.descricaoPrurido}" value="Sem queixas" />
                            <a4j:actionparam name="param5" assignTo="#{fichaHandler.fichaIS.areaHipoAnestesia}" value="false" />
                            <a4j:actionparam name="param6" assignTo="#{fichaHandler.fichaIS.descricaoAreaHipoAnestesia}" value="Sem queixas" />
                            <a4j:actionparam name="param7" assignTo="#{fichaHandler.fichaIS.lesoesCutaneas}" value="false" />
                            <a4j:actionparam name="param8" assignTo="#{fichaHandler.fichaIS.descricaoLesoesCutaneasLocalizadas}" value="Sem queixas" />
                            <a4j:actionparam name="param9" assignTo="#{fichaHandler.fichaIS.tipoDeLesao}" value="Nenhuma" />
                            <a4j:actionparam name="param10" assignTo="#{fichaHandler.fichaIS.alteracoesPelosCabelos}" value="false" />
                            <a4j:actionparam name="param11" assignTo="#{fichaHandler.fichaIS.descricaoAlteracoesPelosCabelos}" value="Sem queixas" />
                            <a4j:actionparam name="param12" assignTo="#{fichaHandler.fichaIS.descricaoOutrosPelosFaneros}" value="Sem queixas" />
                            <a4j:actionparam name="param13" assignTo="#{fichaHandler.fichaIS.descricaoLesoesCutaneas}" value="Sem queixas" />
                        </a4j:jsFunction>


                        <a4j:jsFunction name="desmarcarCabecaPescoco" reRender="panelCabeca">
                            <a4j:actionparam name="param1" assignTo="#{fichaHandler.fichaIS.dorCabecaPescoco}" value="false" />
                            <a4j:actionparam name="param2" assignTo="#{fichaHandler.fichaIS.alteracoesMovimento}" value="false" />
                            <a4j:actionparam name="param3" assignTo="#{fichaHandler.fichaIS.dorOcularCefaleia}" value="false" />
                            <a4j:actionparam name="param4" assignTo="#{fichaHandler.fichaIS.sensacaoCorpoEstranho}" value="false" />
                            <a4j:actionparam name="param5" assignTo="#{fichaHandler.fichaIS.queimacao}" value="false" />
                            <a4j:actionparam name="param6" assignTo="#{fichaHandler.fichaIS.lacrimejamento}" value="false" />
                            <a4j:actionparam name="param7" assignTo="#{fichaHandler.fichaIS.sensacaoOlhoSeco}" value="false" />
                            <a4j:actionparam name="param8" assignTo="#{fichaHandler.fichaIS.alteracaoAcuidadeVisual}" value="false" />
                            <a4j:actionparam name="param9" assignTo="#{fichaHandler.fichaIS.diplopia}" value="false" />
                            <a4j:actionparam name="param10" assignTo="#{fichaHandler.fichaIS.fotofobia}" value="false" />
                            <a4j:actionparam name="param11" assignTo="#{fichaHandler.fichaIS.nistagmo}" value="false" />
                            <a4j:actionparam name="param12" assignTo="#{fichaHandler.fichaIS.escotomas}" value="false" />
                            <a4j:actionparam name="param13" assignTo="#{fichaHandler.fichaIS.secrecao}" value="false" />
                            <a4j:actionparam name="param14" assignTo="#{fichaHandler.fichaIS.dorOuvidos}" value="false" />
                            <a4j:actionparam name="param15" assignTo="#{fichaHandler.fichaIS.otorragia}" value="false" />
                            <a4j:actionparam name="param16" assignTo="#{fichaHandler.fichaIS.alteracaoAcuidadeAuditiva}" value="false" />
                            <a4j:actionparam name="param17" assignTo="#{fichaHandler.fichaIS.zumbido}" value="false" />
                            <a4j:actionparam name="param18" assignTo="#{fichaHandler.fichaIS.pruridoOuvido}" value="false" />
                            <a4j:actionparam name="param19" assignTo="#{fichaHandler.fichaIS.descricaoOutrosOuvido}" value="Sem queixas" />
                        </a4j:jsFunction>

                        <a4j:jsFunction name="desmarcarAr" reRender="panelAr">
                            <a4j:actionparam name="param1" assignTo="#{fichaHandler.fichaIS.epitaxe}" value="false" />
                            <a4j:actionparam name="param2" assignTo="#{fichaHandler.fichaIS.alteracoesOlfato}" value="false" />
                            <a4j:actionparam name="param3" assignTo="#{fichaHandler.fichaIS.descricaoAlteracoesOlfato}" value="Sem queixas" />
                            <a4j:actionparam name="param4" assignTo="#{fichaHandler.fichaIS.tosse}" value="false" />
                            <a4j:actionparam name="param5" assignTo="#{fichaHandler.fichaIS.tipoTosse}" value="Nenhuma" />
                            <a4j:actionparam name="param6" assignTo="#{fichaHandler.fichaIS.hemoptise}" value="false" />
                            <a4j:actionparam name="param7" assignTo="#{fichaHandler.fichaIS.expectoracao}" value="false" />
                            <a4j:actionparam name="param8" assignTo="#{fichaHandler.fichaIS.descricaoExpectoracao}" value="Sem queixas" />
                            <a4j:actionparam name="param9" assignTo="#{fichaHandler.fichaIS.dispneia}" value="false" />
                            <a4j:actionparam name="param10" assignTo="#{fichaHandler.fichaIS.tipoDispneia}" value="Nenhuma" />
                            <a4j:actionparam name="param11" assignTo="#{fichaHandler.fichaIS.dorToracica}" value="false" />
                            <a4j:actionparam name="param12" assignTo="#{fichaHandler.fichaIS.tipoDorToracica}" value="Nenhuma" />
                            <a4j:actionparam name="param13" assignTo="#{fichaHandler.fichaIS.localizacaoDorToracica}" value="Sem queixas" />
                            <a4j:actionparam name="param13" assignTo="#{fichaHandler.fichaIS.descricaoOutrosAR}" value="Sem queixas" />
                        </a4j:jsFunction>

                        <a4j:jsFunction name="desmarcarACV" reRender="panelAcv">
                            <a4j:actionparam name="param1" assignTo="#{fichaHandler.fichaIS.precordalgia}" value="false" />
                            <a4j:actionparam name="param2" assignTo="#{fichaHandler.fichaIS.tipoDorPrecordalgia}" value="Sem queixas" />
                            <a4j:actionparam name="param3" assignTo="#{fichaHandler.fichaIS.frequenciaDorPrecordalgia}" value="Sem queixas" />
                            <a4j:actionparam name="param4" assignTo="#{fichaHandler.fichaIS.palpitacoes}" value="false" />
                            <a4j:actionparam name="param5" assignTo="#{fichaHandler.fichaIS.dpn}" value="false" />
                            <a4j:actionparam name="param6" assignTo="#{fichaHandler.fichaIS.ortopneia}" value="false" />
                            <a4j:actionparam name="param7" assignTo="#{fichaHandler.fichaIS.edemaMMII}" value="false" />
                            <a4j:actionparam name="param8" assignTo="#{fichaHandler.fichaIS.desmaio}" value="false" />
                            <a4j:actionparam name="param9" assignTo="#{fichaHandler.fichaIS.descricaoOutrosACV}" value="Sem queixas" />
                        </a4j:jsFunction>


                        <a4j:jsFunction name="desmarcarAGI" reRender="panelAgi">
                            <a4j:actionparam name="param1" assignTo="#{fichaHandler.fichaIS.sialose}" value="false" />
                            <a4j:actionparam name="param2" assignTo="#{fichaHandler.fichaIS.halitose}" value="false" />
                            <a4j:actionparam name="param3" assignTo="#{fichaHandler.fichaIS.regurgitacao}" value="false" />
                            <a4j:actionparam name="param4" assignTo="#{fichaHandler.fichaIS.eructacao}" value="false" />
                            <a4j:actionparam name="param5" assignTo="#{fichaHandler.fichaIS.soluco}" value="false" />
                            <a4j:actionparam name="param6" assignTo="#{fichaHandler.fichaIS.pirose}" value="false" />
                            <a4j:actionparam name="param7" assignTo="#{fichaHandler.fichaIS.nauseas}" value="false" />
                            <a4j:actionparam name="param8" assignTo="#{fichaHandler.fichaIS.hematemese}" value="false" />
                            <a4j:actionparam name="param9" assignTo="#{fichaHandler.fichaIS.melena}" value="false" />
                            <a4j:actionparam name="param10" assignTo="#{fichaHandler.fichaIS.hematoquezia}" value="false" />
                            <a4j:actionparam name="param11" assignTo="#{fichaHandler.fichaIS.disfagia}" value="false" />
                            <a4j:actionparam name="param12" assignTo="#{fichaHandler.fichaIS.odinofagia}" value="false" />
                            <a4j:actionparam name="param13" assignTo="#{fichaHandler.fichaIS.incontinenciaFecal}" value="false" />
                            <a4j:actionparam name="param14" assignTo="#{fichaHandler.fichaIS.constipacao}" value="false" />
                            <a4j:actionparam name="param15" assignTo="#{fichaHandler.fichaIS.dorAbdominal}" value="false" />
                            <a4j:actionparam name="param16" assignTo="#{fichaHandler.fichaIS.localizacaoDorAbdominal}" value="Sem queixas" />
                            <a4j:actionparam name="param17" assignTo="#{fichaHandler.fichaIS.alteracoesApetite}" value="false" />
                            <a4j:actionparam name="param18" assignTo="#{fichaHandler.fichaIS.descricaoAlteracoesApetite}" value="Sem queixas" />
                            <a4j:actionparam name="param19" assignTo="#{fichaHandler.fichaIS.vomitos}" value="false" />
                            <a4j:actionparam name="param19" assignTo="#{fichaHandler.fichaIS.descricaoVomitos}" value="Sem queixas" />
                            <a4j:actionparam name="param19" assignTo="#{fichaHandler.fichaIS.descricaoOutrosAGI}" value="Sem queixas" />
                        </a4j:jsFunction>

                        <a4j:jsFunction name="desmarcarAGU" reRender="panelAgu">
                            <a4j:actionparam name="param1" assignTo="#{fichaHandler.fichaIS.disuria}" value="false" />
                            <a4j:actionparam name="param2" assignTo="#{fichaHandler.fichaIS.poliaciuria}" value="false" />
                            <a4j:actionparam name="param3" assignTo="#{fichaHandler.fichaIS.poliuria}" value="false" />
                            <a4j:actionparam name="param4" assignTo="#{fichaHandler.fichaIS.nicturia}" value="false" />
                            <a4j:actionparam name="param5" assignTo="#{fichaHandler.fichaIS.hematuria}" value="false" />
                            <a4j:actionparam name="param6" assignTo="#{fichaHandler.fichaIS.alteracaoCorUrina}" value="false" />
                            <a4j:actionparam name="param7" assignTo="#{fichaHandler.fichaIS.alteracaoCheiroUrina}" value="false" />
                            <a4j:actionparam name="param8" assignTo="#{fichaHandler.fichaIS.urgenciaMiccional}" value="false" />
                            <a4j:actionparam name="param9" assignTo="#{fichaHandler.fichaIS.incontinenciaUrinaria}" value="false" />
                            <a4j:actionparam name="param10" assignTo="#{fichaHandler.fichaIS.corrimentoVaginal}" value="false" />
                            <a4j:actionparam name="param11" assignTo="#{fichaHandler.fichaIS.pruridoVaginal}" value="false" />
                            <a4j:actionparam name="param12" assignTo="#{fichaHandler.fichaIS.dorMamas}" value="false" />
                            <a4j:actionparam name="param13" assignTo="#{fichaHandler.fichaIS.descricaoDorMamas}" value="Sem queixas" />
                            <a4j:actionparam name="param14" assignTo="#{fichaHandler.fichaIS.nodulos}" value="false" />
                            <a4j:actionparam name="param15" assignTo="#{fichaHandler.fichaIS.descricaoNodulos}" value="Sem queixas" />
                            <a4j:actionparam name="param16" assignTo="#{fichaHandler.fichaIS.secrecaoPapilar}" value="false" />
                            <a4j:actionparam name="param17" assignTo="#{fichaHandler.fichaIS.descricaoOutrosAGU}" value="Sem queixas" />

                        </a4j:jsFunction>

                        <a4j:jsFunction name="desmarcarAME" reRender="panelAme">
                            <a4j:actionparam name="param1" assignTo="#{fichaHandler.fichaIS.dorArticulacoes}" value="false" />
                            <a4j:actionparam name="param2" assignTo="#{fichaHandler.fichaIS.rigidezArticular}" value="false" />
                            <a4j:actionparam name="param3" assignTo="#{fichaHandler.fichaIS.matinal}" value="false" />
                            <a4j:actionparam name="param4" assignTo="#{fichaHandler.fichaIS.duracaoMatinal}" value="Sem queixas" />
                            <a4j:actionparam name="param5" assignTo="#{fichaHandler.fichaIS.fraqueza}" value="false" />
                            <a4j:actionparam name="param6" assignTo="#{fichaHandler.fichaIS.atrofia}" value="false" />
                            <a4j:actionparam name="param7" assignTo="#{fichaHandler.fichaIS.hipertrofia}" value="false" />
                            <a4j:actionparam name="param8" assignTo="#{fichaHandler.fichaIS.espasmos}" value="false" />
                            <a4j:actionparam name="param9" assignTo="#{fichaHandler.fichaIS.descricaoOutrosAME}" value="Sem queixas" />
                        </a4j:jsFunction>

                        <a4j:jsFunction name="desmarcarSN" reRender="panelSn">
                            <a4j:actionparam name="param1" assignTo="#{fichaHandler.fichaIS.cefaleia}" value="false" />
                            <a4j:actionparam name="param2" assignTo="#{fichaHandler.fichaIS.tonturaVertigem}" value="false" />
                            <a4j:actionparam name="param3" assignTo="#{fichaHandler.fichaIS.convulsoes}" value="false" />
                            <a4j:actionparam name="param4" assignTo="#{fichaHandler.fichaIS.alteracoesMemoria}" value="false" />
                            <a4j:actionparam name="param5" assignTo="#{fichaHandler.fichaIS.transtornosVisuais}" value="false" />
                            <a4j:actionparam name="param6" assignTo="#{fichaHandler.fichaIS.transtornosAuditivos}" value="false" />
                            <a4j:actionparam name="param7" assignTo="#{fichaHandler.fichaIS.transtornosMarcha}" value="false" />
                            <a4j:actionparam name="param8" assignTo="#{fichaHandler.fichaIS.deficitForca}" value="false" />
                            <a4j:actionparam name="param9" assignTo="#{fichaHandler.fichaIS.transtornosEsfincterianos}" value="false" />
                            <a4j:actionparam name="param10" assignTo="#{fichaHandler.fichaIS.alteracoesSensibilidade}" value="false" />
                            <a4j:actionparam name="param11" assignTo="#{fichaHandler.fichaIS.incontinencias}" value="false" />
                            <a4j:actionparam name="param12" assignTo="#{fichaHandler.fichaIS.descricaoIncontinencias}" value="Sem queixas" />
                            <a4j:actionparam name="param13" assignTo="#{fichaHandler.fichaIS.transtornosSono}" value="false" />
                            <a4j:actionparam name="param14" assignTo="#{fichaHandler.fichaIS.descricaoTranstornosSono}" value="Sem queixas" />
                            <a4j:actionparam name="param15" assignTo="#{fichaHandler.fichaIS.descricaoOutrosSN}" value="Sem queixas" />
                        </a4j:jsFunction>


                        <div id="center_section">

                            <a4j:status onstart="#{rich:component('wait')}.show()"
                                        onstop="#{rich:component('wait')}.hide()" />
                            <rich:modalPanel id="wait" autosized="true" width="200" height="80" top="305"
                                             moveable="false" resizeable="false">
                                <f:facet name="header">
                                    <h:outputText value="Carregando..."/>
                                </f:facet>
                                <h:graphicImage value="images/loadingAnimation.gif"/>
                            </rich:modalPanel>


                            
                                <div id="GeralIs">
                                    <h2>Geral</h2>
                                    <rich:panel headerClass="cabecalho" styleClass="panelGeral">
                                        <h:panelGrid columns="2" styleClass="semqueixas">
                                            <h:selectBooleanCheckbox style="margin: 5px; width: auto;" id="geral" value="#{fichaHandler.fichaIS.geral}"  disabled="#{fichaHandler.fichaIsAssinada}" onclick="desmarcarGeral()" >
                                            </h:selectBooleanCheckbox>
                                            <h:outputText value="Sem Queixas"/>
                                        </h:panelGrid>

                                        <div id="opcaoFichaIS">
                                            <a4j:outputPanel id="panelGeral" ajaxRendered="true" >
                                                <h:panelGrid columns="2">
                                                    <h:selectBooleanCheckbox id="febre" value="#{fichaHandler.fichaIS.febre}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.geral}" >
                                                        <a4j:support reRender="subopcaoFebre" event="onclick" ajaxSingle="true"/>
                                                    </h:selectBooleanCheckbox>
                                                    <h:outputText value="Febre"/>
                                                </h:panelGrid>
                                                <h:panelGroup  id="subopcaoFebre" rendered="#{fichaHandler.fichaIS.febre == true}">
                                                    <div class="subopcao">
                                                        <div style="margin-bottom:10px">
                                                            <h:panelGrid columns="2">
                                                                <h:outputText value="Duração(dias):"/>
                                                                <h:inputText id="duracao"  value="#{fichaHandler.fichaIS.duracaoFebre}" size="3" maxlength="3" disabled="#{fichaHandler.fichaIS.geral}"  readonly="#{fichaHandler.fichaIsAssinada}"/>
                                                            </h:panelGrid>

                                                            <h:selectOneRadio styleClass="testeTable" layout="pageDirection" id="selecaoContinua" value="#{fichaHandler.fichaIS.febreContinua}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.geral}" >
                                                                <f:selectItem id="RadioGroup1_0" itemLabel="Contínua" itemValue="true" />
                                                                <f:selectItem id="RadioGroup1_1" itemLabel="Intermitente" itemValue="false" />
                                                            </h:selectOneRadio>
                                                        </div>

                                                        <div style="margin-bottom:10px">
                                                            <h:outputText value="Aferida por termômetro:"/>
                                                            <h:selectOneRadio styleClass="tableLayout" layout="pageDirection" id="selecaoAferida" value="#{fichaHandler.fichaIS.febreAferidaPorTermometro}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.geral}">
                                                                <f:selectItem id="AferidaPorTermometro1" itemLabel="Sim" itemValue="true" />
                                                                <f:selectItem id="AferidaPorTermometro2" itemLabel="Não" itemValue="false" />
                                                            </h:selectOneRadio>
                                                            <h:panelGrid columns="2">
                                                                <h:outputText value="Obs.:"/>
                                                                <h:inputTextarea style="width: 100%;" id="febreObservacao" onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{fichaHandler.fichaIS.febreObservacao}"  disabled="#{fichaHandler.fichaIS.geral}" readonly="#{fichaHandler.fichaIsAssinada}"/>
                                                            </h:panelGrid>
                                                        </div>
                                                    </div>
                                                </h:panelGroup>
                                                <h:panelGrid columns="2">
                                                    <h:selectBooleanCheckbox  id="anorexia" value="#{fichaHandler.fichaIS.anorexia}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.geral}" />
                                                    <h:outputText value="Anorexia"/>
                                                    <h:selectBooleanCheckbox  id="astenia" value="#{fichaHandler.fichaIS.astenia}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.geral}" />
                                                    <h:outputText value="Astenia"/>
                                                    <h:selectBooleanCheckbox  id="cefaleia" value="#{fichaHandler.fichaIS.cefaleiaGeral}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.geral}"/>
                                                    <h:outputText value="Cefaléia"/>

                                                    <h:selectBooleanCheckbox  id="alteracaoPeso" value="#{fichaHandler.fichaIS.possuiAlteracaoPeso}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.geral}" >
                                                        <a4j:support reRender="subOpcaoAltPeso" event="onclick"/>
                                                    </h:selectBooleanCheckbox>
                                                    <h:outputText value="Alteração de Peso"/>
                                                </h:panelGrid >

                                                <div class="subopcao">

                                                    <h:panelGrid id="subOpcaoAltPeso" columns="4" rendered="#{fichaHandler.fichaIS.possuiAlteracaoPeso == true}">
                                                        <h:selectOneMenu id="selecaoPeso" value="#{fichaHandler.fichaIS.alteracaoPeso}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.geral}" >
                                                            <f:selectItem itemValue="Ganho" itemLabel="Ganho" />
                                                            <f:selectItem itemValue="Perda" itemLabel="Perda" />
                                                        </h:selectOneMenu>
                                                        <h:inputText  id="peso" maxlength="7" size="5" styleClass="campoPequeno" value="#{fichaHandler.fichaIS.peso}"  disabled="#{fichaHandler.fichaIS.geral}" readonly="#{fichaHandler.fichaIsAssinada}">
                                                            <f:convertNumber type="number"/>
                                                        </h:inputText>
                                                        <h:outputText value="KG"/>
                                                        <h:message for="peso" errorStyle="color:red; margin-left:5px;"/>
                                                    </h:panelGrid>
                                                </div>

                                                <h:panelGrid>
                                                    <h:outputText value="Outras informações:"/>
                                                    <h:inputTextarea style="width: 100%;" id="outrosGeral" onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{fichaHandler.fichaIS.descricaoOutros}"   disabled="#{fichaHandler.fichaIS.geral}" readonly="#{fichaHandler.fichaIsAssinada}"/>
                                                </h:panelGrid>
                                            </a4j:outputPanel>
                                        </div>
                                    </rich:panel>
                                </div>
                                <div id="Pelos_Faneros" class="dnone">
                                    <h2>Pêlos e Fâneros</h2>
                                    <rich:panel headerClass="cabecalho" styleClass="panelGeral">
                                    <h:panelGrid columns="2" styleClass="semqueixas">
                                        <h:selectBooleanCheckbox style="margin: 5px; width: auto;" id="pelos" value="#{fichaHandler.fichaIS.pelosFaneros}"  disabled="#{fichaHandler.fichaIsAssinada}" onclick="desmarcarPelosFaneros()">
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Sem Queixas"/>
                                    </h:panelGrid>

                                    <div id="opcaoFichaIS">
                                        <a4j:outputPanel id="panelPelos" ajaxRendered="true" >
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.sudorese}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.pelosFaneros}" >
                                                    <a4j:support reRender="subOpcaoSudorese" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Sudorese"/>
                                            </h:panelGrid>

                                            <h:panelGrid id="subOpcaoSudorese" columns="1" rendered="#{fichaHandler.fichaIS.sudorese == true}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.descricaoSudorese}" disabled="#{fichaHandler.fichaIS.pelosFaneros}"  readonly="#{fichaHandler.fichaIsAssinada}"/>

                                            </h:panelGrid>

                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.pruridoPelosFaneros}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.pelosFaneros}">
                                                    <a4j:support reRender="subOpcaoPrurido" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Prurido" />
                                            </h:panelGrid>

                                            <h:panelGrid id="subOpcaoPrurido" columns="1" rendered="#{fichaHandler.fichaIS.pruridoPelosFaneros == true}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.descricaoPrurido}" disabled="#{fichaHandler.fichaIS.pelosFaneros}" readonly="#{fichaHandler.fichaIsAssinada}">
                                                </h:inputTextarea>
                                            </h:panelGrid>


                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.areaHipoAnestesia}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.pelosFaneros}">
                                                    <a4j:support reRender="subOpcaoArea" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Área de Hipo. ou Anestesia" />
                                            </h:panelGrid>


                                            <h:panelGrid id="subOpcaoArea" columns="1" rendered="#{fichaHandler.fichaIS.areaHipoAnestesia == true}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.descricaoAreaHipoAnestesia}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.pelosFaneros}"/>

                                            </h:panelGrid>

                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.lesoesCutaneas}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.pelosFaneros}">
                                                    <a4j:support reRender="subOpcaoLesoes" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Lesões Cutâneas" />
                                            </h:panelGrid>




                                            <div class="subopcao">
                                                <h:panelGroup id="subOpcaoLesoes">


                                                    <h:panelGrid columns="1" rendered="#{fichaHandler.fichaIS.lesoesCutaneas == true}">
                                                        <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.descricaoLesoesCutaneas}" disabled="#{fichaHandler.fichaIS.pelosFaneros}"  readonly="#{fichaHandler.fichaIsAssinada}"/>
                                                    </h:panelGrid>

                                                    <h:panelGrid id="subopcaoLesoesCutanes"  rendered="#{fichaHandler.fichaIS.lesoesCutaneas == true}">
                                                        <h:selectOneRadio layout="pageDirection" value="#{fichaHandler.fichaIS.lesoesCutaneasLocalizadas}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.pelosFaneros}" >
                                                            <f:selectItem id="LesoesCutaneas_0" itemLabel="Localizadas" itemValue="true" />
                                                            <f:selectItem id="LesoesCutaneas_1" itemLabel="Disseminadas" itemValue="false" />
                                                        </h:selectOneRadio>
                                                        <h:panelGrid columns="1">
                                                            <h:outputText value="Descrições" />
                                                            <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.descricaoLesoesCutaneasLocalizadas}" disabled="#{fichaHandler.fichaIS.pelosFaneros}" readonly="#{fichaHandler.fichaIsAssinada}"/>
                                                        </h:panelGrid>
                                                        <h:panelGrid columns="2">
                                                            <h:outputText value="Tipo de Lesão:" />
                                                            <h:selectOneMenu value="#{fichaHandler.fichaIS.tipoDeLesao}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.pelosFaneros}">
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
                                                <h:selectBooleanCheckbox id="alteracoesPelos"  value="#{fichaHandler.fichaIS.alteracoesPelosCabelos}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.pelosFaneros}">
                                                    <a4j:support reRender="subOpcaoPelos" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Alterações nos Pelos ou Cabelos" />
                                            </h:panelGrid>
                                            <h:panelGrid id="subOpcaoPelos"  columns="1" rendered="#{fichaHandler.fichaIS.alteracoesPelosCabelos == true}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.descricaoAlteracoesPelosCabelos}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.pelosFaneros}"/>

                                            </h:panelGrid>
                                            <h:panelGrid>
                                                <h:outputText value="Outras informações:" />
                                                <h:inputTextarea id="outrosPelos" onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{fichaHandler.fichaIS.descricaoOutrosPelosFaneros}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.pelosFaneros}"  readonly="#{fichaHandler.fichaIsAssinada}"/>
                                            </h:panelGrid>
                                        </a4j:outputPanel>
                                    </div>
                                    </rich:panel>
                                </div>
                                <div id="Cabeca_Pescoco" class="dnone">
                                    <h2>Cabeça e Pescoço</h2>
                                    <rich:panel headerClass="cabecalho" styleClass="panelGeral">
                                    <h:panelGrid columns="2" styleClass="semqueixas">
                                        <h:selectBooleanCheckbox id="cabeca" value="#{fichaHandler.fichaIS.cabecaPescoco}" disabled="#{fichaHandler.fichaIsAssinada}" onclick="desmarcarCabecaPescoco()">
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Sem Queixas"/>
                                    </h:panelGrid>
                                    <div id="opcaoFichaIS">
                                        <a4j:outputPanel id="panelCabeca" ajaxRendered="true" >
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.dorCabecaPescoco}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}"/>
                                                <h:outputText value="Dor" />
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.alteracoesMovimento}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}"/>
                                                <h:outputText value="Alterações no Movimento" />
                                            </h:panelGrid>
                                            <h:outputText value="Olhos:" styleClass="topicoIS"/>


                                            <div class="subopcao">
                                                <h:panelGrid columns="4">
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.dorOcularCefaleia}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}"/>
                                                    <h:outputText value="Dor Ocular e Cefaléia" />

                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.sensacaoCorpoEstranho}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}"/>
                                                    <h:outputText value="Sensação de corpo estranho" />


                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.queimacao}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}" />
                                                    <h:outputText value="Queimação ou Ardência" />
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.lacrimejamento}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}" />
                                                    <h:outputText value="Lacrimejamento" />

                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.sensacaoOlhoSeco}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}" />
                                                    <h:outputText value="Sensação de Olho Seco" />


                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.alteracaoAcuidadeVisual}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}"/>
                                                    <h:outputText value="Alteração da acuidade visual" />

                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.diplopia}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}"/>
                                                    <h:outputText value="Diplopia" />


                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.fotofobia}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}" />
                                                    <h:outputText value="Fotofobia" />


                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.nistagmo}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}"/>
                                                    <h:outputText value="Nistagmo" />

                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.escotomas}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}"/>
                                                    <h:outputText value="Escótomas" />

                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.secrecao}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}" />
                                                    <h:outputText value="Secreção" />


                                                </h:panelGrid>
                                            </div>
                                            <h:outputText value="Ouvidos:" styleClass="topicoIS"/>

                                            <div class="subopcao">
                                                <h:panelGrid columns="2">
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.dorOuvidos}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}" />
                                                    <h:outputText value="Dor" />

                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.otorragia}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}" />
                                                    <h:outputText value="Otorragia" />

                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.alteracaoAcuidadeAuditiva}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}" />
                                                    <h:outputText value=" Alteração da acuidade auditiva" />


                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.zumbido}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}" />
                                                    <h:outputText value="Zumbido" />


                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.pruridoOuvido}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}" />
                                                    <h:outputText value="Prurido" />
                                                </h:panelGrid>
                                            </div>
                                            <h:panelGrid>
                                                <h:outputText value="Outras informações:" />
                                                <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{fichaHandler.fichaIS.descricaoOutrosOuvido}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.cabecaPescoco}"  readonly="#{fichaHandler.fichaIsAssinada}"/>
                                            </h:panelGrid>
                                        </a4j:outputPanel>
                                    </div>
                                    </rich:panel>
                                </div>

                                <div id="AR" class="dnone">
                                    <h2>AR</h2>
                                    <rich:panel headerClass="cabecalho" styleClass="panelGeral">
                                    <h:panelGrid columns="2" styleClass="semqueixas">
                                        <h:selectBooleanCheckbox id="ar" value="#{fichaHandler.fichaIS.ar}" disabled="#{fichaHandler.fichaIsAssinada}" onclick="desmarcarAr()">
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Sem Queixas"/>

                                    </h:panelGrid>
                                    <div id="opcaoFichaIS">
                                        <a4j:outputPanel id="panelAr" ajaxRendered="true" >
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.epitaxe}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ar}" />
                                                <h:outputText value="Epitaxe"/>
                                            </h:panelGrid>
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.alteracoesOlfato}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ar}">
                                                    <a4j:support reRender="subAlteracoes" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Alterações de Olfato"/>
                                            </h:panelGrid>

                                            <h:panelGrid id="subAlteracoes" columns="1" rendered="#{fichaHandler.fichaIS.alteracoesOlfato == true}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.descricaoAlteracoesOlfato}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ar}"/>

                                            </h:panelGrid>
                                            <h:panelGrid columns="3">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.tosse}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ar}">
                                                    <a4j:support reRender="subTosse,spacerTosse" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Tosse"/>
                                                <h:selectOneMenu id="subTosse" rendered="#{fichaHandler.fichaIS.tosse == true}" value="#{fichaHandler.fichaIS.tipoTosse}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ar}">
                                                    <f:selectItem itemValue="Nenhuma" itemLabel="Nenhuma" />
                                                    <f:selectItem itemValue="Seca" itemLabel="Seca" />
                                                    <f:selectItem itemValue="Produtiva - Serosa" itemLabel="Produtiva - Serosa"/>
                                                    <f:selectItem itemValue="Produtiva - Mucoide" itemLabel="Produtiva - Mucoide"/>
                                                    <f:selectItem itemValue="Produtiva - Mucopurolenta" itemLabel="Produtiva - Mucopurolenta"/>
                                                </h:selectOneMenu>
                                                <rich:spacer id="spacerTosse" rendered="#{fichaHandler.fichaIS.tosse == false}"/>
                                            </h:panelGrid>

                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.hemoptise}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ar}"/>
                                                <h:outputText value="Hemoptise"/>
                                            </h:panelGrid>
                                            <h:panelGrid columns="2">

                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.expectoracao}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ar}">
                                                    <a4j:support reRender="subExpec" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Expectoração"/>

                                            </h:panelGrid >
                                            <h:panelGrid  id="subExpec" columns="1" rendered="#{fichaHandler.fichaIS.expectoracao == true}">

                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.descricaoExpectoracao}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ar}"/>

                                            </h:panelGrid>
                                            <h:panelGrid columns="3">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.dispneia}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ar}">
                                                    <a4j:support reRender="subDisp,spacerDisp" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Dispneia"/>
                                                <h:selectOneMenu id="subDisp" rendered="#{fichaHandler.fichaIS.dispneia == true}" value="#{fichaHandler.fichaIS.tipoDispneia}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ar}">
                                                    <f:selectItem itemValue="Nenhuma" itemLabel="Nenhuma"/>
                                                    <f:selectItem itemValue="Ortopnéia" itemLabel="Ortopnéia"/>
                                                    <f:selectItem itemValue="DPN" itemLabel="DPN"/>
                                                    <f:selectItem itemValue="Platipnéia" itemLabel="Platipnéia"/>
                                                    <f:selectItem itemValue="Trepopnéia" itemLabel="Trepopnéia"/>
                                                    <f:selectItem itemValue="Aos esforços" itemLabel="Aos esforços"/>
                                                </h:selectOneMenu>
                                                <rich:spacer id="spacerDisp" rendered="#{fichaHandler.fichaIS.dispneia == false}"/>

                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.dorToracica}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ar}">
                                                    <a4j:support reRender="subDor,spacerDor,subopcaoDorToracica" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Dor Torácica"/>
                                                <h:selectOneMenu id="subDor" rendered="#{fichaHandler.fichaIS.dorToracica == true}" value="#{fichaHandler.fichaIS.tipoDorToracica}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ar}">
                                                    <f:selectItem itemValue="Nenhuma" itemLabel="Nenhuma"/>
                                                    <f:selectItem itemValue="Constrictiva" itemLabel="Constrictiva"/>
                                                    <f:selectItem itemValue="Lancinante" itemLabel="Lancinante"/>
                                                    <f:selectItem itemValue="Em queimação" itemLabel="Em queimação"/>
                                                    <f:selectItem itemValue="Outras" itemLabel="Outras"/>
                                                </h:selectOneMenu>
                                                <rich:spacer id="spacerDor" rendered="#{fichaHandler.fichaIS.dorToracica == false}"/>
                                            </h:panelGrid>
                                            <div class="subopcao">
                                                <h:panelGrid id="subopcaoDorToracica" columns="1" rendered="#{fichaHandler.fichaIS.dorToracica== true}">
                                                    <h:outputText value="Localização:"/>
                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.localizacaoDorToracica}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ar}"/>
                                                </h:panelGrid>

                                            </div>

                                            <h:panelGrid>
                                                <h:outputText value="Outras informações:"/>

                                                <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{fichaHandler.fichaIS.descricaoOutrosAR}"disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ar}"/>
                                            </h:panelGrid>
                                        </a4j:outputPanel>
                                    </div>
                                    </rich:panel>
                                </div>

                                <div id="ACV" class="dnone">
                                    <h2>ACV</h2>
                                    <rich:panel headerClass="cabecalho" styleClass="panelGeral">
                                    <h:panelGrid columns="2" styleClass="semqueixas">
                                        <h:selectBooleanCheckbox id="acv" value="#{fichaHandler.fichaIS.acv}"  disabled="#{fichaHandler.fichaIsAssinada}" onclick="desmarcarACV()">
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Sem Queixas"/>
                                    </h:panelGrid>
                                    <div id="opcaoFichaIS">
                                        <a4j:outputPanel id="panelAcv" ajaxRendered="true" >
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.precordalgia}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.acv}">
                                                    <a4j:support reRender="subopcaoPrecordalgia" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Precordalgia" />
                                            </h:panelGrid>
                                            <div class="subopcao">
                                                <h:panelGrid  id="subopcaoPrecordalgia" columns="1" rendered="#{fichaHandler.fichaIS.precordalgia == true}">
                                                    <h:outputText value="Tipo da dor" />
                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.tipoDorPrecordalgia}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.acv}"/>
                                                    <h:outputText value="Frequência" />
                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.frequenciaDorPrecordalgia}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.acv}"/>
                                                </h:panelGrid>
                                            </div>
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.palpitacoes}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.acv}"/>
                                                <h:outputText value="Palpitações" />

                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.dpn}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.acv}"/>
                                                <h:outputText value="DPN" />

                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.ortopneia}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.acv}"/>
                                                <h:outputText value="Ortopnéia" />

                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.edemaMMII}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.acv}"/>
                                                <h:outputText value="Edema MMII" />

                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.desmaio}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.acv}"/>
                                                <h:outputText value="Desmaio" />
                                            </h:panelGrid>
                                            <h:panelGrid >
                                                <h:outputText value="Outras informações:" />

                                                <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{fichaHandler.fichaIS.descricaoOutrosACV}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.acv}"/>
                                            </h:panelGrid>
                                        </a4j:outputPanel>

                                    </div>
                                    </rich:panel>
                                </div>

                                <div id="AGI" class="dnone">
                                    <h2>AGI</h2>
                                    <rich:panel headerClass="cabecalho" styleClass="panelGeral">

                                    <h:panelGrid columns="2" styleClass="semqueixas">
                                        <h:selectBooleanCheckbox id="agi" value="#{fichaHandler.fichaIS.agi}"  disabled="#{fichaHandler.fichaIsAssinada}" onclick="desmarcarAGI()">
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Sem Queixas"/>
                                    </h:panelGrid>
                                    <div id="opcaoFichaIS">
                                        <a4j:outputPanel id="panelAgi" ajaxRendered="true" >


                                            <h:panelGrid columns="4">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.sialose}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}"/>
                                                <h:outputText value="Sialose"/>

                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.halitose}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}"/>
                                                <h:outputText value="Halitose"/>


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.regurgitacao}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}"/>
                                                <h:outputText value="Regurgitação"/>


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.eructacao}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}" />
                                                <h:outputText value="Eructação"/>


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.soluco}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}"/>
                                                <h:outputText value="Soluço"/>


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.pirose}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}" />
                                                <h:outputText value="Pirose"/>


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.nauseas}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}"/>
                                                <h:outputText value="Náuseas"/>


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.hematemese}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}"/>
                                                <h:outputText value="Hematêmese"/>


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.melena}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}"/>
                                                <h:outputText value="Melena"/>


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.hematoquezia}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}"/>
                                                <h:outputText value="Hematoquezia"/>


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.disfagia}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}"/>
                                                <h:outputText value="Disfagia"/>


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.odinofagia}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}" />
                                                <h:outputText value="Odinofagia"/>

                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.incontinenciaFecal}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}"/>
                                                <h:outputText value="Incontinência fecal"/>


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.constipacao}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}"/>
                                                <h:outputText value="Constipação"/>


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.dorAbdominal}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}">
                                                    <a4j:support reRender="subDorAbdominal" event="onclick"/>

                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Dor abdominal"/>
                                            </h:panelGrid>



                                            <div class="subopcao">

                                                <h:panelGrid id="subDorAbdominal" columns="1" rendered="#{fichaHandler.fichaIS.dorAbdominal == true}">
                                                    <h:outputText value="Localização:"/>

                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.localizacaoDorAbdominal}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}"/>
                                                </h:panelGrid>

                                            </div>


                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.alteracoesApetite}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}">
                                                    <a4j:support reRender="subAlteracoesApetite" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Alterações do apetite"/>
                                            </h:panelGrid>


                                            <h:panelGrid id="subAlteracoesApetite"  columns="1" rendered="#{fichaHandler.fichaIS.alteracoesApetite == true}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.descricaoAlteracoesApetite}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}"/>


                                            </h:panelGrid>
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.vomitos}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}">
                                                    <a4j:support reRender="subVomitos" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Vômitos"/>
                                            </h:panelGrid>

                                            <h:panelGrid id="subVomitos" columns="1" rendered="#{fichaHandler.fichaIS.vomitos == true}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.descricaoVomitos}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}"/>

                                            </h:panelGrid>


                                            <h:panelGrid>
                                                <h:outputText value="Outras informações:"/>
                                                <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{fichaHandler.fichaIS.descricaoOutrosAGI}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agi}"/>
                                            </h:panelGrid>
                                        </a4j:outputPanel>
                                    </div>
                                    </rich:panel>
                                </div>

                                <div id="AGU" class="dnone">
                                    <h2>AGU</h2>
                                    <rich:panel headerClass="cabecalho" styleClass="panelGeral">
                                    <h:panelGrid columns="2" styleClass="semqueixas">
                                        <h:selectBooleanCheckbox id="agu" value="#{fichaHandler.fichaIS.agu}"  disabled="#{fichaHandler.fichaIsAssinada}" onclick="desmarcarAGU()">
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Sem Queixas"/>
                                    </h:panelGrid>
                                    <div id="opcaoFichaIS">
                                        <a4j:outputPanel id="panelAgu" ajaxRendered="true" >


                                            <h:panelGrid columns="4">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.disuria}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agu}"/>
                                                <h:outputText value="Disúria" />

                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.poliaciuria}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agu}"/>
                                                <h:outputText value="Poliaciúria" />

                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.poliuria}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agu}"/>
                                                <h:outputText value="Poliúria" />

                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.nicturia}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agu}"/>
                                                <h:outputText value="Nictúria" />

                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.hematuria}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agu}"/>
                                                <h:outputText value="Hematúria" />

                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.alteracaoCorUrina}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agu}"/>
                                                <h:outputText value="Alteração de cor da urina" />

                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.alteracaoCheiroUrina}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agu}"/>
                                                <h:outputText value="Alteração de cheiro da urina" />


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.urgenciaMiccional}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agu}"/>
                                                <h:outputText value="Urgência Miccional" />


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.incontinenciaUrinaria}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agu}"/>
                                                <h:outputText value="Incontinência urinária" />

                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.corrimentoVaginal}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agu}"/>
                                                <h:outputText value="Corrimento vaginal" />

                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.pruridoVaginal}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agu}"/>
                                                <h:outputText value="Prurido vaginal" />


                                            </h:panelGrid>

                                            <h:outputText value="Mamas:" styleClass="topicoIS"/>

                                            <div class="subopcao">
                                                <h:panelGrid columns="2">
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.dorMamas}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agu}" >
                                                        <a4j:support reRender="subMamas" event="onclick"/>
                                                    </h:selectBooleanCheckbox>
                                                    <h:outputText value="Dor" />
                                                </h:panelGrid>

                                                <h:panelGrid id="subMamas"  columns="1"  rendered="#{fichaHandler.fichaIS.dorMamas == true}">
                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.descricaoDorMamas}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agu}"/>

                                                </h:panelGrid>

                                                <h:panelGrid columns="2">
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.nodulos}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agu}">
                                                        <a4j:support reRender="subNodulos" event="onclick"/>
                                                    </h:selectBooleanCheckbox>
                                                    <h:outputText value="Nódulos" />
                                                </h:panelGrid>


                                                <h:panelGrid id="subNodulos" columns="1" rendered="#{fichaHandler.fichaIS.nodulos == true}">
                                                    <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.descricaoNodulos}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agu}"/>

                                                </h:panelGrid>
                                                <h:panelGrid columns="2">
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.secrecaoPapilar}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agu}"/>
                                                    <h:outputText value="Secreção Papilar" />
                                                </h:panelGrid>

                                            </div>
                                            <h:panelGrid>
                                                <h:outputText value="Outras informações:" />
                                                <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{fichaHandler.fichaIS.descricaoOutrosAGU}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.agu}"/>
                                            </h:panelGrid>
                                        </a4j:outputPanel>
                                    </div>
                                    </rich:panel>
                                </div>

                                <div id="AME" class="dnone">
                                    <h2>AME</h2>
                                    <rich:panel headerClass="cabecalho" styleClass="panelGeral">
                                    <h:panelGrid columns="2" styleClass="semqueixas">
                                        <h:selectBooleanCheckbox id="ame" value="#{fichaHandler.fichaIS.ame}"  disabled="#{fichaHandler.fichaIsAssinada}" onclick="desmarcarAME()">
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Sem Queixas"/>
                                    </h:panelGrid>
                                    <div id="opcaoFichaIS">
                                        <a4j:outputPanel id="panelAme" ajaxRendered="true" >
                                            <h:outputText value="Articulações:" styleClass="topicoIS"/>

                                            <div class="subopcao">
                                                <h:panelGrid columns="2">
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.dorArticulacoes}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ame}"/>
                                                    <h:outputText value="Dor" />

                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.rigidezArticular}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ame}"/>
                                                    <h:outputText value="Rigidez Articular" />

                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.matinal}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ame}">
                                                        <a4j:support reRender="subopcaoMatinal" event="onclick"/>
                                                    </h:selectBooleanCheckbox>
                                                    <h:outputText value="Matinal" />
                                                </h:panelGrid>
                                            </div>
                                            <div class="subopcao">

                                                <h:panelGrid id="subopcaoMatinal" columns="1" rendered="#{fichaHandler.fichaIS.matinal == true}">
                                                    <h:outputText value="Duração:" />
                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.duracaoMatinal}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ame}"/>
                                                </h:panelGrid>

                                            </div>

                                            <h:outputText value="Músculos:" styleClass="topicoIS"/>
                                            <div class="subopcao">
                                                <h:panelGrid columns="2">
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.fraqueza}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ame}"/>
                                                    <h:outputText value="Fraqueza" />
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.atrofia}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ame}"/>
                                                    <h:outputText value="Atrofia" />



                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.hipertrofia}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ame}"/>
                                                    <h:outputText value="Hipertrofia" />
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.espasmos}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ame}"/>
                                                    <h:outputText value="Espasmos" />
                                                </h:panelGrid>
                                            </div>

                                            <h:panelGrid>
                                                <h:outputText value="Outras informações:" />
                                                <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{fichaHandler.fichaIS.descricaoOutrosAME}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.ame}"/>
                                            </h:panelGrid>

                                            </a4j:outputPanel>
                                        </div>
                                    </rich:panel>
                                </div>

                                <div id="SN" class="dnone">
                                    <h2>SN</h2>
                                    <rich:panel headerClass="cabecalho" styleClass="panelGeral">
                                    <h:panelGrid columns="2" styleClass="semqueixas">
                                        <h:selectBooleanCheckbox id="sn" value="#{fichaHandler.fichaIS.sn}" disabled="#{fichaHandler.fichaIsAssinada}" onclick="desmarcarSN()">
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Sem Queixas"/>
                                    </h:panelGrid>
                                    <div id="opcaoFichaIS">
                                        <a4j:outputPanel id="panelSn" ajaxRendered="true" >


                                            <h:panelGrid columns="4">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.cefaleia}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.sn}"/>
                                                <h:outputText value="Cefaléia" />


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.tonturaVertigem}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.sn}"/>
                                                <h:outputText value="Tontura e vertigem" />


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.convulsoes}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.sn}"/>
                                                <h:outputText value="Convulsões" />


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.alteracoesMemoria}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.sn}"/>
                                                <h:outputText value="Alterações da memória" />


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.transtornosVisuais}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.sn}"/>
                                                <h:outputText value="Transtornos visuais" />


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.transtornosAuditivos}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.sn}"/>
                                                <h:outputText value="Transtornos auditivos" />


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.transtornosMarcha}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.sn}"/>
                                                <h:outputText value="Transtornos da marcha" />


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.deficitForca}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.sn}"/>
                                                <h:outputText value="Déficit de força" />

                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.alteracoesSensibilidade}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.sn}"/>
                                                <h:outputText value="Alterações de sensibilidade" />


                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.transtornosEsfincterianos}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.sn}"/>
                                                <h:outputText value="Transtornos esfincterianos" />
                                            </h:panelGrid>

                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.incontinencias}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.sn}">
                                                    <a4j:support reRender="subIncon" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Incontinências" />

                                            </h:panelGrid>

                                            <h:panelGrid id="subIncon" columns="1" rendered="#{fichaHandler.fichaIS.incontinencias == true}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.descricaoIncontinencias}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.sn}"/>

                                            </h:panelGrid>

                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaIS.transtornosSono}"   disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.sn}">
                                                    <a4j:support reRender="subTrans" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Transtornos do sono" />
                                            </h:panelGrid>

                                            <h:panelGrid id="subTrans" columns="1" rendered="#{fichaHandler.fichaIS.transtornosSono == true}">
                                                <h:inputTextarea  onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaIS.descricaoTranstornosSono}"  disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.sn}"/>
                                            </h:panelGrid>

                                            <h:panelGrid>
                                                <h:outputText value="Outras informações:" />
                                                <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="80" rows="2" value="#{fichaHandler.fichaIS.descricaoOutrosSN}" disabled="#{fichaHandler.fichaIsAssinada || fichaHandler.fichaIS.sn}"/>
                                            </h:panelGrid>
                                        </a4j:outputPanel>
                                    </div>
                                    </rich:panel>
                            </div>
                            
                            <div align="center" style="margin-top:50px">
                                <h:panelGrid columns="3">
                                    <h:commandButton styleClass="bt_cancel" style="margin-right: 10px;" value="CANCELAR" action="atendimentos" rendered="#{!fichaHandler.fichaIsAssinada}"></h:commandButton>
                                    <h:commandButton styleClass="bt_save" style="margin-right: 10px;" value="SALVAR" action="#{fichaHandler.salvarFichaIS}" rendered="#{!fichaHandler.fichaIsAssinada}"></h:commandButton>
                                    <h:commandButton styleClass="botaoBuscar" value="ASSINAR" action="#{fichaHandler.assinarFichaIS}" rendered="#{!fichaHandler.fichaIsAssinada}" disabled="#{!usuarioHandler.medico}">
                                        <a4j:support reRender="adendosIS" event="oncomplete"/>
                                    </h:commandButton>
                                </h:panelGrid>
                            </div>

                            <div id="conteudoAssinado" align="center">
                                <a4j:outputPanel id="adendosIS" rendered="#{fichaHandler.fichaIsAssinada}">
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