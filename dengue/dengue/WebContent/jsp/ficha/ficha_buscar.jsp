<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../autenticacao.jsp"  flush="true"/>		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br"> 
<% String urlBase = request.getContextPath(); %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<head> 


		<%@ include file="/jsp/inc_header.jsp"%>

		<link href="css/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="css/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
		
		 <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<link href="css/menu.css" rel="stylesheet" type="text/css" />
		
        <link rel="stylesheet" type="text/css" href="css/jTPS.css" />
        <link rel="stylesheet" href="css/style.css" />
		<script language="JavaScript" type="text/javascript" src="js/jquery.js"></script>
        <script language="JavaScript" type="text/javascript" src="js/jTPS.js"></script>
   		<script language="JavaScript" type="text/javascript" src="js/MascaraValidacao.js"></script>        
       
        <script>
                $(document).ready(function () {
                        $('#demoTable').jTPS( {perPages:[5,10,15],scrollStep:1,scrollDelay:30,
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
                
                function resetarForm(){
                	document.getElementById("tfBusca").value = "";
                }
        </script>

		
        <script type="text/javascript">
        	function navegacao(){
	        	var div = window.top.document.getElementById('dadosPaciente');
	        	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}';
	
	        	var divnavegacao = window.top.document.getElementById('navegacao');
	        	divnavegacao.innerHTML = "<a href='<%=urlBase%>'>Home </a> :: <a href='#'>Usuários Buscar</a>";
        	}
        	
        	function removerFicha(idFicha){
        		
        		var r = confirm("Você deseja realmente deletar a ficha:"+idFicha);
        		if (r == true) {
        		    window.location.href = "ficha.do?method=removerFicha&idFicha="+idFicha;
        		} else {
        		    
        		}
        		
        	}
        	
        </script>
		<style>
                body {
                        font-family: Tahoma;
                        font-size: 9pt;
                }
                #demoTable thead th {
                        white-space: nowrap;
                        overflow-x:hidden;
                        padding: 3px;
                }
                #demoTable tbody td {
                        padding: 3px;
                }
        </style>
		
		 
</head>
<body onload="navegacao();">
<%@ include file="/jsp/inc_topo.jsp"%>

<div align='center' id="main-content" style="background-image: none !important;" >
		
		<jsp:include page="../menu.jsp"  flush="true"/>	
        
		<div style="margin-top:15px;">
               	
				 <div id="conteudo" align="center" style="height:700px;">
           		<b style="color: red;"><h:errors/>	${mensagem}</b>
				<div id="buscarFicha">
			         <h:form action="buscarFicha" >
		                 <h:hidden property="method" value="buscarFichaInvestigativa"/>   
                        <div align="center" style="height: 79px">
                            <label>
                                <input type="text" size="60" name="tfBusca" class="input-text" id="tfBusca" onkeypress=" return keyPress(event, this);" />
                            </label>
                           	<h:submit value="Buscar"/> &nbsp;
                            <br/><br/>
                            <label onclick="resetarForm();">
								ID<input id="tipoDeBusca" name="tipoDeBusca" checked="checked" type="radio" value="id" />
							</label>
							<label onclick="resetarForm();">
								Investigador<input id="tipoDeBusca"  name="tipoDeBusca" type="radio" value="investigador" />
							</label>
							<label onclick="resetarForm();">	
								Cidade<input id="tipoDeBusca"  name="tipoDeBusca" type="radio" value="cidade" />
							</label>
							<label onclick="resetarForm();">	
								Unidade Saúde<input id="tipoDeBusca"  name="tipoDeBusca" type="radio" value="unidadeSaude" />
							</label>
                        </div>
                  </h:form> 
                   
                            <p id="titulo-verm" style='margin-left: 350px;' align="left">Fichas de Notificação Individual</p>
                   
                    <br/>
                    <table id="demoTable" style="border: 1px solid #ccc;" cellspacing="0" width="700">
                        <thead>
               			 <tr>
	                        <th sort="index">ID</th>
	                        <th sort="investigador">Investigador</th>
	                        <th sort="cidade">Cidade</th>
	                        <th sort="unidade">Unidade Saúde</th>
	                        <th>Primeiros Sintomas</th>
	                        <th>Ações</th>
               			 </tr>
       					 </thead>
       					 <tbody>
       					<c:forEach items="${fichasInvestigativas}" var="fichaNotificacaoInd" varStatus="index">
                        <tr>
                            <td align="center">
                                ${fichaNotificacaoInd.id}
                            </td>
                            <td align="center">
                                ${fichaNotificacaoInd.investigador.nome}
                            </td>
                            <td align="center">
                                ${fichaNotificacaoInd.dadosGerais.cidade.descricao} -  ${fichaNotificacaoInd.dadosGerais.cidade.estado.sigla}
                            </td>
                            <td align="center">
                                 ${fichaNotificacaoInd.dadosGerais.unidadeSaude.nome_fantasia} - ${fichaNotificacaoInd.dadosGerais.unidadeSaude.codigo_unidade}
                            </td>
                             <td align="center">
                                 ${fichaNotificacaoInd.dadosGerais.dataPrimeirosSintomasFormatada}
                            </td>
                            <td align="center" width="80">
                                <a href="ficha.do?method=mostrarTelaDadosGeraisEdit&idFicha=<c:out value="${fichaNotificacaoInd.id }"></c:out>" title="Editar"><img src="images/edit.png" width="15" height="15" border="0" /></a>
                                 <a href="relatorio.do?method=mostrarRelatorioIndividual&idFicha=<c:out value="${fichaNotificacaoInd.id }"></c:out>" target="_blank"    title="Baixar"><img src="images/print.png" alt="remover" width="15" height="15" border="0" /></a>
                                 <a href="#" onclick="removerFicha('<c:out value="${fichaNotificacaoInd.id }"></c:out>');"  title="Remover"><img src="images/delete.png" alt="remover" width="15" height="15" border="0" /></a>
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
                    <br/>
                </div>
            </div>

				
                </div>
		

		
</div>



<%@ include file="/jsp/inc_rodape.jsp"%>
</body>
</html>