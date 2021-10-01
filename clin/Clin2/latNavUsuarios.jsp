<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.ajax4jsf.org/rich" prefix="rich"%>
<%@ taglib uri="https://ajax4jsf.dev.java.net/ajax" prefix="a4j"%>
<%@ taglib prefix="stella" uri="http://stella.caelum.com.br/faces"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Clínica Médica</title>
        <meta name="title" content="Título da Página" />
        <meta name="description" content="Descrição da Página" />
        <meta name="keywords" content="keywords,separadas,por,virgula,e,endereco.com.br" />
        <meta name="language" content="pt-BR" />
        <meta name="robots" content="All" />
        <meta name="revisit" content="7 days" />
        <script src="js/flash.js" type="text/javascript" language="javascript"></script>
        <link href="css/screen.css" type="text/css" rel="stylesheet" media="screen" />
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
        <f:subview id="latNavUsuarios">
            <div id="ColLatNav">
                <h:panelGroup rendered="#{!usuarioHandler.administrador}">
                    <ul>
                        <li>
                            <h:form rendered="#{!usuarioHandler.administrador}">
                                <h:commandLink styleClass="a" action="#{usuarioHandler.editarPerfil}">
                                    <h:outputText value="Editar Perfil"></h:outputText>
                                </h:commandLink>
                            </h:form>
                        </li>
                    </ul>
                </h:panelGroup>
                
                <h:form rendered="#{usuarioHandler.administrador}">
                    <ul>
                        <li>
                            <h:commandLink  styleClass="a" action="#{usuarioHandler.editarPerfil}" >
                                <h:outputText value="Editar Perfil">
                                </h:outputText>
                            </h:commandLink>
                        </li>
                        <li>
                            <a class="submn" href="javascript:;">Novo Usuário</a>
                            <ul class="dnone">
                                <li>
                                    <h:commandLink action="#{usuarioHandler.novoUsuarioMedico}" value="Médico">
                                        <f:setPropertyActionListener target="#{usuarioHandler.tipoUsuario}" value="Médico"/>
                                    </h:commandLink>
                                </li>
                                <li>
                                    <h:commandLink action="#{usuarioHandler.novoUsuarioEnfermeiro}" value="Enfermeiro">
                                        <f:setPropertyActionListener target="#{usuarioHandler.tipoUsuario}" value="Enfermeiro"/>
                                    </h:commandLink>
                                </li>
                                <li>
                                    <h:commandLink action="#{usuarioHandler.novoUsuarioAluno}" value="Aluno">
                                        <f:setPropertyActionListener target="#{usuarioHandler.tipoUsuario}" value="Aluno"/>
                                    </h:commandLink>
                                </li>
                                <li>
                                    <h:commandLink action="#{usuarioHandler.novoUsuarioAdministrador}" value="Administrador">
                                        <f:setPropertyActionListener target="#{usuarioHandler.tipoUsuario}" value="Administrador"/>
                                    </h:commandLink>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <h:commandLink styleClass="a" action="#{usuarioHandler.visaoUsuario}">
                                <h:outputText value="Buscar Usuario"/>
                            </h:commandLink><!--<a href="#">QPD</a>-->
                        </li>
                    </ul>
                </h:form>
            </div>
        </f:subview>
    </body>
</html>
