<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	   <%@include file="../head.jsp" %>
		<script type="text/javascript" src="./javascripts/formulario6.js"></script>
	    <title>HPV-LIKA</title>
  	</head>

	<body>
	    <div id="container">
			<div id="top">
		        <%@include file="../top.jsp" %>
	      	</div>
	      	<%@include file="../selecionarMenuUsuario.jsp" %>

			<div class="clear:both;">
			</div>
			<div id="leftnav" style="min-height: 500px;">
	      		<%@include file="leftnav.jsp" %>
			</div>
			
			
			<div id="content">
				<h2>6. HIST&Oacute;RICO FAMILIAR</h2><!-- campo obrigatorio o h2 no css!!! -->
				<h3>PRONEX: ${formulario.codigoPronex}</h3>
								<br>
		<c:if test="${usuarioDaSessao.acessoAdministrador != null && usuarioDaSessao.acessoAdministrador == 'Y'}">
				<br>
				<select>
						<option selected="selected">Ultimas modificações:</option>
						<c:forEach var="modificacao" items="${formulario.modificacoes}">
						<c:if test="${modificacao.etapa == 6 }">
						<option>${modificacao.usuario.login} em ${modificacao.dataModificacao}</option>
						</c:if>
					</c:forEach>
							
				</select>
				</c:if>
				<br />
				
				
				<br>
				<form action="formulario.addFormulario6.logic" method = "post">
					<input type=hidden name="historicoFamiliar.formulario.id" value="${formulario.id}">
					<input type=hidden name="historicoFamiliar.id" value="${historicoFamiliar.id}"/>
					<input type="hidden" name="historicoModificacoes.user" value="${usuarioDaSessao.id}" />
					<table class="block" id="formulario6">
						<tr>
							<td class="block" width="300">Algum parente com doen&ccedil;a cr&ocirc;nica</td>
							<td class="block">
								<input type="radio" id="algumParenteDoencaCronica" name="historicoFamiliar.algumParenteDoencaCronica" value="sim" onclick="parenteDoencaCronica(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoFamiliar.algumParenteDoencaCronica == 'sim'}">checked="checked"</c:if>/>Sim 
								<input type="radio" name="historicoFamiliar.algumParenteDoencaCronica" value="nao" onclick="parenteDoencaCronica(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoFamiliar.algumParenteDoencaCronica == 'nao'}">checked="checked"</c:if>/>N&atilde;o
								<input type="radio" name="historicoFamiliar.algumParenteDoencaCronica" value="ns/nr" onclick="parenteDoencaCronica(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoFamiliar.algumParenteDoencaCronica == 'ns/nr'}">checked="checked"</c:if>/>NS/NR
							</td>
						</tr>
						<tr>
							<td class="block">Algum parente com c&acirc;ncer</td>
							<td class="block">
								<input type="radio" id="algumParenteCancer" name="historicoFamiliar.algumParenteCancer" value="sim" onclick="parenteCancer(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoFamiliar.algumParenteCancer == 'sim'}">checked="checked"</c:if>/>Sim
								<input type="radio" name="historicoFamiliar.algumParenteCancer" value="nao" onclick="parenteCancer(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoFamiliar.algumParenteCancer == 'nao'}">checked="checked"</c:if>/>N&atilde;o
								<input type="radio" name="historicoFamiliar.algumParenteCancer" value="ns/nr" onclick="parenteCancer(this.value,this.parentNode.parentNode.rowIndex);" <c:if test="${historicoFamiliar.algumParenteCancer == 'ns/nr'}">checked="checked"</c:if>/>NS/NR
							</td>
						</tr>
						<tr>
							<td><br/></td>
							<td />
						</tr>
						<%@include file="util/limparSalvar.jsp" %>
					</table>
				</form>
			</div>		
			<div id="footer">
			 	<%@include file="../footer.jsp" %>
			</div>
		</div>
