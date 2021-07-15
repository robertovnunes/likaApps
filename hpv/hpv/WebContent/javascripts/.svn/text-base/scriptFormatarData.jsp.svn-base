<script>
function IsNumeric(valor){
			var log=valor.length; var sw="S";
			for (x=0; x<log; x++){ 
				v1=valor. substr(x,1);
				v2 = parseInt(v1);
				//Comprovo se � um valor num�rico
				if (isNaN(v2)) { sw= "N";}
			}
			if (sw=="S") {return true;} else {return false; }
		}

		var primeiroslap=false;
		var segundoslap=false;
		
		function formateadata(data){
			var long = data.length;
			var dia;
			var mes;
			var ano;
			if ((long>=2) && (primeiroslap==false)) { 
				dia=data.substr(0,2);
				if ((IsNumeric(dia)==true) && (dia<=31) && (dia!="00")) { 
					data=data.substr(0,2)+"/"+data.substr(3,7); 
					primeiroslap=true; 
				}
				else { 
					data=""; 
					primeiroslap=false;
				}
			}else{ 
				dia=data.substr(0,1);
				if (IsNumeric(dia)==false){
					data="";}
					if ((long<=2) && (primeiroslap=true)) {
						data=data.substr(0,1); 
						primeiroslap=false; 
					}
				}
				if ((long>=5) && (segundoslap==false)){ 
					mes=data.substr(3,2);
					if ((IsNumeric(mes)==true) &&(mes<=12) && (mes!="00")) { 
						data=data.substr(0,5)+"/"+data.substr(6,4); 
						segundoslap=true; 
					}
					else { 
						data=data.substr(0,3);
						segundoslap=false;
					}
				}
				else { 
					if ((long<=5) && (segundoslap=true)) { 
						data=data.substr(0,4); 
						segundoslap=false; 
				} 
			}
			if (long>=7){ 
				ano=data.substr(6,4);
				if (IsNumeric(ano)==false) { 
					data=data.substr(0,6); 
				}
				else { 
					if (long==10){ 
						if ((ano==0) || (ano<1800) || (ano>2100)) { 
							data=data.substr(0,6); 
						} 
					} 
				}
			}
			if (long>=10){
				data=data.substr(0,10);
				dia=data.substr(0,2);
				mes=data.substr(3,2);
				ano=data.substr(6,4);
				// Ano nao bisexto e � fevereiro e o dia � maior a 28
				if ( (ano%4 != 0) && (mes ==02) && (dia > 28) ) { 
					data=data.substr(0,2)+"/"; 
				}
			}
			return (data);
		} 
		</SCRIPT>