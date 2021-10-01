<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="css/menu.css" rel="stylesheet" type="text/css" />
        <title>Insert title here</title>
    </head>
    <body>
        <f:subview id="menuPacientes">
            <h:form>
               
                <h:panelGrid columns="2">
                        <h:commandLink styleClass="clicado" action="pacientes">
                            <h:outputText value="Pacientes"/>
                        </h:commandLink>
                        <h:commandLink styleClass="outros" action="#{usuarioHandler.visaoUsuario}">
                            <h:outputText value="Usuários"/>
                        </h:commandLink>
               </h:panelGrid>
               
                <div class="bordaBox">
                    <strong class="b3"></strong>
                    <strong class="b4"></strong>
                </div>
                <div id="submenu">
                    <div id="acaoSubMenuPaciente">
                        <h:commandLink action="#{pacienteHandler.novoPaciente}">
                            <h:outputText value="Novo Paciente">
                            </h:outputText>
                        </h:commandLink>
                        <font color="#ffffff"> | </font>
                        <h:commandLink action="buscarPaciente">
                            <h:outputText value="Buscar Paciente">
                            </h:outputText>
                        </h:commandLink>
                    </div>
                    <div align="right" id="usuario">
                        <b><h:outputText value="#{usuarioHandler.usuario.tipo}"/>:</b>
                        <h:outputText value="#{usuarioHandler.usuario.login}"/>
                        <h:outputText value=" | "/>
                        <b><h:commandLink value="Sair" action="#{usuarioHandler.sair}"/></b>
                        

                    </div>

                </div>

            </h:form>
        </f:subview>
    </body>
</html>