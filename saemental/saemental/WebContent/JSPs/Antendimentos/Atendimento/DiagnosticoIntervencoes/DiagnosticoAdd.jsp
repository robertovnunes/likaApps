<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../../autenticacao.jsp"  flush="true"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br"> 
<% String urlBase = request.getContextPath(); %>
<head> 
		<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h"%>
		<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
		<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
		 <link rel="stylesheet" href="Css/style.css" />
		 <link rel="stylesheet" type="text/css" href="Css/jTPS.css" />
		 
         <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> 
   		<script src="http://malsup.github.com/jquery.form.js"></script>
   		
   		 
        <script language="JavaScript" type="text/javascript" src="jscripts/jTPS.js"></script>
        <script>
                $(document).ready(function () {
                	
                        $('#demoTable').jTPS( {perPages:[5],scrollStep:1,scrollDelay:30,
                                clickCallback:function () {     
                                        // target table selector
                                        var table = '#demoTable';
                                        // store pagination + sort in cookie 
                                        document.cookie = 'jTPS=sortasc:' + $(table + ' .sortableHeader').index($(table + ' .sortAsc')) + ',' +
                                                'sortdesc:' + $(table + ' .sortableHeader').index($(table + ' .sortDesc')) + ',' +
                                                'page:' + $(table + ' .pageSelector').index($(table + ' .hilightPageSelector')) + ';';
                                }
                        });
                        // reinstate sort and pagination if cookie exists
                        var cookies = document.cookie.split(';');
                        for (var ci = 0, cie = cookies.length; ci < cie; ci++) {
                                var cookie = cookies[ci].split('=');
                                if (cookie[0] == 'jTPS') {
                                        var commands = cookie[1].split(',');
                                        for (var cm = 0, cme = commands.length; cm < cme; cm++) {
                                                var command = commands[cm].split(':');
                                                if (command[0] == 'sortasc' && parseInt(command[1]) >= 0) {
                                                        $('#demoTable .sortableHeader:eq(' + parseInt(command[1]) + ')').click();
                                                } else if (command[0] == 'sortdesc' && parseInt(command[1]) >= 0) {
                                                        $('#demoTable .sortableHeader:eq(' + parseInt(command[1]) + ')').click().click();
                                                } else if (command[0] == 'page' && parseInt(command[1]) >= 0) {
                                                        $('#demoTable .pageSelector:eq(' + parseInt(command[1]) + ')').click();
                                                }
                                        }
                                }
                        }
                        // bind mouseover for each tbody row and change cell (td) hover style
                        $('#demoTable tbody tr:not(.stubCell)').bind('mouseover mouseout',
                                function (e) {
                                        // hilight the row
                                        e.type == 'mouseover' ? $(this).children('td').addClass('hilightRow') : $(this).children('td').removeClass('hilightRow');
                                }
                        );
                        
                });

                function intervencoesAdd(){
                    alert('Interven&ccedil;&atilde;o salva com sucesso!');
                 	var div = document.getElementById('resumoIntervencoes');   
                 	div.innerHTML += 'Aconselhamento (5240) <br/>';
                }

                function resultadosAdd(){
                    alert('Resultado salvo com sucesso!');
                 	var div = document.getElementById('resumoResultados');   
                 	div.innerHTML += 'Aceita&ccedil;&atilde;o do estado de Saúde (1300) <br/>';
                }
                
                
     </script>
     <script type="text/javascript">
     $(document).ready(function(){
		    
    	 $('#diagnosticoSalvar').ajaxForm({
		         url : 'diagnosticoSalvar.do', // or whatever
		         success : function (response) {
		        	 window.opener.location.href = 'atendimento.do?method=mostrarTelaAdmissaProcEnfermagem';
		        	 self.close();
		         }
		     });
     });
     	function enviarForm(){
     		
     		var form = document.getElementById("diagnosticoSalvar");
     		form.submit();
     		window.opener.location.href = 'atendimento.do?method=mostrarTelaAdmissaProcEnfermagem';
     		//self.close();
     		
     	}
     </script>
     <style type="text/css">
     	body{overflow: scroll;}
     </style>
