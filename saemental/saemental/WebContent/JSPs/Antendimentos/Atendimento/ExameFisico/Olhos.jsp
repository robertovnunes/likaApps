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
        
        
		
        <link href="Css/menu.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="Css/general.css" type="text/css" media="screen" />
        
        
			<script type="text/javascript" src="jscripts/tiny_mce/tiny_mce.js">
	        </script>

        <script language="JavaScript" type="text/javascript" src="jscripts/jTPS.js"></script>
		<script language="JavaScript" type="text/javascript" src="jscripts/MascaraValidacao.js"></script>     
			
		
 		 
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
		 <script type="text/javascript">
 	function semQueixa(){
 		var check = document.getElementById("semqueixa").checked;
 		
		if(check == true){
			document.getElementById("exame").style.opacity = "0.7";
			document.getElementById("exame").style.filter = "alpha(opacity=70)";
			
			document.form.edema.disabled = "disabled";
			document.form.xantelasma.disabled = "disabled";
			document.form.ptose.disabled = "disabled";
			document.form.blefarite.disabled = "disabled";
			document.form.palpebrasoutros.disabled = "disabled";
			
			document.form.exoftalmia.disabled = "disabled";
			document.form.enoftalmia.disabled = "disabled";
			document.form.globooutros.disabled = "disabled";
			
			document.form.conjutivite.disabled = "disabled";
			document.form.ictericia.disabled = "disabled";
			document.form.pterigio.disabled = "disabled";
			document.form.escleraoutros.disabled = "disabled";

			document.form.arco.disabled = "disabled";
			document.form.ulcera.disabled = "disabled";
			document.form.corneaoutros.disabled = "disabled";

			document.form.anisocoria.disabled = "disabled";
			document.form.midriase.disabled = "disabled";
			document.form.miose.disabled = "disabled";
			document.form.irisoutros.disabled = "disabled";

			document.form.palidez.disabled = "disabled";
			document.form.conjuntivite.disabled = "disabled";
			document.form.conjuntivaoutros.disabled = "disabled";

			document.getElementById("lentesSim").disabled = "disabled";
			document.getElementById("lentesNao").disabled = "disabled";
		}else{
			document.getElementById("exame").style.opacity = "1.0";
			document.getElementById("exame").style.filter = "alpha(opacity=100)";

			document.form.edema.disabled = false;
			document.form.xantelasma.disabled = false;
			document.form.ptose.disabled = false;
			document.form.blefarite.disabled = false;
			document.form.palpebrasoutros.disabled = false;
			
			document.form.exoftalmia.disabled = false;
			document.form.enoftalmia.disabled = false;
			document.form.globooutros.disabled = false;
			
			document.form.conjutivite.disabled = false;
			document.form.ictericia.disabled = false;
			document.form.pterigio.disabled = false;
			document.form.escleraoutros.disabled = false;

			document.form.arco.disabled = false;
			document.form.ulcera.disabled = false;
			document.form.corneaoutros.disabled = false;

			document.form.anisocoria.disabled = false;
			document.form.midriase.disabled = false;
			document.form.miose.disabled = false;
			document.form.irisoutros.disabled = false;

			document.form.palidez.disabled = false;
			document.form.conjuntivite.disabled = false;
			document.form.conjuntivaoutros.disabled = false;

			document.getElementById("lentesSim").disabled = false;
			document.getElementById("lentesNao").disabled = false;
		}
 	}

 	function sair(){
 		decisao = confirm("Deseja salvar os dados?");
 		if (decisao){
 		} else {
 		}
 	}
 </script>
		 <script type="text/javascript">
        	function navegacao(){
	        	//var div = window.top.document.getElementById('dadosPaciente');
		       // 	div.innerHTML = "<b>Usu??rio: </b>"+ '${usuario.nome}' + "<b> Paciente: </b>"+ '${paciente.nome}';
		        //	<c:if test="${usuario.tipoUsuario == 'ALUNOLABORATORIO'}">div.innerHTML += "<b> Aluno Respons??vel: </b>"+ '${paciente.usuario.nome}';</c:if>
		
		        	var divnavegacao = window.top.document.getElementById('navegacao');
		        	divnavegacao.innerHTML = "<a style='color: white;text-decoration: none;' href='<%=urlBase%>'>Home </a> :: <a style='color: white;text-decoration: none;' href='paciente.do?method=mostrarTelaPacienteBuscar'>Pacientes Buscar</a> :: <a style='color: white;text-decoration: none;' href='antendimento.do?method=antedimentosPaciente&id="+${paciente.id}+"'>Atendimentos Paciente</a>" + " :: <a style='color: white;text-decoration: none;' href='#'>Exame F??sico</a> :: <a style='color: white;text-decoration: none;' href='#'>Olhos</a>";
        	}
        </script>	
			
		 
				  
				  
</head>
<body onload="navegacao();semQueixa();"> 
<%@ include file="/JSPs/inc_topo.jsp"%>

