<script>
	function mascarahora(Hora,campo) {
		var name = "";
		name += campo;
		var hora01 = "";
		hora01 = hora01 + Hora;
		if (hora01.length == 2) {
			hora01 += ':';
			var lis = document.getElementsByName(""+name);
			var num = lis.length;
			lis.item(0).value = hora01;
		}
		//if (hora01.length == 5) {
			verificahora(name);
		//}
				
	}
	
	function verificahora(campo) {
		hrs = (document.getElementsByName(campo).item(0).value.substring(0, 2));

		var hora = "" + hrs;
		if(hora.charAt(0)>'2' || hora.charAt(0)<'0'){
			document.getElementsByName(campo).item(0).value = hrs.substring(1, 2);
			hrs = (document.getElementsByName(campo).item(0).value.substring(0, 2));

		}

		if(hora.charAt(1)>'9' || hora.charAt(1)<'0'){
			document.getElementsByName(campo).item(0).value = hrs.substring(0, 1);
			hrs = (document.getElementsByName(campo).item(0).value.substring(0, 2));

		}

		min = (document.getElementsByName(campo).item(0).value.substring(3, 5));
		if(min != null && min.length > 0){

			if(min.charAt(0)>'5' || min.charAt(0)<'0'){
				document.getElementsByName(campo).item(0).value =hrs + ":"+ min.substring(1, 2);
				min = (document.getElementsByName(campo).item(0).value.substring(3, 4));

			}
			if(min.charAt(1)>'9' || min.charAt(1)<'0'){
				document.getElementsByName(campo).item(0).value =hrs+ ":" + min.substring(0, 1);
				min = (document.getElementsByName(campo).item(0).value.substring(4, 5));

			}
			
		}
		if ((hrs < 00) || (hrs > 23) ) {
			alert("Hora inválida!");
			document.getElementsByName(campo).item(0).focus();
		}
		if((min < 00) || (min > 59)){
			alert("Minuto inválido!");
			document.getElementsByName(campo).item(0).focus();
		}
	}
</script>