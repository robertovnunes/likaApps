function removerItemGenerico(str,url) {
	if (confirm('Tem certeza que deseja remover ' + str + '?')) {
		window.location.href = url;
	} else {
		return void ('');
	}
}