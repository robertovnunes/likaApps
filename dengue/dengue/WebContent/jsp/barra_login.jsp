<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
		  <style>
                body {
                        font-family: Tahoma;
                        
                }
        </style>

<%
	if(session.getAttribute("usuario") == null){
%>
<div id="login_box">
	<div style="margin:30px; padding-top:10px;">
		<h:form action="logon">
		<h:hidden property="method" value="logon"/>
			<table style='color: #727272; font-family: Impact;' border="0">
			<tr>
				<td style="background: none;">	
					<b style='font-size:26px;'>Login</b>
				</td>
				<td style="color: red; font-family: arial; font-size: 10px;">
					<h:errors/>
					 <%
       					 if(request.getAttribute("expirou") != null && !request.getAttribute("expirou").equals("")){
       						out.print(request.getAttribute("expirou")); 
    					}%>
    					
    					<%
							if(request.getAttribute("expirou") != null && !request.getAttribute("expirou").equals("")){
						%>
								 <link rel="stylesheet" href="js/jquery-ui/css/ui-lightness/jquery-ui-1.10.1.custom.css" />
								  <script src="js/jquery-ui/js/jquery-1.9.1.js"></script>
								  <script src="js/jquery-ui/js/jquery-ui-1.10.1.custom.js"></script>
								<script>
								  $(function() {
								    $( "#dialog-message" ).dialog({
								      modal: true,
								      buttons: {
								        Ok: function() {
								          $( this ).dialog( "close" );
								        }
								      }
								    });
								  });
								  </script>
								  <div id="dialog-message" title="Mensagem Alerta">
								  <p>
								    <span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 50px 0;"></span>
								   <%out.print(request.getAttribute("expirou")); %>
								  </p>
								 
								</div>
							<% } %>
				</td>
			</tr>
			<tr>
				<td style="background: none;">	
					Login:
				</td>
				<td>	
					<%
					String login = "";
					String senha = "";
					if (request.getRequestURL().indexOf("8083") != -1){ 
						login = "paulo";
						senha = "paulo123";
					} 
					%>
					
					<h:text property="loginUsuario" styleClass="input-text input-200" value="<%=login %>" styleId="login" maxlength="10"/>
				</td>
			</tr>
			<tr>
				<td style="background: none;">	
					Senha:
				</td>
				<td>	
					<h:password styleClass="input-text input-200" styleId="senha" value="<%=senha %>" property="senhaUsuario" size="19"/>
				</td>
			</tr>
			
			</table>
		
				<table style='margin-top:10px;' border='0'>
				<tr>
				<td style="padding-left:40px;">
					<a style='color:#727272; font-size: 10px;margin-top:20px;' href='#'  onclick="alert('Em construção!')">Esqueceu a senha?</a>
				</td>
				<td>
					<input type="submit" value='Entrar' style='margin-left: 50px;' />
				</td>
				</tr>
				</table>
				
			</h:form>
		</div>
	</div>
<%
	}else{

%>





<br /><br />
	<b style="color: #4F6B72; font-size: 16px; ">Bem-Vindo(a), </b>
	<div id="login_box_logado">
		<div style="margin:0 30px 30px 30px; padding-top:10px;">
			<span style="color: #4F6B72;font-size:9pt;">Usuário:</span><br /><font style="color: #4F6B72; font-size: 14px; font-weight: bold;"><c:out value="${usuario.nome}"></c:out></font>
			<br />
			<font style="color: #4F6B72; font-size: 12px; ">Último login: 12/10/2012 4:10pm</font><br /><br />
			<input type="button" onclick="window.location.href='usuario.do?method=mostrarTelaUsuarioEdit&id=<c:out value="${usuario.id }"></c:out>'" style='margin-left: 130px;' value='Editar Perfil'>
			<input type="button" onclick="window.location.href='logoff.do?method=logoff'" style='' value='Sair'>
			
		</div>
		
		
	</div>
	
<%
	}
%>

		
