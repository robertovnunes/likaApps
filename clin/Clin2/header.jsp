<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <f:subview id="headerSubView">
        <div id="header_l">
                <h1>CLÍNICA MÉDICA</h1>
                <p class="h1_sub">Prontuário do Paciente</p>
        </div>
        <div id="header_r">
            <h:form id="membro">
                <div id="member">
                    <img src="img/member_pic.jpg" alt="iR4 Consultoria Web" />
                    <p>Olá <strong>
                            <h:outputText value="#{usuarioHandler.usuario.nome}"/>
                           </strong>
                    </p>
                    <p>
                        <h:commandLink action="#{usuarioHandler.editarPerfil}" value="Editar meu perfil"/> |
                        <h:commandLink action="#{usuarioHandler.sair}" value="Sair"/>
                    </p>
                </div>
            </h:form>
        </div>  
    </f:subview>
</body>
</html>