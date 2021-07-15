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
	<script type="text/javascript" src="jscripts/jquery.bgiframe.min.js"></script>
		<%@ include file="/JSPs/inc_header.jsp"%>
				  <script type="text/javascript" src="jscripts/jquery.autocomplete.js"></script>


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
		
 		 
			
		 <link rel="stylesheet" href="Css/jquery.autocomplete.css" type="text/css" />	
			
		 <script type="text/javascript">
            tinyMCE.init({
                mode: "textareas",
                theme: "simple"
            });
           </script>
           
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
                </script>
               <script type="text/javascript">
					function removerCid(id){
						var tabela = document.getElementById("demoTable");

				        var ultimaLinha = tabela.rows.length;
						
				    	for(var i = 0; i < ultimaLinha; i++){
							if(tabela.rows[i].id == ("rowCid_" + id)){
								tabela.deleteRow(i);
							}			
						}
				    	carregarCids();
					}

					function carregarCids(){
						var cids = document.getElementById("cids");

						var tabela = document.getElementById("demoTable");

				        var ultimaLinha = tabela.rows.length;
						
				    	for(var i = 0; i < ultimaLinha; i++){
					    	var rowId = tabela.rows[i].id;
					    	if(rowId.substr(0,7) == "rowCid_" ){
				    			cids.value += rowId.substr(7) + ";";
					    	}
						}
					}
					</script>
					 <script type="text/javascript">
					function addCid(id, cid, descricao){
						
						var cids = document.getElementById("cids");
						cids.value += id+";";

						var tabela = document.getElementById("demoTable");
						var tBody = tabela.getElementsByTagName('tbody')[0];
						var newRow = tBody.insertRow(0);

						var tdCid = document.createElement('td');
						var tdDescricao = document.createElement('td');
						var tdRemove = document.createElement('td');
						tdCid.innerHTML = cid;
						tdCid.align = "center";
						tdDescricao.innerHTML = descricao;
						tdDescricao.align = "center";
						tdRemove.innerHTML = '<img src="imagens/delete.png" width="16" height="16" border="0" style="cursor: pointer;" onclick="removerCid('+id+');"/>';
						tdRemove.align = "center";
						
						newRow.appendChild (tdCid);
						newRow.appendChild (tdDescricao);
						newRow.appendChild (tdRemove);
						
						
					}
               </script>
        
        <script type="text/javascript">
            function redirecionar(){
				var frame = document.getElementById('content');
				frame.src = "atendimento.do?method=mostrarTelaAdmissaoQueixa";
            }
        </script>
		
		 <script type="text/javascript">
        	function navegacao(){
	        //	var div = window.top.document.getElementById('dadosPaciente');
		     //   	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		      ///  	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Responsável: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<a style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar' target='conteudo'>Pacientes Buscar</a> :: <a style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"' target='conteudo'>Atendimentos Paciente</a>" + " :: <a style='color: white;text-decoration: none;' href='#'>Queixa da doença atual</a>";
        	}
        </script>
	
				  <script>
				  $(document).ready(function(){
				     	$("#autocomplete").autocomplete("autocomplete",
				     			{
				     		delay:10,
				     		minChars:2,
				     		matchSubset:1,
				     		matchContains:1,
				     		cacheLength:10,
				     		autoFill:true
					  });
				  });
				  </script>
				  
				  
				  
</head>
<body onload="navegacao();carregarCids();"> 
<%@ include file="/JSPs/inc_topo.jsp"%>

<div align='center' id="main-content" style="background-image: none !important;" >
		
		<jsp:include page="../../../menu.jsp"  flush="true"/>	
        
		
		<div style="">
				
				
    	<div id="conteudoNormal" align="center" style="height:1100px">
               				
               				
               	 <jsp:include page="../menu-atendimentos.jsp"  flush="true"/>				
               				
				
				
		 <div id="conteudoNormal" align="left" style="height:1000px; display:inline-block;">
		 
