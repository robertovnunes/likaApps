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
	        $(function() {	    
	        	$("#inputDate").datepicker({
					changeMonth: true,
					changeYear: true,
					yearRange: '1900:2013',
					gotoCurrent: true
				});	
	        });
	    	
	    

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
        	function navegacao(){
	       // 	var div = window.top.document.getElementById('dadosPaciente');
	       // 	div.innerHTML = "<b>Usu??rio: </b>"+ '${usuario.nome}';
	
	        	var divnavegacao = window.top.document.getElementById('navegacao');
	        	divnavegacao.innerHTML = "<a style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a style='color: white;text-decoration: none;' href='#'>Pacientes Adicionar</a>";
        	}
        </script>
		
		 
</head>
<body onload="navegacao();">
<%@ include file="/JSPs/inc_topo.jsp"%>

<div align='center' id="main-content" style="background-image: none !important;" >
		
		<jsp:include page="../../menu.jsp"  flush="true"/>	
        
		
		<div id="conteudo" align="center" style="height:700px;">
	<div id="erroMsg">
               <font color="red"> <h:errors/></font>
          		<div style='margin-top:30px;color:red;width:700px'>${mensagem}</div>
                <br /><br />
            </div>
	<h:form action="pacienteAdd" >
                 <h:hidden property="method" value="pacienteAdd"/>    
                 <input type="hidden" name="acao" value="pacienteAdd"></input>              
				     <p id="titulo-verm" style='margin-left: 350px;' align="left">Cadastro de Paciente</p>
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
                                    <input size="113" name="nome" maxlength="150" value="<c:out value="${pacienteRet.nome}"></c:out>" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:900px;padding-top:10px;">
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        CPF
                                        <input size="15" id="cpf" name="cpf" maxlength="14" value="<c:out value="${pacienteRet.cpf}"></c:out>" onblur="validarCampo(this);" onkeypress=" return keyPress(event, this);" />
                                    </font>
                                </div>
                                  <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
		                            	N??mero do Prontu&aacute;rio
                                        <font color="red">
                                            *
                                        </font>
                                        <input size="15" id="numeroProntuario" name="numeroProntuario" value="<c:out value="${pacienteRet.prontuario.numero}"></c:out>" maxlength="14" />
                                    </font>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:900px;padding-top:10px;">
                                <div style="float:left; margin-right:10px;">
                                    <font face="Arial">
                                        Nome da m&atilde;e <input size="60" name="filiacao" value="<c:out value="${pacienteRet.nomeMae}"></c:out>" />
                                    </font>
                                </div>
                                <div>
                                    <font face="Arial">
                                        Data de Nascimento 
                                        <font color="red">
                                            *
                                        </font>
										 <input size="13" id="inputDate" name="inputDate" onchange="calculaIdade();" value="<c:out value="${pacienteRet.nascimento}"></c:out>" />
									</font>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:900px;padding-top:10px;">
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Idade
                                        
                                        <input size="5" readonly="readonly" name="idade" id="idade" value="<c:out value="${pacienteRet.idade}"></c:out>" />
                                    </font>
                                </div>
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Sexo 
                                        <font color="red">
                                            *
                                        </font>
                                        <select size="1" name="sexo">
                                            <option value="Feminino" <c:if test="${pacienteRet.sexo == 'Feminino'}">selected="selected"</c:if>>Feminino</option>
                                            <option value="Masculino" <c:if test="${pacienteRet.sexo == 'Masculino'}">selected="selected"</c:if>>Masculino</option>
                                        </select>
                                    </font>
                                </div>
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Ra&ccedil;a 
                                        <font color="red">
                                            *
                                        </font>
                                        <select size="1" name="raca">
                                            <option value="BRANCO" <c:if test="${pacienteRet.raca == 'BRANCO' || pacienteRet eq null}">selected="selected"</c:if> >BRANCO</option>
                                            <option value="NEGRO" <c:if test="${pacienteRet.raca == 'NEGRO'}">selected="selected"</c:if>>NEGRO</option>
                                            <option value="PARDO" <c:if test="${pacienteRet.raca == 'PARDO'}">selected="selected"</c:if>>PARDO</option>
                                            <option value="AMARELO" <c:if test="${pacienteRet.raca == 'AMARELO'}">selected="selected"</c:if>>AMARELO</option>
                                            <option value="IND??GENA" <c:if test="${pacienteRet.raca == 'IND??GENA'}">select="selected"</c:if>>IND&Iacute;GENA</option>
                                        </select>
                                    </font>
                                </div>
                                <div style="float:left;">
                                    <font face="Arial">
                                        Telefone <input name="telefone" size="42" value="<c:out value="${pacienteRet.telefone}"></c:out>" />
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
                                        <input id="rua" size="45" name="endereco" value="<c:out value="${pacienteRet.endereco.descricao}"></c:out>" />
                                    </font>
                                </div>
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        N&uacute;mero
                                        <font color="red">
                                            *
                                        </font>
                                        <input size="7" name="numero" value="<c:out value="${pacienteRet.endereco.numero}"></c:out>" />
                                    </font>
                                </div>
                                <div style="float:left;">
                                    <font face="Arial">
                                        Bairro
                                        <font color="red">
                                            *
                                        </font>
                                        <input id="bairro" name="bairro" size="24" value="<c:out value="${pacienteRet.endereco.bairro}"></c:out>" />
                                    </font>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:10px;">
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        CEP
                                        <font color="red">
                                            *
                                        </font>
                                        <input onBlur="getEndereco();" id="cep" size="15" name="cep" maxlength="8" value="<c:out value="${pacienteRet.endereco.cep}"></c:out>" />
                                    </font>
                                </div>
								<div style="float:left;margin-right: 10px;">
									<input type="button" value="Verificar" />
								</div>
								<div style="float:left;margin-right: 10px;">
									<a href="http://www.correios.com.br/"><u>N&atilde;o sabe o seu CEP? Consulte aqui</u></a>  
								</div>
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Cidade
                                        <font color="red">
                                            *
                                        </font>
                                        <input id="cidade" size="10" name="cidade" value="<c:out value="${pacienteRet.endereco.cidade}"></c:out>" />
                                    </font>
                                </div>
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Estado
                                        <font color="red">
                                            *
                                        </font>
                                        <select id="federacao" name="federacao">
                                            <option value="AC" <c:if test="${pacienteRet.endereco.estado == 'AC'}">selected="selected"</c:if>>AC</option>
                                            <option value="AL" <c:if test="${pacienteRet.endereco.estado == 'AL'}">selected="selected"</c:if>>AL</option>
                                            <option value="AM" <c:if test="${pacienteRet.endereco.estado == 'AM'}">selected="selected"</c:if>>AM</option>
                                            <option value="AP" <c:if test="${pacienteRet.endereco.estado == 'AP'}">selected="selected"</c:if>>AP</option>
                                            <option value="BA" <c:if test="${pacienteRet.endereco.estado == 'BA'}">selected="selected"</c:if>>BA</option>
                                            <option value="CE" <c:if test="${pacienteRet.endereco.estado == 'CE'}">selected="selected"</c:if>>CE</option>
                                            <option value="DF" <c:if test="${pacienteRet.endereco.estado == 'DF'}">selected="selected"</c:if>>DF</option>
                                            <option value="ES" <c:if test="${pacienteRet.endereco.estado == 'ES'}">selected="selected"</c:if>>ES</option>
                                            <option value="GO" <c:if test="${pacienteRet.endereco.estado == 'GO'}">selected="selected"</c:if>>GO</option>
                                            <option value="MA" <c:if test="${pacienteRet.endereco.estado == 'MA'}">selected="selected"</c:if>>MA</option>
                                            <option value="MG" <c:if test="${pacienteRet.endereco.estado == 'MG'}">selected="selected"</c:if>>MG</option>
                                            <option value="MS" <c:if test="${pacienteRet.endereco.estado == 'MS'}">selected="selected"</c:if>>MS</option>
                                            <option value="MT" <c:if test="${pacienteRet.endereco.estado == 'MT'}">selected="selected"</c:if>>MT</option>
                                            <option value="PA" <c:if test="${pacienteRet.endereco.estado == 'PA'}">selected="selected"</c:if>>PA</option>
                                            <option value="PB" <c:if test="${pacienteRet.endereco.estado == 'PB'}">selected="selected"</c:if>>PB</option>
                                            <option value="PE" <c:if test="${pacienteRet.endereco.estado == 'PE' || pacienteRet eq null}">selected="selected"</c:if>>PE</option>
                                            <option value="PI" <c:if test="${pacienteRet.endereco.estado == 'PI'}">selected="selected"</c:if>>PI</option>
                                            <option value="PR" <c:if test="${pacienteRet.endereco.estado == 'PR'}">selected="selected"</c:if>>PR</option>
                                            <option value="RJ" <c:if test="${pacienteRet.endereco.estado == 'RJ'}">selected="selected"</c:if>>RJ</option>
                                            <option value="RN" <c:if test="${pacienteRet.endereco.estado == 'RN'}">selected="selected"</c:if>>RN</option>
                                            <option value="RO" <c:if test="${pacienteRet.endereco.estado == 'RO'}">selected="selected"</c:if>>RO</option>
                                            <option value="RR" <c:if test="${pacienteRet.endereco.estado == 'RR'}">selected="selected"</c:if>>RR</option>
                                            <option value="RS" <c:if test="${pacienteRet.endereco.estado == 'RS'}">selected="selected"</c:if>>RS</option>
                                            <option value="SC" <c:if test="${pacienteRet.endereco.estado == 'SC'}">selected="selected"</c:if>>SC</option>
                                            <option value="SE" <c:if test="${pacienteRet.endereco.estado == 'SE'}">selected="selected"</c:if>>SE</option>
                                            <option value="SP" <c:if test="${pacienteRet.endereco.estado == 'SP'}">selected="selected"</c:if>>SP</option>
                                            <option value="TO" <c:if test="${pacienteRet.endereco.estado == 'TO'}">selected="selected"</c:if>>TO</option>
											
                                        </select>
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
                                        <input size="98" name="pto_referencia" value="<c:out value="${pacienteRet.endereco.referencia}"></c:out>" />
                                    </font>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:10px;">
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Estado Civil
                                        <font color="red">
                                            *
                                        </font>
                                        <select size="1" name="estado_civil">
                                            <option value="CASADO" <c:if test="${pacienteRet.estadoCivil == 'CASADO' || pacienteRet eq null}">selected="selected"</c:if>>CASADO</option>
                                            <option value="SOLTEIRO" <c:if test="${pacienteRet.estadoCivil == 'SOLTEIRO'}">selected="selected"</c:if>>SOLTEIRO</option>
                                            <option value="VI??VO" <c:if test="${pacienteRet.estadoCivil == 'VI??VO'}">selected="selected"</c:if>>VI&Uacute;VO</option>
                                            <option value="DIVORCIADO" <c:if test="${pacienteRet.estadoCivil == 'DIVORCIADO'}">selected="selected"</c:if>>DIVORCIADO</option>
                                            <option value="CONSENSUAL" <c:if test="${pacienteRet.estadoCivil == 'CONSENSUAL'}">selected="selected"</c:if>>CONSENSUAL</option>
                                        </select>
                                    </font>
                                </div>
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        N&ordm; de filhos
                                        <font color="red">
                                            *
                                        </font>
                                        <input size="5" name="num_filhos" value="<c:out value="${pacienteRet.qtdFilhos}"></c:out>" />
                                    </font>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:10px;">
                                <div style="float:left;margin-right: 10px;">
                                    <font face="Arial">
                                        Religi&atilde;o 
                                        <select size="1" name="religiao">
                                        	<option value="" <c:if test="${pacienteRet eq null}">selected="selected"</c:if>>N&atilde;o informado</option>
                                            <option value="CAT??LICA" <c:if test="${pacienteRet.religiao == 'CAT??LICA'}">selected="selected"</c:if>>CAT&Oacute;LICA</option>
                                            <option value="PROTESTANTE" <c:if test="${pacienteRet.religiao == 'PROTESTANTE'}">selected="selected"</c:if>>PROTESTANTE</option>
                                            <option value="ESP??RITA" <c:if test="${pacienteRet.religiao == 'ESP??RITA'}">selected="selected"</c:if>>ESP&Iacute;RITA</option>
                                            <option value="OUTROS" <c:if test="${pacienteRet.religiao == 'OUTROS'}">selected="selected"</c:if>>OUTROS</option>
                                        </select>
                                    </font>
                                </div>
                                <div style="float:left;">
                                    <font face="Arial">
                                        Escolaridade
                                        <font color="red">
                                            *
                                        </font>
                                        <select size="1" name="escolaridade">
                                        	<option value="" <c:if test="${pacienteRet eq null}">selected="selected"</c:if>>N&atilde;o informado</option>
                                            <option value="Fudamental comp" <c:if test="${pacienteRet.escolaridade == 'Fudamental comp'}">selected="selected"</c:if>>Fudamental comp</option>
                                            <option value="Fundamental incomp" <c:if test="${pacienteRet.escolaridade == 'Fundamental incomp'}">selected="selected"</c:if>>Fundamental incomp</option>
                                            <option value="M??dio comp" <c:if test="${pacienteRet.escolaridade == 'M??dio comp'}">selected="selected"</c:if>>M&eacute;dio comp</option>
                                            <option value="M??dio incomp" <c:if test="${pacienteRet.escolaridade == 'M??dio incomp'}">selected="selected"</c:if>>M&eacute;dio incomp</option>
                                            <option value="Superior comp" <c:if test="${pacienteRet.escolaridade == 'Superior comp'}">selected="selected"</c:if>>Superior comp</option>
                                            <option value="Superior incomp" <c:if test="${pacienteRet.escolaridade == 'Superior incomp'}">selected="selected"</c:if>>Superior incomp</option>
                                            <option value="Profissionalizante" <c:if test="${pacienteRet.escolaridade == 'Profissionalizante'}">selected="selected"</c:if>>Profissionalizante</option>
                                            <option value="Analfabeto" <c:if test="${pacienteRet.escolaridade == 'Analfabeto'}">selected="selected"</c:if>>Analfabeto</option>
                                        </select>
                                    </font>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top:10px;">
                                <div>
                                    <font face="Arial">
                                        Ocupa&ccedil;&atilde;o/Profiss&atilde;o
                                        <font color="red">
                                            *
                                        </font>
                                        <input name="profissao" size="50" value="<c:out value="${pacienteRet.profissao}"></c:out>" />
                                    </font>
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