<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../../autenticacao.jsp"  flush="true"/>		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br"> 
<% String urlBase = request.getContextPath(); %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<head> 


		<%@ include file="/JSPs/inc_header.jsp"%>

		<link href="Css/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="Css/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />

		
        <link href="Css/menu.css" rel="stylesheet" type="text/css" />
    
        <script language="JavaScript" type="text/javascript" src="jscripts/MascaraValidacao.js"></script>  
		<script type="text/javascript" src="jscripts/jquery.js"></script>
		<script type="text/javascript" src="jscripts/getCep.js"></script>
        <script type="text/javascript" src="jscripts/eye.js"></script>
        <script type="text/javascript" src="jscripts/utils.js"></script>
        
        
 		 <link rel="stylesheet" href="jquery-ui/css/ui-lightness/jquery-ui-1.10.1.custom.css" />
		  <script src="jquery-ui/js/jquery-1.9.1.js"></script>
		  <script src="jquery-ui/js/jquery-ui-1.10.1.custom.js"></script>
        
        

        <script type="text/javascript">
	    

        	function calculaIdade(){
				var inputDate = document.getElementById("inputDate").value;
				var nascimento = inputDate.split('/');
				var idade = calcular_idade(nascimento);
				document.getElementById("idade").value = idade;
            }

        	function calcular_idade( data_nasc ){

        		var dataHj = new Date();
        		dia = dataHj.getDate();
        		mes = dataHj.getMonth();
        		ano = dataHj.getFullYear();
				dataHj = dia +"/"+ mes +"/"+ ano;
        		data = dataHj.split('/');
        		
        		var anos = data[2] - data_nasc[2];
        		
        		if ( data_nasc[1] >= data[1] ){

	        		if ( data_nasc[0] <= data[0] ){
	        			return anos;
	        		}else{
		        		return anos-1;
	        		}
        		}else{
        			return anos;
        		}
       		}


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
	        	//var div = window.top.document.getElementById('dadosPaciente');
	        	//div.innerHTML = "<b>Usuário: </b>"+ '${usuario.nome}';
	
	        	var divnavegacao = window.top.document.getElementById('navegacao');
	        	divnavegacao.innerHTML = "<a style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a style='color: white;text-decoration: none;' href='#'>Usuários Adicionar</a>";
        	}
        </script>
		
		 
</head>
<body onload="navegacao(); usuarioDescricao();">
<%@ include file="/JSPs/inc_topo.jsp"%>

