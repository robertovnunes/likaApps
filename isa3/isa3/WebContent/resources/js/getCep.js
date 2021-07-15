// Fun��o �nica que far� a transa��o
	function getEndereco() {
			// Se o campo CEP n�o estiver vazio
			var cep = document.getElementById('CEP');
			var cepStr = cep.value;
			if(cepStr.trim() != ""){
				
				$.getScript("http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#cep").val(), function(){
					// o getScript d� um eval no script, ent�o � s� ler!
					//Se o resultado for igual a 1
			  		if(resultadoCEP["resultado"]){
						// troca o valor dos elementos
						$("#rua").val(unescape(resultadoCEP["tipo_logradouro"])+": "+unescape(resultadoCEP["logradouro"]));
						$("#bairro").val(unescape(resultadoCEP["bairro"]));
						$("#cidade").val(unescape(resultadoCEP["cidade"]));
						var estado = resultadoCEP["uf"];
						document.getElementById('federacao').value = estado;
					}else{
						alert("Endere�o n�o encontrado");
					}
				});				
			}			
	}