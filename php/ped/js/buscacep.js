function getCEP() {
    // Se o campo CEP não estiver vazio
    if($.trim($("#inpCEP").val()) != ""){
        /*
            Para conectar no serviço e executar o json, precisamos usar a função getScript do jQuery, o getScript e o
            dataType:"jsonp" conseguem fazer o cross-domain, os outros dataTypes não possibilitam esta interação entre
            domínios diferentes.
            Estou chamando a url do serviço passando o parâmetro "formato=javascript" e o CEP digitado no formulário
            http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#cep").val()
        */
        $.getScript("http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#inpCEP").val(), function(){
            // o getScript dá um eval no script, então é só ler!
            //Se o resultado for igual a 1
            if(resultadoCEP["resultado"] == "1"){
                // troca o valor dos elementos
                $("#inpEnd").val(unescape(resultadoCEP["tipo_logradouro"])+" "+unescape(resultadoCEP["logradouro"]));
                $("#inpBair").val(unescape(resultadoCEP["bairro"]));
                $("#hdIdCid").val(unescape(resultadoCEP["cidade"]));
                $("#hdIdUF").val(unescape(resultadoCEP["uf"]));


				var x = unescape(resultadoCEP["uf"]);
				
				switch (x){
					case "AC":
						x = "Acre";
						break;
					case "AL":
						x = "Alagoas";
						break;
					case "AP":
						x = "Amapá";
						break;
					case "AM":
						x = "Amazonas";
						break;
					case "BA":
						x = "Bahia";
						break;
					case "CE":
						x = "Ceará";
						break;
					case "DF":
						x = "Distrito Federal";
						break;
					case "ES":
						x = "Espírito Santo";
						break;
					case "GO":
						x = "Goiás";
						break;
					case "MA":
						x = "Maranhão";
						break;
					case "MT":
						x = "Mato Grosso";
						break;
					case "MS":
						x = "Mato Grosso do Sul";
						break;
					case "MG":
						x = "Minas Gerais";
						break;
					case "PA":
						x = "Pará";
						break;
					case "PB":
						x = "Paraíba";
						break;
					case "PR":
						x = "Paraná";
						break;
					case "PE":
						x = "Pernambuco";
						break;
					case "PI":
						x = "Piauí";
						break;
					case "RJ":
						x = "Rio de Janeiro";
						break;
					case "RN":
						x = "Rio Grande do Norte";
						break;
					case "RS":
						x = "Rio Grande do Sul";
						break;
					case "RO":
						x = "Rondônia";
						break;
					case "RR":
						x = "Roraima";
						break;
					case "SP":
						x = "São Paulo";
						break;
					case "SC":
						x = "Santa Catarina";
						break;
					case "SE":
						x = "Sergipe";
						break;
					case "TO":
						x = "Tocantins";
						break;
					default:
						break;
				}
				var y;
				
				$("#inpUF").children(":option").each(function(){
					if($(this).text() == x){
						y = $(this).val();
					}
				});
				
				$.post(
					"alterar_cidades.php",
					{
						uf:y,
						cid:unescape(resultadoCEP["cidade"])
					},
					function(valor){
						$("#inpUF").val(y);
						$("#inpCid").html(valor);
					}
				);
				

				
            } else{
                alert("Endereço não encontrado!");
                $("#inpEnd").val("");
                $("#inpBair").val("");
                $("#hdIdCid").val("");
                $("#hdIdUF").val("");
            }
        });
    } else {
        alert("Digite um CEP!");
    }
}