<!-- JAVASCRIPTS -->
<script type="text/javascript">
var doencaCronica = false;
function parenteDoencaCronica(valor,linha){
	if(valor =="sim" && doencaCronica == false){
		var row = document.getElementById("formulario6").insertRow(linha+1);
		var colA = row.insertCell(0);
		colA.innerHTML = "Grau de parentesco";
		colA.id="block";
		var colB = row.insertCell(1);
		colB.innerHTML ="<input type=hidden name='historicoFamiliar.parenteDoencaCronica.id' value='${historicoFamiliar.parenteDoencaCronica.id}' />";
		colB.innerHTML +="<input type='text' class='textfieldLongo' name='historicoFamiliar.parenteDoencaCronica.grauParentesco' value='${historicoFamiliar.parenteDoencaCronica.grauParentesco}' maxlength='30'/>";
		colB.id="block";
		
		var row2 = document.getElementById("formulario6").insertRow(linha+2);
		var col2A = row2.insertCell(0);
		col2A.innerHTML = "Qual tipo?";
		col2A.id="block";
		var col2B = row2.insertCell(1);
		col2B.innerHTML ="<input type='text'class='textfieldLongo' name='historicoFamiliar.parenteDoencaCronica.tipo' value='${historicoFamiliar.parenteDoencaCronica.tipo}' maxlength='40'/>";
		col2B.id="block";
		doencaCronica = true;
	}
	else if ((valor == "nao" || valor == "ns/nr") && doencaCronica == true){
		var str = document.getElementById("formulario6").rows[linha+1].innerHTML;
		if(str.indexOf("Grau de parentesco") >= 0 ){/*então existia antes o campo na tabela*/
			var tbl = document.getElementById('formulario6');
			tbl.deleteRow(linha+1);
			tbl.deleteRow(linha+1);
			doencaCronica = false;
		}
	}
}

var parenteC = false;
function parenteCancer(valor,linha){
	if(valor =="sim" && parenteC == false){
		var row = document.getElementById("formulario6").insertRow(linha+1);
		var colA = row.insertCell(0);
		colA.innerHTML = "Grau de parentesco";
		colA.id="block";
		var colB = row.insertCell(1);
		colB.innerHTML ="<input type=hidden name='historicoFamiliar.parenteCancer.id' value='${historicoFamiliar.parenteCancer.id}' />";
		colB.innerHTML +="<input type='text'class='textfieldLongo' name='historicoFamiliar.parenteCancer.grauParentesco' value='${historicoFamiliar.parenteCancer.grauParentesco}'/>";
		colB.id="block";
		
		var row2 = document.getElementById("formulario6").insertRow(linha+2);
		var col2A = row2.insertCell(0);
		col2A.innerHTML = "Qual tipo?";
		col2A.id="block";
		var col2B = row2.insertCell(1);
		col2B.innerHTML ="<input type='text'class='textfieldLongo' name='historicoFamiliar.parenteCancer.tipo' value='${historicoFamiliar.parenteCancer.tipo}' />";
		col2B.id="block";
		parenteC = true;
	}
	else if ((valor == "nao" || valor == "ns/nr") && parenteC == true){
		var str = document.getElementById("formulario6").rows[linha+1].innerHTML;
		if(str.indexOf("Grau de parentesco") >= 0 ){/*então existia antes o campo na tabela*/
			var tbl = document.getElementById('formulario6');
			tbl.deleteRow(linha+1);
			tbl.deleteRow(linha+1);
			parenteC = false;
		}
	}
}

<!-- FIM DOS JAVASCRIPTS -->	
</script>

<!-- funcoes ativadas quando for editar os dados -->
<script type="text/javascript">
	<c:if test="${historicoFamiliar.algumParenteDoencaCronica == 'sim'}">
		parenteDoencaCronica("sim",document.getElementById("algumParenteDoencaCronica").parentNode.parentNode.rowIndex);		
	</c:if>
	<c:if test="${historicoFamiliar.algumParenteCancer == 'sim'}">
		parenteCancer("sim",document.getElementById("algumParenteCancer").parentNode.parentNode.rowIndex);		
	</c:if>
</script>

	</body>
</html>