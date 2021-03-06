<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<%@include file="../head.jsp" %>
		<script type="text/javascript" src="./javascripts/scriptFormatarData.js"> </script>
		<script type="text/javascript" src="./javascripts/scriptSoNumeros.js"> </script>
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

					<h2 style="">S?FILIS</h2><br>
					<h2 style="margin-left: 20px;"><u>Viral - S?filis</u></h2>
					<br>
				<form action="viralSifilis.add.logic" method="post">
					<input type="hidden" name='laudoSifilis.id' value="${laudoSifilis.id}">
					<input type="hidden" name='laudoSifilis.formulario.id' value='${formulario.id}'>

					<table class=block style="width: 100%;">
						<tr> 
							<td class=block colspan="2"><b>RESULTADOS</b></td>
						</tr>
						<tr> 
							<td><br></td>
							<td></td>
						</tr>
						<tr> 
							<td class=block>Nome do paciente</td>
							<td class=block>
								<input type=text style="width: 300px;" maxlength="99" value='${formulario.informacoesPessoais.nome}' readonly="readonly"/>
							</td>
						</tr>
						<tr> 
							<td class=block>Unidade de Sa?de da Fam?lia</td>
							<td class=block>
								<input type=text name='laudoSifilis.unidadeSaudeFamilia' value="${laudoSifilis.unidadeSaudeFamilia}" style="width: 300px;" maxlength="120"/>
							</td>
						</tr>
						<tr> 
							<td><br></td>
							<td></td>
						</tr>
						
						<tr> 
							<td class=block colspan="2"><b>Dados do laudo</b></td>
						</tr>
						<tr>
							<td class=block> Resultado</td>
							<td class=block>
								<input type="text" name='laudoSifilis.resultado' value="${laudoSifilis.resultado}" style="width: 100%;" maxlength="100"/>
							</td>
						</tr>
						<tr>
							<td class=block>
								Data da coleta
							</td>
							<td class=block>
								<input type='text' name='laudoSifilis.dataColeta' value='${laudoSifilis.dataColeta}' onkeyup="this.value=formateadata(this.value);" style="width: 100%;"/>
							</td>
						</tr>
						<tr>
							<td class=block>Data da entrega</td>
							<td class=block>
								<input type='text' name='laudoSifilis.dataEntrega' value='${laudoSifilis.dataEntrega}' onkeyup="this.value=formateadata(this.value);" style="width: 80px;"/>
							</td>
						</tr>
						<tr>
							<td class=block>C?digo</td>
							<td class=block>
								<input type='text' name='laudoSifilis.codigo' value='${laudoSifilis.codigo}' style="width: 80px;" />								
							</td>
						</tr>
						
						<tr>
							<td class=block>Observa??es</td>
							<td class=block>
								<textarea name='laudoSifilis.observacoes' style="width: 100%;height: 100px;" onkeyup="this.value=tamanho(this.value,150);">${laudoSifilis.observacoes}</textarea>
								<script type="text/javascript">
									function tamanho(str, tam){
										if(str.length <= tam)return str;
										else return str.substr(tam);
									}
								</script>
						</tr>
						
						<tr> 
							<td><br></td>
							<td></td>
						</tr>
						<tr>
							<td align="center" colspan="2" class="block">
								<input type="reset" value="Limpar" style="margin-right: 30px;"/>
								<input type="submit" value="Salvar" style="margin-left: 30px;"/>
							</td>
						</tr>
	
					</table>
				</form>
			</div>
			<div id="footer">
			 	<%@include file="../footer.jsp" %>
			</div>
		</div>
	</body>	
</html>