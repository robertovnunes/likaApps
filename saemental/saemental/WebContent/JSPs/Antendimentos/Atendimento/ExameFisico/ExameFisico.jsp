<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<jsp:include page="../../../autenticacao.jsp"  flush="true"/>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link href="Css/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="Css/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
    
    <link rel="stylesheet" href="Css/style.css" />
     <style type="text/css">
    body {
		background-color: white;
	}
    </style>
    <script type="text/javascript">
    function redimensionar(valor){
        var altura = parseInt(valor)+200;
		window.parent.redimensionar(altura+"px");
		
		document.getElementById('frameExFisico').style.height = valor+'px';
		document.getElementById('conteudoNormal').style.height = valor+'px';	
    }
    </script>
</head>
<body>
    <div id="conteudoNormal" align="center" style="height:550px;">
    			<br />
                <p id="titulo-verm" style='' align="left">::Exame F&iacute;sico Boca</p>
                <br/>
             
             <jsp:include page="menu-examefisico.jsp"  flush="true"/>
             
				<br /><br /><br />
				
				<!--   -->
            </div>
</body>
</html>
