function mudaLb(s) {
	/*s.style.color = '#666666';*/ //formato antes
    s.style.color = '#666666';

}

function addAdendo() {
	adendo.disabled=true;
	salvar.disabled=false;
	var ni = document.getElementById('myDiv');
	var newdiv = document.createElement('div');
	newdiv.setAttribute("id", "adendoNovo");
	newdiv.innerHTML = "<fieldset class='full'><legend>Adendo</legend><textarea name='adendoNovo' rows='3' cols='65' onkeyup='savCampo()'></textarea></fieldset><br />";
	ni.appendChild(newdiv);
}

function janelaConfirmacao(nome, url) {


	if (window
			.confirm('Voce nÃ£o salvou os  campos: ' + nome + '  Deseja salvar? ')) {
		window.location.href = url;
	} else {
		return void ('');
	}
}

function AlternarAbasIS(elem, div) {
	var k = 0;
	e = document.getElementById(elem);
	d = document.getElementById(div);
	for (i = 1; i <= 10; i++) {
		m = document.getElementById('abais' + i);
		m.className = '';
		c = document.getElementById('divis' + i);
		c.style.display = 'none';
		if (m == e)
			k = i;
	}
	e.className = 'msel';
	d.style.display = '';
	document.getElementById('ctrlis').value = k;
}

function AlternarAbasHP(elem, div) {
	var k = 0;
	e = document.getElementById(elem);
	d = document.getElementById(div);
	for (i = 1; i <= 10; i++) {
		m = document.getElementById('abahp' + i);
		m.className = '';
		c = document.getElementById('divhp' + i);
		c.style.display = 'none';
		if (m == e)
			k = i;
	}
	e.className = 'msel';
	d.style.display = '';
	document.getElementById('ctrlhp').value = k;
}

function AlternarAbasEX(elem, div) {
	var k = 0;
	e = document.getElementById(elem);
	d = document.getElementById(div);
	for (i = 1; i <= 15; i++) {
		m = document.getElementById('abaex' + i);
		m.className = '';
		m.style.display = 'none';
		c = document.getElementById('divex' + i);
		c.style.display = 'none';
		if (m == e)
			k = i;
	}
	e.className = 'msel';
	d.style.display = '';
	document.getElementById('ctrlex').value = k;
}

function cDisplay(a) {

	var j = 0, k = 0;
	if (a == 1) {

		j = 1;
		k = 3;
	} else if (a == 2) {
		j = 4;
		k = 5
	} else if (a == 3) {
		j = 6;
		k = 15;
	}
	for (i = j; i <= k; i++) {
		m = document.getElementById('abaex' + i);

		$(m).css('display', 'block');

	}

}
function pesquisarCep(cep){
	alert(cep);
}


/*function muda(id, n, type) {
	if (!document.getElementById('ctrl')) {
		if (type == 'a')
			window.location.href = 'acesso_aluno.php';
		else if (type == 'n')
			window.location.href = 'cadastro_paciente.php';
	} else {
		if (document.getElementById('ctrl').value == 0) {
			if (type == 'p')
				window.location.href = 'prontuario_paciente.php?at=' + id
						+ '&n=' + n;
			else if (type == 'a')
				window.location.href = 'acesso_aluno.php';
			else if (type == 'n')
				window.location.href = 'cadastro_paciente.php';
			else if (type == 'h')
				window.location.href = 'historico_paciente.php?pr=' + id
						+ '&n=' + n;
		} else {
			var overlay = new myOverlay();
			var resp = overlay.confirm("Deseja prosseguir sem salvar?",'' ,'' ,id,n,type );

			if (resp) {
				if (type == 'p')
					window.location.href = 'prontuario_paciente.php?at=' + id
							+ '&n=' + n;
				else if (type == 'a')
					window.location.href = 'acesso_aluno.php';
				else if (type == 'n')
					window.location.href = 'cadastro_paciente.php';
				if (type == 'h')
					window.location.href = 'historico_paciente.php?pr=' + id
							+ '&n=' + n;
			}
		}
	}
}*/

