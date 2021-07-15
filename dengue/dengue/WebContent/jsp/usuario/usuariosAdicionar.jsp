<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../autenticacao.jsp"  flush="true"/>		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br"> 
<% String urlBase = request.getContextPath(); %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<head> 

		
		<%@ include file="/jsp/inc_header.jsp"%>

<link type="text/css" href="css/jquery.signature.css" rel="stylesheet" />
<style type="text/css">
.kbw-signature { width: 400px; height: 200px; }
</style>

		<link href="css/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="css/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
		
		<link href="css/menu.css" rel="stylesheet" type="text/css" />

		<script language="JavaScript" type="text/javascript" src="js/MascaraValidacao.js"></script>

		
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/getCep.js"></script>
        <script type="text/javascript" src="js/eye.js"></script>
        <script type="text/javascript" src="js/utils.js"></script>
        
        
        
		<link type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.0/themes/south-street/jquery-ui.css" rel="stylesheet" />
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.0/jquery-ui.min.js"></script>
        
        

<script type="text/javascript" src="js/jquery.signature.js"></script>
		   <script>
				  $(document).ready(function(){
					  
					  var elements = document.getElementsByTagName("INPUT");
					    for (var i = 0; i < elements.length; i++) {
					        elements[i].oninvalid = function(e) {
					            e.target.setCustomValidity("");
					            if (!e.target.validity.valid) {
					                e.target.setCustomValidity("Campo Obrigatório");
					            }
					        };
					        elements[i].oninput = function(e) {
					            e.target.setCustomValidity("");
					        };
					    }
					    
					    elements = document.getElementsByTagName("SELECT");
					    for (var i = 0; i < elements.length; i++) {
					        elements[i].oninvalid = function(e) {
					            e.target.setCustomValidity("");
					            if (!e.target.validity.valid) {
					                e.target.setCustomValidity("Campo Obrigatório");
					            }
					        };
					        elements[i].oninput = function(e) {
					            e.target.setCustomValidity("");
					        };
					    }
					    
					    $('#sig').signature({guideline: true});
						$('#clear').click(function() {
							$('#sig').signature('clear');
						});
						
				  });
				  </script>
		<script type="text/javascript">
	    
	    	function usuarioDescricao(){

				var restricao = document.getElementById('restricaoAcesso');
				var indice = restricao.selectedIndex;
				var conselho = document.getElementById('conselho');
				var div = document.getElementById('descricaoTipoUsuario');
				
				if(indice == 0){
					conselho.setAttribute('style','visibility:visible;');
					div.innerHTML = '<b style="color:#66CC33; font-size: 10px;">Descri&ccedil;&atilde;o Professor:</b><br /><div style="font-size: 10px;">Cadastrar, visualizar e avaliar todos os dados inseridos por todos os alunos.</div>';
				}else if(indice == 1){
					conselho.setAttribute('style','visibility:visible;');
					div.innerHTML = '<b style="color:#66CC33;font-size: 10px">Descri&ccedil;&atilde;o Enfermeiro:</b><br /><div style="font-size: 10px;"> Cadastrar, inserir, avaliar e sistematizar os dados do pacientes.</div>';
				}else if(indice == 2){
					conselho.setAttribute('style','visibility:hidden;');
					div.innerHTML = '<b style="color:#66CC33; font-size: 10px">Descri&ccedil;&atilde;o Aluno Laboratório:</b><br /><div style="font-size: 10px;"> Cadastrar, visualizar, admitir, re-admitir, evoluir e dar alta a pacientes fict&iacute;cios.</div>';
				}else if(indice == 3){
					conselho.setAttribute('style','visibility:hidden;');
					div.innerHTML = '<b style="color:#66CC33;font-size: 10px">Descri&ccedil;&atilde;o Aluno Enfermaria:</b><br /><div style="font-size: 10px;"> Cadastrar, inserir, avaliar e sistematizar os dados do pacientes.</div>';
				}
				
			}
	    </script>

		
        <script type="text/javascript">
        	function navegacao(){
	        	var div = window.top.document.getElementById('dadosPaciente');
	        	div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}';
	
	        	var divnavegacao = window.top.document.getElementById('navegacao');
	        	divnavegacao.innerHTML = "<a href='<%=urlBase%>'>Home </a> :: <a href='#'>Usuários Adicionar</a>";
        	}
        	
        	
        	function selecionouPais(){
        		var cod = $('#pais').val();

        		if(cod != '1058'){
        			$('#estado').attr("disabled","disabled");
        			$('#cidade').attr("disabled","disabled");
        			$('#bairro').attr("disabled","disabled");
        		}else{
        			$('#estado').removeAttr("disabled");
        			$('#cidade').removeAttr("disabled");
        			$('#bairro').removeAttr("disabled");
        		}
        	}
        	
        	function salvarAssinatura(){
        		var assInput = document.getElementById("assinatura")
        		assInput.value = $('#sig').signature('toJSON');
        		if(assInput.value != null){
        			return true;
        		}else{
	        		return false;
        		}
        	}
        </script>
		
		 
