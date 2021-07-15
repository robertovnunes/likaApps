<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../../../autenticacao.jsp"  flush="true"/>		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br"> 
<% String urlBase = request.getContextPath(); %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<head> 

			<script language="JavaScript" type="text/javascript" src="jscripts/jquery.js"></script>

		<%@ include file="/JSPs/inc_header.jsp"%>


		<link href="Css/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="Css/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
        
        
        <link rel="stylesheet" type="text/css" href="Css/jTPS.css" />
		<link href="Css/tabela.css" rel="stylesheet" type="text/css" />
        <link href="Css/menu.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="Css/general.css" type="text/css" media="screen" />
        
        
			<script type="text/javascript" src="jscripts/tiny_mce/tiny_mce.js">
	        </script>

        <script language="JavaScript" type="text/javascript" src="jscripts/jTPS.js"></script>
		<script language="JavaScript" type="text/javascript" src="jscripts/MascaraValidacao.js"></script>     
			
		<script language="JavaScript" type="text/javascript" src="jscripts/popup.js" ></script>	
			
		<script type="text/javascript">
            tinyMCE.init({
                mode: "textareas",
                theme: "simple"
            });
           </script>
        
        <script type="text/javascript">
        	
            function redirecionar(){
				var frame = document.getElementById('content');
				frame.src = "atendimento.do?method=mostrarTelaAdmissaoQueixa";
            }
        </script>
		 <script>
                $(document).ready(function () {
                        $('#demoTable').jTPS( {perPages:[5,10],scrollStep:1,scrollDelay:30,
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

                function selecionou(){
                	window.open('Observacao.htm','width=300','height=400');
                }
                
                function resetarForm(){
                	document.getElementById("tfBusca").value = "";
                }
        </script>
		 <script type="text/javascript">
        	function navegacao(){
	        //	var div = window.top.document.getElementById('dadosPaciente');
		     //   	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		     //   	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Responsável: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<astyle='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar' target='conteudo'>Pacientes Buscar</a> :: <a style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"' target='conteudo'>Atendimentos Paciente</a>" + " :: <a style='color: white;text-decoration: none;' href='#'>Avaliação Professor</a>";
        	}
        </script>
		 <style>
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
<%@ include file="/JSPs/inc_topo.jsp"%>

<div align='center' id="main-content" style="background-image: none !important;" >
		
		<jsp:include page="../../../menu.jsp"  flush="true"/>	
        
		
		<div style="">
				
				
    	<div id="conteudoNormal" align="center" style="height:700px">
               				
               				
               	 <jsp:include page="../menu-atendimentos.jsp"  flush="true"/>				
               				
				
				
		 <div id="conteudoNormal" align="left" style="height:700px; display:inline-block;">
		 
		 
			 <div id="buscarAvaliacoes">
                    <form id="form" name="form" method="post" action="avaliacoesBuscar.do">
                     <input type="hidden" value="avaliacoesBuscar" name="method"/>
                        <div align="center" style="height: 60px">
                            <label>
                                <input type="text" size="60" name="tfBusca" id="tfBusca"  onkeypress=" return keyPress(event,this);" />
                            </label>
                             <input type="submit" value="Buscar" />
                            <br/>
                            <label onclick="resetarForm();">
                                Professor<input name="tipoDeBusca" type="radio" checked="checked" value="professor"/>
                            </label>
                            <label onclick="resetarForm();">
                                Data<input name="tipoDeBusca" type="radio" value="data"/>
                            </label>
                        </div>
					</form>
                    <h4 align="left" style="margin-left:80px;">Avalia&ccedil;&otilde;es</h4>
                    <table id="demoTable" style="border: 1px solid #ccc;" cellspacing="0" width="700">
                       <thead>
               			 <tr>
	                       <th sort="autor">Professor</th>
                            <th sort="data">Data</th>
                            <th sortn="tipo">Selecionar</th>
	                 	</tr>
	                 	</thead>
	                 
                   <tbody>
       					<c:forEach items="${avaliacoes}" var="avaliacao" varStatus="index">
                        <tr>
                            <td align="center">
                                <c:out value="${avaliacao.professor.nome}"></c:out>
                            </td>
                            <td align="center">
                                 <c:out value="${avaliacao.dataHoraFormatada}"></c:out>
                            </td>
                            <td align="center">
                                <a target="_blank" href="avaliacaoSelect.do?method=selecionarAvaliacao&id=<c:out value="${avaliacao.id}"></c:out>">Selecionar</a>
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
       			 <br/><br/><br/>
       			<div style="margin-left:40%;">
       				<c:if test="${usuario.tipoUsuario == 'PROFESSOR'}">
       			 	 <input type="button" value="Adicionar Avaliação" id="button"/>
       			 	</c:if>
       			 </div>
                </div>
		 
		 
		 
         </div>
         
            </div>

               	
                </div>

		
</div>



<%@ include file="/JSPs/inc_rodape.jsp"%>
     <div id="popupContact">
		<a id="popupContactClose">sair</a>
		<h1>Adicionar Avaliação</h1>
		<p id="contactArea">
			<form name="avaliacaoAdd" method="post" action="avaliacaoAdd.do">
    	 		 <h:hidden property="method" value="adicionarAvaliacao"/>   
				<textarea id="elm1" name="avaliacao" rows="15" cols="80" style="width: 100%"  >
				</textarea>
				<br/><br/>
				<input type="submit" value="Salvar"  />
			</form>
		</p>
	</div>
	<div id="backgroundPopup"></div>
</body>
</html>