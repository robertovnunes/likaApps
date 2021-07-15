<%@page import="org.hibernate.Transaction"%>
<%@page import="br.com.lika.hpv.dao.DAO"%>
<%@page import="java.util.Date"%>
<%@page import="br.com.lika.hpv.dao.DAOFactory"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <title>HPV-LIKA</title>
	    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	    <link href="css/style.css" rel="stylesheet" type="text/css" />
	    <link href="css/menu.css" rel="stylesheet" type="text/css" />
	    <link rel="shortcut icon" href="images/nurse.png" />
	    <!--
	      [if lt IE 8]><style type="text/css" media="screen"> #menuh{float:none;} body{behavior:url(css/csshover.htc);
	      font-size:75%;} #menuh ul li{float:left; width: 100%;} #menuh a{height:1%;font:bold 1em/1.4em helvetica, arial,
	      sans-serif;} </style> <![endif]
	    -->
  	</head>
  	
  	<body onload="document.getElementById('aqui').focus();">
		<div id="container">
	    	<div id="top">
		    	 <img src="images/lika.png" style="padding-top: 30px;" align="right" /><br />
				<br />
				<div style="text-align: center; font-size: 16pt;">Sistema de apoio ao estudo do HPV</div>
		    </div>
      
      		<div id="menuh">
				<ul>
					<li><a href="index.jsp" class="top_parent"> &nbsp; Home </a></li>
				</ul>
				<ul>
					<li><a href="login.jsp" class="top_parent"> &nbsp; Login </a></li>
				</ul>
			</div>
			
			<div class="clear:both;">
			</div>
	
			<div id="leftnav">
	      		<h2>Links</h2>
				<div id="nav">
					<ul id="navlist">
						<li><a href="http://www.lika.ufpe.br" target="_about"> LIKA </a></li>
						<li><a href="http://www.ideias.ufpe.br" target="_about"> IDEIAS </a></li>
						<li><a href="http://www.ufpe.br" target="_about"> UFPE </a></li>
						<li><a href="http://infomed.lika.ufpe.br/bpv" target="_about"> BPV </a></li>
					</ul>
				</div>
				<p> 
					<h2>Links &uacute;teis sobre o HPV</h2>
					<div id="nav">
						<ul id="navlist">
							<li><a href="http://www.inca.gov.br/conteudo_view.asp?id=327" target="_about"> INCA </a></li>
							<li><a href="http://www.gineco.com.br/index3b.htm" target="_about"> Gineco </a></li>
							<li><a href="http://pt.wikipedia.org/wiki/V%C3%ADrus_do_papiloma_humano" target="_about"> Wikipédia </a></li>
							<li><a href="http://www.gardasil.com/" target="_about"> Gardasil </a></li>
						</ul>
					</div>
				</p><br>
				<p class="quote"> "Se n&atilde;o puder se destacar pelo talento, ven&ccedil;a pelo esfor&ccedil;o." (Dave Weinbaum)</p>
			</div>

			<div id="content">
				<h2>
					<span style="font-weight: bold; color: #520934;">
				      Login
				    </span>
				</h2>
				<div>
					<span class="erro">
 	                	<%if (request.getParameter("usuarioDaSessao.login") != null) {
 	                	%>
 	                    	Usu&aacute;rio/senha inv&aacute;lidos!
 	                    	
                        <%} %>
 	                    <%if (request.getParameter("expirou") != null) {
 	    
 	                    %>
 	                    	Para sua seguran&ccedil;a, a sess&atilde;o foi expirada automaticamente.<br/>Por favor,logue novamente.
 	                    <%} %>
 	                 </span>
 	                 <span class="sucesso">
 	                 	<%if (request.getParameter("logout") != null) {
 	                    %>
 	                    	Sessão finalizada com sucesso!
 	                    <%} %>
 	                    <%if (request.getParameter("email") != null) {
 	                    %>
 	                    	Lembrete de senha enviado com sucesso!
 	                    <%} %>
						<%if (request.getParameter("emailFail") != null) {%>
							
						<%} %>

 	               	</span>
					
					
					<form action="login.efetuarLogin.logic" method="post">
						<table>
							<tr>
								<td>Login:</td>
								<td><input type="text" name="usuario.login" id='aqui'/></td>
							</tr>
							<tr>
								<td>Senha:</td>
								<td><input type="password" name="usuario.senha" /></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" value="login" /></td>
							</tr>
						</table>
					</form>	
				</div>
				<div>
					<fieldset style="width: 340px;">
						<legend style="font:red; font-size: 11px;">
							<a href="#" onclick="habilitaEsqueceuSenha();">esqueceu a senha?</a>
						</legend>
						<div id="esqueceuSenha">
						</div>
					</fieldset>
					
				</div>
			</div>
			<script>
				var habilitado = false;
				function habilitaEsqueceuSenha(){
					if(!habilitado){
						document.getElementById('esqueceuSenha').innerHTML = "<form action='login.lembrarSenha.logic' method='post'>" + 
							"email cadastrado:<input type='text' maxlength=40 name='usuario.email' style='width:200px;'>" +
							"<input type='submit' value='ok'/>"+
							"</form>";
						habilitado = true;
					}
					else{
						document.getElementById('esqueceuSenha').innerHTML = "";
						habilitado = false;
					}
				}
			</script>
			  	
			<div id="footer">
			 	<%@include file="footer.jsp" %>
			</div>  	
			
		</div>
	</body>
</html>