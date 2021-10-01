<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="icon" type="image/ico" href="images/estetoscopio.ico" />
        <title>Clin</title>
    </head>
    <body>
        <f:view>

            <div id="main_content">
                <div id="top_banner"></div>
                <div style="margin-bottom: 50px; margin-top:20px;">
                    <h:form>
                        <h:panelGrid columns="2">
                            <h:outputText value="Digite seu login para receber a senha:" />
                            <br />
                            <h:inputText required="true"  size="20" id="login"  maxlength="20" value="#{usuarioHandler.usuario.login}"
                                         requiredMessage="Campo Login é obrigatório!"/>
                            <br>

                            <h:commandButton value="Enviar Senha" actionListener="#{usuarioHandler.esqueceuSenha}" />
                        </h:panelGrid>
                        <h:panelGrid columns="1">
                            <div style="color: red;">
                                <h:messages style="color:red;" layout="table"/>
                            </div>
                        </h:panelGrid>
                    </h:form>
                </div>

                <f:subview id="rodape">
                    <jsp:include page="rodape.jsp"></jsp:include>
                </f:subview>

            </div>

        </f:view>
    </body>
</html>