function mudaConduta(idAtend,idHipotese){
	//alert(idHipotese);
	window.location.href = 'prontuario_paciente.php?at='+idAtend+'&aba=conduta&hd='+idHipotese;
}

function muda(id,n,type){
    if (!document.getElementById('ctrl') || document.getElementById('ctrl').value == 0){
        if (type == 'p')
    		window.location.href = 'prontuario_paciente.php?at='+id+'&aba='+n;
    	else if (type == 'a')
    		window.location.href = 'aluno.php';
    	else if (type == 'n')
    		window.location.href = 'cadastro_paciente.php';
    	else if (type == 'h')
    		window.location.href = 'historico_paciente.php?pr='+id;
        else if (type == 'e')
		    window.location.href = 'editarPerfil.php';
        else if (type == 't')
		    window.location.href = 'lista_atendimentos.php?pr='+id;
		else if (type == 'r')
			window.location.href = 'relatorioHistorico.php?pr='+id;
		else if (type == 'rp')
			window.location.href = 'relatorioProntuario.php?at='+id;
    } else if (document.getElementById('ctrl') && document.getElementById('ctrl').value != 0){
	    var resp = confirm("Deseja prosseguir sem salvar?");
		if (resp){
		    if (type == 'p'){
                window.location.href = 'prontuario_paciente.php?at='+id+'&aba='+n;
			} else if (type == 'a'){
        		window.location.href = 'aluno.php';
			} else if (type == 'n'){
				window.location.href = 'cadastro_paciente.php';
			} else if (type == 'h'){
				window.location.href = 'historico_paciente.php?pr='+id;
            } else if (type == 'e'){
			    window.location.href = 'editarPerfil.php';
			} else if (type == 't'){
				window.location.href = 'lista_atendimentos.php?pr='+id;
			} else if (type == 'r'){
			window.location.href = 'relatorioHistorico.php?pr='+id;
			}
		}
	}
}

function savCampo(x) {
	document.getElementById('ctrl').value = 1;
	var val = document.getElementById('ccaba').value;
	var bool = false;
	for (i = 0; i < val.length; i++) {
		if (val.substr(i, i + 1) == x) {
			bool = true;
			break;
		}
	}
	if (!bool)
		document.getElementById('ccaba').value = val + x;
}

function contre(field) {
	if (field.value.length > 1000) {
		field.value = field.value.substring(0, 1000);
		alert("Voc&ecirc; atingiu o m&aacute;ximo de caracteres permitidos.");
	}
}

function MascaraDE(objTextBox, e){
    var SeparadorHora = ':';
	var sep = 0;
    var key = '';
    var i = j = 0;
    var len = len2 = 0;
    var strCheck = '0123456789';
    var aux = aux2 = '';
    var whichCode = (window.Event) ? e.which : e.keyCode;
    if (whichCode == 13) return true;
    key = String.fromCharCode(whichCode); // Valor para o código da Chave
    if (strCheck.indexOf(key) == -1) return false; // Chave inválida
    len = objTextBox.value.length;
     
    for(i = 0; i < len; i++)
        if ((objTextBox.value.charAt(i) != '0') && (objTextBox.value.charAt(i) != SeparadorHora)) break;
    aux = '';
    for(; i < len; i++)
        if (strCheck.indexOf(objTextBox.value.charAt(i))!=-1) aux += objTextBox.value.charAt(i);
    aux += key;
    len = aux.length;
    if (len == 0) objTextBox.value = '';
    if (len == 1) objTextBox.value = '0'+ SeparadorHora + '0' + aux;
    if (len == 2) objTextBox.value = '0'+ SeparadorHora + aux;
    if (len > 2 && len < 5) {
        aux2 = '';
        for (j = 0, i = len - 3; i >= 0; i--) {
            aux2 += aux.charAt(i);
            j++;
        }
        objTextBox.value = '';
        len2 = aux2.length;
        for (i = len2 - 1; i >= 0; i--)
        objTextBox.value += aux2.charAt(i);
        objTextBox.value += SeparadorHora + aux.substr(len - 2, len);
    }
    return false;
}

