<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib prefix="stella" uri="http://stella.caelum.com.br/faces"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CLIN</title>
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
<link href="CSS/menu.css" rel="stylesheet" type="text/css" />
<link href="CSS/frmstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.maskedinput-1.2.1.js"></script>
<script type="text/javascript">
function mascara(o,f){
    v_obj=o
    v_fun=f
    setTimeout("execmascara()",1)
}

function execmascara(){
    v_obj.value=v_fun(v_obj.value)
}

function cpf(v){
    v=v.replace(/\D/g,"")                    //Remove tudo o que não é dígito
    v=v.replace(/(\d{3})(\d)/,"$1.$2")       //Coloca um ponto entre o terceiro e o quarto dígitos
    v=v.replace(/(\d{3})(\d)/,"$1.$2")       //Coloca um ponto entre o terceiro e o quarto dígitos
                                             //de novo (para o segundo bloco de números)
    v=v.replace(/(\d{3})(\d{1,2})$/,"$1-$2") //Coloca um hífen entre o terceiro e o quarto dígitos
    return v
}

function data(v){
    v=v.replace(/\D/g,"")                    //Remove tudo o que não é dígito
    v=v.replace(/(\d{2})(\d)/,"$1/$2")       //Coloca um ponto entre o terceiro e o quarto dígitos
    v=v.replace(/(\d{2})(\d)/,"$1/$2")       //Coloca um ponto entre o terceiro e o quarto dígitos
                                             //de novo (para o segundo bloco de números)
   // v=v.replace(/(\d{3})(\d{1,2})$/,"$1-$2") //Coloca um hífen entre o terceiro e o quarto dígitos
    return v
}

function soNumeros(v){
    return v.replace(/\D/g,"")
}




