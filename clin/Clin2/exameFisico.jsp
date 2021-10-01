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

            #opcaoFicha table tr td{                
                padding-right: 20px;
            }

            #opcaoFicha table td table td{
                padding: 0 0 0 0
            }


        </style>
        <script type="text/javascript" language="javascript">
            jQuery(document).ready(function () {
                jQuery.noConflict();
                jQuery("#Geral").addClass('visivel');
                jQuery("a").live('click', function() {
                    var id = jQuery(this).attr('name');
                    jQuery(".visivel").removeClass("visivel").toggleClass('dnone');
                    jQuery("#" + id).addClass('visivel').toggleClass('dnone');
                });
            });

            function calculaIMC(){
                var peso = jQuery(".peso").val();
                peso = peso.replace(',', '.');
                peso = peso*1;
                var altura = jQuery(".altura").val();
                altura = altura.replace(',', '.');
                altura = altura*1;                
                if (altura <= 0){
                    jQuery(".imc").attr('value', "");
                } else {
                    var imc = peso/(altura*altura)*1;
                    if (isNaN(imc)){
                        jQuery(".imc").attr('value', "");
                    }else{
                        imc = imc.toFixed(3);
                        imc = imc + "";
                        imc.replace('.', ',');
                        jQuery(".imc").attr('value', imc);
                    }
                }
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
                        <h:outputText styleClass="diretorio" value="#{fichaHandler.menuFichas.atendimento}"></h:outputText>
                        <h:graphicImage  value="/images/nav.gif" />
                        <h:outputText styleClass="diretorio" value="Exame Físico"></h:outputText>
                    </div>

                    <div align="right" id="salvoPor">
                        <h:panelGroup styleClass="salvoPor" rendered="#{!fichaHandler.fichaExameFisicoAssinada}">
                            <h:outputText value="Salvo por: " rendered="#{fichaHandler.fichaExameFisico.salvoPor != null}" />
                            <h:outputText value="#{fichaHandler.fichaExameFisico.salvoPor.nome}" rendered="#{fichaHandler.fichaExameFisico.salvoPor != null}" />
                            <h:outputText value="Ficha não Salva" rendered="#{fichaHandler.fichaExameFisico.salvoPor == null}" />
                        </h:panelGroup>
                    </div>

                     <jsp:include page="menuFichas1.jsp"></jsp:include>

                    <div id="panelConfirmacao" align="center" style="margin-top: 15px;">
                        <h:messages id="confirmacao" errorClass="erroConfirmacao" infoClass="sucessoConfirmacao" layout="table" showSummary="true" showDetail="false" globalOnly="true"></h:messages>
                    </div>

                    <h:form>
                        <a4j:jsFunction name="desmarcarGeral" reRender="panelGeral">
                            <a4j:actionparam name="param1" assignTo="#{fichaHandler.fichaExameFisico.peso}" value="0" />
                            <a4j:actionparam name="param2" assignTo="#{fichaHandler.fichaExameFisico.altura}" value="0" />
                            <a4j:actionparam name="param3" assignTo="#{fichaHandler.fichaExameFisico.ICM}" value="0" />
                            <a4j:actionparam name="param4" assignTo="#{fichaHandler.fichaExameFisico.PA}" value="0" />
                            <a4j:actionparam name="param5" assignTo="#{fichaHandler.fichaExameFisico.FC}" value="0" />
                            <a4j:actionparam name="param6" assignTo="#{fichaHandler.fichaExameFisico.FR}" value="0" />
                            <a4j:actionparam name="param7" assignTo="#{fichaHandler.fichaExameFisico.estadoGeral}" value="Não Avaliado" />
                            <a4j:actionparam name="param8" assignTo="#{fichaHandler.fichaExameFisico.temperatura}" value="0" />
                            <a4j:actionparam name="param9" assignTo="#{fichaHandler.fichaExameFisico.descricaoEdemas}" value="Não Avaliado" />
                            <a4j:actionparam name="param10" assignTo="#{fichaHandler.fichaExameFisico.localizacaoCirculacaoColateral}" value="Não Avaliado" />
                            <a4j:actionparam name="param11" assignTo="#{fichaHandler.fichaExameFisico.hipocorado}" value="false" />
                            <a4j:actionparam name="param12" assignTo="#{fichaHandler.fichaExameFisico.ictericia}" value="false" />
                            <a4j:actionparam name="param13" assignTo="#{fichaHandler.fichaExameFisico.cianose}" value="false" />
                            <a4j:actionparam name="param14" assignTo="#{fichaHandler.fichaExameFisico.circulacaoColateral}" value="false" />
                            <a4j:actionparam name="param15" assignTo="#{fichaHandler.fichaExameFisico.linfonodos}" value="false" />
                            <a4j:actionparam name="param16" assignTo="#{fichaHandler.fichaExameFisico. linfonodosCervical}" value="Não Avaliado" />
                            <a4j:actionparam name="param17" assignTo="#{fichaHandler.fichaExameFisico.linfonodosAxilar}" value="Não Avaliado" />
                            <a4j:actionparam name="param18" assignTo="#{fichaHandler.fichaExameFisico.linfonodosInguinal}" value="Não Avaliado" />

                            <a4j:actionparam name="param19" assignTo="#{fichaHandler.fichaExameFisico.outros}" value="Não Avaliado" />
                            <a4j:actionparam name="param20" assignTo="#{fichaHandler.fichaExameFisico.edemas}" value="false" />
                            <a4j:actionparam name="param21" assignTo="#{fichaHandler.fichaExameFisico.normocorado}" value="false" />


                        </a4j:jsFunction>


                        <a4j:jsFunction name="desmarcarACV" reRender="panelACV">
                            <a4j:actionparam name="param1" assignTo="#{fichaHandler.fichaExameFisico.abaulamentosACV}" value="Não Avaliado" />
                            <a4j:actionparam name="param2" assignTo="#{fichaHandler.fichaExameFisico.localizacaoIctusCordis}" value="Não Avaliado" />
                            <a4j:actionparam name="param3" assignTo="#{fichaHandler.fichaExameFisico.extensaoIctusCordis}" value="Não Avaliado" />
                            <a4j:actionparam name="param4" assignTo="#{fichaHandler.fichaExameFisico.intensidadeIctusCordis}" value="Não Avaliado" />

                            <a4j:actionparam name="param5" assignTo="#{fichaHandler.fichaExameFisico.pulsos}" value="false" />


                            <a4j:actionparam name="param7" assignTo="#{fichaHandler.fichaExameFisico.carotideo}" value="Não Avaliado" />
                            <a4j:actionparam name="param8" assignTo="#{fichaHandler.fichaExameFisico.braquial}" value="Não Avaliado" />
                            <a4j:actionparam name="param9" assignTo="#{fichaHandler.fichaExameFisico.femoral}" value="Não Avaliado" />
                            <a4j:actionparam name="param24" assignTo="#{fichaHandler.fichaExameFisico.radial}" value="Não Avaliado" />
                            <a4j:actionparam name="param10" assignTo="#{fichaHandler.fichaExameFisico.popliteo}" value="Não Avaliado" />
                            <a4j:actionparam name="param11" assignTo="#{fichaHandler.fichaExameFisico.pedioso}" value="Não Avaliado" />
                            <a4j:actionparam name="param12" assignTo="#{fichaHandler.fichaExameFisico.tibialPosterior}" value="Não Avaliado" />

                            <a4j:actionparam name="param13" assignTo="#{fichaHandler.fichaExameFisico.estaseJugular}" value="false" />
                            <a4j:actionparam name="param14" assignTo="#{fichaHandler.fichaExameFisico.refluxoHepatojugular}" value="false" />

                            <a4j:actionparam name="param15" assignTo="#{fichaHandler.fichaExameFisico.ritmoCardiaco}" value="Não Avaliado" />
                            <a4j:actionparam name="param16" assignTo="#{fichaHandler.fichaExameFisico. bulhas}" value="Não Avaliado" />

                            <a4j:actionparam name="param17" assignTo="#{fichaHandler.fichaExameFisico.sopros}" value="false" />

                            <a4j:actionparam name="param18" assignTo="#{fichaHandler.fichaExameFisico.descricaoSopros}" value="Não Avaliado" />
                            <a4j:actionparam name="param19" assignTo="#{fichaHandler.fichaExameFisico.descricaoAlteracaodeBulhas}" value="Não Avaliado" />

                            <a4j:actionparam name="param20" assignTo="#{fichaHandler.fichaExameFisico.cliquesEstalidos}" value="false" />

                            <a4j:actionparam name="param21" assignTo="#{fichaHandler.fichaExameFisico.descricaoCliquesEstalidos}" value="Não Avaliado" />
                            <a4j:actionparam name="param22" assignTo="#{fichaHandler.fichaExameFisico.outrosACV}" value="Não Avaliado" />
                            <a4j:actionparam name="param23" assignTo="#{fichaHandler.fichaExameFisico.observacaoACV}" value="Não Avaliado" />


                        </a4j:jsFunction>

                        <a4j:jsFunction name="desmarcarAR" reRender="panelAR">

                            <a4j:actionparam name="param1" assignTo="#{fichaHandler.fichaExameFisico.formaDoTorax}" value="Não Avaliado" />
                            <a4j:actionparam name="param2" assignTo="#{fichaHandler.fichaExameFisico.abaulamentosAR}" value="Não Avaliado" />
                            <a4j:actionparam name="param3" assignTo="#{fichaHandler.fichaExameFisico.depressoes}" value="Não Avaliado" />
                            <a4j:actionparam name="param4" assignTo="#{fichaHandler.fichaExameFisico.tipoRespiratorio}" value="Não Avaliado" />
                            <a4j:actionparam name="param5" assignTo="#{fichaHandler.fichaExameFisico.amplitudeDaRespiracao}" value="false" />
                            <a4j:actionparam name="param7" assignTo="#{fichaHandler.fichaExameFisico.expansibilidade}" value="Não Avaliado" />
                            <a4j:actionparam name="param8" assignTo="#{fichaHandler.fichaExameFisico.fremitoToracovocal}" value="Não Avaliado" />
                            <a4j:actionparam name="param9" assignTo="#{fichaHandler.fichaExameFisico.percussaoAR}" value="Não Avaliado" />
                            <a4j:actionparam name="param6" assignTo="#{fichaHandler.fichaExameFisico.sonsRespiratorios}" value="false" />
                            <a4j:actionparam name="param10" assignTo="#{fichaHandler.fichaExameFisico.murmurioVesicularPresente}" value="false" />
                            <a4j:actionparam name="param11" assignTo="#{fichaHandler.fichaExameFisico.sonsAnormaisDescontinuos}" value="false" />
                            <a4j:actionparam name="param12" assignTo="#{fichaHandler.fichaExameFisico.estertoresGrossos}" value="false" />
                            <a4j:actionparam name="param13" assignTo="#{fichaHandler.fichaExameFisico.localizacaoEstertoresGrossos}" value="Não Avaliado" />
                            <a4j:actionparam name="param14" assignTo="#{fichaHandler.fichaExameFisico.sonsAnormaisContinuos}" value="false" />
                            <a4j:actionparam name="param15" assignTo="#{fichaHandler.fichaExameFisico.roncos}" value="false" />
                            <a4j:actionparam name="param16" assignTo="#{fichaHandler.fichaExameFisico.sibilos}" value="false"/>
                            <a4j:actionparam name="param17" assignTo="#{fichaHandler.fichaExameFisico.estridor}" value="false" />
                            <a4j:actionparam name="param18" assignTo="#{fichaHandler.fichaExameFisico.localizacaoEstridor}" value="Não Avaliado" />
                            <a4j:actionparam name="param19" assignTo="#{fichaHandler.fichaExameFisico.atritoPleural}" value="false" />
                            <a4j:actionparam name="param20" assignTo="#{fichaHandler.fichaExameFisico.descricaoAtritoPleural}" value="Não Avaliado" />
                            <a4j:actionparam name="param21" assignTo="#{fichaHandler.fichaExameFisico.auscultaDaVozFalada}" value="Não Avaliado" />
                            <a4j:actionparam name="param22" assignTo="#{fichaHandler.fichaExameFisico.vozFalada}" value="false" />
                            <a4j:actionparam name="param23" assignTo="#{fichaHandler.fichaExameFisico.outrosAR}" value="Não Avaliado" />
                            <a4j:actionparam name="param24" assignTo="#{fichaHandler.fichaExameFisico.observacaoAR}" value="Não Avaliado" />

                        </a4j:jsFunction>

                        <a4j:jsFunction name="desmarcarAGI" reRender="panelAGI">

                            <a4j:actionparam name="param1" assignTo="#{fichaHandler.fichaExameFisico.formaVolume}" value="Não Avaliado" />
                            <a4j:actionparam name="param2" assignTo="#{fichaHandler.fichaExameFisico.cicatrizUmbilical}" value="Não Avaliado" />
                            <a4j:actionparam name="param3" assignTo="#{fichaHandler.fichaExameFisico.pulsacoesVisiveis}" value="false" />
                            <a4j:actionparam name="param4" assignTo="#{fichaHandler.fichaExameFisico.descricaoPulsasoesVisiveis}" value="Não Avaliado" />
                            <a4j:actionparam name="param5" assignTo="#{fichaHandler.fichaExameFisico.movimentosPeristalticos}" value="false" />
                            <a4j:actionparam name="param7" assignTo="#{fichaHandler.fichaExameFisico.descricaoMovimentosPeristalticos}" value="Não Avaliado" />
                            <a4j:actionparam name="param8" assignTo="#{fichaHandler.fichaExameFisico.ruidosHidroaerios}" value="Não Avaliado" />
                            <a4j:actionparam name="param9" assignTo="#{fichaHandler.fichaExameFisico.sensibilidade}" value="Não Avaliado" />
                            <a4j:actionparam name="param6" assignTo="#{fichaHandler.fichaExameFisico.resistenciaParedeAbdominal}" value="Não Avaliado" />
                            <a4j:actionparam name="param10" assignTo="#{fichaHandler.fichaExameFisico.diastasesHernias}" value="Não Avaliado" />
                            <a4j:actionparam name="param11" assignTo="#{fichaHandler.fichaExameFisico.pulsacoes}" value="Não Avaliado" />
                            <a4j:actionparam name="param12" assignTo="#{fichaHandler.fichaExameFisico.massaPalpavel}" value="false" />
                            <a4j:actionparam name="param13" assignTo="#{fichaHandler.fichaExameFisico.descricaoMassaPalpavel}" value="Não Avaliado" />
                            <a4j:actionparam name="param14" assignTo="#{fichaHandler.fichaExameFisico.palpacaoFigado}" value="false" />
                            <a4j:actionparam name="param15" assignTo="#{fichaHandler.fichaExameFisico.descricaoPalpacaoFigado}" value="Não Avaliado" />
                            <a4j:actionparam name="param16" assignTo="#{fichaHandler.fichaExameFisico.palpacaoVesiculaBiliar}" value="false"/>
                            <a4j:actionparam name="param17" assignTo="#{fichaHandler.fichaExameFisico.descricaoPalpacaoVesiculaBiliar}" value="Não Avaliado" />
                            <a4j:actionparam name="param18" assignTo="#{fichaHandler.fichaExameFisico.palpacaoBaco}" value="false" />
                            <a4j:actionparam name="param19" assignTo="#{fichaHandler.fichaExameFisico.descricaoPalpacaoBaco}" value="Não Avaliado" />
                            <a4j:actionparam name="param20" assignTo="#{fichaHandler.fichaExameFisico.palpacaoCeco}" value="false" />
                            <a4j:actionparam name="param21" assignTo="#{fichaHandler.fichaExameFisico.descricaoPalpacaoCeco}" value="Não Avaliado" />
                            <a4j:actionparam name="param22" assignTo="#{fichaHandler.fichaExameFisico.palpacaoColonTransverso}" value="false" />
                            <a4j:actionparam name="param23" assignTo="#{fichaHandler.fichaExameFisico.descricaoPalpacaoColonTransverso}" value="Não Avaliado" />
                            <a4j:actionparam name="param24" assignTo="#{fichaHandler.fichaExameFisico.palpacaoSigmoide}" value="false" />
                            <a4j:actionparam name="param25" assignTo="#{fichaHandler.fichaExameFisico.descricaoPalpacaoSigmoide}" value="Não Avaliado" />
                            <a4j:actionparam name="param26" assignTo="#{fichaHandler.fichaExameFisico.figado}" value="Não Avaliado" />
                            <a4j:actionparam name="param27" assignTo="#{fichaHandler.fichaExameFisico.ascite}" value="false" />
                            <a4j:actionparam name="param28" assignTo="#{fichaHandler.fichaExameFisico.pequenoVolume}" value="false" />
                            <a4j:actionparam name="param29" assignTo="#{fichaHandler.fichaExameFisico.medioVolume}" value="false" />
                            <a4j:actionparam name="param30" assignTo="#{fichaHandler.fichaExameFisico.grandeVolume}" value="false" />
                            <a4j:actionparam name="param31" assignTo="#{fichaHandler.fichaExameFisico.observacaoAGI}" value="Não Avaliado" />

                        </a4j:jsFunction>

                        <a4j:jsFunction name="desmarcarAGU" reRender="panelAGU">

                            <a4j:actionparam name="param1" assignTo="#{fichaHandler.fichaExameFisico.agu}" value="Não Avaliado" />

                        </a4j:jsFunction>

                        <a4j:jsFunction name="desmarcarAO" reRender="panelAO">

                            <a4j:actionparam name="param1" assignTo="#{fichaHandler.fichaExameFisico.aparelhoOsteoarticula}" value="Não Avaliado" />

                        </a4j:jsFunction>

                        <a4j:jsFunction name="desmarcarSN" reRender="panelSN">

                            <a4j:actionparam name="param1" assignTo="#{fichaHandler.fichaExameFisico.sistemaNervoso}" value="Não Avaliado" />
                            <a4j:actionparam name="param2" assignTo="#{fichaHandler.fichaExameFisico.avaliacaoDoNivelDeConsciencia}" value="0" />
                            <a4j:actionparam name="param3" assignTo="#{fichaHandler.fichaExameFisico.descricaoNivelDeConsciencia}" value="Não Avaliado" />

                        </a4j:jsFunction>



                        <div id="center_section">

                            <a4j:status onstart="#{rich:component('wait2')}.show()"
                                        onstop="#{rich:component('wait2')}.hide()" />
                            <rich:modalPanel id="wait2" autosized="true" width="200" height="80" top="305"
                                             moveable="false" resizeable="false">
                                <f:facet name="header">
                                    <h:outputText value="Carregando..."/>
                                </f:facet>
                                <h:graphicImage value="images/loadingAnimation.gif"/>
                            </rich:modalPanel>

                            
                                <div id="Geral">
                                    <h2>Geral</h2>
                                <rich:panel headerClass="cabecalho" styleClass="panelGeral">

                                    <h:panelGrid columns="2" styleClass="semqueixas">
                                        <h:selectBooleanCheckbox id="geral" value="#{fichaHandler.fichaExameFisico.naoAvaliadoGeral}"  disabled="#{fichaHandler.fichaExameFisicoAssinada}" onclick="desmarcarGeral()" >
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Não Avaliado"/>
                                    </h:panelGrid>

                                    <div id="opcaoFicha">
                                        <a4j:outputPanel ajaxRendered="true" id="panelGeral">
                                            <h:panelGrid columns="4" cellpadding="5" cellspacing="5">
                                                <h:panelGrid columns="4">
                                                    <h:outputText value="Peso:" style="width: 80px;"/>
                                                    <h:inputText converterMessage="Número inválido" onkeypress="troca(this)" styleClass="peso" onkeyup="calculaIMC()" id="peso" value="#{fichaHandler.fichaExameFisico.peso}" maxlength="7" size="5" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}">
                                                        <f:convertNumber type="number"/>
                                                    </h:inputText>
                                                    <h:outputText value="Kg"/>
                                                    <h:message for="peso" errorStyle="color:red; margin-lef:5px;"/>
                                                </h:panelGrid>
                                                <h:panelGrid columns="3">
                                                    <h:outputText value="Altura:"/> <h:inputText id="altura" converterMessage="Número inválido" styleClass="altura" onkeypress="troca(this)" onkeyup = "calculaIMC()" value="#{fichaHandler.fichaExameFisico.altura}" maxlength="7" size="5" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}">
                                                        <f:convertNumber type="number" />
                                                    </h:inputText>
                                                    <h:outputText value="m"/>
                                                    <h:message for="altura" errorStyle="color:red; margin-lef:5px;"/>
                                                </h:panelGrid>
                                                <h:panelGrid columns="3">
                                                    <h:outputText value="IMC:"/> <h:inputText id="icm" converterMessage="Número inválido" styleClass="imc" onkeypress="troca(this)" value="#{fichaHandler.fichaExameFisico.ICM}" maxlength="7" size="5" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}">
                                                        <f:convertNumber type="number"/>
                                                    </h:inputText>
                                                    <h:message for="icm" errorStyle="color:red; margin-lef:5px;"/>
                                                </h:panelGrid>
                                                <h:panelGrid columns="3">
                                                    <h:outputText value="PA:"/> <h:inputText id="pa" converterMessage="Número inválido" value="#{fichaHandler.fichaExameFisico.PA}" maxlength="10" size="8" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}">
                                                    </h:inputText>
                                                    <h:outputText value="mmHg"/>
                                                    <h:message for="pa" errorStyle="color:red; margin-lef:5px;"/>
                                                </h:panelGrid>



                                                <h:panelGrid columns="3">
                                                    <h:outputText value="FC:"/>  <h:inputText id="fc" converterMessage="Número inválido" onkeypress="troca(this)" value="#{fichaHandler.fichaExameFisico.FC}" maxlength="7" size="5" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}">
                                                        <f:convertNumber type="number"/>
                                                    </h:inputText>
                                                    <h:outputText value="bpm"/>
                                                    <h:message for="fc" errorStyle="color:red; margin-lef:5px;"/>
                                                </h:panelGrid>
                                                <h:panelGrid columns="3">
                                                    <h:outputText value="FR:"/>  <h:inputText id="fr" converterMessage="Número inválido" onkeypress="troca(this)" value="#{fichaHandler.fichaExameFisico.FR}" maxlength="7" size="5" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}">
                                                        <f:convertNumber type="number"/>
                                                    </h:inputText>
                                                    <h:outputText value="ipm"/>
                                                    <h:message for="fr" errorStyle="color:red; margin-lef:5px;"/>
                                                </h:panelGrid>
                                                <h:panelGrid columns="2">
                                                    <h:outputText value="Estado Geral:"/>
                                                    <h:selectOneMenu value="#{fichaHandler.fichaExameFisico.estadoGeral}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}">
                                                        <f:selectItem itemValue="Não Avaliado" itemLabel="Não Avaliado" />
                                                        <f:selectItem itemValue="Bom" itemLabel="Bom" />
                                                        <f:selectItem itemValue="Regular" itemLabel="Regular" />
                                                        <f:selectItem itemValue="Decaído" itemLabel="Decaído" />
                                                    </h:selectOneMenu>
                                                </h:panelGrid>
                                                <h:panelGrid columns="3">
                                                    <h:outputText value="Temperatura:"/>  <h:panelGrid columns="3">
                                                        <h:inputText id="temp" converterMessage="Número inválido" onkeypress="troca(this)" value="#{fichaHandler.fichaExameFisico.temperatura}" size="5" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}">
                                                            <f:convertNumber type="number"/>
                                                        </h:inputText> &deg; C
                                                        <h:message for="temp" errorStyle="color:red; margin-lef:5px;"/>
                                                    </h:panelGrid>
                                                </h:panelGrid>

                                            </h:panelGrid>

                                            <h3>Edema</h3>
                                            <div class="subopcao">
                                                <h:panelGrid columns="1">
                                                    <h:selectOneRadio value="#{fichaHandler.fichaExameFisico.edemas}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}">
                                                        <a4j:support reRender="panelGeral" event="onclick"/>

                                                        <f:selectItem id="semEdemas" itemLabel="Sem Edemas" itemValue="false" />
                                                        <f:selectItem id="comEdemas" itemLabel="Com Edemas" itemValue="true" />
                                                    </h:selectOneRadio>

                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.descricaoEdemas}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}" rendered="#{fichaHandler.fichaExameFisico.edemas ==true}"/>

                                                </h:panelGrid>
                                            </div>

                                            <h3>Coloração</h3>
                                            <div class="subopcao">
                                                <h:panelGrid columns="2">
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.normocorado}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}"/>Normocorado
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.hipocorado}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}"/>Hipocorado
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.ictericia}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}"/>Icterícia
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.cianose}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}"/>Cianose
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.circulacaoColateral}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}">
                                                        <a4j:support reRender="panelGeral" event="onclick"/>
                                                    </h:selectBooleanCheckbox>
                                                    <h:outputText value="Circulação Colateral"/>
                                                </h:panelGrid>
                                                <div class="subopcao">
                                                    <h:panelGroup id="subopcaoCirculacaoColateral" rendered="#{fichaHandler.fichaExameFisico.circulacaoColateral == true}">
                                                        <h:panelGrid columns="1">
                                                            <h:outputText value="Localização:"/><h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.localizacaoCirculacaoColateral}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}"/>
                                                        </h:panelGrid>
                                                        <div>
                                                        <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.linfonodos}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}">
                                                            <a4j:support reRender="panelGeral" event="onclick">
                                                            </a4j:support>
                                                        </h:selectBooleanCheckbox>Linfonodos:
                                                        
                                                        
                                                        <h:panelGroup id="subopcaoLinfonodos" rendered="#{fichaHandler.fichaExameFisico.linfonodos == true}">
                                                            <div class="subopcao" style="margin-top: 10px;">
                                                                <h:panelGrid columns="1">
                                                                    <h:outputText value="Cervical:"/>
                                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.linfonodosCervical}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}"/>
                                                                    <h:outputText value="Axilar:"/>
                                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.linfonodosAxilar}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}"/>
                                                                    <h:outputText value="Inguinal:"/>
                                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.linfonodosInguinal}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}"/>
                                                                </h:panelGrid>
                                                            </div>
                                                        </h:panelGroup>
                                                        </div>
                                                    </h:panelGroup>
                                                </div>
                                            </div>

                                            <h3> Outros: </h3>

                                            <div class="subopcao">
                                                <h:inputTextarea value="#{fichaHandler.fichaExameFisico.outros}" cols="80" rows="6" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoGeral}"></h:inputTextarea>
                                            </div>
                                        </a4j:outputPanel>
                                    </div>
                                </rich:panel>
                                </div>



                                <div id="ACV" class="dnone">
                                    <h2>ACV</h2>
                                <rich:panel headerClass="cabecalho" styleClass="panelGeral">
                                    <h:panelGrid columns="2" styleClass="semqueixas">
                                        <h:selectBooleanCheckbox id="acv" value="#{fichaHandler.fichaExameFisico.naoAvaliadoACV}"  disabled="#{fichaHandler.fichaExameFisicoAssinada}" onclick="desmarcarACV()"  >
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Não Avaliado"/>
                                    </h:panelGrid>

                                    <h2>Inspeção e Palpação</h2>
                                    <a4j:outputPanel ajaxRendered="true" id="panelACV">
                                        <div id="opcaoFicha">

                                            <h3>Abaulamentos</h3>
                                            <div class="subopcao">
                                                <h:inputTextarea value="#{fichaHandler.fichaExameFisico.abaulamentosACV}" id="taAbaulamentos" cols="80" rows="6" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}"></h:inputTextarea>
                                            </div>
                                            <br />
                                            <h3>Ictus Cordis</h3>
                                            <div class="subopcao">
                                                <h:panelGrid columns="1">
                                                    Localização:<h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.localizacaoIctusCordis}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}"/>
                                                    Extensão: <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.extensaoIctusCordis}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}"/>
                                                    Intensidade: <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.intensidadeIctusCordis}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}"/>
                                                </h:panelGrid>
                                            </div>
                                            <br />
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.pulsos}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}">
                                                    <a4j:support reRender="panelACV" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Pulsos:"/>
                                            </h:panelGrid>
                                            <div class="subopcao">
                                                <h:panelGrid columns="1" rendered="#{fichaHandler.fichaExameFisico.pulsos == true}">
                                                    <h:outputText value="Carotídeo:"/> <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.carotideo}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}"/>
                                                    <h:outputText value="Braquial:"/>  <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.braquial}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}"/>
                                                    <h:outputText value="Radial:"/>    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.radial}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}"/>
                                                    <h:outputText value="Femoral:"/>  <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.femoral}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}"/>
                                                    <h:outputText value="Poplíteo:"/> <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.popliteo}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}"/>
                                                    <h:outputText value="Pedioso:"/>  <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.pedioso}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}"/>
                                                    <h:outputText value="Tibial Posterior:"/>  <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.tibialPosterior}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}"/>
                                                </h:panelGrid>
                                            </div>
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.estaseJugular}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}"/>
                                                <h:outputText value="Estase jugular"/>
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.refluxoHepatojugular}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}"/>
                                                <h:outputText value="Refluxo hepatojugular"/>
                                            </h:panelGrid>

                                        </div>
                                        <br />

                                        <h2>Ausculta</h2>
                                        <div id="opcaoFicha">
                                            <h:panelGrid columns="1">
                                                <h:outputText value="Rítmo Cardíaco:"/><h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.ritmoCardiaco}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}"/>
                                                <h:outputText value="Bulhas:"/><h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.bulhas}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}"/>
                                            </h:panelGrid>

                                            <h3>Anormalidades:</h3>
                                            <div class="subopcao">
                                                <h:panelGrid columns="3">
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.sopros}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}" >
                                                        <a4j:support reRender="panelACV" event="onclick"/>
                                                    </h:selectBooleanCheckbox>
                                                    <h:outputText value="Sopros:"/>
                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.descricaoSopros}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}" rendered="#{fichaHandler.fichaExameFisico.sopros == true}"/>
                                                    <rich:spacer rendered="#{fichaHandler.fichaExameFisico.sopros == false}"/>

                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.alteracaodeBulhas}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}" >
                                                        <a4j:support reRender="panelACV" event="onclick"/>
                                                    </h:selectBooleanCheckbox>
                                                    <h:outputText value="Alterações de bulhas:"/>
                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.descricaoAlteracaodeBulhas}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}" rendered="#{fichaHandler.fichaExameFisico.alteracaodeBulhas == true}"/>
                                                    <rich:spacer rendered="#{fichaHandler.fichaExameFisico.alteracaodeBulhas == false}"/>

                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.cliquesEstalidos}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}" >
                                                        <a4j:support reRender="panelACV" event="onclick"/>
                                                    </h:selectBooleanCheckbox>
                                                    <h:outputText value="Cliques e Estalidos:"/>
                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.descricaoCliquesEstalidos}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}" rendered="#{fichaHandler.fichaExameFisico.cliquesEstalidos == true}"/>
                                                    <rich:spacer rendered="#{fichaHandler.fichaExameFisico.cliquesEstalidos == false}"/>

                                                </h:panelGrid>
                                            </div>
                                        </div>

                                        <br />

                                        <h2>Outros</h2>
                                        <div id="opcaoFicha">

                                            <h:inputTextarea value="#{fichaHandler.fichaExameFisico.outrosACV}" cols="80" rows="6" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}"></h:inputTextarea>

                                        </div>
                                        <br/>

                                        <h2>Observações</h2>
                                        <div id="opcaoFicha">
                                            <h:inputTextarea value="#{fichaHandler.fichaExameFisico.observacaoACV}" cols="80" rows="6" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoACV}"></h:inputTextarea>
                                        </div>
                                    </a4j:outputPanel>
                                </rich:panel>
                                </div>

                                <div id="AR" class="dnone">
                                    <h2>AR</h2>
                                <rich:panel headerClass="cabecalho" styleClass="panelGeral">
                                    <h:panelGrid columns="2" styleClass="semqueixas">
                                        <h:selectBooleanCheckbox id="ar" value="#{fichaHandler.fichaExameFisico.naoAvaliadoAR}"  disabled="#{fichaHandler.fichaExameFisicoAssinada}" onclick="desmarcarAR()" >
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Não Avaliado"/>
                                    </h:panelGrid>

                                    <a4j:outputPanel ajaxRendered="true" id="panelAR">
                                        <h2> Inspeção</h2>
                                        <div id="opcaoFicha">
                                            <h:panelGrid columns="1">
                                                <h:outputText value="Forma do Tórax:"/>   <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.formaDoTorax}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}"/>
                                                <h:outputText value="Abaulamentos:"/>   <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.abaulamentosAR}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}"/>
                                                <h:outputText value="Depressões:"/>   <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.depressoes}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}"/>
                                                <h:outputText value="Tipo Respiratório:"/>  <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.tipoRespiratorio}" disabled="#{fichaHandler.fichaExameFisicoAssinada  || fichaHandler.fichaExameFisico.naoAvaliadoAR}"/>
                                                <h:outputText value="Amplitude da Respiração:"/>  <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.amplitudeDaRespiracao}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}"/>
                                            </h:panelGrid>
                                        </div>

                                        <h2>Palpação</h2>
                                        <div id="opcaoFicha">
                                            <h:panelGrid columns="1">
                                                <h:outputText value="Expansibilidade:"/><h:inputTextarea value="#{fichaHandler.fichaExameFisico.expansibilidade}" id="taExpansibilidade" cols="80" rows="6" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}"></h:inputTextarea>
                                                <h:outputText value="Frêmito toracovocal:"/><h:inputTextarea value="#{fichaHandler.fichaExameFisico.fremitoToracovocal}" id="taFremitoToracovocal" cols="80" rows="6" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}"></h:inputTextarea>
                                            </h:panelGrid>
                                        </div>

                                        <h2>Percussão</h2>
                                        <div id="opcaoFicha">
                                            <h:inputTextarea value="#{fichaHandler.fichaExameFisico.percussaoAR}" id="taAROutros" cols="80" rows="6" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}"></h:inputTextarea>
                                        </div>

                                        <h2>Ausculta</h2>

                                        <div id="opcaoFicha">
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.sonsRespiratorios}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}">
                                                    <a4j:support reRender="panelAR" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Sons Respiratórios:"/>
                                            </h:panelGrid> 
                                            <div class="subopcao">
                                                <h:panelGroup rendered="#{fichaHandler.fichaExameFisico.sonsRespiratorios == true}">
                                                    <h:outputText value="Murmúrio Vesicular:"/>
                                                    <h:selectOneRadio value="#{fichaHandler.fichaExameFisico.murmurioVesicularPresente}">
                                                        <a4j:support reRender="panelAR" event="onclick"/>
                                                        <f:selectItem id="rgMurmurioVesicularPresente" itemLabel="Presente" itemValue="true" />
                                                        <f:selectItem id="rgMurmurioVesicularAusente" itemLabel="Ausente" itemValue="false" />
                                                    </h:selectOneRadio>
                                                    <div class="subopcao">
                                                        <h:panelGrid columns="1">
                                                            <h:outputText value="Localização:"  rendered="#{fichaHandler.fichaExameFisico.murmurioVesicularPresente == true}"/>
                                                            <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.localizacaoMurmurioVesicular}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}" rendered="#{fichaHandler.fichaExameFisico.murmurioVesicularPresente == true}"/>
                                                        </h:panelGrid>
                                                    </div>
                                                </h:panelGroup>

                                            </div>
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.sonsAnormaisDescontinuos}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}">
                                                    <a4j:support reRender="panelAR" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Sons Anormais Descontínuos:"/>
                                            </h:panelGrid>
                                            <div class="subopcao">
                                                <h:panelGroup rendered="#{fichaHandler.fichaExameFisico.sonsAnormaisDescontinuos == true}">
                                                    <h:selectOneRadio value="#{fichaHandler.fichaExameFisico.estertoresGrossos}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}">
                                                        <f:selectItem id="EstertoresFinos" itemLabel="Estertores Finos" itemValue="false"   />
                                                        <f:selectItem id="EstertoresGrossos" itemLabel="Estertores Grossos" itemValue="true" />
                                                    </h:selectOneRadio>
                                                    <div class="subopcao">
                                                        <h:panelGrid columns="1">
                                                            <h:outputText value="Localização:"/>
                                                            <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.localizacaoEstertoresGrossos}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}"/>
                                                        </h:panelGrid>
                                                    </div>
                                                </h:panelGroup>
                                            </div>
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.sonsAnormaisContinuos}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}">
                                                    <a4j:support reRender="panelAR" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Sons Anormais Contínuos:"/>
                                            </h:panelGrid>
                                            <div class="subopcao">
                                                <h:panelGroup rendered="#{fichaHandler.fichaExameFisico.sonsAnormaisContinuos == true}">
                                                    <h:panelGrid columns="2">
                                                        <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.roncos}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}"/>
                                                        <h:outputText value="Roncos"/>
                                                        <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.sibilos}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}"/>
                                                        <h:outputText value="Sibilos"/>
                                                        <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.estridor}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}"/>
                                                        <h:outputText value="Estridor"/>
                                                    </h:panelGrid>
                                                    <div class="subopcao">
                                                        <h:panelGrid columns="1">
                                                            <h:outputText value="Localização:"/><h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.localizacaoEstridor}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}"/>
                                                        </h:panelGrid>
                                                    </div>
                                                </h:panelGroup>
                                            </div>
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.atritoPleural}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}">
                                                    <a4j:support reRender="panelAR" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Atrito Pleural:"/>
                                            </h:panelGrid>
                                            <h:panelGrid columns="1">
                                                <h:inputTextarea value="#{fichaHandler.fichaExameFisico.descricaoAtritoPleural}" cols="80" rows="5" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}"  rendered="#{fichaHandler.fichaExameFisico.atritoPleural == true}"/>
                                            </h:panelGrid>


                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.vozFalada}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}">
                                                    <a4j:support reRender="panelAR" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Auscuta da voz falada:"/>
                                            </h:panelGrid>
                                            <h:panelGrid columns="1">
                                                <h:selectOneMenu value="#{fichaHandler.fichaExameFisico.auscultaDaVozFalada}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}" rendered="#{fichaHandler.fichaExameFisico.vozFalada == true}">
                                                    <f:selectItem itemValue="Broncofonia" itemLabel="Broncofonia" />
                                                    <f:selectItem itemValue="Egofonia" itemLabel="Egofonia" />
                                                    <f:selectItem itemValue="Pecterilóquia Fônica" itemLabel="Pecterilóquia Fônica" />
                                                    <f:selectItem itemValue="Pecterilóquia Afônica" itemLabel="Pecterilóquia Afônica" />
                                                </h:selectOneMenu>
                                            </h:panelGrid>
                                        </div>

                                        <h2>Outros</h2>
                                        <div id="opcaoFicha">
                                            <h:inputTextarea value="#{fichaHandler.fichaExameFisico.outrosAR}" cols="80" rows="5" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}"></h:inputTextarea>
                                        </div>

                                        <h2>Observações</h2>
                                        <div id="opcaoFicha">
                                            <h:inputTextarea value="#{fichaHandler.fichaExameFisico.observacaoAR}" cols="80" rows="5" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAR}"></h:inputTextarea>
                                        </div>

                                    </a4j:outputPanel>
                                </rich:panel>
                                </div>

                                <div id="AGI" class="dnone">
                                    <h2>AGI</h2>
                                <rich:panel headerClass="cabecalho" styleClass="panelGeral">
                                    <h:panelGrid columns="2" styleClass="semqueixas">
                                        <h:selectBooleanCheckbox id="agi" value="#{fichaHandler.fichaExameFisico.naoAvaliadoAGI}"  disabled="#{fichaHandler.fichaExameFisicoAssinada}" onclick="desmarcarAGI()" >
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Não Avaliado"/>
                                    </h:panelGrid>

                                    <a4j:outputPanel ajaxRendered="true" id="panelAGI">
                                        <h2>Inspeção</h2>
                                        <div id="opcaoFicha">
                                            <h:panelGrid columns="1">
                                                <h:outputText value="Forma e Volume"/> <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.formaVolume}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}"/>
                                                <h:outputText value="Cicatriz Umbilical:"/><h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.cicatrizUmbilical}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}"/>
                                            </h:panelGrid>
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.pulsacoesVisiveis}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}">
                                                    <a4j:support reRender="panelAGI" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Pulsações Visíveis:"/>
                                            </h:panelGrid>
                                            <h:panelGrid columns="1" rendered="#{fichaHandler.fichaExameFisico.pulsacoesVisiveis == true}">
                                                <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.descricaoPulsasoesVisiveis}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}"/>
                                            </h:panelGrid>

                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.movimentosPeristalticos}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}">
                                                    <a4j:support reRender="panelAGI" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Movimentos Peristalticos Visíveis:"/>
                                            </h:panelGrid>
                                            <h:panelGrid columns="1" rendered="#{fichaHandler.fichaExameFisico.movimentosPeristalticos == true}">
                                                <h:inputTextarea cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.descricaoMovimentosPeristalticos}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}"/>
                                            </h:panelGrid>
                                        </div>
                                        <h2>Ausculta</h2>
                                        <div id="opcaoFicha">
                                            <h:panelGrid columns="1">
                                                <h:outputText value="Ruídos hidroaérios:"/> <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.ruidosHidroaerios}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}"/>
                                            </h:panelGrid>
                                        </div>
                                        <h2>Palpação</h2>

                                        <div id="opcaoFicha">


                                            <h3>Superficial:</h3>
                                            <div class="subopcao">
                                                <h:panelGrid columns="1">
                                                    <h:outputText value="Sensibilidade:"/> <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.sensibilidade}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}"/>
                                                    <h:outputText value="Resistência da parede abdominal:"/> <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.resistenciaParedeAbdominal}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}"/>
                                                    <h:outputText value="Diástases ou Hérnias:"/> <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.diastasesHernias}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}"/>
                                                    <h:outputText value="Pulsações:"/> <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.pulsacoes}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}"/>
                                                </h:panelGrid>
                                            </div>



                                            <h3> Profunda:</h3>
                                            <div class="subopcao">
                                                <h:panelGrid columns="2">
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.massaPalpavel}"  disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}">
                                                        <a4j:support reRender="panelAGI" event="onclick"/>
                                                    </h:selectBooleanCheckbox>
                                                    <h:outputText value="Massa Palpável:"/>
                                                </h:panelGrid>
                                                <h:panelGrid columns="1" rendered="#{fichaHandler.fichaExameFisico.massaPalpavel == true}">
                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.descricaoMassaPalpavel}"  disabled="#{fichaHandler.fichaExameFisicoAssinada  || fichaHandler.fichaExameFisico.naoAvaliadoAGI}" />
                                                </h:panelGrid>
                                                <h:panelGrid columns="2">
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.palpacaoFigado}"  disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}" >
                                                        <a4j:support reRender="panelAGI" event="onclick"/>
                                                    </h:selectBooleanCheckbox>
                                                    <h:outputText value="Palpação do Fígado:"/>
                                                </h:panelGrid>
                                                <h:panelGrid columns="1" rendered="#{fichaHandler.fichaExameFisico.palpacaoFigado == true}">
                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.descricaoPalpacaoFigado}"  disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}" />
                                                </h:panelGrid>
                                                <h:panelGrid columns="2">
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.palpacaoVesiculaBiliar}"  disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}" >
                                                        <a4j:support reRender="panelAGI" event="onclick"/>
                                                    </h:selectBooleanCheckbox>
                                                    <h:outputText value="Palpação da Vesícula Biliar:"/>
                                                </h:panelGrid>
                                                <h:panelGrid columns="1" rendered="#{fichaHandler.fichaExameFisico.palpacaoVesiculaBiliar == true}">
                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.descricaoPalpacaoVesiculaBiliar}"  disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}" />
                                                </h:panelGrid>
                                                <h:panelGrid columns="2">
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.palpacaoBaco}"  disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}" >
                                                        <a4j:support reRender="panelAGI" event="onclick"/>
                                                    </h:selectBooleanCheckbox>
                                                    <h:outputText value="Palpação do Baço:"/>
                                                </h:panelGrid>
                                                <h:panelGrid columns="1" rendered="#{fichaHandler.fichaExameFisico.palpacaoBaco == true}">
                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.descricaoPalpacaoBaco}"  disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}" />
                                                </h:panelGrid>
                                                <h:panelGrid columns="2">
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.palpacaoCeco}"  disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}" >
                                                        <a4j:support reRender="panelAGI" event="onclick"/>
                                                    </h:selectBooleanCheckbox>
                                                    <h:outputText value="Palpação do Ceco:"/>
                                                </h:panelGrid>
                                                <h:panelGrid columns="1"  rendered="#{fichaHandler.fichaExameFisico.palpacaoCeco == true}">
                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.descricaoPalpacaoCeco}"  disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}" />
                                                </h:panelGrid>
                                                <h:panelGrid columns="2">
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.palpacaoColonTransverso}"  disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}" >
                                                        <a4j:support reRender="panelAGI" event="onclick"/>
                                                    </h:selectBooleanCheckbox>
                                                    <h:outputText value="Palpação do Cólon Transverso:"/>
                                                </h:panelGrid>
                                                <h:panelGrid columns="1" rendered="#{fichaHandler.fichaExameFisico.palpacaoColonTransverso == true}">
                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.descricaoPalpacaoColonTransverso}"  disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}" />
                                                </h:panelGrid>
                                                <h:panelGrid columns="2">
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.palpacaoSigmoide}"  disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}" >
                                                        <a4j:support reRender="panelAGI" event="onclick"/>
                                                    </h:selectBooleanCheckbox>
                                                    <h:outputText value="Palpação do Sigmóide:"/>
                                                </h:panelGrid>
                                                <h:panelGrid columns="1" rendered="#{fichaHandler.fichaExameFisico.palpacaoSigmoide == true}">
                                                    <h:inputTextarea onkeyup="limitaTamanho(this,100)"  cols="50" rows="2" value="#{fichaHandler.fichaExameFisico.descricaoPalpacaoSigmoide}"  disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}" />
                                                </h:panelGrid>
                                            </div>

                                        </div>

                                        <h2> Percusão</h2>

                                        <div id="opcaoFicha">
                                            <h3>Fígado:</h3>

                                            <div class="subopcao">
                                                <h:inputTextarea value="#{fichaHandler.fichaExameFisico.figado}" cols="80" rows="5" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}"></h:inputTextarea>
                                            </div>
                                            <h:panelGrid columns="2">
                                                <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.ascite}"  disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}">
                                                    <a4j:support reRender="panelAGI" event="onclick"/>
                                                </h:selectBooleanCheckbox>
                                                <h:outputText value="Ascite:"/>
                                            </h:panelGrid>
                                            <div class="subopcao">
                                                <h:panelGrid columns="2" rendered="#{fichaHandler.fichaExameFisico.ascite == true}">
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.pequenoVolume}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}" />
                                                    <h:outputText value="Pequeno Volume"/>
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.medioVolume}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}" />
                                                    <h:outputText value=" Médio Volume"/>
                                                    <h:selectBooleanCheckbox value="#{fichaHandler.fichaExameFisico.grandeVolume}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}" />
                                                    <h:outputText value="Grande Volume"/>
                                                </h:panelGrid>
                                            </div>
                                        </div>

                                        <h2>Observação:</h2>
                                        <div id="opcaoFicha">
                                            <h:inputTextarea value="#{fichaHandler.fichaExameFisico.observacaoAGI}" cols="80" rows="5" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGI}"></h:inputTextarea></div>
                                        </a4j:outputPanel>
                                    </rich:panel>
                                </div>

                                <div id="AGU" class="dnone">
                                    <h2>AGU</h2>
                                <rich:panel headerClass="cabecalho" styleClass="panelGeral">

                                    <h:panelGrid columns="2" styleClass="semqueixas">
                                        <h:selectBooleanCheckbox id="AGU" value="#{fichaHandler.fichaExameFisico.naoAvaliadoAGU}"  disabled="#{fichaHandler.fichaExameFisicoAssinada}" onclick="desmarcarAGU()" >
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Não Avaliado"/>
                                    </h:panelGrid>

                                    <a4j:outputPanel  ajaxRendered="true" id="panelAGU">
                                        <div id="opcaoFicha">
                                            <h:inputTextarea value="#{fichaHandler.fichaExameFisico.agu}" cols="80" rows="5" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAGU}"></h:inputTextarea>
                                        </div>
                                    </a4j:outputPanel>
                                </rich:panel>
                                </div>

                                <div id="Aparelho_Osteoarticular" class="dnone">
                                    <h2>Aparelho Osteoarticular</h2>
                                <rich:panel headerClass="cabecalho" styleClass="panelGeral">

                                    <h:panelGrid columns="2" styleClass="semqueixas">
                                        <h:selectBooleanCheckbox id="AO" value="#{fichaHandler.fichaExameFisico.naoAvaliadoAO}"  disabled="#{fichaHandler.fichaExameFisicoAssinada}" onclick="desmarcarAO()" >
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Não Avaliado"/>
                                    </h:panelGrid>

                                    <a4j:outputPanel  ajaxRendered="true" id="panelAO">
                                        <div id="opcaoFicha">

                                            <h:inputTextarea value="#{fichaHandler.fichaExameFisico.aparelhoOsteoarticula}" cols="80" rows="5" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoAO}"></h:inputTextarea>

                                        </div>
                                    </a4j:outputPanel>
                                </rich:panel>
                                </div>

                                <div id="Sistema_Nervoso" class="dnone">
                                    <h2>Sistema Nervoso</h2>
                                <rich:panel headerClass="cabecalho" styleClass="panelGeral">

                                    <h:panelGrid columns="2" styleClass="semqueixas">
                                        <h:selectBooleanCheckbox id="SN" value="#{fichaHandler.fichaExameFisico.naoAvaliadoSN}"  disabled="#{fichaHandler.fichaExameFisicoAssinada}" onclick="desmarcarSN()" >
                                        </h:selectBooleanCheckbox>
                                        <h:outputText value="Não Avaliado"/>
                                    </h:panelGrid>

                                    <a4j:outputPanel  ajaxRendered="true" id="panelSN">
                                        <div id="opcaoFicha">

                                            <h:inputTextarea value="#{fichaHandler.fichaExameFisico.sistemaNervoso}" cols="80" rows="5" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoSN}"></h:inputTextarea>

                                        </div>


                                        <h2>Avaliação do nível de Consciência:</h2>
                                        <div id="opcaoFicha">

                                            ESCALA DE COMA DE GLASGOW:
                                            <h:inputText maxlength="2" styleClass="campoPequeno" value="#{fichaHandler.fichaExameFisico.avaliacaoDoNivelDeConsciencia}" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoSN}"/>
                                            <br /><br />

                                            <table border="1" id="tabela" class="texthidden">
                                                <tr>
                                                    <td colspan="2">VARIÁVEIS</td>
                                                    <td>ESCORE</td>
                                                </tr>

                                                <tr>
                                                    <td width="130">Abertura Ocular</td>
                                                    <td width="130">
                                                        Espontânea <br />
					À voz <br />
					À dor <br />
                                                        Nenhuma
                                                    </td>
                                                    <td width="130">
                                                        4 <br />
					3 <br />
					2 <br />
                                                        1
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td width="130">Resposta Verbal</td>
                                                    <td width="180">
                                                        Orientada <br />
					Confusa <br />
					Palavras inapropriadas <br />
					Palavras incompreensivas <br />
					Nenhuma <br />

                                                    </td>
                                                    <td width="80">
                                                        5<br />
                                                        4 <br />
					3 <br />
					2 <br />
                                                        1
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td width="130">Resposta Motora</td>
                                                    <td width="130">
                                                        Obedece comandos <br />
					Localiza dor <br />
					Movimento de retirada<br />
					Flexão anormal <br />
					Extensão anormal <br />
					Nenhuma <br />
                                                    </td>
                                                    <td width="130">
                                                        6<br />
                                                        5<br />
                                                        4 <br />
					3 <br />
					2 <br />
                                                        1
                                                    </td>
                                                </tr>

                                            </table>
                                            <br />
                                            <h:inputTextarea value="#{fichaHandler.fichaExameFisico.descricaoNivelDeConsciencia}" cols="80" rows="5" disabled="#{fichaHandler.fichaExameFisicoAssinada || fichaHandler.fichaExameFisico.naoAvaliadoSN}"></h:inputTextarea>
                                            <br /><br /><br />

                                        </div>
                                    </a4j:outputPanel>
                                </rich:panel>
                                </div>

                            <div align="center" style="margin-top:50px">
                                <h:panelGrid columns="3">
                                    <h:commandButton styleClass="bt_cancel" style="margin-right: 10px;" value="CANCELAR" action="atendimentos" rendered="#{!fichaHandler.fichaExameFisicoAssinada}" ></h:commandButton>
                                    <h:commandButton styleClass="bt_save" style="margin-right: 10px;" value="SALVAR" action="#{fichaHandler.salvarFichaExameFisico}" rendered="#{!fichaHandler.fichaExameFisicoAssinada}"></h:commandButton>
                                    <h:commandButton styleClass="botaoBuscar" value="ASSINAR" action="#{fichaHandler.assinarFichaExameFisico}" rendered="#{!fichaHandler.fichaExameFisicoAssinada}" disabled="#{!usuarioHandler.medico}">
                                        <a4j:support reRender="adendosExameFisico" event="oncomplete"/>
                                    </h:commandButton>
                                </h:panelGrid>
                            </div>

                        
                            <div id="conteudoAssinado">
                                <a4j:outputPanel id="adendosExameFisico" rendered="#{fichaHandler.fichaExameFisicoAssinada}">
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