</head>
<body>
<div align="center">
<br />
	<h3><c:out value="${cipe.titulo}"></c:out> (<c:out value="${cipe.codigo}"></c:out>)</h3>
	 <div id="erroMsg">
               <font color="red"> <h:errors/></font>
               <font color="red"> 
              		${mensagem}
				</font>
            </div>
				<br />
		 		<table border="1px">
		 			<tr>
		 				<th  style="width:300px;">
		 					Diagn&oacute;sticos 
		 				</th>
		 				<th  style="width:300px;">
		 					Interven&ccedil;&otilde;es 
		 				</th>
		 				<th  style="width:300px;">
		 					Resultados Esperados
		 				</th>
		 			</tr>
		 			<tr>
		 				<td>
				 			<c:out value="${cipe.titulo}"></c:out> (<c:out value="${cipe.codigo}"></c:out>)
		 				</td>
		 				<td id="resumoIntervencoes">
		 					<c:forEach items="${nics}" var="nic" varStatus="index">
		 						<c:out value="${nic.descricao}"></c:out>(<c:out value="${nic.codigo}"></c:out>) <a href="diagnostico.do?method=removerNic&idNic=<c:out value="${nic.id}"></c:out>">remover</a>
		 						<br />
		 					</c:forEach>
		 				</td>
		 				<td id="resumoResultados">
		 					<c:forEach items="${nocs}" var="noc" varStatus="index">
		 						<c:out value="${noc.descricao}"></c:out>(<c:out value="${noc.codigo}"></c:out>) <a href="diagnostico.do?method=removerNoc&idNoc=<c:out value="${noc.id}"></c:out>">remover</a>
		 						<br />
		 					</c:forEach>
		 				</td>
		 			</tr>
		 		</table>
				<br/>
       			 <h2>Buscar</h2>
       			 
       			 <form name="nicNocBuscar" method="get" action="nicNocBuscar.do">
    	 		 	<h:hidden property="method" value="nicNocBuscar"/>  
				    <input type="text" size="80" name="valor" />
				    <h:hidden property="buscarNicNoc" value="salvar"/>  
				    <input type="submit" name="btBuscar" id="btBuscar2" value="Buscar" /><br/>
				    Interven&ccedil;&otilde;es<input type="radio" name="tipo" value="intervencao" checked="checked" />
				    Resultados<input type="radio" name="tipo" value="resultado" />
			    </form>
			    <br/><br/>
	    		 <table id="demoTable" style="border: 1px solid #ccc;" cellspacing="0" width="700">
                       <thead>
               			 <tr>
                            <th sort="cod">C&oacute;digo</th>
                            <th>Descri&ccedil;&atilde;o</th>
                            <th>Adicionar</th>
	                 	</tr>
	                 	</thead>
	                 
                   <tbody>
       					<c:forEach items="${nicList}" var="nic" varStatus="index">
  						<tr>
  							<td align="center">
  							 	${nic.codigo}
  							</td>
  							<td align="center">
  								 ${nic.descricao}
  							</td>
  							<td align="center">
  								<a href="nicAdd.do?method=nicAdd&id=<c:out value="${nic.id}"></c:out>" >Adicionar</a>
  							</td>
  						</tr>
  						</c:forEach>
  						
  						<c:forEach items="${nocList}" var="noc" varStatus="index">
  						<tr>
  							<td align="center">
  							 	${noc.codigo}
  							</td>
  							<td align="center">
  								 ${noc.descricao}
  							</td>
  							<td align="center">
  								<a href="nocAdd.do?method=nocAdd&id=<c:out value="${noc.id}"></c:out>" >Adicionar</a>
  							</td>
  						</tr>
  						</c:forEach>
                     </tbody>
                 	<tfoot class="nav">
               		 <tr>
                        <td colspan=7>
                                <div class="pagination"></div>
                                <div class="paginationTitle">P&aacute;gina</div>
                                <div class="selectPerPage"></div>
                                <div class="status"></div>
                        </td>
                	</tr>
       			 </tfoot>
       			 </table>
       			 <br />
       			 <div align="right" style="margin-right: 40px;">
       			 <form name="diagnosticoSalvar" id="diagnosticoSalvar">
    	 		 	<h:hidden property="method" value="diagnosticoSalvar"/>  
       			 	
       			 	<input type="submit"  value="Salvar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
       			 </form>
       			 </div>
       </div>
     
</body>
</html>