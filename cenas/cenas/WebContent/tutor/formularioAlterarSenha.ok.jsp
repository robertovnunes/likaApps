<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/meutag.tld" prefix="m" %>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel="stylesheet" href="css/internas.css" />
	<title>CenAS: Cen?rios de Aprendizagem</title>

	<SCRIPT LANGUAGE="JavaScript">
 	
	    function verificarSenhas(atual){

		
			
		    var digitada = document.getElementById("senhaAtual").value;
		    var nova = document.getElementById("novaSenha").value;
		    var confirmarSenha = document.getElementById("confirmarNovaSenha").value;
	
		
	        if(atual == digitada){
	        
			    if(nova == confirmarSenha){
				    document.getElementById("formSenha").submit();
			    }
			    else{
				    alert("Senha digitada e Confirma??o de senha est?o diferentes.Tente novamente.");
				    document.getElementById("novaSenha").value = "";
				    document.getElementById("confirmarNovaSenha").value = "";
			    }
		        } else {
			        alert("A senha digitada n?o corresponde ? senha atual do sistema.");
		        }
        }

    </SCRIPT>


</head>

<body>

	<%@ include file="../cabecalho_disciplinas.jsp"%>

<div id="corpo">


<div id="conteudo">


<%@ include file="../erros.jsp" %>
<div id="miolo" align="center">

	<h1>Alterar Senha</h1>

	<p style="text-align: center;">

	<form name="form" id="formSenha" action="tutor.mudarSenha.logic" method="post"
		style="text-align:center; ">
	    
	<input type="hidden" name="tutor.id" value="${tutor.id}" /> 
	
	<table id="dados" style="text-align: left;" class="dados" align="center">
		
		<tr>
			<td class="title">Senha Antiga:</td>
			<td class="content3"><input type="password" id="senhaAtual" size="20" />
			</td>
		</tr>
		<tr>
			<td class="title">Nova Senha:</td>
			<td class="content3"><input type="password" id="novaSenha" size="20" />
			</td>
		</tr>
		<tr>
			<td class="title">Confirmar Nova Senha:</td>
			<td class="content3">
				<input type="password" id="confirmarNovaSenha" name="tutor.senha" size="20" />
			</td>
		</tr>
		<tr>
			<td class="actions" colspan="2">
			<input type="button" value="Salvar" class="button" onclick="verificarSenhas('${usuario.senha}')"/>&nbsp;
			</td>
		</tr>
		
	</table>
	
	</form>
	</p>
	
	
	</div>

</div>
<%@ include file="../rodape.jsp"%></div>

</body>

</html>
