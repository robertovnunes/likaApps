<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%@include file="../head.jsp"%>
<link href="css/displaytag.css" rel="stylesheet" type="text/css" />
<title>HPV-LIKA</title>
</head>
<body>
	<script type="text/javascript">
	
	function beforeGerarLaudo(id){
		
		var test = confirm('Se você gerar o laudo ele não poderá mais ser modificado. Tem certeza que deseja continuar?');
		
		if(test)
			window.location = 'viralHpv.gerarPdfLaudo.logic?formulario.id='+id;
		
		
	}
	
	</script>

	<div id="container">
		<div id="top">
			<%@include file="../top.jsp"%>

		</div>
		<%@include file="../selecionarMenuUsuario.jsp"%>

		<div class="clear:both;"></div>


		<div id="contentListar">
			<h2>Laudos (HPV)</h2>
			<!-- campo obrigatorio o h2 no css!!! -->
			<div id='cadastrarNovoTemplate'>
				<fieldset>
					<legend>Templates</legend>
					<div>
						<a href='viralHpv.listarTemplateTextosLaudo.logic'>Templates de laudos do HPV</a>
					</div>
				</fieldset>
			</div>
			<br></br>



			<div id='resultadoListar'>
				<display:table requestURI="viralHpv.index.logic" name="${formularios}" export="true" id="formulario" list="${formularios}" pagesize="10" sort="list" class="displaytag">
					<display:column title="Número do prontuário" sortable="true">${formulario.numeroProntuario}</display:column>
					<display:column title="Código barras" sortable="true">${formulario.codigoBarras}</display:column>
					<display:column title="Código PRONEX" sortable="true">${formulario.codigoPronex}</display:column>
					<display:column title="Grupo Participante" sortable="true">${formulario.grupoParticipante}</display:column>
					<display:column title="Laudo">
						<c:if test="${formulario.laudoHpv.dataEntrega == null}">
							<a href="viralHpv.formulario.logic?formulario.id=${formulario.id}">Editar</a>
						</c:if>
					</display:column>
					<display:column title="PDF" media="">
						<c:if test="${formulario.laudoHpv.id != null && formulario.laudoHpv.dataEntrega == null}">
							<a href="javascript:beforeGerarLaudo(${formulario.id});" >Gerar</a>
						</c:if>
						<c:if test="${formulario.laudoHpv.id != null && formulario.laudoHpv.dataEntrega != null}">
							<a href="viralHpv.gerarPdfLaudo.logic?formulario.id=${formulario.id}" target="_blank">Re-Imprimir</a>
						</c:if>
					</display:column>

					<!-- coloquei isso porque o negocio nao aceita ser comentado -->
					<c:if test="false">
					<display:column title="remover" media="">
						<c:if test="${formulario.laudoHpv.id != null}">
							<a href="#" onclick='removerLaudo("${formulario.laudoHpv.id}");'>remover</a>
						</c:if>
					</display:column>
					</c:if>
					<display:setProperty name="paging.banner.placement" value="bottom" />
					<display:setProperty name="basic.empty.showtable" value="true" />
					<display:setProperty name="export.excel" value="true" />
					<display:setProperty name="export.xml" value="true" />
					<display:setProperty name="export.csv" value="false" />
					<display:setProperty name="export.pdf" value="true" />
					<display:setProperty name="export.excel.filename" value="lista.xls" />
					<display:setProperty name="export.pdf.filename" value="lista.pdf" />
				</display:table>
			</div>
			<script type="text/javascript">
					function removerLaudo(id){
						if(id != null && id != ""){
							window.location = "viralHpv.remove.logic?laudoHpv.id="+ id;
						}else alert("Não há laudo associado a este formulário!");
					}
				</script>

		</div>
		<div id="footer">
			<%@include file="../footer.jsp"%>
		</div>
	</div>

</body>

</html>