</head>
<body>
<%@ include file="/jsp/inc_topo.jsp"%>

<div align='center' id="main-content"  style="background-image: none !important;" >
		
		<jsp:include page="../menu.jsp"  flush="true"/>	
        
		
		<div style="margin-top:15px;">
					
				<div id="conteudo" align="center" style="height:700px;">
         
						<div id="erroMsg">
               <font color="red"> <h:errors/></font>
               <font color="red"> 
              		${mensagem}
				</font>
                <br /><br />
            </div>
			<h:form action="usuarioAdd" style=" width:80%;"  onsubmit="return salvarAssinatura()" method="POST">
                 <h:hidden property="method" value="usuarioAdd"/>   
                 <input type="hidden" value="usuarioAdd" name="acao"></input>
                   <div style="width:906px;"><h4 align="left" style="">Cadastro Investigador</h4></div>
         
                    <table style="margin-left:30px;">
                        <tr>
                            <td width="900" style="width:900px;">
                                <div style="float:left;">
                                    <font face="Arial">
                                        Nome
                                        <font color="red">
                                            *
                                        </font>
                                    </font>
                                    <input size="80" name="nome" maxlength="150" value="<c:out value="${usuarioRet.nome}"></c:out>" required />
                                </div>
                                
                                <div style="float:left;">
                                    <font face="Arial">
                                        Sexo
                                        <font color="red">
                                            *
                                        </font>
										<select id="sexo" name="sexo" required>
											<option value="Feminino" <c:if test="${usuarioRet.sexo == 'Feminino'}">selected="selected"</c:if>>Feminino</option>
                                            <option value="Masculino" <c:if test="${usuarioRet.sexo == 'Masculino'}">selected="selected"</c:if>>Masculino</option>
										</select>
                                    </font>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:900px;padding-top:10px;">
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        CPF
                                        <input size="15" id="cpf" name="cpf" maxlength="14" value="<c:out value="${usuarioRet.cpf}"></c:out>" onblur="validarCampo(this);" onkeypress=" return keyPress(event, this);"/>
                                    </font>
                                </div>
								<div style="float:left;">
                                    <font face="Arial">
                                        Telefone
										<input id="telefone" name="telefone" size="14" onkeypress="return isNumberKey(event)" value="<c:out value="${usuarioRet.telefone}"></c:out>" maxlength="14"  />
                                    </font>
                                </div>
                                <div style="float:left;">
                                    <font face="Arial">
                                        Celular
										<input id="celular" name="celular"  size="14" onkeypress="return isNumberKey(event)" value="<c:out value="${usuarioRet.celular}"></c:out>" maxlength="14"  />
                                    </font>
                                </div>
                                 <div style="float:left;">
                                    <font face="Arial">
                                        Email
                                        <font color="red">
                                            *
                                        </font>
										<input id="email" name="email" size="30" value="<c:out value="${usuarioRet.email}"></c:out>" maxlength="50"  required />
                                    </font>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:10px;">
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        CEP
                                        <input onblur="getEndereco();"  onkeypress="return isNumberKey(event)"  id="cep" maxlength="9" size="20" name="cep" value="<c:out value="${usuarioRet.residencia.logradouro.cep}"></c:out>" />
                                    </font>
                                </div>
								<div style="float:left;margin-right: 10px;">
									<img id="loader" style="visibility:hidden;width:16px; heigth:16px;" src="images/ajax-loader.gif" alt="loading" />
									<input type="button" value="Verificar" />
								</div>
								<div style="float:left;margin-right: 10px;">
									<a href="http://www.correios.com.br/"><u>N&atilde;o sabe o seu CEP? Consulte aqui</u></a>  
								</div>
								
								<div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        N&uacute;mero
                                        <font color="red">
                                            
                                        </font>
                                        <input size="7" name="numero" id="numero" value="<c:out value="${usuarioRet.residencia.numero}"></c:out>" />
                                    </font>
                                </div>
                                
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Comp.
                                        <font color="red">
                                            
                                        </font>
                                        <input size="7" id="complemento" name="complemento" value="<c:out value="${usuarioRet.residencia.numero}"></c:out>" />
                                    </font>
                                </div>
							</td>
						</tr>
                          <tr>
                        	<td style="padding-top:10px;">
                             <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Pais
                                        <font color="red">
                                            *
                                        </font>
                                        <select id="pais" name="pais" onchange="selecionouPais()" required>
                                        	<option value=""><c:out value="SELECIONE"></c:out></option>
                                        	<c:forEach items="${paises}" var="pais" varStatus="index">
	                                            <option value="${pais.numeroCodificacao}"  <c:if test="${usuarioRet.residencia.pais.numeroCodificacao == pais.numeroCodificacao}">selected="selected"</c:if>><c:out value="${pais.nome}"></c:out></option>
                                        	</c:forEach>
                                        												
                                        </select>
                                    </font>
                                </div>
                                
                                
                                
                            </td>
                        </tr>
                        
                       <tr>
							<td style="padding-top:10px;">
                                
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Estado
                                        <font color="red">
                                            *
                                        </font>
                                        <select id="estado" name="estado" onchange="listarCidades()" required>
                                         <option value=""><c:out value="SELECIONE"></c:out></option>
                                        	<c:forEach items="${estados}" var="estado" varStatus="index">
                                        	
	                                            <option value="${estado.codigo}" <c:if test="${usuarioRet.residencia.estado.codigo == estado.codigo}">selected="selected"</c:if> ><c:out value="${estado.descricao}"></c:out></option>
                                        	</c:forEach>
                                        												
                                        </select>
                                    </font>
                                </div>
                          		 <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Cidade
                                        <font color="red">*
                                        </font>
                                        <select id="cidade" name="cidade" onchange="listarBairros()" required>
                                        	<option value=''>SELECIONE</option>
                                        	
                                        	<c:forEach items="${cidades}" var="cidade" varStatus="index">
                                        	
	                                            <option value="${cidade.codigo_cidade}" <c:if test="${usuarioRet.residencia.cidade.codigo_cidade == cidade.codigo_cidade}">selected="selected"</c:if>><c:out value="${cidade.descricao}"></c:out></option>
                                        	</c:forEach>
                                        </select>
                                        
                                    </font>
                                </div>
                           </tr>
                           
                        <tr>
                            <td style="padding-top:10px;">
                            	<div style="float:left;">
                                    <font face="Arial">
                                        Bairro
                                        <font color="red">
                                            *
                                        </font>
                                        
                                         <select id="bairro" name="bairro" required>
                                        	<option value=''>SELECIONE</option>
                                        	<c:forEach items="${bairros}" var="bairro" varStatus="index">
                                        	
	                                            <option value="${bairro.codigo}" <c:if test="${usuarioRet.residencia.logradouro.bairro.codigo == bairro.codigo}">selected="selected"</c:if>><c:out value="${bairro.descricao}"></c:out></option>
                                        	</c:forEach>
                                        </select>
                                        
                                        
                                    </font>
                                </div>
                               
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Endere&ccedil;o
                                        <font color="red">
                                            
                                        </font>
                                        <input id="rua" size="45" name="endereco" value="<c:out value="${usuarioRet.residencia.logradouro.rua}"></c:out>" />
                                    </font>
                                </div>
                                
                                
                            </td>
                        </tr>
                        
						
                      
                        <tr>
                            <td style="padding-top:10px;">
                                <div>
                                    <font face="Arial">
                                        Ponto de 
                                        refer&ecirc;ncia
                                        <input size="94" name="pto_referencia" value="<c:out value="${usuarioRet.residencia.referencia}"></c:out>" />
                                    </font>
                                </div>
                            </td>
                        </tr>
                        
						<tr>
							<td>
								<div>
									Login 
									<font color="red">
		                                *
		                            </font>
		                            <input type="text" size="10" name="login" value="<c:out value="${usuarioRet.login}"></c:out>" required/> 
									Senha
									<font color="red">
		                                *
		                            </font>
		                            <input type="password" size="10" name="senha" required/>
									Confirmar Senha
									<font color="red">
		                                *
		                            </font>
		                            <input type="password" size="10" name="confirmasenha" required/>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div style="width: 150px;">
									Assinatura<font color="red">*</font>
								</div>
								<div>
									<div id="sig"></div>
									<p style="clear: both;"><button id="clear">Limpar Assinatura</button></p>
									<input type="hidden" id="assinatura" name="assinatura" value=""/>
								</div>
							</td>
						</tr>
						<tr>
                            <td>
                                <font color="red" size="1">
                                    *Campos obrigat&oacute;rios
                                </font>
                            </td>
                        </tr>
						
                    </table>
                    <p align="center">
                    	<h:submit value="Salvar"/> &nbsp;
						<h:reset value="Limpar"/>
                    </p>
                </h:form>
		 
		 
              </div>
			   
                </div>

		
</div>



<%@ include file="/jsp/inc_rodape.jsp"%>
</body>
</html>