function mascara(o, f) {
	v_obj = o;
	v_fun = f;
	setTimeout("execmascara()", 1);
}

function execmascara() {
	if (v_fun == 1) {
		v_obj.value = cpf(v_obj.value);
	} else if (v_fun == 2) {
		v_obj.value = data(v_obj.value);
	} else if (v_fun == 3) {
		v_obj.value = cep(v_obj.value);
	} else if (v_fun == 4) {
		v_obj.value = hora(v_obj.value);
	} else if (v_fun == 5){
		v_obj.value = pressao(v_obj.value);
	} else if (v_fun == 6){
		v_obj.value = num(v_obj.value);
	}
}


function pressao(v){
	v = v.replace(/\D/g, ""); 
	v = v.replace(/(\d{2})(\d)/, "$1/$2");
	return v;
}

function cpf(v) {
	v = v.replace(/\D/g, ""); // Remove tudo o que nï¿½o ï¿½ dï¿½gito
	v = v.replace(/(\d{3})(\d)/, "$1.$2"); // Coloca um ponto entre o terceiro
											// e o quarto dï¿½gitos
	v = v.replace(/(\d{3})(\d)/, "$1.$2"); // Coloca um ponto entre o terceiro
											// e o quarto dï¿½gitos
	// de novo (para o segundo bloco de nï¿½meros)
	v = v.replace(/(\d{3})(\d{1,2})$/, "$1-$2"); // Coloca um hï¿½fen entre o
													// terceiro e o quarto
													// dï¿½gitos
	return v;
}

function data(v) {
	v = v.replace(/\D/g, "");
	v = v.replace(/(\d{2})(\d)/, "$1/$2");
	v = v.replace(/(\d{2})(\d{1,4})$/, "$1/$2");
	return v;
}

function cep(v) {
	v = v.replace(/\D/g, "");
	v = v.replace(/(\d{5})(\d{1,3})$/, "$1-$2");
	return v;
}

function hora(v) {
	v = v.replace(/\D/g, "");
	v = v.replace(/(\d{2})(\d{1,2})$/, "$1:$2");
	return v;
}

function num(v) {
	v = v.replace(/\D/g, "");
	v = v.replace(/(\d{1,4})$/, "$1");
	return v;
}

function newIDHip(hip) {
    document.getElementById('idhipot').value = hip;
 
}
function OpcaoHip(hip, valor){			/* Foi feita essa função porque o "type=image" não funciona com firefox */
	document.getElementById('idhipot').value = hip;
	if(valor == "chip")
		document.getElementById('tdHD').innerHTML = "<input type='hidden' name='chip' value='Confirmar Hipótese' >";
	if(valor == "rhip")
		document.getElementById('tdHD').innerHTML = "<input type='hidden' name='rhip' value='Remover Hipótese' >";
}

function testandoClique(hip){
	document.getElementById('idhipot').value = hip;	
}

function removerVacinaMod(vacina, dose) {
    document.getElementById('vacina').value = vacina;
    document.getElementById('dose').value = dose;  
	document.getElementById('tdVAC').innerHTML = "<input type='hidden' name='vac' value='Remover Vacina' >";
}

function removerVacina(vacina, dose) {
    document.getElementById('vacina').value = vacina;
    document.getElementById('dose').value = dose;
}

function verificar(){
	document.getElementById("gamb").value = "true";
	document.getElementById("pront").submit();
}
		
function concatenar(msg1, msg2){
	if (msg1 == "") msg1 = msg2;
	else msg1 = msg1 + ", "+ msg2;
	return msg1;
}

