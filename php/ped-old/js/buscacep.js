function getCEP() {
    // Se o campo CEP n�o estiver vazio
    if($.trim($("#inpCEP").val()) != ""){
        /*
            Para conectar no servi�o e executar o json, precisamos usar a fun��o getScript do jQuery, o getScript e o
            dataType:"jsonp" conseguem fazer o cross-domain, os outros dataTypes n�o possibilitam esta intera��o entre
            dom�nios diferentes.
            Estou chamando a url do servi�o passando o par�metro "formato=javascript" e o CEP digitado no formul�rio
            http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#cep").val()
        */
        $.getScript("http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#inpCEP").val(), function(){
            // o getScript d� um eval no script, ent�o � s� ler!
            //Se o resultado for igual a 1
            if(resultadoCEP["resultado"] == "1"){
                // troca o valor dos elementos
                $("#inpEnd").val(unescape(resultadoCEP["tipo_logradouro"])+" "+unescape(resultadoCEP["logradouro"]));
                $("#inpBair").val(unescape(resultadoCEP["bairro"]));
                $("#inpCid").val(unescape(resultadoCEP["cidade"]));
                $("#inpUF").val(unescape(resultadoCEP["uf"]));
            } else{
                alert("Endere�o n�o encontrado!");
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