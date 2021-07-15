<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

  <jsp:include page="../../../inc_header.jsp"  flush="true"/>
  
  
    <script language="JavaScript" type="text/javascript" src="js/popup.js" ></script>
    <script type="text/javascript" src="js/jquery.autocomplete.js"></script>
	
        <link rel="stylesheet" href="css/popup.css" type="text/css" media="screen" />	
        
        
		 <link rel="stylesheet" href="css/jquery.autocomplete.css" type="text/css" />	
 		 
  <script type="text/javascript">
	  function adicionarDiagnostico(){
				
			
			var determinante = document.getElementById("determinante");
			var justificativa = document.getElementById("justificativa");
			
			var tbody = document.getElementById('determinantes-tbody');
			
			var row = document.createElement("tr");
		 	var cell1 = document.createElement("td");    
		 	var cell2 = document.createElement("td");  
		 	var cell3 = document.createElement("td");   
          
		 	var index = tbody.getElementsByTagName('tr').length;
		 	cell1.innerHTML = determinante.value;  
		 	cell2.innerHTML = justificativa.value;  
            var a = document.createElement('input');
            a.type = "button";
            a.value = "Remover";
            row.id = "row-"+index;
            a.setAttribute("onclick","removerDeterminante("+index+");");
            var hidden = document.createElement('input');
            hidden.type ="hidden";
            hidden.name ="determinantes";
            hidden.value=determinante.value+"##"+justificativa.value;
            cell3.setAttribute("align","center");
            cell3.appendChild(a);
            cell3.appendChild(hidden);
            
            row.appendChild(cell1);
            row.appendChild(cell2);
            row.appendChild(cell3);
   			
            tbody.appendChild(row);
            
            disablePopup();
            
            determinante.value = "";
            justificativa.value = "";
	}
			
		function removerDeterminante(index){
				
			var row = document.getElementById("row-"+index);
			row.parentNode.removeChild(row);
		}
		
		function avancarHipoteses(){
			
			var form = document.forms[0];
			form.action = "/pensae2/salvarHipoteses.do";
			form.method.value = "avancarHipoteses";
			form.submit();
		}
		
		function procurarTermo(retorno , eixo){
			
			var url ="mostrarTelaProcurarTermo.do?method=mostrarTelaProcurarTermo&retorno="+retorno+"&eixo="+eixo;
			var newwindow= window.open(url,'Procurar Termo','height=700,width=750');
			if (window.focus) {newwindow.focus()}
			return false;
			
		}
	</script>
	
	  <script>
	  $(document).ready(function(){
	     	$("#termoautocomplete").autocomplete("autocomplete?eixo=Foco",
	     			{
	     		delay:10,
	     		minChars:3,
	     		matchSubset:1,
	     		matchContains:1,
	     		cacheLength:10,
	     		autoFill:true
		  });
	     	$("#termo2autocomplete").autocomplete("autocomplete?eixo=Foco",
	     			{
	     		delay:10,
	     		minChars:3,
	     		matchSubset:1,
	     		matchContains:1,
	     		cacheLength:10,
	     		autoFill:true
		  });
	     	
	     	$("#termo3autocomplete").autocomplete("autocomplete?eixo=Acao",
	     			{
	     		delay:10,
	     		minChars:3,
	     		matchSubset:1,
	     		matchContains:1,
	     		cacheLength:10,
	     		autoFill:true
		  });
	     	

	     	$("#termo4autocomplete").autocomplete("autocomplete?eixo=Acao",
	     			{
	     		delay:10,
	     		minChars:3,
	     		matchSubset:1,
	     		matchContains:1,
	     		cacheLength:10,
	     		autoFill:true
		  });
	  });
	  </script>
	  
	  <script type="text/javascript">
	  		function editarDiagnosticoFuncao(index){
	  			
	  			var form = document.forms['editarDiagnostico'];
	  			var cipe = document.getElementById("cipe-"+index);
	  			var cipeId = document.getElementById("cipe-id-"+index);
	  			var cipeDesc = document.getElementById("cipe-desc-"+index);
	  			
	  			var determinante = document.getElementById("determinante-"+index);
	  			var textoComplementar = document.getElementById("textoComplementar-"+index);
	  		
	  			form.texto.value = textoComplementar.innerHTML;
	  			form.termo2autocomplete.value = cipe.innerHTML;
	  			document.getElementById('determinante2-descricao').innerHTML = cipeDesc.innerHTML;
	  			form.idtermo2autocomplete.value = cipeId.innerHTML;
	  		//	form.determinante.value = determinante.innerHTML;
	  			
	  			var selecionadoIndex = 0;
	  			for (var i=0; i<form.determinante.length; i++){
	  			  	var option = form.determinante.options[i];
	  			  	
	  			  	if(parseInt(option.value) == parseInt(determinante.innerHTML.trim())){
	  			  		selecionadoIndex = i;					  			  
			  		  }
		  		  }
	  			
	  			form.determinante.selectedIndex = selecionadoIndex;
	  			
	  			form.idDiagnostico.value = index;
	  			
	  			centerPopup2();
	  			loadPopup2();
	  			
	  		}
	  		
			function editarMetaDiagnosticoFuncao(indexMeta, indexDiagn){
	  			
	  			var form = document.forms['editarMetaDiagnostico'];
	  			var meta = document.getElementById("meta-"+indexMeta);
	  		
	  			form.meta.value = meta.innerHTML;
	  			form.idMetaDiagnostico.value = indexMeta;
	  			form.idDiagnostico.value = indexDiagn;
	  			
	  			centerPopup4();
	  			loadPopup4();
	  			
	  		}
	  		
	  		function adicionarMetaFuncao(index){
	  			var form = document.forms['adicionarMetaDiagnostico'];
	  			form.idDiagnostico.value = index;
	  			centerPopup3();
	  			loadPopup3();
	  		}
  		 </script>
	  		  
	  <script type="text/javascript"> 		
	  		function adicionarIntervencaoFuncao(indexMeta, indexDiagn){
	  			var form = document.forms['adicionarIntervencaoDiagnostico'];
	  			form.idMetaDiagnostico.value = indexMeta;
	  			form.idDiagnostico.value = indexDiagn;
	  			centerPopup5();
	  			loadPopup5();
	  		}
	  		
			function editarIntervencaoDiagnosticoFuncao(indexIntervencao, indexMeta, indexDiagn){
	  			
	  			var form = document.forms['editarIntervencaoDiagnostico'];
	  			
	  			var cipeInter = document.getElementById("cipeInter-"+indexIntervencao);
	  			
	  			var cipeInterId = document.getElementById("cipeInter-id-"+indexIntervencao);
	  			var cipeInterDesc = document.getElementById("cipeInter-desc-"+indexIntervencao);
	  			
	  			var textoComplementarInter = document.getElementById("textoComplementarInter-"+indexIntervencao);
	  		
	  			form.termo4autocomplete.value = cipeInter.innerHTML;
	  			form.texto.value = textoComplementarInter.innerHTML;
	  			form.idIntervencaoDiagnostico.value = indexIntervencao;
	  			form.idMetaDiagnostico.value = indexMeta;
	  			form.idDiagnostico.value = indexDiagn;
	  			
	  			document.getElementById('determinante4-descricao').innerHTML = cipeInterDesc.innerHTML;
	  			form.idtermo4autocomplete.value = cipeInterId.innerHTML;
	  			
	  			centerPopup6();
	  			loadPopup6();
	  			
	  		}
			
			function apagarProcurarTermo(retorno){
				
				var inputTermo = document.getElementById(retorno+"-termo");
				var inputIdTermo = document.getElementById(retorno+"-id-termo");
            	var inputDescricao = document.getElementById(retorno+"-descricao");
            	inputTermo.value = "";
            	inputIdTermo.value = "";
            	inputDescricao.innerHTML = "";
			}
	</script>
	  
	
