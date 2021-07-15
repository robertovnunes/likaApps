function confirma(nome, url) {
	if (confirm('Tem certeza que deseja remover ' + nome + '?')) {
		window.location.href = url;
	} else {
		return void ('');
	}
}


