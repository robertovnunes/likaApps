<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ChatModule</title>
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/ballons.css">
<link rel="stylesheet" href="css/breadcrumb.css">
<link rel="stylesheet" href="css/input_textbox.css">
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
	    $(".dialog").animate({ scrollTop: $(document).height()}, 0);
	    $(".dialog p").eq(-2).hide(0);
	    $(".dialog p:last").hide();
	    $(".dialog p").eq(-2).fadeIn("slow");
	    $(".dialog p:last").delay( "slow" );
	    $(".dialog p:last").fadeIn("slow");
	    $(".dialog").delay("slow") ;
	    $(".dialog").delay(50) ;
		$(".dialog").animate({ scrollTop: $(document).height()}, 0);
	});
	
	</script>
</head>
<body OnLoad="document.chat.textfield.focus();">
	<header class="logo">
		<h1>Prática Virtual</h1>
	</header>
		<div class="main">
			<form name="chat" action="Chat" method="post"
				accept-charset="ISO-8859-1">
				<div class="dialog">
					<c:forEach items="${colecao}" var="dialog">
						<p class="triangle-obtuse left">${dialog.textUser}</p>
						<p class="triangle-obtuse right">${dialog.textPatient}</p>
					</c:forEach>
				</div>
				
				<input class="width_chat awesome-text-box" type="text"
					name="textfield">
			<p>Info:<c:out value="${alert}"/></p>
			</form>
		</div>
</body>	
</html>