</head>
<body>

<div id="container">

	  <jsp:include page="../inc_topo_curso.jsp"  flush="true"/>
    
    <div id="middle">    
		<div id="middle_align" style="overflow:visible !important;">

            <div id="wrapper" class='logado caso'>
        	  <h3 class="bread">CR<c:out value="${matricula.curso.id}"></c:out> > EC<c:out value="${arcoMaguerez.estudoDeCaso.id}"></c:out> > asdadasHipóteses de Solução</h3>

               <jsp:include page="inc_topo_estudo_caso.jsp"  flush="true"/>  
                
            	<c:if test="${arcoMaguerez.faseDoArco > 3}"><div class="desabilitar-form" style="height:100%;"></div>	</c:if>
            	
               		
                	<div class="help">
                                <h3 class="arco hipotese"> Hipóteses de Solução</h3>
                              Nesta quarta etapa do método do Arco ("Hipótese de Solução") você deverá pensar de forma crítica e reflexiva nas possíveis soluções para o problema. Construa o Plano de Cuidados de Enfermagem, selecionando os diagnósticos de maior acurácia, metas e intervenções de Enfermagem.
	                	 </div>
                	<br /> 
				<h3>Plano de Cuidados de Enfermagem</h3>
				 <input type="button" value="Selecionar Determinante" id="button"/>
				
				<h:form action="salvarHipoteses" >
					<h:hidden property="method" value="salvarHipoteses"/>
	              	<table >
	              		<thead>
			            	<tr>
			                	<th>Determinante</th>
			                    <th>Diagnóstico<span style="color: #C0C0C0   !important;">[Eixo]</span></th>
			                    <th>Diagnóstico<span style="color: #C0C0C0  !important;">[Texto Complementar]</span></th>
			                    <th>Metas</th>
			                    <th>Intervenções</th>
			                   <!--  <th>Ação</th> -->
			                </tr>
		                </thead>
		                <tbody id="determinantes-tbody">
		                 	<c:forEach items="${diagnosticos}" var="diagnostico" varStatus="index">
				            	<tr id='row-<c:out value="${index.index}"/>'>
				                	<td>
				                		<table>
				                			<tr style="border: 0 !important;">
				                				<td>
							                		<div>
								                		<c:out value="${diagnostico.determinante.titulo}"></c:out>
								                		<div style="display:none;" id='determinante-<c:out value="${diagnostico.id}"></c:out>'>
								                			<c:out value="${diagnostico.determinante.id}"></c:out>
								                		</div>
							                		</div>
				                				</td>
				                				<%-- <td>
							                		<div id="member" style="height: 20px !important; padding: 0px !important; float:none !important;">
										                	<ul style="padding: 0px !important;">
										                    	<li>
										                			<div class="acoes-pen"></div>
										                        	<span style="padding: 0px !important;margin-top: -10px;"></span>
										                            <ul style="padding: 0px !important;">
										                            	<li>[DG<c:out value="${diagnostico.id}"></c:out>]</li>
										                            	<li><a href="javascript:void(0);" onclick="adicionarMetaFuncao('${diagnostico.id}');">Adicionar Meta</a></li>
										                            	<li><a href="javascript:void(0);" onclick="editarDiagnosticoFuncao('${diagnostico.id}');">Editar Diagnóstico</a></li>
										                            	<li><a href="removerDiagnostico.do?method=removerDiagnostico&idDiagnostico=${diagnostico.id}">Remover Diagnóstico</a></li>
										                            </ul>
										                        </li>
										                    </ul>
										                </div>
				                				</td> --%>
				                			</tr>
				                		</table>
			                		</td>
				                	<td>
				                		<table>
				                			<tr style="border: 0 !important;">
				                				<td align="right" style="padding-left: 20px;">
							                		<c:out value="${diagnostico.cipe.termo}"></c:out>
							                		<div style="display:none;" id='cipe-<c:out value="${diagnostico.id}"></c:out>' ><c:out value="${diagnostico.cipe.termo}"></c:out></div>
							                		<div style="display:none;" id='cipe-id-<c:out value="${diagnostico.id}"></c:out>' ><c:out value="${diagnostico.cipe.id}"></c:out></div>
							                		<div style="display:none;" id='cipe-desc-<c:out value="${diagnostico.id}"></c:out>' ><c:out value="${diagnostico.cipe.descricao}"></c:out></div>
				                				</td>
				                				<td align="left">
							                		<div id="member" style="width: 50px; height: 20px !important; padding: 0px !important; float:none !important;">
										                	<ul style="padding: 0px !important;">
										                    	<li>
										                    		<div style="position: relative; z-index:2;"><img src="imagens/icons/edit.png" /></div>
										                        	<span></span>
										                        	<ul style="padding: 10px !important; text-align: justify;">
										                            	<li> <c:out value="${diagnostico.cipe.descricao}"></c:out></li>
										                            	<li>
											                            	<div <c:if test="${arcoMaguerez.faseDoArco > 3}">style="display:none;"</c:if>>
												                            	<a class="tagASubmenu" href="javascript:void(0);" onclick="adicionarMetaFuncao('${diagnostico.id}');">Adicionar Meta</a><br />
												                            	<a class="tagASubmenu" href="javascript:void(0);" onclick="editarDiagnosticoFuncao('${diagnostico.id}');">Editar</a>
												                            	<a class="tagASubmenu" href="removerDiagnostico.do?method=removerDiagnostico&idDiagnostico=${diagnostico.id}">Remover</a>
										                        			</div>
										                            	</li>
										                            </ul>
										                        </li>
										                    </ul>
										                </div>
				                				</td>
				                			</tr>
				                		</table>
				                	</td>
				                	<td id="DIAGNOSTICO">
				                		<c:if test="${diagnostico.textoComplementar != ''}">
				                		<table>
				                			<tr style="border: 0 !important;">
				                				<td align="right">
							                		
				                				</td>
				                				<td align="left">
							                		<div id="member" style="width: 200px; height: 20px !important; padding: 0px !important; float:none !important;">
										                	<ul style="padding: 0px !important;">
										                    	<li>
										                    		<div><c:out value="${diagnostico.textoComplementarResumido}"></c:out></div>
										                        	<span></span>
										                        	<ul style="padding: 10px !important; text-align: justify; width: 250px;">
										                            	<li id='textoComplementar-<c:out value="${diagnostico.id}"></c:out>'><c:out value="${diagnostico.textoComplementar}"></c:out></li>
										                            </ul>
										                        </li>
										                    </ul>
										                </div>
				                				</td>
				                			</tr>
				                		</table>
				                		</c:if>
				                		<c:if test="${diagnostico.textoComplementar == ''}"><span id='textoComplementar-<c:out value="${diagnostico.id}"></c:out>' ></span></c:if>
				                	</td>
				                	<td id="META">
				                		<c:if test="${diagnostico.metas != null}">
				                		<c:forEach items="${diagnostico.metas}" var="meta" varStatus="index">
				                			<script>
				                			$(document).ready(function(){
				                				$('.metaClass-<c:out value="${meta.id}"></c:out>').mouseover(function() {
				                					$('.metaClass-<c:out value="${meta.id}"></c:out>').css( "color", "blue" );
				                				});
				                				$('.metaClass-<c:out value="${meta.id}"></c:out>').mouseout(function() {
				                					$('.metaClass-<c:out value="${meta.id}"></c:out>').css( "color", "gray" );
				                				});
				                				
				                			});
				                			</script>
					                		<table>
					                			<tr style="border: 0 !important;">
					                				<td align="right" class="metaClass-${meta.id}" style="position: relative; z-index:2;" >
								                		<c:out value="${meta.textoMetaResumido}"></c:out>
					                				</td>
					                				<td align="right">
								                		<div id="member" style="width: 50px; height: 20px !important; padding: 0px !important; float:none !important;">
											                	<ul style="padding: 0px !important;">
											                    	<li>
											                    		<div style="position: relative; z-index:2;"><img src="imagens/icons/edit.png" /></div>
											                        	<span></span>
											                        	<ul style="padding: 10px !important; text-align: justify; width: 250px; margin-left: -120px;">
											                        		<li>[MT<c:out value="${meta.id}"></c:out>]</li>
											                            	<li id='meta-<c:out value="${meta.id}"></c:out>'><c:out value="${meta.textoMeta}"></c:out></li>
											                            	<li>
											                        			<div <c:if test="${arcoMaguerez.faseDoArco > 3}">style="display:none;"</c:if>>
										                            				<a class="tagASubmenu" href="javascript:void(0);" onclick="adicionarIntervencaoFuncao('${meta.id}','${diagnostico.id}');">Adicionar Intervenção</a><br />
												                        			<a class="tagASubmenu" href="javascript:void(0);" onclick="editarMetaDiagnosticoFuncao('${meta.id}','${diagnostico.id}');">Editar</a>
										                            				<a class="tagASubmenu" href="removerMetaDiagnostico.do?method=removerMetaDiagnostico&idMetaDiagnostico=${meta.id}" >Remover</a>
											                        			</div>
										                        			</li>
											                            </ul>
											                        </li>
											                    </ul>
											                </div>
					                				</td>
					                			</tr>
					                		</table>
			                			</c:forEach>
				                		</c:if>
				                		
				                	</td>
				                	<td id="INTERVENCAO">
				                		<c:if test="${diagnostico.metas != null}">
				                		<c:forEach items="${diagnostico.metas}" var="meta" varStatus="index">
				                			<c:forEach items="${meta.intervencoes}" var="intervencao" varStatus="index2">
						                		<table>
						                			<tr style="border: 0 !important;">
						                				<td align="right" class="metaClass-${meta.id}"  style="position: relative; z-index:2;">
									                		<c:out value="${intervencao.cipe.termo}"></c:out>
									                		
									                		<div style="display:none;" id='cipeInter-id-<c:out value="${intervencao.id}"></c:out>' ><c:out value="${intervencao.cipe.id}"></c:out></div>
							                				<div style="display:none;" id='cipeInter-desc-<c:out value="${intervencao.id}"></c:out>' ><c:out value="${intervencao.cipe.descricao}"></c:out></div>
									                		
									                		<div style="display:none;" id='cipeInter-<c:out value="${intervencao.id}"></c:out>' ><c:out value="${intervencao.cipe.termo}"></c:out></div>
						                				</td>
						                				<td align="right">
									                		<div id="member" style="width: 50px; height: 20px !important; padding: 0px !important; float:none !important;">
												                	<ul style="padding: 0px !important;">
												                    	<li>
												                    		<div style="position: relative; z-index:2;"><img src="imagens/icons/edit.png" /></div>
												                        	<span></span>
												                        	<ul style="padding: 10px !important; text-align: justify; width: 250px; margin-left: -220px;">
												                        		<li>[IN<c:out value="${intervencao.id}"></c:out>] <c:out value="${intervencao.cipe.descricao}"></c:out></li>
												                        		<li>[MT<c:out value="${meta.id}"></c:out>] <c:out value="${meta.textoMeta}"></c:out></li>
												                        		<li>Texto Complementar:</li>
												                            	<li id='textoComplementarInter-<c:out value="${intervencao.id}"></c:out>'><c:out value="${intervencao.textoComplementar}"></c:out></li>
												                            	<li>
												                        			<div <c:if test="${arcoMaguerez.faseDoArco > 3}">style="display:none;"</c:if>>
													                        			<a class="tagASubmenu" href="javascript:void(0);" onclick="editarIntervencaoDiagnosticoFuncao('${intervencao.id}', '${meta.id}','${diagnostico.id}');">Editar</a>
											                            				<a class="tagASubmenu" href="removerIntervencaoDiagnostico.do?method=removerIntervencaoDiagnostico&idIntervencaoDiagnostico=${intervencao.id}" >Remover</a>
												                        			</div>
											                        			</li>
												                            </ul>
												                        </li>
												                    </ul>
												                </div>
						                				</td>
						                			</tr>
						                		</table>
				                			</c:forEach>
			                			</c:forEach>
				                		</c:if>
				                		
				                	</td>
				                	 <%-- <td align="center">
			                	 			<div id="member" style="height: 20px !important; padding: 0px !important; float:none !important;">
							                	<ul style="padding: 0px !important;">
							                    	<li>
							                    		<div class="acoes-pen"></div>
							                        	<span style="padding: 0px !important;margin-top: -10px;"></span>
							                            <ul style="padding: 0px !important;">
							                            	<li>[DG<c:out value="${diagnostico.id}"></c:out>]</li>
							                            	<li><a href="javascript:void(0);" onclick="adicionarMetaFuncao('${diagnostico.id}');">Adicionar Meta</a></li>
							                            	<li><a href="javascript:void(0);" onclick="editarDiagnosticoFuncao('${diagnostico.id}');">Editar Diagnóstico</a></li>
							                            	<li><a href="removerDiagnostico.do?method=removerDiagnostico&idDiagnostico=${diagnostico.id}">Remover Diagnóstico</a></li>
							                            </ul>
							                        </li>
							                    </ul>
							                </div>
				                	 </td> --%>
				                </tr>
		                	</c:forEach>
		                </tbody>
	                </table>
        		
		        		<table class="navegacao" style="position: relative; z-index:2;">
			            	<tr>
				             	 <td style="vertical-align: top;">
				               		<input type="button" value="Voltar"  onclick="window.location.href = 'teorizacao.do?method=mostrarTelaTeorizacao';" class="bt_voltar" />
				                </td>
				                <td class="space"></td>
				            	<td class="left">    
				                	<input type="button" value="Cancelar" onclick="window.location.href = 'hipoteses.do?method=mostrarTelaHipoteses';" class="bt_cancelar" class="left" />
				                </td>
				               <td class="right">
				                	<input type="submit" value="Salvar Dados" class="bt_salvar" class="right" />
			               		 </td>
				                <td class="space"></td>
				                 <td style="vertical-align: top;">
				        			<input type="button"  value="Avançar Fase" onclick="avancarHipoteses();" class="bt_avancar" class="left" />
				                </td>
			              </tr>
			            </table>
	            </h:form>
            </div><!-- /#wrapper -->
    	</div><!-- /#middle_align -->
					<div style="width: 100%; height: 300px;"></div>
    </div><!-- /#middle -->    
    
	<jsp:include page="../../../inc_rodape.jsp"  flush="true"/>
  
    
