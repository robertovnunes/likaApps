function doDecimal(numero){
		var tamanho = numero.length;
		var retorno = "";
		var achou = 0;
		var i = 0;

		if(tamanho > 0){
			if(numero.charAt(0) == "." ||numero.charAt(0) == "," ){
				retorno += "0."
				numero = numero.substr(1,tamanho);
			}
		}
		
		for(i = 0; i < tamanho; i++){
			if(numero.charAt(i) >= 0 && numero.charAt(i) <= 9 ){
				retorno += numero.charAt(i); 
			}
			else if((numero.charAt(i) == "." || numero.charAt(i) == ",") &&  achou == 0){
				retorno += ".";
				achou = 1;
			}
			else{
				return retorno;
			}
		}
		return retorno;
	}