function removerLaudo(prontuario,url) {
	if (confirm('Tem certeza que deseja remover o laudo do prontu�rio ' + prontuario + '?')) {
		window.location.href = url;//"citopato.remove.logic?laudoCitopatologico.id="+ id;
	} else {
		return void ('');
	}
}