<div align='center' id="main-content" style="background-image: none !important;  " >


		
		<jsp:include page="../../menu.jsp"  flush="true"/>	
        
		<div id="conteudo" align="center" style="height:700px;">
       		<div id="erroMsg">
               <font color="red"> <h:errors/></font>
          		<div style='margin-top:30px;color:red;width:700px'>${mensagem}</div>
                <br /><br />
            </div>
			<h:form action="usuarioAdd" style=" width:80%;" >
                 <h:hidden property="method" value="usuarioAdd"/>   
                 <input type="hidden" value="usuarioAdd" name="acao"></input>
         			<p id="titulo-verm" style='margin-left: 200px;' align="left">Cadastro de Usu&aacute;rio</p>
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
                                    <input size="110" name="nome" maxlength="150" value="<c:out value="${usuarioRet.nome}"></c:out>" />
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
										<input id="telefone" name="telefone" size="38" value="<c:out value="${usuarioRet.telefone}"></c:out>" maxlength="14"  />
                                    </font>
                                </div>
                                <div style="float:left;">
                                    <font face="Arial">
                                        Sexo
                                        <font color="red">
                                            *
                                        </font>
										<select id="sexo" name="sexo">
											<option value="Feminino" <c:if test="${usuarioRet.sexo == 'Feminino'}">selected="selected"</c:if>>Feminino</option>
                                            <option value="Masculino" <c:if test="${usuarioRet.sexo == 'Masculino'}">selected="selected"</c:if>>Masculino</option>
										</select>
                                    </font>
                                </div>
                            </td>
                        </tr>
                       
                        <tr>
                            <td style="padding-top:10px;">
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Endere&ccedil;o
                                        <font color="red">
                                            *
                                        </font>
                                        <input id="rua" size="45" name="endereco" value="<c:out value="${usuarioRet.endereco.descricao}"></c:out>" />
                                    </font>
                                </div>
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        N&uacute;mero
                                        <font color="red">
                                            *
                                        </font>
                                        <input size="7" name="numero" value="<c:out value="${usuarioRet.endereco.numero}"></c:out>" />
                                    </font>
                                </div>
                                <div style="float:left;">
                                    <font face="Arial">
                                        Bairro
                                        <font color="red">
                                            *
                                        </font>
                                        <input id="bairro" name="bairro" size="21" value="<c:out value="${usuarioRet.endereco.bairro}"></c:out>" />
                                    </font>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:10px;">
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        CEP
                                        <input onblur="getEndereco();"  id="cep" maxlength="9" size="20" name="cep" value="<c:out value="${usuarioRet.endereco.cep}"></c:out>" />
                                    </font>
                                </div>
								<div style="float:left;margin-right: 10px;">
									<input type="button" value="Verificar" />
								</div>
								<div style="float:left;margin-right: 10px;">
									<a href="http://www.correios.com.br/"><u>N&atilde;o sabe o seu CEP? Consulte aqui</u></a>  
								</div>
							</td>
						</tr>
						<tr>
							<td style="padding-top:10px;">
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Cidade
                                        <font color="red">
                                            *
                                        </font>
                                        <input id="cidade" size="15" name="cidade" value="<c:out value="${usuarioRet.endereco.cidade}"></c:out>" />
                                    </font>
                                </div>
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Estado
                                        <font color="red">
                                            *
                                        </font>
                                        <select id="federacao" name="federacao">
                                            <option value="AC" <c:if test="${usuarioRet.endereco.estado == 'AC'}">selected="selected"</c:if>>AC</option>
                                            <option value="AL" <c:if test="${usuarioRet.endereco.estado == 'AL'}">selected="selected"</c:if>>AL</option>
                                            <option value="AM" <c:if test="${usuarioRet.endereco.estado == 'AM'}">selected="selected"</c:if>>AM</option>
                                            <option value="AP" <c:if test="${usuarioRet.endereco.estado == 'AP'}">selected="selected"</c:if>>AP</option>
                                            <option value="BA" <c:if test="${usuarioRet.endereco.estado == 'BA'}">selected="selected"</c:if>>BA</option>
                                            <option value="CE" <c:if test="${usuarioRet.endereco.estado == 'CE'}">selected="selected"</c:if>>CE</option>
                                            <option value="DF" <c:if test="${usuarioRet.endereco.estado == 'DF'}">selected="selected"</c:if>>DF</option>
                                            <option value="ES" <c:if test="${usuarioRet.endereco.estado == 'ES'}">selected="selected"</c:if>>ES</option>
                                            <option value="GO" <c:if test="${usuarioRet.endereco.estado == 'GO'}">selected="selected"</c:if>>GO</option>
                                            <option value="MA" <c:if test="${usuarioRet.endereco.estado == 'MA'}">selected="selected"</c:if>>MA</option>
                                            <option value="MG" <c:if test="${usuarioRet.endereco.estado == 'MG'}">selected="selected"</c:if>>MG</option>
                                            <option value="MS" <c:if test="${usuarioRet.endereco.estado == 'MS'}">selected="selected"</c:if>>MS</option>
                                            <option value="MT" <c:if test="${usuarioRet.endereco.estado == 'MT'}">selected="selected"</c:if>>MT</option>
                                            <option value="PA" <c:if test="${usuarioRet.endereco.estado == 'PA'}">selected="selected"</c:if>>PA</option>
                                            <option value="PB" <c:if test="${usuarioRet.endereco.estado == 'PB'}">selected="selected"</c:if>>PB</option>
                                            <option value="PE" <c:if test="${usuarioRet.endereco.estado == 'PE' || usuarioRet eq null}">selected="selected"</c:if>>PE</option>
                                            <option value="PI" <c:if test="${usuarioRet.endereco.estado == 'PI'}">selected="selected"</c:if>>PI</option>
                                            <option value="PR" <c:if test="${usuarioRet.endereco.estado == 'PR'}">selected="selected"</c:if>>PR</option>
                                            <option value="RJ" <c:if test="${usuarioRet.endereco.estado == 'RJ'}">selected="selected"</c:if>>RJ</option>
                                            <option value="RN" <c:if test="${usuarioRet.endereco.estado == 'RN'}">selected="selected"</c:if>>RN</option>
                                            <option value="RO" <c:if test="${usuarioRet.endereco.estado == 'RO'}">selected="selected"</c:if>>RO</option>
                                            <option value="RR" <c:if test="${usuarioRet.endereco.estado == 'RR'}">selected="selected"</c:if>>RR</option>
                                            <option value="RS" <c:if test="${usuarioRet.endereco.estado == 'RS'}">selected="selected"</c:if>>RS</option>
                                            <option value="SC" <c:if test="${usuarioRet.endereco.estado == 'SC'}">selected="selected"</c:if>>SC</option>
                                            <option value="SE" <c:if test="${usuarioRet.endereco.estado == 'SE'}">selected="selected"</c:if>>SE</option>
                                            <option value="SP" <c:if test="${usuarioRet.endereco.estado == 'SP'}">selected="selected"</c:if>>SP</option>
                                            <option value="TO" <c:if test="${usuarioRet.endereco.estado == 'TO'}">selected="selected"</c:if>>TO</option>											
                                        </select>
                                    </font>
                                </div>
                               	<div id="conselho" style="visibility:hidden;">
                               		<font face="Arial">
                                       Conselho:
                                        <font color="red">
                                            *
                                        </font>
                                        <input size="19" name="conselho" value="<c:if test="${usuarioEdit.tipoUsuario == 'PROFESSOR'}"><c:out value="${usuarioEdit.conselho}"></c:out> </c:if> <c:if test="${usuarioRet.tipoUsuario == 'ENFERMEIRO'}"><c:out value="${usuarioRet.conselho}"></c:out> </c:if>" />
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
                                        <input size="94" name="pto_referencia" value="<c:out value="${usuarioRet.endereco.referencia}"></c:out>" />
                                    </font>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:10px;">
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Tipo do Usu&aacute;rio
                                        <font color="red">
                                            *
                                        </font>
                                        <select name="restricaoAcesso" id="restricaoAcesso" onchange="usuarioDescricao();">
                                            <option value="professor" <c:if test="${usuarioRet.tipoUsuario == 'PROFESSOR'}">selected="selected" </c:if>>Professor</option>
                                            <option value="enfermeiro" <c:if test="${usuarioRet.tipoUsuario == 'ENFERMEIRO'}">selected="selected" </c:if>>Enfermeiro</option>
                                            <option value="alunoLab" <c:if test="${usuarioRet.tipoUsuario == 'ALUNOLABORATORIO'}">selected="selected" </c:if>>Aluno Laboratório</option>
                                            <option value="alunoEnf" <c:if test="${usuarioRet.tipoUsuario == 'ALUNOENFERMARIA'}">selected="selected" </c:if>>Aluno Enfermaria</option>
                                        </select>
                                    </font>
                                </div>
                                <div id="descricaoTipoUsuario">
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
		                            <input type="text" size="10" name="login" value="<c:out value="${usuarioRet.login}"></c:out>" /> 
									Senha
									<font color="red">
		                                *
		                            </font>
		                            <input type="password" size="10" name="senha" />
									Confirmar Senha
									<font color="red">
		                                *
		                            </font>
		                            <input type="password" size="10" name="confirmasenha" />
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



<%@ include file="/JSPs/inc_rodape.jsp"%>
</body>
</html>