</div><!-- /#container -->

<div id="popupContact" style="position: absolute; top: 184.167px; left: 0px; display: none;">
		<a id="popupContactClose">sair</a>
		<h1>Adicionar Diagnóstico!</h1>
		<p id="contactArea">
			<h:form action="adicionarDiagnostico" >
				<h:hidden property="method" value="adicionarDiagnostico"/>
				Determinante:
				<select name="determinante" style="width: 600px;">
				<c:forEach items="${determinantesHipoteses}" var="determinante" varStatus="index">
						<option value="${determinante.id}"><c:out value="${determinante.titulo}"></c:out></option>
	   			</c:forEach>
				</select><br />
				<table border='0' style="border:none !important; font-size: 13px !important; color: black !important;">
					<tr style="border:none !important;">
						<td align="left" style="text-align:justify;">
							Termo do Eixo Foco:<br />
						</td>
					</tr>
					<tr style="border:none !important;">
						<td>
							<input id="determinante1-termo" name="termoautocomplete" disabled="disabled" style="width: 546px;"  /> <br />
							<input type="hidden"id="determinante1-id-termo"  name="idtermoautocomplete" value="" />
						</td>
						<td>
							<img style="margin-left: 10px; cursor:pointer;" onclick="procurarTermo('determinante1', 'Foco')" src="imagens/procurar.png" width="16px" height="16px" />
						</td>
					</tr>
					<tr style="border:none !important;">
						<td align="left"  style="background: #E8F2EB; " id="determinante1-descricao" >
							
						</td>
						<td>
							<img style="margin-left: 10px; cursor:pointer;" onclick="apagarProcurarTermo('determinante1')" src="imagens/trash.png" width="16px" height="16px" />
						</td>
					</tr>
				</table>
				<br />
				Texto Complementar:
				<textarea id="texto"  name="texto" style="width: 600px; height: 150px; "></textarea><br />
				<input type="submit" value="Adicionar Diagnóstico" />
			</h:form>
		</p>
