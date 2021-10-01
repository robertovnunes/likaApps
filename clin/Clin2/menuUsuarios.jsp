<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.ajax4jsf.org/rich" prefix="rich"%>
<%@ taglib uri="https://ajax4jsf.dev.java.net/ajax" prefix="a4j"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="css/menu.css" rel="stylesheet" type="text/css" />
        <title>Insert title here</title>

        <style type="text/css">

            .rich-ddmenu-label-select{
                background-color: transparent;
                border:none;
            }

        </style>

    </head>

    <body>
        <f:subview id="menuUsuarios">
            <h:form>
                 <h:panelGrid columns="2">
                        <h:commandLink styleClass="outros" action="pacientes">
                            <h:outputText value="Pacientes"/>
                        </h:commandLink>
                        <h:commandLink styleClass="clicado" action="#{usuarioHandler.visaoUsuario}">
                            <h:outputText value="Usuários"/>
                        </h:commandLink>
               </h:panelGrid>
                  <div class="bordaBox"><strong class="b3"></strong><strong
                        class="b4"></strong>
                </div>
                    <div id="submenu">
                        <div id="acaoSubMenuUsuario">


                            <h:commandLink  action="#{usuarioHandler.editarPerfil}" rendered="#{!usuarioHandler.administrador}">
                                <h:outputText value="Editar Perfil">
                                </h:outputText>
                            </h:commandLink>

                            <h:panelGrid columns="5" rendered="#{usuarioHandler.administrador}">

                                <h:commandLink  action="#{usuarioHandler.editarPerfil}">
                                    <h:outputText value="Editar Perfil">
                                    </h:outputText>
                                </h:commandLink>

                                <font color="#ffffff"> | </font>

                                <rich:dropDownMenu direction="bottom-right" >
                                    <f:facet name="label">
                                        <h:panelGroup>
                                            <h:outputText value="Novo Usuário" style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; color: #fff; font-weight:400;"/>
                                        </h:panelGroup>
                                    </f:facet>
                                    <rich:menuItem submitMode="ajax" >
                                        <h:commandLink  style=" color:#003399;" value="Médico"  action="#{usuarioHandler.novoUsuarioMedico}">
                                            <f:setPropertyActionListener target="#{usuarioHandler.tipoUsuario}" value="Médico"/>
                                        </h:commandLink>
                                    </rich:menuItem>
                                    <rich:menuSeparator id="menuSeparator" />

                                    <rich:menuItem submitMode="ajax">
                                        <h:commandLink  style=" color:#003399;" value="Enfermeiro" action="#{usuarioHandler.novoUsuarioEnfermeiro}">
                                            <f:setPropertyActionListener target="#{usuarioHandler.tipoUsuario}" value="Enfermeiro"/>
                                        </h:commandLink>
                                    </rich:menuItem>
                                    <rich:menuSeparator id="menuSeparator1" />

                                    <rich:menuItem submitMode="ajax">
                                        <h:commandLink  style=" color:#003399;" value="Aluno"   action="#{usuarioHandler.novoUsuarioAluno}">
                                            <f:setPropertyActionListener target="#{usuarioHandler.tipoUsuario}" value="Aluno"/>
                                        </h:commandLink>
                                    </rich:menuItem>

                                    <rich:menuSeparator id="menuSeparator2" />

                                    <rich:menuItem submitMode="ajax">
                                        <h:commandLink  style=" color:#003399;" value="Administrador"  action="#{usuarioHandler.novoUsuarioAdministrador}">
                                            <f:setPropertyActionListener target="#{usuarioHandler.tipoUsuario}" value="Administrador"/>
                                        </h:commandLink>
                                    </rich:menuItem>

                                </rich:dropDownMenu>



                                <font color="#ffffff"> | </font>

                                <h:commandLink  action="buscarUsuario">
                                    <h:outputText value="Buscar Usuários">
                                    </h:outputText>
                                </h:commandLink>


                            </h:panelGrid>

                        </div>
                        <div align="right" id="usuario">
                            <b>
                                <h:outputText value="#{usuarioHandler.usuario.tipo}"/>:</b>
                            <h:outputText value="#{usuarioHandler.usuario.login}"/>
                            <h:outputText value=" | "/>
                            <b><h:commandLink value="Sair" action="#{usuarioHandler.sair}"/></b>

                        </div>

                    </div>
            </h:form>
        </f:subview>
    </body>
</html>