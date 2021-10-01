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
                $("#inpCid").val(unescape(resultadoCEP["cidade"]));
                $("#inpUF").val(unescape(resultadoCEP["uf"]));
            } else{
                alert("Endereço não encontrado!");
                $("#inpEnd").val("");
                $("#inpBair").val("");
                $("#inpCid").val("");
                $("#inpUF").val("");
            }
        });
    } else {
        alert("Digite um CEP!");
    }
}