</div>
<div id="backgroundPopup"></div>

<div id="popupContact2" style="position: absolute; top: 184.167px; left: 0px; display: none;">
		<a id="popupContactClose2">sair</a>
		<h1>Editar Diagnóstico!</h1>
		<p id="contactArea">
			<h:form action="editarDiagnostico" >
				<h:hidden property="method" value="editarDiagnostico"/>
				<h:hidden property="idDiagnostico" value=""/>
				Determinante:
				<select name="determinante" style="width: 600px;">
				<c:forEach items="${determinantesHipoteses}" var="determinante" varStatus="index">
						<option value="${determinante.id}"><c:out value="${determinante.titulo}"></c:out></option>
	   			</c:forEach>
				</select><br />
				
				<table border='0' style="border:none !important; font-size: 13px !important; color: black !important;">
					<tr style="border:none !important;">
						<td align="left" style="text-align:justify;">
							Termo do Eixo Foco:<br />
						</td>
					</tr>
					<tr style="border:none !important;">
						<td>
							<input id="determinante2-termo" name="termo2autocomplete" disabled="disabled" style="width: 546px;"  /> <br />
							<input type="hidden"id="determinante2-id-termo"  name="idtermo2autocomplete" value="" />
						</td>
						<td>
							<img style="margin-left: 10px; cursor:pointer;" onclick="procurarTermo('determinante2', 'Foco')" src="imagens/procurar.png" width="16px" height="16px" />
						</td>
					</tr>
					<tr style="border:none !important;">
						<td align="left"  style="background: #E8F2EB; " id="determinante2-descricao" >
							
						</td>
						<td>
							<img style="margin-left: 10px; cursor:pointer;" onclick="apagarProcurarTermo('determinante2')" src="imagens/trash.png" width="16px" height="16px" />
						</td>
					</tr>
				</table>
				
				<br />
				Texto Complementar:
				<textarea id="texto"  name="texto" style="width: 600px; height: 150px; "></textarea><br />
				<input type="submit" value="Editar Diagnóstico" />
			</h:form>
		</p>
