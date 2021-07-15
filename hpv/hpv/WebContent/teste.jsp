<%@page pageEncoding="Cp1252" contentType="text/html; charset=Cp1252" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Cp1252"/>
<title></title>
</head>
	<body>
		<form action="teste.jsp">
			aqui: <input type="file" name="arq" id="arq2">
			<input type="button" value="ok" onclick="ae();">		
		</form>
	<script languagae="javascript">
		<!--
		function ae(){
			var imagem=new Image();
			alert(document.getElementById("arq2").value);
			imagem.src=document.getElementById("arq2").src;
			
			alert(imagem.fileSize);
			if(imagem.fileSize > 2000) {
			  alert("maior");
			}
			else {
			  alert("ok");
			}
		}
		
		//-->
	</script>
	
	</body>
</html>
