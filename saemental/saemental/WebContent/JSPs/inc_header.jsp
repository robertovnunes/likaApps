<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>SAE Mental - Sistematiza��o da Assist�ncia em Enfermagem em Sa�de Mental</title>
<meta name="title" content="SAE Mental - Sistematiza��o da Assist�ncia em Enfermagem em Sa�de Mental" />
<meta name="description" content="" />
<meta name="keywords" content="" />


<meta name="author" content="Paulo Ot�vio Dantas Diniz"  />
<meta name="language" content="pt-BR" />
<meta name="robots" content="All" />
<meta name="revisit" content="7 days" />
<link rel="shortcut icon" href="images/icon.png" />
<link href="Css/style.css" type="text/css" rel="stylesheet" media="screen" />
<script type="text/javascript">
            
            function blockHistoryNavegation(){
            	
            	console.log(history.forward());
		        window.history.forward();
		 //       blockHistoryNavegation();
            }
            blockHistoryNavegation();
    </script>


<%
	if(request.getAttribute("mensagem") != null && !request.getAttribute("mensagem").equals("")){
%>
		 <link rel="stylesheet" href="jquery-ui/css/ui-lightness/jquery-ui-1.10.1.custom.css" />
		  <script src="jscripts/jquery-1.3.2.js"></script>
		  <script src="jscripts/jquery/ui/jquery-ui-1.7.2.custom.js"></script>
		<script>
		 $(document).ready(function () {
			 
			 var p = document.createElement ('p');
			 p.innerHTML = '<span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 110px 0;"></span><%=request.getAttribute("mensagem")%>' ;
			 
			 var div = document.createElement ('div');
			 div.setAttribute ('id', "dialog-message");
			 div.setAttribute ('title', "Mensagem Alerta");
			 
			 div.appendChild(p);
			 document.body.appendChild(div);	
			 
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
		  
	<% } %>
	
	<%
	if(request.getAttribute("observacao") != null && !request.getAttribute("observacao").equals("")){
%>
		  <link rel="stylesheet" href="jquery-ui/css/ui-lightness/jquery-ui-1.10.1.custom.css" />
		  <script src="jscripts/jquery-1.3.2.js"></script>
		  <script src="jscripts/jquery/ui/jquery-ui-1.7.2.custom.js"></script>
		<script>
		 $(document).ready(function () {
			 
			 var p = document.createElement ('p');
			 p.innerHTML = '<span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 110px 0;"></span><%=request.getAttribute("observacao")%>' ;
			 
			 var div = document.createElement ('div');
			 div.setAttribute ('id', "dialog-message");
			 div.setAttribute ('title', "Mensagem Alerta");
			 
			 div.appendChild(p);
			 document.body.appendChild(div);
			 
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
		 
	<% } %>