</div>
	<div id="backgroundPopup2"></div>
	
<div id="popupContact3" style="position: absolute; top: 184.167px; left: 0px; display: none;">
		<a id="popupContactClose3">sair</a>
		<h1>Adicionar Meta!</h1>
		<p id="contactArea">
			<h:form action="adicionarMetaDiagnostico" >
				<h:hidden property="method" value="adicionarMetaDiagnostico"/>
				<h:hidden property="idDiagnostico" value=""/>
				Meta:
				<textarea id="meta"  name="meta" style="width: 600px; height: 150px; "></textarea><br />
				
				<input type="submit" value="Adicionar Meta" />
			</h:form>
		</p>
</div>
	<div id="backgroundPopup3"></div>
	
<div id="popupContact4" style="position: absolute; top: 184.167px; left: 0px; display: none;">
		<a id="popupContactClose4">sair</a>
		<h1>Editar Meta!</h1>
		<p id="contactArea">
			<h:form action="editarMetaDiagnostico" >
				<h:hidden property="method" value="editarMetaDiagnostico"/>
				<h:hidden property="idMetaDiagnostico" value=""/>
				<h:hidden property="idDiagnostico" value=""/>
				Meta:
				<textarea id="meta"  name="meta" style="width: 600px; height: 150px; "></textarea><br />
				
				<input type="submit" value="Editar Meta" />
			</h:form>
		</p>
