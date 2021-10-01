<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">        
        <title>Insert title here</title>
        <!--<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>-->
        <!--<link rel="stylesheet" href="jquery/thickbox.css" type="text/css" media="screen" />
        <script type="text/javascript" src="jquery/jquery-latest.js"></script>
        <script type="text/javascript" src="jquery/thickbox.js"></script>-->        
        <script type="text/javascript">            
            jQuery(document).ready(function(){
                jQuery.noConflict();
                jQuery("a.visited").parent().find('ul').toggleClass('dnone');                
            });
        </script>
        <script type="text/javascript">
                agente=navigator.userAgent.toLowerCase();
                ehExplorer=agente.indexOf('msie')!=-1?1:0;
                ehOpera=agente.indexOf('opera')==-1?0:1;

                function abrir(){
                    LeftPosition = (screen.width) ? (screen.width-900)/2 : 0;
                    TopPosition = (screen.height) ? (screen.height-600)/2 : 0;
                    //  alert("AKIII");
                    if(ehExplorer==1 && ehOpera==0) {
                        // alert("Eh EXPlorere");
                        window.open('atendimentosAnteriores.jsf','Atendimentos Anteriores','status=no;scroll=yes;dialogWidth=' + 900 + 'px;dialogHeight=' + 600 + 'px;help=no');
                    }else{
                        window.open ('atendimentosAnteriores.jsf', 'Atendimentos Anteriores', 'status=no,menubar=no,scrollbars=yes,height=600,width=900,left='+LeftPosition + ',top='+TopPosition);
                        // alert("Nao EH EXPlorere");
                    }
                    return true;
                }



                function OpenSubWin( page, w, h, sb )
                {  var sw = screen.width, sh = screen.height;
                    var ulx = ((sw-w)/2), uly = ((sh-h)/2);
                    var sbt = (sb==1) ? 'yes' : 'no';

                    var paramz = 'toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars='+sbt+',width='+w+',height='+h+'';
                    var oSubWin = window.open( "", "SubWin", paramz );

                    oSubWin.moveTo( ulx, uly );
                    oSubWin.location.replace( page );
                }
        </script>
        <script type="text/javascript">
            function initializeLinks()
            {
                if(!document.getElementById || !document.createTextNode){return;}
                var as = document.getElementsByTagName('a');
                var submnClass = 'submn';
                var a, parentA, ul;
                agente=navigator.userAgent.toLowerCase();
                ehExplorer=agente.indexOf('msie')!=-1?1:0;
                ehOpera=agente.indexOf('opera')==-1?0:1;
                for(var i = 0; i < as.length; i++)
                {
                    a = as[i].className;
                    if (a && a.toString().indexOf(submnClass) != -1)
                    {
                        as[i].onclick = function()
                        {
                            parentA = this.parentNode;
                            if (ehExplorer == 1 && ehOpera == 0)
                                ul = parentA.childNodes[2];
                            else
                                ul = parentA.childNodes[3];
                            ul.className = ul.className == 'dnone' ? '' : 'dnone';
                        }
                    }
                }
            }
            window.onload = initializeLinks;
        </script>
    </head>
    <body>
        <f:subview id="menuFichas">
            <h:form>

                <div id="ColLatNav">
                    <ul>
                        <li>
                            <h:commandLink immediate="true" styleClass="#{fichaHandler.menuFichas.menuQPD}" id="qpd" action="#{fichaHandler.mostrarFicha}" value="Queixa principal">
                                <f:setPropertyActionListener target="#{fichaHandler.fichaAtual}" value="QPD"/>
                            </h:commandLink>
                        </li>
                        <li>
                            <h:commandLink immediate="true" styleClass="#{fichaHandler.menuFichas.menuHDA}" id="hda" action="#{fichaHandler.mostrarFicha}" value="Histórico da doença atual">
                                <f:setPropertyActionListener target="#{fichaHandler.fichaAtual}" value="HDA"/>
                            </h:commandLink>
                        </li>
                        <li>
                            <h:commandLink immediate="true" styleClass="#{fichaHandler.menuFichas.menuIS}" id="is" action="#{fichaHandler.mostrarFicha}" value="Int. sintomatológico">
                                <f:setPropertyActionListener target="#{fichaHandler.fichaAtual}" value="IS"/>
                            </h:commandLink>
                            <ul class="dnone">
                                <li>
                                    <%--<a4j:commandLink id="geral" value="Geral"></a4j:commandLink>--%>
                                    <a name="GeralIs" href="javascript:;">Geral</a>
                                </li>
                                <li>
                                    <!--<a4j:commandLink id="pelos_faneros" value="Pêlos e Fâneros" onclick="toggleGeral()"></a4j:commandLink>-->
                                    <a name="Pelos_Faneros" href="javascript:;">Pêlos e Fâneros</a>
                                </li>
                                <li>
                                    <!--<a4j:commandLink id="cabeca_pescoco" value="Cabeça e Pescoço"></a4j:commandLink>-->
                                    <a name="Cabeca_Pescoco" href="javascript:;">Cabeça e Pescoço</a>
                                </li>
                                <li>
                                    <!--<a4j:commandLink id="ar" value="AR"></a4j:commandLink>-->
                                    <a name="AR" href="javascript:;">AR</a>
                                </li>
                                <li>
                                    <!--<a4j:commandLink id="acv" value="ACV"></a4j:commandLink>-->
                                    <a name="ACV" href="javascript:;">ACV</a>
                                </li>
                                <li>
                                    <!--<a4j:commandLink id="agi" value="AGI"></a4j:commandLink>-->
                                    <a name="AGI" href="javascript:;">AGI</a>
                                </li>
                                <li>
                                    <!--<a4j:commandLink id="agu" value="AGU"></a4j:commandLink>-->
                                    <a name="AGU" href="javascript:;">AGU</a>
                                </li>
                                <li>
                                    <!--<a4j:commandLink id="ame" value="AME"></a4j:commandLink>-->
                                    <a name="AME" href="javascript:;">AME</a>
                                </li>
                                <li>
                                    <!--<a4j:commandLink id="sn" value="SN"></a4j:commandLink>-->
                                    <a name="SN" href="javascript:;">SN</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <h:commandLink immediate="true" styleClass="#{fichaHandler.menuFichas.menuAntecedentes}" id="antecedentes" action="#{fichaHandler.mostrarFicha}" value="Antecedentes" >
                                <f:setPropertyActionListener target="#{fichaHandler.fichaAtual}" value="antecedentes"/>
                            </h:commandLink>
                            <ul class="dnone">
                                <li>                                    
                                    <a name="PessoalIs" href="javascript:;">Pessoal</a>
                                </li>
                                <li>                                    
                                    <a name="HabitosIs" href="javascript:;">Hábitos de Vida</a>
                                </li>
                                <li>                                    
                                    <a name="VacinacaoIs" href="javascript:;">Vacinação</a>
                                </li>
                                <li>                                    
                                    <a name="SociaisIs" href="javascript:;">Sociais(Epidemiologia)</a>
                                </li>
                                <li>                                    
                                    <a name="MedicacaoIs" href="javascript:;">Medicações em Uso</a>
                                </li>
                                <li>                                    
                                    <a name="FamiliaresIs" href="javascript:;">Familiares</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <h:commandLink immediate="true" styleClass="#{fichaHandler.menuFichas.menuExameFisico}" id="exameFisico" action="#{fichaHandler.mostrarFicha}" value="Exame físico" >
                                <f:setPropertyActionListener target="#{fichaHandler.fichaAtual}" value="exameFisico"/>
                            </h:commandLink>
                            <ul class="dnone">
                                <li>
                                    <a name="Geral" href="javascript:;">Geral</a>
                                </li>
                                <li>
                                    <a name="ACV" href="javascript:;">ACV</a>
                                </li>
                                <li>
                                    <a name="AR" href="javascript:;">AR</a>
                                </li>
                                <li>
                                    <a name="AGI" href="javascript:;">AGI</a>
                                </li>
                                <li>
                                    <a name="AGU" href="javascript:;">AGU</a>
                                </li>
                                <li>
                                    <a name="Aparelho_Osteoarticular" href="javascript:;">Aparelho Osteoarticular</a>
                                </li>
                                <li>
                                    <a name="Sistema_Nervoso" href="javascript:;">Sistema Nervoso</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <h:commandLink immediate="true" styleClass="#{exameHandler.menuFichas.menuExames}" id="exames" action="#{exameHandler.mostrarFicha}" value="Exames" >
                                <f:setPropertyActionListener target="#{fichaHandler.fichaAtual}" value="exames"/>
                                <f:setPropertyActionListener target="#{exameHandler.atendimentoAtual}" value="#{fichaHandler.atendimentoAtual}"/>
                            </h:commandLink>
                        </li>
                        <li>
                            <h:commandLink immediate="true" styleClass="#{fichaHandler.menuFichas.menuPromblemasECondutas}" id="problemasEcondutas" action="#{fichaHandler.mostrarFicha}" value="Problemas/Condutas" >
                                <f:setPropertyActionListener target="#{fichaHandler.fichaAtual}" value="problemasCondutas"/>
                            </h:commandLink>
                        </li>
                        <!--<div id="menuAnt" style="margin-top:10px; margin-left:2px; font-size:10px;">-->
                        <!--<ul>-->
                            <li>
                                <a4j:commandLink  immediate="true" ajaxSingle="true" value="Atendimentos anteriores"  oncomplete="javascript:OpenSubWin('atendimentosAnteriores.jsf','900','600','0')" action="#{atendimentoAteriorHandler.carregarAtendimentoAnterior}" rendered="#{!empty atendimentoHandler.listaAtendimentos}">
                                </a4j:commandLink>

                                <a4j:commandLink  immediate="true" ajaxSingle="true" value="Atendimentos anteriores"  onclick="javascript:alert('Não há Atendimentos Anteriores para este Paciente.')" rendered="#{empty atendimentoHandler.listaAtendimentos}">
                                </a4j:commandLink>


                            </li>
                        <!--</ul>-->

                        <!--</div>-->

                        <li>
                            <a class="submn" href="javascript:;">Novo atendimento</a>
                            <ul class="dnone">
                                <li>                                    
                                    <h:commandLink  value="Completo" actionListener="#{fichaHandler.criarNovoAtendimentoCompleto}" action="#{atendimentoHandler.criarAtendimentoCompleto}">
                                            <f:attribute name="paciente" value="#{atendimentoHandler.pacienteAtual}"/>
                                            <f:setPropertyActionListener target="#{fichaHandler.menuFichas.submenu}" value="#{submenuPaciente}"/>
                                    </h:commandLink>
                                </li>
                                <li>
                                    <h:commandLink  value="Retorno" actionListener="#{fichaHandler.criarNovoAtendimentoRetorno}" action="#{atendimentoHandler.criarAtendimentoRetorno}">
                                        <f:attribute name="paciente" value="#{atendimentoHandler.pacienteAtual}"/>
                                        <f:setPropertyActionListener target="#{fichaHandler.menuFichas.submenu}" value="#{submenuPaciente}"/>
                                    </h:commandLink>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    
                </div>
              

            </h:form>
        </f:subview>
    </body>
</html>