<c:if test="${atendimento.assinar == true }">
<div class="desabilitar-form" style="height:1000px;"></div>	
</c:if>
		 <div id="erroMsg">
               <font color="red"> <h:errors/></font>
               <font color="red"> 
              		${mensagem}
				</font>
            </div>
		 <h:form action="queixa" >
                 <h:hidden property="method" value="queixaSalvar"/>  
                 	<p id="titulo-verm" style='' align="left">::Queixa da Doença Atual</p>         
		 			<br />
				    	
                    <div class="titulo">Diagn&oacute;stico Médico Inicial (CID-10)</div>
  					<div class="sessao">
  					 <table id="demoTable" style="border: 1px solid #ccc;" cellspacing="0" width="700">
                       <thead>
               			 <tr>
	                       <th sort="cid">Cid</th>
                            <th sort="descricao">Descrição</th>
                            <th>Remover</th>
	                 	</tr>
	                 	</thead>
	                 
                   <tbody>
                   	<c:forEach items="${cids}" var="cid" varStatus="index">
                   		<tr id="rowCid_<c:out value="${cid.id }"></c:out>">
                            <td align="center">
                               ${cid.cid}
                            </td>
                            <td align="center">
                                ${cid.descricao}
                            </td>
                            <td style="cursor: auto;" align="center">
                            <a href="cidRemover.do?method=removerCid&id=<c:out value="${cid.id }"></c:out>" ><img src="imagens/delete.png" width="16" height="16" border="0" style="cursor: pointer;" /></a>
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
                    <input type="button" value="Adicionar" id="button"/>
                    <input type="hidden" name="cids" id="cids" value="" />
                    </div>
                    
                    <div class="titulo">Queixa Principal (Relato)</div>
  					<div class="sessao">
	                    <!-- Gets replaced with TinyMCE, remember HTML in a textarea should be encoded -->
	                    <br/>
	                    <textarea id="elm1" name="queixa" rows="15" cols="80" style="width: 600px;">
	                     <c:out value="${atendimento.queixa.queixaPrincipal}" ></c:out>
	                    </textarea>
                    </div>
                    <br/>
                    
                    
                    <br />
		 			<div class="titulo">Medica&ccedil;&otilde;es em uso</div>
  					<div class="sessao">
	                    <!-- Gets replaced with TinyMCE, remember HTML in a textarea should be encoded -->
	                    <br/>
	                    <textarea id="elm1" name="medicacoes" rows="10" cols="50" style="width: 600px;">
		                   <c:out value="${atendimento.queixa.medicacoes}" ></c:out>
	                    
	                    </textarea>
                    </div>
                    <br/>
                    <br/>
                    <div id="erroMsg">
		               <font color="red"> <h:errors/></font>
		               <font color="red"> 
		              		${mensagem}
						</font>
		            </div>
                      <input type="reset"  value="Cancelar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
                        <input type="submit" value="Salvar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
                        
                     <br />  <c:if test="${atendimento.assinar == true }">
						 	<b>Assinado por:</b> <c:out value="${atendimento.usuarioAssinou.nome}"></c:out>
						 	<br /><br />
						 	<b>Data de Assinatura:</b> <c:out value="${atendimento.dataHoraAssinatura}"></c:out>
						 </c:if>
                  </h:form>
         </div>
         
            </div>

               	
                </div>

		
</div>



<%@ include file="/JSPs/inc_rodape.jsp"%>

<div id="popupContact" style="position: absolute; top: 184.167px; left: 0px; display: none;">
		<a id="popupContactClose">sair</a>
		<h1>Adicionar Cid!</h1>
		<p id="contactArea">
			 <h:form action="cidAdd" >
              	<h:hidden property="method" value="cidAdd"/>   
				<input id="autocomplete" name="autocomplete" size="50"  /> 
				<br/><br/>
 				<input type="hidden" name="cidId" value="1"></input>
				<input type="submit" value="Adicionar"  />
				
			</h:form>
		</p>
	</div>
	<div id="backgroundPopup"></div>
</body>
</html>