</div>
	<div id="backgroundPopup4"></div>
	
	<div id="popupContact5" style="position: absolute; top: 184.167px; left: 0px; display: none;">
			<a id="popupContactClose5">sair</a>
			<h1>Adicionar Intervenção!</h1>
			<p id="contactArea">
				<h:form action="adicionarIntervencaoDiagnostico" >
					<h:hidden property="method" value="adicionarIntervencaoDiagnostico"/>
					<h:hidden property="idMetaDiagnostico" value=""/>
					<h:hidden property="idDiagnostico" value=""/>
					
					<table border='0' style="border:none !important; font-size: 13px !important; color: black !important;">
					<tr style="border:none !important;">
						<td align="left" style="text-align:justify;">
							Termo do Eixo Ação:<br />
						</td>
					</tr>
					<tr style="border:none !important;">
						<td>
							<input id="determinante3-termo" disabled="disabled" name="termo3autocomplete" style="width: 546px;"  /> <br />
							<input type="hidden"id="determinante3-id-termo"  name="idtermo3autocomplete" value="" />
						</td>
						<td>
							<img style="margin-left: 10px; cursor:pointer;" onclick="procurarTermo('determinante3', 'Acao')" src="imagens/procurar.png" width="16px" height="16px" />
						</td>
					</tr>
					<tr style="border:none !important;">
						<td align="left"  style="background: #E8F2EB; " id="determinante3-descricao" >
							
						</td>
						<td>
							<img style="margin-left: 10px; cursor:pointer;" onclick="apagarProcurarTermo('determinante3')" src="imagens/trash.png" width="16px" height="16px" />
						</td>
					</tr>
				</table>
					
					<br />
					Texto Complementar:
					<textarea id="texto"  name="texto" style="width: 600px; height: 150px; "></textarea><br />
					
					<input type="submit" value="Adicionar Intervenção" />
				</h:form>
			</p>
	</div>
	<div id="backgroundPopup5"></div>
	
