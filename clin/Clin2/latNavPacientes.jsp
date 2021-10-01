<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Clínica Médica</title>        
        <meta name="language" content="pt-BR" />
        <meta name="robots" content="All" />
        <meta name="revisit" content="7 days" />
        <script src="js/flash.js" type="text/javascript" language="javascript"></script>        
        <link href="css/screen.css" type="text/css" rel="stylesheet" media="screen" />
        
    </head>
    <body>
        <f:subview id="latNavPacientes">
            <div id="ColLatNav">
                <h:form>
                    <ul>
                        <li>
                            <h:commandLink styleClass="a" action="#{pacienteHandler.novoPaciente}">
                                <h:outputText value="Novo Paciente"/>
                            </h:commandLink><!--<a href="#">QPD</a>-->
                        </li>
                        <li>
                            <h:commandLink styleClass="a" action="buscarPaciente">
                                <h:outputText value="Buscar Paciente"/>
                            </h:commandLink><!--<a href="#">QPD</a>-->
                        </li>
                    </ul>
                </h:form>
                </div>
        </f:subview>
    </body>
</html>