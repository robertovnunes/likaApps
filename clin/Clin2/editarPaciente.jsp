<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<%@ taglib prefix="stella" uri="http://stella.caelum.com.br/faces"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>CLIN</title>
        <link rel="stylesheet" type="text/css" href="css/screen.css" />        
        <link href="css/frmstyle.css" rel="stylesheet" type="text/css" />        
        <script type="text/javascript" src="js/mascaras.js"></script>
        <script type="text/javascript" src="js/jquery.maskedinput-1.2.1.js"></script>
    </head>
    <body>
        <f:view>
            <div id="main_content">                

                <div id="header">                    
                    <jsp:include page="header.jsp"/>
                    <jsp:include page="menuPaciente1.jsp"/>
                    <h:form id="location">
                        <p>
                            <h:commandLink action="pacientes">
                                <h:outputText value="Pacientes"/>
                            </h:commandLink> > Editar Paciente
                        </p>
                    </h:form>
                </div><!-- /#header -->

                <div id="page_content">                    
                    <jsp:include page="latNavPacientes.jsp"></jsp:include>
                   
                    <div id="center_section">

                    <div id="panelConfirmacao" align="center" style="margin-top: 15px;">
                        <h:messages id="confirmacao" errorClass="erroConfirmacao" infoClass="sucessoConfirmacao" layout="table" showSummary="true" showDetail="false" globalOnly="true"></h:messages>
                        <h:message for="cpf" />
                    </div>

                    
                        <h2>Editar Cadastro</h2>


                        <h:form styleClass="frmstylizer">

                            <label class="small"> Prontuário <font color="red">&#42;</font>
                                <h:inputText styleClass="textfield"
                                             id="prontuario" value="#{pacienteHandler.paciente.prontuario}"
                                             required="true" requiredMessage="Campo Prontuário é Obrigatório"
                                             onkeypress="mascara(this,prontuario)" maxlength="9" >
                                </h:inputText>
                            </label>

                            <br />

                            <label class="full"> Nome <font color="red">&#42;</font>
                                <h:inputText
                                    styleClass="textfield" id="nome" style="margin-right: 15px;"
                                    value="#{pacienteHandler.paciente.nome}" required="true"
                                    requiredMessage="Campo Nome é Obrigatório" maxlength="150">
                                </h:inputText>
                            </label>



                            <label class="x-small" > Sexo <font color="red">&#42;</font>
                                <h:selectOneMenu style="width: 100px" styleClass="textfield"
                                    id ="sexo" value="#{pacienteHandler.paciente.sexo}" required="true"
                                    requiredMessage="Campo Sexo é Obrigatório">
                                    <f:selectItem itemValue="" itemLabel="Selecione..." />
                                    <f:selectItem itemValue="M" itemLabel="Masculino" />
                                    <f:selectItem itemValue="F" itemLabel="Feminino" />
                                </h:selectOneMenu> </label>

                            <label class="small" style="width: 64px; margin-left:15px"> Idade
                                <h:inputText styleClass="textfield"
                                             id="idade" value="#{pacienteHandler.paciente.idade}"
                                             onkeypress="mascara(this,soNumeros)" maxlength="3"
                                             style="width: 48px" >
                                </h:inputText></label>

                            <label class="small" style="width: 100px"> Nascimento
                                <h:inputText styleClass="textfield"
                                             id="nascimento" value="#{pacienteHandler.paciente.dataNascimento}"
                                             onkeypress="mascara(this,data)" maxlength="10" style="width: 90px" converterMessage="Data no formato inválido. ex: 30/10/1987">
                                    <f:convertDateTime type="date" pattern="dd/MM/yyyy" />
                                </h:inputText></label>

                            <label class="small" style="width: 112px"> CPF
                                <h:inputText styleClass="textfield" id="cpf"
                                             value="#{pacienteHandler.paciente.CPF}"
                                             onkeypress="mascara(this,cpf)" maxlength="14" style="width: 96px">
                                    <stella:validateCPF formatted="true" />
                                </h:inputText>
                            </label>

                            <label class="small" style="width: 95px"> Identidade
                                <h:inputText styleClass="textfield"
                                             id="identidade" value="#{pacienteHandler.paciente.RG}"
                                             style="width: 83px" maxlength="8"
                                             onkeypress="mascara(this,soNumeros)">
                                </h:inputText>
                            </label>

                            <label class="x-small" style="width: 76px"> Expedidor
                                <h:inputText styleClass="textfield" id="orgaoExpedidor"
                                             value="#{pacienteHandler.paciente.orgaoExpedidor}"  maxlength="10" style="width: 65px">
                                </h:inputText>
                            </label>


                            <label class="small" style="width: 120px" > CNS
                                <h:inputText styleClass="textfield" id="cns"
                                             value="#{pacienteHandler.paciente.CNS}"  maxlength="15"
                                             style="width: 117px">
                                </h:inputText>
                            </label>
                            <br />

                            <label class="full"> Nome da Mãe <font color="red">&#42;</font>
                                <h:inputText styleClass="textfield" id="nomeMae"
                                             value="#{pacienteHandler.paciente.nomeDaMae}" required="true"
                                             requiredMessage="Campo Nome da Mãe é Obrigatório" maxlength="150">
                                </h:inputText>
                            </label>
                            <br />

                            <label class="full"> Endereço
                                <h:inputText
                                    styleClass="textfield" id="endereco"
                                    value="#{pacienteHandler.paciente.endereco}"  maxlength="150">
                                </h:inputText>
                            </label>
                            <br />

                            <label class="x-small" style="margin-right: 20px"> Telefone 1
                                <h:inputText style="width: 100%" styleClass="textfield" id="telefone" value="#{pacienteHandler.paciente.telefone1}" maxlength="9"  onkeypress="mascara(this,telefone)">
                                </h:inputText>
                            </label>

                            <label class="x-small" style="margin-right: 20px"> Telefone 2
                                <h:inputText styleClass="textfield" id="celular" value="#{pacienteHandler.paciente.telefone2}" maxlength="9"  onkeypress="mascara(this,telefone)">
                                </h:inputText>
                            </label>

                            <label class="x-large" style="width: 518px;"> E-mail
                                <h:inputText styleClass="textfield" id="email"
                                             value="#{pacienteHandler.paciente.email}"  maxlength="100">
                                </h:inputText>
                            </label>

                            <label class="x-small" style="width: 120px"> Estado Civil
                                <h:selectOneMenu style="width: 120px"
                                                 value="#{pacienteHandler.paciente.estadoCivil}">
                                    <f:selectItem itemValue="" itemLabel="Selecione..." />
                                    <f:selectItem itemValue="solteiro" itemLabel="Solteiro(a)" />
                                    <f:selectItem itemValue="casado" itemLabel="Casado(a)" />
                                    <f:selectItem itemValue="divorciado" itemLabel="Divorciado(a)" />
                                    <f:selectItem itemValue="uniao estavel" itemLabel="União Estável" />
                                    <f:selectItem itemValue="viuvo" itemLabel="Viúvo(a)" />
                                </h:selectOneMenu>
                            </label>

                            <label class="small" style="margin-right: 20px;"> Profissao
                                <h:inputText styleClass="textfield" id="profissao"
                                             value="#{pacienteHandler.paciente.profissao}">
                                </h:inputText>
                            </label>

                            <label class="x-small" style="width: 100px"> Cor <font
                                    color="red">&#42;</font>
                                <h:selectOneMenu id="cor" style="width: 100px"
                                    value="#{pacienteHandler.paciente.corDaPele}" required="true"
                                    requiredMessage="Campo Cor é Obrigatório">
                                    <f:selectItem itemValue="" itemLabel="Selecione..." />
                                    <f:selectItem itemValue="branco" itemLabel="Branco(a)" />
                                    <f:selectItem itemValue="preto" itemLabel="Preto(a)" />
                                    <f:selectItem itemValue="pardo" itemLabel="Pardo(a)" />
                                    <f:selectItem itemValue="amarelo" itemLabel="Amarelo(a)" />
                                    <f:selectItem itemValue="indigena" itemLabel="Indígena" />
                                </h:selectOneMenu>
                            </label>

                            <label class="x-small" style="width: 153px"> Escolaridade
                                <h:selectOneMenu style="width: 150px"
                                                 value="#{pacienteHandler.paciente.escolaridade}">
                                    <f:selectItem itemValue="" itemLabel="Selecione..." />
                                    <f:selectItem itemValue="analfabeto" itemLabel="Analfabeto(a)" />
                                    <f:selectItem itemValue="alfabetizado" itemLabel="Alfabetizado" />
                                    <f:selectItem itemValue="fundamental I"
                                                  itemLabel="1ª a 4ª Série - Fundamental I" />
                                    <f:selectItem itemValue="fundamental II"
                                                  itemLabel="5ª a 8ª Série - Fundamental II" />
                                    <f:selectItem itemValue="ensino medio incompleto"
                                                  itemLabel="2º Grau Incompleto - Ensino Médio" />
                                    <f:selectItem itemValue="ensino medio completo"
                                                  itemLabel="2º Grau Completo - Ensino Médio" />
                                    <f:selectItem itemValue="superior incompleto"
                                                  itemLabel="Superior Incompleto" />
                                    <f:selectItem itemValue="superior completo"
                                                  itemLabel="Superior Completo" />
                                </h:selectOneMenu>
                            </label>

                            <label class="small" style="margin-right: 20px;"> Religião
                                <h:inputText styleClass="textfield" id="religiao" style="width: 172px;"
                                             value="#{pacienteHandler.paciente.religiao}">
                                </h:inputText>
                            </label>

                            <label class="small" style="margin-right: 20px;"> Naturalidade
                                <h:inputText styleClass="textfield" id="naturalidade" style="width: 172px;"
                                             value="#{pacienteHandler.paciente.naturalidade}">
                                </h:inputText>
                            </label>

                            <label class="x-small" style="width: 190px;"> Renda Mensal
                                <h:selectOneMenu style="width: 190px;"
                                                 value="#{pacienteHandler.paciente.rendaMensal}">
                                    <f:selectItem itemValue="" itemLabel="Selecione..." />
                                    <f:selectItem itemValue="ate 2 salarios minimos"
                                                  itemLabel="Até dois salários mínimos" />
                                    <f:selectItem itemValue="de 2 a 5 salarios minimos"
                                                  itemLabel="de 2 a 5 salários mínimos" />
                                    <f:selectItem itemValue="de 5 a 10 salarios minimos"
                                                  itemLabel="de 5 a 10 salários mínimos" />
                                    <f:selectItem itemValue="de 10 a 20 salarios minimos"
                                                  itemLabel="de 10 a 20 salários mínimos" />
                                    <f:selectItem itemValue="acima de 20 salarios minimos"
                                                  itemLabel="acima de 20 salários mínimos" />
                                </h:selectOneMenu>
                            </label>

                            <label class="small" style="width: 146px;"> Pessoas na mesma casa
                                <h:selectOneMenu
                                    style="width: 146px;"
                                    value="#{pacienteHandler.paciente.pessoasNaMesmaCasa}" >
                                    <f:selectItem itemValue="" itemLabel="Selecione..." />
                                    <f:selectItem itemValue="1" itemLabel="1" />
                                    <f:selectItem itemValue="2" itemLabel="2" />
                                    <f:selectItem itemValue="3" itemLabel="3" />
                                    <f:selectItem itemValue="4" itemLabel="4" />
                                    <f:selectItem itemValue="5" itemLabel="5" />
                                    <f:selectItem itemValue="6" itemLabel="6" />
                                    <f:selectItem itemValue="7" itemLabel="7" />
                                    <f:selectItem itemValue="8" itemLabel="8" />
                                    <f:selectItem itemValue="9" itemLabel="9" />
                                    <f:selectItem itemValue="10" itemLabel="10" />
                                    <f:selectItem itemValue="mais de 10" itemLabel="mais de 10" />
                                </h:selectOneMenu>
                            </label>
                            <br>

                            <h:panelGroup rendered="#{pacienteHandler.paciente.idPaciente != null}">
                                <div class="cadastrado">
                                    <p><font color="#FF9834"><b>Dados incluídos por: </b></font>
                                        <h:outputText value="#{pacienteHandler.paciente.salvoPor.nome}" style="font-weight:bold;"/> em
                                        <h:outputText value="#{pacienteHandler.paciente.salvoEm}" style="font-weight:bold;" escape="false">
                                            <f:convertDateTime type="both" dateStyle="default" pattern="dd/MM/yyyy 'às' HH:mm:ss"/>
                                        </h:outputText>
                                    </p>
                                </div>
                            </h:panelGroup>


                            <div id="necessario">*Campos obrigatórios
                                <h:panelGrid columns="1">
                                    <h:message for="prontuario"/>
                                    <h:message for="nome"/>
                                    <h:message for="sexo"/>
                                    <h:message for="nomeMae"/>
                                    <h:message for="cor"/>
                                </h:panelGrid>
                            </div>

                            <div align="center" style="width: 210px; margin-right: auto; margin-left: auto;">
                                <h:commandButton styleClass="bt_cancel" value="CANCELAR" style="float: left;" action="pacientes" immediate="true"></h:commandButton>
                                <h:commandButton styleClass="bt_save" value="SALVAR" style="float: right;" action="#{pacienteHandler.editarPacienteSelecionado}"></h:commandButton>
                            </div>
                        </h:form>
                    </div>
                    <jsp:include page="rodape.jsp"></jsp:include>
                </div>
            </div>
        </f:view>
    </body>
</html>