<div id="popupContact6" style="position: absolute; top: 184.167px; left: 0px; display: none;">
			<a id="popupContactClose5">sair</a>
			<h1>Editar Intervenção!</h1>
			<p id="contactArea">
				<h:form action="editarIntervencaoDiagnostico" >
					<h:hidden property="method" value="editarIntervencaoDiagnostico"/>
					<h:hidden property="idIntervencaoDiagnostico" value=""/>
					<h:hidden property="idMetaDiagnostico" value=""/>
					<h:hidden property="idDiagnostico" value=""/>
					
					<table border='0' style="border:none !important; font-size: 13px !important; color: black !important;">
						<tr style="border:none !important;">
							<td align="left" style="text-align:justify;">
								Termo do Eixo Ação:<br />
							</td>
						</tr>
						<tr style="border:none !important;">
							<td>
								<input id="determinante4-termo" disabled="disabled" name="termo4autocomplete" style="width: 546px;"  /> <br />
								<input type="hidden"id="determinante4-id-termo"  name="idtermo4autocomplete" value="" />
							</td>
							<td>
								<img style="margin-left: 10px; cursor:pointer;" onclick="procurarTermo('determinante4', 'Acao')" src="imagens/procurar.png" width="16px" height="16px" />
							</td>
						</tr>
						<tr style="border:none !important;">
							<td align="left"  style="background: #E8F2EB; " id="determinante4-descricao" >
								
							</td>
							<td>
								<img style="margin-left: 10px; cursor:pointer;" onclick="apagarProcurarTermo('determinante4')" src="imagens/trash.png" width="16px" height="16px" />
							</td>
						</tr>
					</table>
					
					
					<br />
					Texto Complementar:
					<textarea id="texto"  name="texto" style="width: 600px; height: 150px; "></textarea><br />
					
					<input type="submit" value="Editar Intervenção" />
				</h:form>
			</p>
	</div>
	<div id="backgroundPopup6"></div>
</body>
</html>    