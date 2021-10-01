function mascara(o,f){
    v_obj=o;
    v_fun=f;
    setTimeout("execmascara()",1);
}

function execmascara(){
    v_obj.value=v_fun(v_obj.value);
}

function cpf(v){
    v=v.replace(/\D/g,"");                  //Remove tudo o que não é dígito
    v=v.replace(/(\d{3})(\d)/,"$1.$2");      //Coloca um ponto entre o terceiro e o quarto dígitos
    v=v.replace(/(\d{3})(\d)/,"$1.$2");      //Coloca um ponto entre o terceiro e o quarto dígitos
    //de novo (para o segundo bloco de números)
    v=v.replace(/(\d{3})(\d{1,2})$/,"$1-$2"); //Coloca um hífen entre o terceiro e o quarto dígitos
    return v;
}

function telefone(v){
    v=v.replace(/\D/g,"");                  //Remove tudo o que não é dígito
    v=v.replace(/(\d{4})(\d)/,"$1-$2");      
    return v;
}

function prontuario(v){
    v=v.replace(/\D/g,"");
    v=v.replace(/(\d{7})(\d)/,"$1-$2");
    return v;
}


function data(v){
    v=v.replace(/\D/g,"") ;                   //Remove tudo o que não é dígito
    v=v.replace(/(\d{2})(\d)/,"$1/$2");       //Coloca um ponto entre o terceiro e o quarto dígitos
    v=v.replace(/(\d{2})(\d)/,"$1/$2");       //Coloca um ponto entre o terceiro e o quarto dígitos
    //de novo (para o segundo bloco de números)
    // v=v.replace(/(\d{3})(\d{1,2})$/,"$1-$2") //Coloca um hífen entre o terceiro e o quarto dígitos
    return v;
}

function soNumeros(v){
    return v.replace(/\D/g,"");
}

function limitaTamanho(campo, limite){
    var erro = "Limite de " + limite + " caracteres ultrapassado!";

    if (campo.value.length >= limite)
        alert(erro);

    if (campo.value.length >= limite) {
        
        campo.value = campo.value.substring(0,limite -1);
         
    }
    document.forms[0].xyz.value = campo.value.length
}

function troca(c){
    campo = c;
    setTimeout("exec_troca()",1);

}

function exec_troca(){
    campo.value = virgula(campo.value);
}

function virgula(texto){
    texto = texto.replace(".",",");
    return texto;
}


