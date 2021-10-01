<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
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
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
<link href="css/screen.css" type="text/css" rel="stylesheet" media="screen" />

</head>

<body>
    <f:view>
        <div id="msg" class="alert dnone"> <!-- alterar apenas a classe .erro .confirm .alert -->
            <ul>
                <li><img src="img/transparent.gif" class="icon_erro" />Mensagem de erro</li> <!-- colocar a classe da imagem também -->
                <li><img src="img/transparent.gif" class="icon_alert" />Mensagem de alerta</li>
                <li><img src="img/transparent.gif" class="icon_confirm" />Mensagem de confirmação</li>
            </ul>
        </div>

        <div id="main_content">

            <div id="header">
            <div id="header_l">
                    <h1>CLÍNICA MÉDICA</h1>
                    <p class="h1_sub">Prontuário do Paciente</p>
            </div>
            </div>

            <div id="page_content">
                <!--<div id="top_banner"></div>-->
                <div style="margin-bottom: 50px; margin-top:20px;">
                    <h:form>
                        <h:panelGrid columns="2">
                            <h:panelGroup>

                                <span style="color: #7B0E10; font-weight: bold; font-size: 14px; padding: 10px;">ACESSO RESTRITO
                                    <h:graphicImage value="images/user-icon.png" width="37" height="27" alt="user" title="user"/>
                                </span>
                                <h:panelGrid columns="2" style="margin-top: 10px">
                                    <h:outputText value="Login:" style="margin: 10px 10px 0px 0px"/>
                                    <h:inputText required="true"  size="20" id="login"  maxlength="20" value="#{usuarioHandler.usuario.login}"
                                                 requiredMessage="Campo Login é obrigatório!"/>
                                    
                                    <h:outputText value="Senha:" style="margin: 0px 10px 10px 0px"/>
                                    <h:inputSecret  id = "senha" required="true" size="20"  maxlength="20" value="#{usuarioHandler.usuario.senha}"
                                                    requiredMessage="Campo Senha é obrigatório!" style="margin: 5px 0px 0px 0px"/>
                                </h:panelGrid>
                                <h:panelGrid columns="1" style="width: 241px">
                                    <h:commandLink value="Esqueceu a senha?" action="esqueceuSenha" immediate="true">
                                    </h:commandLink>
                                    <h:commandButton value="Login" action="#{usuarioHandler.login}" styleClass="button"/>
                                </h:panelGrid>


                            </h:panelGroup>

                            <h:panelGroup>
                                <div class="title">BEM VINDO!</div>
                                <p align="justify" style="font-size:14px; text-indent:50px;">Você está acessando o sistema CLIN, prontuário para
                                    Semiologia do Adulto e do Idoso do Módulo IN542 (Introdução
                                    à Clínica Médica) do 4º período do Curso de Medicina da UFPE.
                                    O sistema CLIN é utilizado como ferramenta de aprendizagem
                                    permitindo que os alunos exercitem o registro e acompanhamento
                                    de casos clínicos com orientação dos Professores de Clínica Médica.
                                </p>
                            </h:panelGroup>
                        </h:panelGrid>
                        <h:panelGrid columns="1">
                            <div style="color: red;">
                                <h:messages style="color:red;" layout="table"/>
                            </div>
                        </h:panelGrid>
                    </h:form>
                </div>
            </div>            
            <jsp:include page="rodape.jsp"></jsp:include>
        </div>
    </f:view>
    </body>
    </html>