<div align='center' id="main-content" style="background-image: none !important;" >
		
		<jsp:include page="../../../menu.jsp"  flush="true"/>	
        
		
		<div style="">
				
				
    	<div id="conteudoNormal" align="center" style="height:1100px">
               				
               				
               	 <jsp:include page="../menu-atendimentos.jsp"  flush="true"/>				
               				
				
				
		 <div id="conteudoNormal" align="left" style="height:1000px; display:inline-block;">
		 
		 
		  <p id="titulo-verm" style='' align="left">::Exame F&iacute;sico Olhos</p>
                <br/>
             
             <jsp:include page="menu-examefisico.jsp"  flush="true"/>
             
				<br /><br /><br />
				
				
<c:if test="${atendimento.assinar == true }">
<div class="desabilitar-form"></div>	
</c:if>
	<h:form action="olhos">
    	 		 <h:hidden property="method" value="olhosSalvar"/>  
	 <div id="conteudoNormal" align="left" style="height:450px;">
	  <div id="erroMsg">
			               <font color="red"> <h:errors/></font>
			               <font color="red"> 
			              		${mensagem}
							</font>
			            </div>
				 <br/>
				 <div class="titulo">Olhos</div>
  				 <div class="sessao"></div>
				 Sem Queixas<input id="semqueixa" name="semqueixa" <c:if test="${exame.semQueixas == true}"> checked="checked"</c:if> type="checkbox" onclick="semQueixa();" />
				 <br/><br/>
				  <div id="exame">
		                    Acuidade Diminu&iacute;da<input type="radio" <c:if test="${exame.acuidadeDiminuida == true}"> checked="checked"</c:if> name="acuidade" value="diminuida" />
		                    Acuidade Preservada<input type="radio" <c:if test="${exame.acuidadePreservada == true}"> checked="checked"</c:if> name="acuidade" value="preservada"/>
		                 <br/><br/>
		                    Deformidade<input type="checkbox" name="deformidade" <c:if test="${exame.deformidade == true}"> checked="checked"</c:if> />
		                    Dor<input type="checkbox" name="dor" <c:if test="${exame.dor == true}"> checked="checked"</c:if> />
		             	<br/><br/>
		                   Edema<input type="checkbox" name="edema" <c:if test="${exame.edema == true}"> checked="checked"</c:if> />
		                   Hiperemia<input type="checkbox" name="hiperemia"  <c:if test="${exame.hiperemia == true}"> checked="checked"</c:if>/>
		                   Icter&iacute;cia<input type="checkbox" name="ictericia" <c:if test="${exame.ictericia == true}"> checked="checked"</c:if>/>
		                   Lacrimejamento<input type="checkbox" name="lacrimejamento" <c:if test="${exame.lacrimejamento == true}"> checked="checked"</c:if>/>
		             	<br/><br/>
		                   Prurido<input type="checkbox" name="prurido" <c:if test="${exame.prurido == true}"> checked="checked"</c:if>/>
		                   Ptose<input type="checkbox" name="ptose" <c:if test="${exame.ptose == true}"> checked="checked"</c:if>/>
		                   Ressecamento<input type="checkbox" name="ressecamento" <c:if test="${exame.ressecamento == true}"> checked="checked"</c:if> />
		                   Secre&ccedil;&atilde;o<input type="checkbox" name="secrecao" <c:if test="${exame.secrecao == true}"> checked="checked"</c:if> />
		                   
		             	<br/><br/>
			          Necessidade de lentes corretivas <br/>
                                 Sim<input type="radio" checked="checked" name="lentes" <c:if test="${exame.lentesCorretivas == true}"> checked="checked"</c:if> id="lentesSim" value="lentesSim" />
                                 N&atilde;o<input type="radio" name="lentes" <c:if test="${exame.lentesCorretivas == false}"> checked="checked"</c:if> id="lentesNao" value="lentesNao"/>
			           	<br/><br/>
		                 Outros <input type="text" size="20" name="outros" value="<c:out value="${exame.outros}"></c:out>" />
		                <br/><br/>
                 </div>
             	<br/><br/>
                  <input type="submit" value="Salvar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
                  <input type="reset" value="Cancelar" <c:if test="${atendimento.assinar == true }">disabled="disabled"</c:if> />
			<br />	<c:if test="${atendimento.assinar == true }">
						 	<b>Assinado por:</b> <c:out value="${atendimento.usuarioAssinou.nome}"></c:out>
						 	<br /><br />
						 	<b>Data de Assinatura:</b> <c:out value="${atendimento.dataHoraAssinatura}"></c:out>
						 </c:if>
	</div>
	</h:form>
				
				
				<!--   -->
		 
		 
		 
         </div>
         
            </div>

               	
                </div>

		
</div>



<%@ include file="/JSPs/inc_rodape.jsp"%>

</body>
</html>