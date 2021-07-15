<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<%@include file="../head.jsp" %>
		<script type="text/javascript" src="./javascripts/scriptFormatarData.js"></script>
  	</head>
	<body>
	    <div id="container">
			<div id="top"><%@include file="../top.jsp" %></div>
	      	<div id="menuh-container"><%@include file="../logado/menu.jsp" %></div>
			<div class="clear:both;">
			</div>
			<div id="leftnav" style="min-height: 500px;"><%@include file="leftnav.jsp" %></div>
			
			
			<div id="content">
				<h2>12. AMOSTRAS</h2>
				<br>
				<form action="amostras.add.logic" method = "post">
					<input type="hidden" name='amostra.id' value='${amostra.id }' />
					<input type="hidden" name='amostra.formulario.id' value='${formulario.id}' />

					<div>
						<fieldset class=block> 
							<div clas=block>
								<fieldset class=block>
									<legend>DNA &Uacute;TERO</legend>
									<table style="width: 100%;">
										<tr> 
											<td class=block>Data</td>
											<td class=block><input type=text maxlength="10" style="width: 150px;" name='amostra.dnaUteroData' onkeyup="this.value=formateadata(this.value);" value='${amostra.dnaUteroData}' /> </td>
										</tr>
										<tr> 
											<td class=block>Cod. Barras</td>
											<td class=block><input type=text maxlength="16" name='amostra.dnaUteroCodigoBarras' value='${amostra.dnaUteroCodigoBarras}' style="width: 150px;" /> </td> 
										</tr>
										<tr> 
											<td class=block>Armazenamento</td>
											<td class=block>
												Freezer <input type="text" style="width: 200px;" maxlength="25" name='amostra.dnaUteroArmazenamentoFreezer' value='${amostra.dnaUteroArmazenamentoFreezer}' /><br>
												Gaveta <input type="text" style="width: 200px; margin-top:10px;" maxlength="25" name='amostra.dnaUteroArmazenamentoGaveta' value='${amostra.dnaUteroArmazenamentoGaveta}'/><br>
												Caixa <input type="text" style="width: 200px;margin-top:10px;" maxlength="25" name='amostra.dnaUteroArmazenamentoCaixa' value='${amostra.dnaUteroArmazenamentoCaixa}'/><br>
											</td> 
										</tr>
									</table>
								</fieldset>
							</div>
							<br><br>

							<div clas=block>
								<fieldset class=block>
									<legend>DNA SANGUE</legend>
									<table style="width: 100%;">
										<tr> 
											<td class=block>Data</td>
											<td class=block><input type=text maxlength="10" style="width: 150px;" name="amostra.dnaSangueData" value="${amostra.dnaSangueData}" onkeyup="this.value=formateadata(this.value);" /> </td>
										</tr>
										<tr> 
											<td class=block>Cod. Barras</td>
											<td class=block><input type=text maxlength="16" name='amostra.dnaSangueCodigoBarras' value='${amostra.dnaSangueCodigoBarras}' style="width: 150px;" /> </td> 
										</tr>
										<tr> 
											<td class=block>Armazenamento</td>
											<td class=block>
												Freezer <input type="text" style="width: 200px;" maxlength="25" name='amostra.dnaSangueArmazenamentoFreezer' value='${amostra.dnaSangueArmazenamentoFreezer}'/><br>
												Gaveta <input type="text" style="width: 200px; margin-top:10px;" maxlength="25" name='amostra.dnaSangueArmazenamentoGaveta' value='${amostra.dnaSangueArmazenamentoGaveta}'/><br>
												Caixa <input type="text" style="width: 200px;margin-top:10px;" maxlength="25" name='amostra.dnaSangueArmazenamentoCaixa' value='${amostra.dnaSangueArmazenamentoCaixa}'/><br>
											</td> 
										</tr>
									</table>
								</fieldset>
							</div>
							<br><br>

							
							<div clas=block>
								<fieldset class=block>
									<legend>DNA SORO (alfa)</legend>
									<table style="width: 100%;">
										<tr> 
											<td class=block>Data</td>
											<td class=block><input type=text maxlength="10" name='amostra.dnaSoroAlfaData' value='${amostra.dnaSoroAlfaData}' onkeyup='this.value=formateadata(this.value);' style="width: 150px;" /> </td>
										</tr>
										<tr> 
											<td class=block>Cod. Barras</td>
											<td class=block><input type='text' maxlength="16" style="width: 150px;" name='amostra.dnaSoroAlfaCodigoBarras' value="${amostra.dnaSoroAlfaCodigoBarras}"/> </td> 
										</tr>
										<tr> 
											<td class=block>Armazenamento</td>
											<td class=block>
												Freezer <input type="text" style="width: 200px;" maxlength="25" name='amostra.dnaSoroAlfaArmazenamentoFreezer' value='${amostra.dnaSoroAlfaArmazenamentoFreezer}'/><br>
												Gaveta <input type="text" style="width: 200px; margin-top:10px;" maxlength="25" name='amostra.dnaSoroAlfaArmazenamentoGaveta' value='${amostra.dnaSoroAlfaArmazenamentoGaveta}'/><br>
												Caixa <input type="text" style="width: 200px;margin-top:10px;" maxlength="25" name='amostra.dnaSoroAlfaArmazenamentoCaixa' value='${amostra.dnaSoroAlfaArmazenamentoCaixa}'/><br>
											</td> 
										</tr>
									</table>
								</fieldset>
							</div>
							<br><br>

							<div clas=block>
								<fieldset class=block>
									<legend>DNA SORO (beta)</legend>
									<table style="width: 100%;">
										<tr> 
											<td class=block>Data</td>
											<td class=block><input type=text maxlength="10" style="width: 150px;" name='amostra.dnaSoroBetaData' value='${amostra.dnaSoroBetaData}' onkeyup="this.value=formateadata(this.value);"/></td>
										</tr>
										<tr> 
											<td class=block>Cod. Barras</td>
											<td class=block><input type=text maxlength="16" style="width: 150px;" name='amostra.dnaSoroBetaCodigoBarras' value='${amostra.dnaSoroBetaCodigoBarras}'/> </td> 
										</tr>
										<tr> 
											<td class=block>Armazenamento</td>
											<td class=block>
												Freezer <input type="text" style="width: 200px;" maxlength="25" name='amostra.dnaSoroBetaArmazenamentoFreezer' value='${amostra.dnaSoroBetaArmazenamentoFreezer}'/><br>
												Gaveta <input type="text" style="width: 200px; margin-top:10px;" maxlength="25" name='amostra.dnaSoroBetaArmazenamentoGaveta' value='${amostra.dnaSoroBetaArmazenamentoGaveta}'/><br>
												Caixa <input type="text" style="width: 200px;margin-top:10px;" maxlength="25" name='amostra.dnaSoroBetaArmazenamentoCaixa' value='${amostra.dnaSoroBetaArmazenamentoCaixa}'/><br>
											</td> 
										</tr>
									</table>
								</fieldset>
							</div>
							<br><br>

							<div clas=block>
								<fieldset class=block>
									<legend>L&Acirc;MINA</legend>
									<table style="width: 100%;">
										<tr> 
											<td class=block>Data</td>
											<td class=block><input type=text maxlength="10" style="width: 150px;" name='amostra.dnaLaminaData' value='${amostra.dnaLaminaData}' onkeyup="this.value=formateadata(this.value);" /></td>
										</tr>
										<tr> 
											<td class=block>Cod. Barras</td>
											<td class=block><input type=text maxlength="16" style="width: 150px;" name='amostra.laminaCodigoBarras' value='${amostra.laminaCodigoBarras}' /> </td> 
										</tr>
										<tr> 
											<td class=block>Armazenamento</td>
											<td class=block>
												Freezer <input type="text" style="width: 200px;" maxlength="25" name='amostra.dnaLaminaArmazenamentoFreezer' value='${amostra.dnaLaminaArmazenamentoFreezer}'/><br>
												Gaveta <input type="text" style="width: 200px; margin-top:10px;" maxlength="25" name='amostra.dnaLaminaArmazenamentoGaveta' value='${amostra.dnaLaminaArmazenamentoGaveta}'/><br>
												Caixa <input type="text" style="width: 200px;margin-top:10px;" maxlength="25" name='amostra.dnaLaminaArmazenamentoCaixa' value='${amostra.dnaLaminaArmazenamentoCaixa}'/><br>
											</td> 
										</tr>
									</table>
								</fieldset>
							</div>
							<br><br>

						</fieldset>
					</div>
					
					<div align="center" colspan="1" class="block">
						<input type="reset" value="Limpar" style="margin-right:20px; "/>
						<input type="submit" value="Salvar" style="margin-left:20px;"/>
					</div>
				</form>
			</div>		
			<div id="footer">
			 	<%@include file="../footer.jsp" %>
			</div>
		</div>
	</body>	
</html>