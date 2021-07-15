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
			
		
 		 <script type="text/javascript">
        	
            
        	function horizontal(){
                
        		
                var navItems = document.getElementById("menu_dropdown").getElementsByTagName("li");
                
                for (var i = 0; i < navItems.length; i++) {
                    if (navItems[i].className == "submenu") {
                        if (navItems[i].getElementsByTagName('ul')[0] != null) {
                            navItems[i].onmouseover = function(){
                                this.getElementsByTagName('ul')[0].style.display = "block";
                                this.style.backgroundColor = "#f9f9f9";
                            }
                            navItems[i].onmouseout = function(){
                                this.getElementsByTagName('ul')[0].style.display = "none";
                                this.style.backgroundColor = "#FFFFFF";
                            }
                        }
                    }
                }
                
            }
            
            function vertical(){
            
            	
                var navItems = document.getElementById("nav_atendimentos").getElementsByTagName("li");
                
                for (var i = 0; i < navItems.length; i++) {
                    if (navItems[i].className == "submenu") {
                        navItems[i].onmouseover = function(){
                            this.getElementsByTagName('ul')[0].style.display = "block";
                            this.style.backgroundColor = "#f9f9f9";
							
                        }
                        navItems[i].onmouseout = function(){
                            this.getElementsByTagName('ul')[0].style.display = "none";
                            this.style.backgroundColor = "#FFFFFF";
                        }
                    }
                }
                
                
            }
            function redirecionar(){
				var frame = document.getElementById('content');
				frame.src = "atendimento.do?method=mostrarTelaAdmissaoQueixa";
            }
        </script>
		 <script type="text/javascript">
            function addRow(){
				var doenca = document.getElementById("doenca").value;
				var familiar = document.getElementById("familiar").value;
				
				if (doenca != "") {
					//tabBody = document.getElementsByTagName("TBODY").item(0);
					tabBody = document.getElementById("listagemAntecedentes");
					row = document.createElement("TR");
					cell1 = document.createElement("TD");
					cell2 = document.createElement("TD");
					textnode1 = document.createTextNode(familiar);
					textnode2 = document.createTextNode(doenca);
					cell1.appendChild(textnode1);
					cell2.appendChild(textnode2);
					row.appendChild(cell1);
					row.appendChild(cell2);
					tabBody.appendChild(row);
					
					document.getElementById("div_tabela").style.visibility = "visible";
					atualizarHeredrograma();

					var parentes = document.getElementById("parentes");
					var patologias = document.getElementById("patologias");

					parentes.value += familiar+";";
					patologias.value += doenca+";";
					
				}
            }
			
			function atualizarHeredrograma(){
				var doenca = document.getElementById("doenca").value;
				var familiar = document.getElementById("familiar").value;
				
				var heredrograma = document.getElementById("tbHeredrograma");
			}
			
			function removerRow(){
				table = document.getElementById("tabela");		
				var qtdLinhas = table.rows.length;		
				
				if(qtdLinhas > 2){					
					table.deleteRow(qtdLinhas - 1);

					var parentes = document.getElementById("parentes").value;
					var patologias = document.getElementById("patologias").value;

					var splitParentes = parentes.split(";");
					var splitPatologias = patologias.split(";");

					var i = 0;
					patologias = "";
					parentes = "";
					for(i = 0; i < splitPatologias.length-2; i++){
					 	patologias += splitPatologias[i] + ";";
					 	parentes += splitParentes[i] + ";";
					}

					document.getElementById("parentes").value = parentes;
					document.getElementById("patologias").value = patologias ;
					
				}else{
					table.deleteRow(qtdLinhas - 1);
					document.getElementById("div_tabela").style.visibility="hidden";
				}
			}
        </script>
		
		 <script type="text/javascript">
        	function navegacao(){
	        		//var div = window.top.document.getElementById('dadosPaciente');
		        //	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		       // 	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Responsável: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<a style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar'>Pacientes Buscar</a> :: <a style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"'>Atendimentos Paciente</a>" + " :: <a style='color: white;text-decoration: none;' href='#'>Antecedentes Familiares</a>";
      		}
        </script> 
			
			
		 
				  
				  