function verificarEX(inspecao, pele, ganglios,estadpuberal,desenvneuropsicomotor, cranio, olhos, 
	sistotorrino, pescoco, aprespiratorio , apcardiovascular, apgastroint , apgenitourinario, 
	apmuscesqueletico, sistnervoso ){
	var erroJanela = "";
	if( inspecao == "0")
		erroJanela = concatenar(erroJanela, "Inspe&ccedil;&atilde;o");
	if( pele == "0")
		erroJanela = concatenar(erroJanela, "Pele e Mucosas");
	if( ganglios == "0")
		erroJanela = concatenar(erroJanela, "Ganglios Linf&aacute;ticos");
	if( estadpuberal == "0")
		erroJanela = concatenar(erroJanela, "Estadiamento Puberal");
	if( desenvneuropsicomotor == "0")
		erroJanela = concatenar(erroJanela, "Desenvolvimento Neuropsicomotor");
	if( cranio == "0")
		erroJanela = concatenar(erroJanela, "Cr&acirc;nio");
	if( olhos == "0")
		erroJanela = concatenar(erroJanela, "Olhos");
	if( sistotorrino == "0")
		erroJanela = concatenar(erroJanela, "Sistema Otorrinolaringol&oacute;gico");
	if( pescoco == "0")
		erroJanela = concatenar(erroJanela, "Pesco&ccedil;o");
	if( aprespiratorio == "0")
		erroJanela = concatenar(erroJanela, "Respirat&oacute;rio");
	if( apcardiovascular == "0")
		erroJanela = concatenar(erroJanela, "Cardiovascular");
	if( apgastroint == "0")
		erroJanela = concatenar(erroJanela, "Gastro Intestinal");
	if( apgenitourinario == "0")
		erroJanela = concatenar(erroJanela, "Genito-Urin&aacute;rio");
	if( apmuscesqueletico == "0")
		erroJanela = concatenar(erroJanela, "M&uacute;sculo Esquel&eacute;tico");
	if( sistnervoso == "0")
		erroJanela = concatenar(erroJanela, "Sistema Nervoso");

	if(erroJanela == "" ){
		document.getElementById("gamb").value = "true";
		document.getElementById("pront").submit();
	}else{
		var overlay = new myOverlay();
		overlay.confirm('Voce n&atilde;o salvou os seguintes itens: <br />'+erroJanela+'.<br /> Deseja assinar?','','','','','o');
   }
}


function verificarIS(geral, pele, olhos,ouvidos,respiratorio , cardiovascular, gastroint , genitourinario, muscesqueletico, nervoso ){
	var erroJanela = "";
	if( geral == "0")
		erroJanela = concatenar(erroJanela, "Geral");
	if( pele == "0")
		erroJanela = concatenar(erroJanela, "Pele");
	if( olhos == "0")
		erroJanela = concatenar(erroJanela, "Olhos");
	if( ouvidos == "0")
		erroJanela = concatenar(erroJanela, "Ouvidos");
	if( respiratorio == "0")
		erroJanela = concatenar(erroJanela, "Respirat&oacute;rio");
	if( cardiovascular == "0")
		erroJanela = concatenar(erroJanela, "Cardiovascular");
	if( gastroint == "0")
		erroJanela = concatenar(erroJanela, "Gastro Intestinal");
	if( genitourinario == "0")
		erroJanela = concatenar(erroJanela, "Genito-Urin&aacute;rio");
	if( muscesqueletico == "0")
		erroJanela = concatenar(erroJanela, "M&uacute;sculo Esquel&eacute;tico");
	if( nervoso == "0")
		erroJanela = concatenar(erroJanela, "Nervoso");

	if(erroJanela == "" ){
		document.getElementById("gamb").value = "true";
		document.getElementById("pront").submit();
	}else{
		var overlay = new myOverlay();
		overlay.confirm('Voce n&atilde;o salvou os seguintes itens: <br>'+erroJanela+'. <br>Deseja assinar?',"gamb","pront");
		//	document.getElementById("gamb").value = "true";
		//	document.getElementById("pront").submit();
	}
}