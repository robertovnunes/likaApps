<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CLIN</title>
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
<link href="CSS/menu.css" rel="stylesheet" type="text/css" />
<link href="CSS/tabela.css" rel="stylesheet" type="text/css" />
</head>
<body>
<f:view>
	<div id="main_content">
	<div id="top_banner"></div>
	<div id="page_content">
	<f:subview id="menuPacientes">
       <jsp:include page="MenuUsuarios.jsp"></jsp:include>
     </f:subview>
	<div class="bordaBox1">
	<div id="menuPac" align="center">
	<div class="menuPac1"><a class="diretorio" href="">Usuário</a>
	&nbsp;<img alt="" src="images/nav.gif" border="0">&nbsp; <a
		class="diretorio" href="historicoPaciente.html">Novo Usuário</a></div>
	</div>
	<strong class="b4"></strong><strong class="b3"></strong><strong
		class="b2"></strong> <strong class="b1"></strong></div>
	<div id="center_section">
	<div class="center_box">
	<table align="center">
		<tr>
			<td align="right">Nome:</td>
			<td><input name="tfNome" type="text" height="11px" /></td>
		</tr>
		<tr>
			<td align="right">CPF:</td>
			<td><input name="tfCPF" type="text" height="11px" /></td>
		</tr>
		<tr>
			<td align="right">Login:</td>
			<td><input name="tfLogin" type="text" height="11px" /></td>
		</tr>
		<tr>
			<td align="right">Senha:</td>
			<td><input name="tfSenha" type="text" height="11px" /></td>
		</tr>
		<tr>
			<td align="right">Conselho:</td>
			<td><input name="tfConselho" type="text" height="11px" /></td>
		</tr>
		<tr>
			<td align="right">Tipo:</td>
			<td><input name="tfTipo" type="text" height="11px" /></td>
		</tr>
		<tr>
			<td align="right">Email:</td>
			<td><input name="tfEmail" type="text" height="11px" /></td>
		</tr>
		<tr>
			<td align="right">Telefone:</td>
			<td><input name="tfTelefone" type="text" height="11px" /></td>
		</tr>
		<tr>
			<td align="right">Celular:</td>
			<td><input name="tfCelular" type="text" height="11px" /></td>
		</tr>
		<tr>
			<td align="right">Endereço:</td>
			<td><input name="tfEndereco" type="text" height="11px" /></td>
		</tr>


	</table>
	<br />
	<br />
	<table align="center">
		<tr>
			<td>
			<form><input name="btLimpar" type="button" value="Limpar" />
			</form>
			</td>
			<td>
			<form action="paginaInicial.html"><input name="btCancelar"
				type="submit" value="Cancelar" /></form>
			</td>
			<td>
			<form action="editarUsuario.html"><input name="btCadastrar"
				type="submit" value="Salvar" /></form>
			</td>
		</tr>
	</table>
	</div>
	</div>
	</div>
	<f:subview id="rodape">
		<jsp:include page="Rodape.jsp"></jsp:include>
	</f:subview>
	</div>
</f:view>
</body>

</html>