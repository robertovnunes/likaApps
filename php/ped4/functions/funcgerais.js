function mudaLb(s) {
	s.style.color = '#000000';
}

function addAdendo() {
	var ni = document.getElementById('myDiv');
	var newdiv = document.createElement('div');
	newdiv.setAttribute("id", "adendoNovo");
	newdiv.innerHTML = "<fieldset style='width:590px'><legend>Adendo</legend><table width='493' border='0' cellpadding='0' cellspacing='2'><tr><textarea name='adendoNovo' rows='3' cols='70' onkeyup='savCampo()'></textarea></tr></table></fieldset><br />";
	ni.appendChild(newdiv);
}

function janelaConfirmacao(nome, url) {

	
	if (window
			.confirm('Voce não salvou os  campos: ' + nome + '  Deseja salvar? ')) {
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
function muda(id, n, type) {
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
}

function savCampo(x) {
	document.getElementById('ctrl').value = 1;
	var val = document.getElementById('ccaba').value;
	for (i = 0; i < val.length; i++) {
		if (val.substr(i, i + 1) == x) {
			return;
		}
	}
	document.getElementById('ccaba').value = val + x;
}

function contre(field) {
	if (field.value.length > 1000) {
		field.value = field.value.substring(0, 1000);
		alert("Voc&ecirc; atingiu o m&aacute;ximo de caracteres permitidos.");
	}
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
	}
}


function pressao(v){
	v = v.replace(/\D/g, ""); 
	v = v.replace(/(\d{2})(\d)/, "$1/$2");
	return v;
}

function cpf(v) {
	v = v.replace(/\D/g, ""); // Remove tudo o que n�o � d�gito
	v = v.replace(/(\d{3})(\d)/, "$1.$2"); // Coloca um ponto entre o terceiro
											// e o quarto d�gitos
	v = v.replace(/(\d{3})(\d)/, "$1.$2"); // Coloca um ponto entre o terceiro
											// e o quarto d�gitos
	// de novo (para o segundo bloco de n�meros)
	v = v.replace(/(\d{3})(\d{1,2})$/, "$1-$2"); // Coloca um h�fen entre o
													// terceiro e o quarto
													// d�gitos
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