</script>
</head>
<body>
<f:view>
	<div id="main_content">
	<div id="top_banner"></div>
	<div id="page_content"><f:subview id="menuPacientes">
		<jsp:include page="MenuPacientes.jsp"></jsp:include>
	</f:subview>
	<div class="bordaBox">
	<div id="menuPac" align="center"><h:outputText value="Paciente"
		styleClass="subTitulo"></h:outputText>&nbsp; <img alt=""
		src="images/nav.gif" border="0"> &nbsp; <h:outputText
		value="Novo Paciente" styleClass="subTitulo"></h:outputText></div>
	<strong class="b4"
		style="background-color: #BBD8EC; border-left-color: #BBD8EC; border-right-color: #BBD8EC;"></strong>
	<strong class="b3"
		style="background-color: #BBD8EC; border-left-color: #BBD8EC; border-right-color: #BBD8EC;"></strong>
	<strong class="b2"
		style="background-color: #BBD8EC; border-left-color: #BBD8EC; border-right-color: #BBD8EC;"></strong>
	<strong class="b1"
		style="background-color: #BBD8EC; border-left-color: #BBD8EC; border-right-color: #BBD8EC;"></strong>
	</div>

	<div id="center_section">
	<div class="title" style="margin-left: 90px; margin-bottom: 20px">
	Cadastro</div>

	<h:form styleClass="frmstylizer">
		<label class="full"> Nome <font color="red">&#42;</font> <h:inputText
			styleClass="textfield" id="nome"
			value="#{pacienteHandler.paciente.nome}" required="true"
			requiredMessage="Campo Nome é Obrigatório" maxlength="150"></h:inputText></label>
		<br />

		<label class="x-small"> Sexo <font color="red">&#42;</font> <h:selectOneMenu
			value="#{pacienteHandler.paciente.sexo}">
			<f:selectItem itemValue="M" itemLabel="Masculino" />
			<f:selectItem itemValue="F" itemLabel="Feminino" />
		</h:selectOneMenu> </label>

		<label class="small" style="width: 64px"> Idade <font
			color="red">&#42;</font><h:inputText styleClass="textfield"
			id="idade" value="#{pacienteHandler.paciente.idade}"
			onkeypress="mascara(this,soNumeros)" maxlength="3"
			style="width: 48px" required="true"
			requiredMessage="Campo Idade é Obrigatório">
		</h:inputText></label>

		<label class="small" style="width: 100px"> Nascimento <font
			color="red">&#42;</font><h:inputText styleClass="textfield"
			id="nascimento" value="#{pacienteHandler.paciente.dataNascimento}"
			required="true" requiredMessage="Campo Nascimento é Obrigatório"
			onkeypress="mascara(this,data)" maxlength="10" style="width: 95px">
			<f:convertDateTime type="date" pattern="dd/MM/yyyy" />
		</h:inputText></label>

		<label class="small" style="width: 112px"> CPF <font
			color="red">&#42;</font> <h:inputText styleClass="textfield" id="cpf"
			value="#{pacienteHandler.paciente.CPF}" required="true"
			requiredMessage="Campo CPF é Obrigatório"
			onkeypress="mascara(this,cpf)" maxlength="14" style="width: 96px">
			<stella:validateCPF formatted="true" />


		</h:inputText></label>

		<label class="small" style="width: 95px"> Identidade <font
			color="red">&#42;</font> <h:inputText styleClass="textfield"
			id="identidade" value="#{pacienteHandler.paciente.RG}"
			required="true" requiredMessage="Campo Identidade é Obrigatório"
			style="width: 83px" maxlength="8"
			onkeypress="mascara(this,soNumeros)"></h:inputText></label>

		<label class="x-small" style="width: 76px"> Expedidor <font color="red">&#42;</font>
		<h:inputText styleClass="textfield" id="orgaoExpedidor"
			value="#{pacienteHandler.paciente.orgaoExpedidor}" required="true"
			requiredMessage="Campo Org. Expedidor é Obrigatório" maxlength="10" style="width: 65px"></h:inputText></label>


		<label class="x-small" style="width: 143px"> CNS <font
			color="red">&#42;</font> <h:inputText styleClass="textfield" id="cns"
			value="#{pacienteHandler.paciente.CNS}" required="true"
			requiredMessage="Campo CNS é Obrigatório" maxlength="15"
			style="width: 117px"></h:inputText></label>
		<br />

		<label class="full"> Nome da Mãe <font color="red">&#42;</font>
		<h:inputText styleClass="textfield" id="nomeMae"
			value="#{pacienteHandler.paciente.nomeDaMae}" required="true"
			requiredMessage="Campo Nome da Mãe é Obrigatório" maxlength="150"></h:inputText></label>
		<br />

		<label class="full"> Endereço <font color="red">&#42;</font><h:inputText
			styleClass="textfield" id="endereco"
			value="#{pacienteHandler.paciente.endereco}" required="true"
			requiredMessage="Campo Endereço é Obrigatório" maxlength="150"></h:inputText></label>
		<br />

		<label class="small"> Telefone <font color="red">&#42;</font>
		<h:inputText styleClass="textfield" id="telefone" value=""></h:inputText></label>

		<label class="x-large"> E-mail <font color="red">&#42;</font>
		<h:inputText styleClass="textfield" id="email"
			value="#{pacienteHandler.paciente.email}" required="true"
			requiredMessage="Campo Email é Obrigatório" maxlength="100"></h:inputText></label>

		<label class="x-small" style="width: 125px"> Estado Civil <font
			color="red">&#42;</font> <h:selectOneMenu style="width: 120px"
			value="#{pacienteHandler.paciente.estadoCivil}">
			<f:selectItem itemValue="solteiro" itemLabel="Solteiro(a)" />
			<f:selectItem itemValue="casado" itemLabel="Casado(a)" />
			<f:selectItem itemValue="divorciado" itemLabel="Divorciado(a)" />
			<f:selectItem itemValue="uniao estavel" itemLabel="União Estável" />
			<f:selectItem itemValue="viuvo" itemLabel="Viúvo(a)" />
		</h:selectOneMenu> </label>

		<label class="small"> Profissao <font color="red">&#42;</font>
		<h:inputText styleClass="textfield" id="profissao"
			value="#{pacienteHandler.paciente.profissao}" required="true"
			requiredMessage="Campo Profissão é Obrigatório"></h:inputText></label>

		<label class="x-small" style="width: 99px"> Cor <font
			color="red">&#42;</font> <h:selectOneMenu
			value="#{pacienteHandler.paciente.corDaPele}">
			<f:selectItem itemValue="branco" itemLabel="Branco(a)" />
			<f:selectItem itemValue="preto" itemLabel="Preto(a)" />
			<f:selectItem itemValue="pardo" itemLabel="Pardo(a)" />
		</h:selectOneMenu> </label>

		<label class="x-small" style="width: 153px"> Escolaridade <font
			color="red">&#42;</font> <h:selectOneMenu style="width: 150px"
			value="#{pacienteHandler.paciente.escolaridade}">
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
		</h:selectOneMenu> </label>

		<label class="small"> Religião <font color="red">&#42;</font>
		<h:inputText styleClass="textfield" id="religiao"
			value="#{pacienteHandler.paciente.religiao}"></h:inputText></label>

		<label class="small"> Naturalidade <font color="red">&#42;</font>
		<h:inputText styleClass="textfield" id="naturalidade"
			value="#{pacienteHandler.paciente.naturalidade}"></h:inputText></label>

		<label class="x-small" style="width: 200px"> Renda Mensal <font
			color="red">&#42;</font> <h:selectOneMenu style="width: 200px"
			value="#{pacienteHandler.paciente.rendaMensal}">
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
		</h:selectOneMenu> </label>

		<label class="small" style="width: 146px"> Pessoas na mesma
		casa <font color="red">&#42;</font> <h:selectOneMenu
			style="width: 120px"
			value="#{pacienteHandler.paciente.pessoasNaMesmaCasa}">
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
		</h:selectOneMenu> </label>
		<br></br>

		<div id="necessario">*Campos obrigatórios <h:messages /></div>

		<div align="center"><h:commandButton value="Limpar"
			style="margin-right:10px;"></h:commandButton> <h:commandButton
			value="Cancelar" style="margin-right:10px;" action="pacientes"></h:commandButton>
		<h:commandButton value="Salvar"
			actionListener="#{pacienteHandler.salvarPaciente}">
			<f:attribute name="salvoPor" value="#{usuarioHandler.usuario}"/>
			</h:commandButton></div>
	</h:form></div>
	<f:subview id="rodape">
		<jsp:include page="Rodape.jsp"></jsp:include>
	</f:subview></div>
	</div>
</f:view>
</body>
</html>