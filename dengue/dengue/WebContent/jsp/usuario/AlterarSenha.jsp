<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../autenticacao.jsp"  flush="true"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br"> 
<head> 
		<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h"%>
		<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
		<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
		<title>Alterar Senha</title>
		<link href="css/menu.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="css/style.css" />
		<style type="text/css">
			body{
				background-color: white;
		}

</style>
</head>
<body>
<b>Usu&aacute;rio:</b> ${usuarioEdit.nome}<br/><br/>
<br/><br/><br/>
 <div id="erroMsg">
               <font color="red"> <h:errors/></font>
               <font color="red"> 
              		${mensagem}
				</font>
                <br /><br />
            </div>
<h:form action="usuarioAlterarSenha" style="border:1px dashed #2A6DB1; ">
                 <h:hidden property="method" value="usuarioAlterarSenha" /> 
<table>
	<tr>
		<td>
		<div>Senha Antiga<font color="red"> * </font> <input name="senhaAntiga" type="password"
			size="10" /> 
		</div>
		</td>
	</tr>
	<tr>
		<td>
		<div>Nova Senha <font color="red"> * </font> <input name="senhaNova" type="password"
			size="10" /> 
		</div>
		</td>
	</tr>
	<tr>
		<td>
			Confirmar Senha <font color="red"> * </font> <input name="senhaConfirmar"
			type="password" size="10" />
		</td>
	</tr>
	<tr>
		<td><font color="red" size="1"> *Campos obrigat&oacute;rios </font></td>
	</tr>

</table>
<p align="center"> 
	<h:submit value="Salvar"/> &nbsp;
	<h:reset value="Limpar"/></p>
</h:form>
</body>
</html>