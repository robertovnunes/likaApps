<%-- 
    Document   : latNavPaciente
    Created on : 09/04/2011, 20:33:41
    Author     : Adriano
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
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
         <f:subview id="latNavPaciente">
            <div id="ColLatNav">
                <h:form>
                    <ul>
                        <li>                            
                            <h:commandLink styleClass="a" action="#{pacienteHandler.novoPaciente}">
                                <h:outputText value="Novo Paciente"/>
                            </h:commandLink>
                        </li>
                        <li>
                            <h:commandLink styleClass="a" action="buscarPaciente">
                                <h:outputText value="Buscar Paciente"/>
                            </h:commandLink>
                        </li>
                        <li>
                            <h:commandLink styleClass="a" action="#{pacienteHandler.editarPaciente}">
                                <h:outputText value="Editar Cadastro"></h:outputText>
                            </h:commandLink>
                        </li>
                        <li>
                            <a class="submn" href="javascript:;">Novo Atendimento</a>
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
                        <li>
                            <a4j:commandLink  immediate="true" ajaxSingle="true" value="Atendimentos Anteriores"  oncomplete="javascript:OpenSubWin('atendimentosAnteriores.jsf','900','600','0')" action="#{atendimentoAteriorHandler.carregarAtendimentoAnterior}" rendered="#{!empty atendimentoHandler.listaAtendimentos}">
                            </a4j:commandLink>

                            <a4j:commandLink  immediate="true" ajaxSingle="true" value="Atendimentos Anteriores"  onclick="javascript:alert('Não há Atendimentos Anteriores para este Paciente.')" rendered="#{empty atendimentoHandler.listaAtendimentos}">
                            </a4j:commandLink>
                        </li>
                        <li>                            
                            <h:commandLink styleClass="a" action="#{atendimentoHandler.atendimentosDoPaciente}" >
                                <f:setPropertyActionListener target="#{atendimentoHandler.pacienteAtual}" value="#{pacienteHandler.paciente}"/>
                                <h:outputText value="Atendimentos"></h:outputText>
                            </h:commandLink>
                        </li>                        
                    </ul>
                </h:form>
            </div>
        </f:subview>
    </body>
</html>
