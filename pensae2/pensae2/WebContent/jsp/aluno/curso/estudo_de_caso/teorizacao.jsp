<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

  <jsp:include page="../../../inc_header.jsp"  flush="true"/>
 	

	 <script type="text/javascript">
		function avancarTeorizacao(){
			
			var form = document.forms[0];
			form.action = "/pensae2/avancarTeorizacao.do";
			form.method.value = "avancarTeorizacao";
			form.submit();
		}
	</script>
	
</head>
<body>

<div id="container">

	  <jsp:include page="../inc_topo_curso.jsp"  flush="true"/>
    
    <div id="middle">    
		<div id="middle_align">

          	<h:form action="salvarTeorizacao" method="post" enctype="multipart/form-data">
            <div id="wrapper" class='logado caso'>
        	  <h3 class="bread">CR<c:out value="${matricula.curso.id}"></c:out> > EC<c:out value="${arcoMaguerez.estudoDeCaso.id}"></c:out> > Teoriza??o</h3>

               <jsp:include page="inc_topo_estudo_caso.jsp"  flush="true"/>  
            <c:if test="${arcoMaguerez.faseDoArco > 2}"><div class="desabilitar-form" style="height:100%;"></div>	</c:if>    
            	
                	
                	<div class="help">
                                <h3 class="arco teorizacao"> Teoriza??o</h3>
                               Nesta terceira etapa do M?todo do Arco ("Teoriza??o") voc? dever? estudar os pontos-chaves em artigos cient?ficos, livros, anais de congresso, v?deos educativos, entre outros materiais de aprendizagem. Podendo tamb?m participar de palestras, encontros e reuni?es cient?ficas. Anexe abaixo um documento com o resumo do conte?do pesquisado e as refer?ncias relacionadas. Atente-se para n?o desviar do tema proposto!
                               </div>
                    
                	
					<h:hidden property="method" value="salvarTeorizacao"/>
					<br /><br />
					Nesta fase voc? deve enviar um arquivo do tipo <b>.Doc, .Docx ou .Pdf</b> contendo a sua teoriza??o relacionada a este Estudo de Caso com no <b>m?ximo 16mb</b><br />
					Arquivo: 
					<c:forEach items="${arcoMaguerez.teorizacao.arquivos}" var="arquivo" varStatus="index">
	           				<a style="position: relative; z-index:2;" href="baixarArquivo.do?method=baixarArquivo&idArquivo=${arquivo.id}"><c:out value="${arquivo.nomeArqv}"></c:out></a><br />
	           		</c:forEach>
	           		<br />
					<h:file property="file" size="200" styleClass="file"  style="width:300px;" />   (Deixe em branco caso queira manter o mesmo arquivo)
        				
                
            </div><!-- /#wrapper -->
        		<table class="navegacao" style="position: relative; z-index:2;">
	            	<tr>
		             	 <td style="vertical-align: top;">
		               		<input type="button" value="Voltar" onclick="window.location.href = 'ptsChave.do?method=mostrarTelaPontosChave';" class="bt_voltar" >
		                </td>
		                <td class="space"></td>
		            	<td class="left">    
		                	<input type="button" value="Cancelar" onclick="window.location.href = 'teorizacao.do?method=mostrarTelaTeorizacao';" class="bt_cancelar" class="left">
		                </td>
		               <td class="right">
		                	<input type="submit"  value="Salvar Dados" class="bt_salvar" class="right">
	               		 </td>
		                <td class="space"></td>
		                 <td style="vertical-align: top;">
		        			<input type="button"  value="Avan?ar Fase" onclick="avancarTeorizacao();"  class="bt_avancar" class="left">
		                </td>
	              </tr>
	            </table>
          	</h:form>

    	</div><!-- /#middle_align -->
    		<div style="width: 100%; height: 300px;"></div>
    </div><!-- /#middle -->    
    
	<jsp:include page="../../../inc_rodape.jsp"  flush="true"/>
  
    
</div><!-- /#container -->
</body>
</html>    