// Fun??o ?nica que far? a transa??o
	function getEndereco() {
			// Se o campo CEP n?o estiver vazio
			if($.trim($("#cep").val()) != ""){
				/* 
					Para conectar no servi?o e executar o json, precisamos usar a fun??o
					getScript do jQuery, o getScript e o dataType:"jsonp" conseguem fazer o cross-domain, os outros
					dataTypes n?o possibilitam esta intera??o entre dom?nios diferentes
					Estou chamando a url do servi?o passando o par?metro "formato=javascript" e o CEP digitado no formul?rio
					http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#cep").val()
				*/
				$.getScript("http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#cep").val(), function(){
					// o getScript d? um eval no script, ent?o ? s? ler!
					//Se o resultado for igual a 1
			  		if(resultadoCEP["resultado"]){
						// troca o valor dos elementos
						$("#rua").val(unescape(resultadoCEP["tipo_logradouro"])+": "+unescape(resultadoCEP["logradouro"]));
						$("#bairro").val(unescape(resultadoCEP["bairro"]));
						$("#cidade").val(unescape(resultadoCEP["cidade"]));
						var estado = resultadoCEP["uf"];
						document.getElementById('federacao').value = estado;
					}else{
						alert("Endere?o n?o encontrado");
					}
				});				
			}			
	}