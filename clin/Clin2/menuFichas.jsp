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
        <link href="css/menu.css" rel="stylesheet" type="text/css" />
        <link href="css/tabela.css" rel="stylesheet" type="text/css" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="jquery/thickbox.css" type="text/css" media="screen" />
        <script type="text/javascript" src="jquery/jquery-latest.js"></script>
        <script type="text/javascript" src="jquery/thickbox.js"></script>
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

    </head>
    <body>
        <f:subview id="menuFichas">
            <h:form>

                <div id="menu10">
                    <ul>
                        <li><h:commandLink immediate="true" styleClass="#{fichaHandler.menuFichas.menuQPD}" id="qpd" action="#{fichaHandler.mostrarFicha}" value="QPD">
                                <f:setPropertyActionListener target="#{fichaHandler.fichaAtual}" value="QPD"/>
                            </h:commandLink>
                        </li>
                        <li><h:commandLink immediate="true" styleClass="#{fichaHandler.menuFichas.menuHDA}" id="hda" action="#{fichaHandler.mostrarFicha}" value="HDA">
                                <f:setPropertyActionListener target="#{fichaHandler.fichaAtual}" value="HDA"/>
                            </h:commandLink>
                        </li>
                        <li><h:commandLink immediate="true" styleClass="#{fichaHandler.menuFichas.menuIS}" id="is" action="#{fichaHandler.mostrarFicha}" value="IS">
                                <f:setPropertyActionListener target="#{fichaHandler.fichaAtual}" value="IS"/>
                            </h:commandLink>
                        </li>
                        <li><h:commandLink immediate="true" styleClass="#{fichaHandler.menuFichas.menuAntecedentes}" id="antecedentes" action="#{fichaHandler.mostrarFicha}" value="Antecedentes" >
                                <f:setPropertyActionListener target="#{fichaHandler.fichaAtual}" value="antecedentes"/>
                            </h:commandLink>
                        </li>
                        <li><h:commandLink immediate="true" styleClass="#{fichaHandler.menuFichas.menuExameFisico}" id="exameFisico" action="#{fichaHandler.mostrarFicha}" value="Exame Físico" >
                                <f:setPropertyActionListener target="#{fichaHandler.fichaAtual}" value="exameFisico"/>
                            </h:commandLink>
                        </li>
                        <li><h:commandLink immediate="true" styleClass="#{exameHandler.menuFichas.menuExames}" id="exames" action="#{exameHandler.mostrarFicha}" value="Exames" >
                                <f:setPropertyActionListener target="#{fichaHandler.fichaAtual}" value="exames"/>
                                <f:setPropertyActionListener target="#{exameHandler.atendimentoAtual}" value="#{fichaHandler.atendimentoAtual}"/>
                            </h:commandLink>
                        </li>
                        <li><h:commandLink immediate="true" styleClass="#{fichaHandler.menuFichas.menuPromblemasECondutas}" id="problemasEcondutas" action="#{fichaHandler.mostrarFicha}" value="Problemas/Condutas" >
                                <f:setPropertyActionListener target="#{fichaHandler.fichaAtual}" value="problemasCondutas"/>
                            </h:commandLink>
                        </li>
                    </ul>
                </div>
              <div id="menuAnt" style="margin-top:10px; margin-left:2px; font-size:10px;">
                    <ul>
                        <li>
                            <a4j:commandLink  immediate="true" ajaxSingle="true" value="Atendimentos Anteriores"  oncomplete="javascript:OpenSubWin('atendimentosAnteriores.jsf','900','600','0')" action="#{atendimentoAteriorHandler.carregarAtendimentoAnterior}" rendered="#{!empty atendimentoHandler.listaAtendimentos}">
                            </a4j:commandLink>
                            
                            <a4j:commandLink  immediate="true" ajaxSingle="true" value="Atendimentos Anteriores"  onclick="javascript:alert('Não há Atendimentos Anteriores para este Paciente.')" rendered="#{empty atendimentoHandler.listaAtendimentos}">
                            </a4j:commandLink>
                            
                            
                        </li>
                    </ul>

                </div>

            </h:form>
        </f:subview>
    </body>
</html>