</head>
<body onload="navegacao();"> 
<%@ include file="/JSPs/inc_topo.jsp"%>

<div align='center' id="main-content" style="background-image: none !important;" >
		
		<jsp:include page="../../../menu.jsp"  flush="true"/>	
        
		
		<div style="">
				
				
    	<div id="conteudoNormal" align="center" style="height:750px">
               				
               				
               	 <jsp:include page="../menu-atendimentos.jsp"  flush="true"/>				
               				
				
				
		 <div id="conteudoNormal" align="left" style="height:700px; display:inline-block;">
		 
		 
		 <c:if test="${atendimento.assinar == true }">
<div class="desabilitar-form" style="height:700px;"></div>	
</c:if>    
                <p id="titulo-verm" style='' align="left">::Antecedentes Familiares</p>
  				 <div class="sessao"></div>
  				 <div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			            </div>
				<br />
				Parente: <select id="familiar">
					<option value="Mãe">M&atilde;e</option>
					<option value="Pai">Pai</option>
					<option value="Filho">Filho</option>
					<option value="Filha">Filha</option>
					<option value="Avó Paterno">Av&oacute; Paterno</option>
					<option value="Avô Paterno">Avô Paterno</option>
					<option value="Avó Materno">Av&oacute; Materno</option>
					<option value="Avô Materno">Avô Materno</option>
					<option value="Tio">Tio</option>
					<option value="Tia">Tia</option>
					<option value="Primo">Primo</option>
					<option value="Prima">Prima</option>
				</select>
				Patologia: <input id="doenca" type="text" size="50" />
				<input type="button" value="Adicionar" onclick="addRow();" />
				
                <div id="div_tabela" align="center" style="visibility:visible">
                   <br /><br />
                    <table id="tabela" class="tabela" align="center">
                    	<thead>
	                        <tr>
	                            <th>
	                                Parente
	                            </th>
	                            <th>
	                                Patologia
	                            </th>
	                        </tr>
                    	</thead>
                    	<tbody id="listagemAntecedentes">
		                   	<c:forEach items="${antecedentesFamiliares}" var="antecedentes" varStatus="index">
			                        <tr>
			                        	<td>
			                        		<c:out value="${antecedentes.parente}"></c:out>
			                        	</td>
			                        	<td>
			                        		<c:out value="${antecedentes.patologia}"></c:out>
			                        	</td>
			                        </tr>
		                    </c:forEach>
						</tbody>
                    </table>
                    <br/>
					<input type="button" value="Remover" onclick="removerRow();" />
                   
                </div>
				
				<br /><br />
				<div style="margin-left: 50px; margin-top: 50px;" > 
			<h:form action="antFamiliares">
    	 		 <h:hidden property="method" value="antFamiliaresSalvar"/>    
						<input type="hidden" name="parentes" id="parentes" value="<c:out value="${parentes}"></c:out>"/>
						<input type="hidden" name="patologias" id="patologias" value="<c:out value="${patologias}"></c:out>"/>
						<input type="submit" name="save" value="Salvar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if>/>
						<input type="reset" name="reset" value="Cancelar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if>/>
			<br />	<c:if test="${atendimento.assinar == true }">
						 	<b>Assinado por:</b> <c:out value="${atendimento.usuarioAssinou.nome}"></c:out>
						 	<br /><br />
						 	<b>Data de Assinatura:</b> <c:out value="${atendimento.dataHoraAssinatura}"></c:out>
						 </c:if>
				</h:form>
				</div>
		 
		 
		 
         </div>
         
            </div>

               	
                </div>

		
</div>



<%@ include file="/JSPs/inc_rodape.jsp"%>

</body>
</html>