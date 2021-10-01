/**
 * @author Emanuel
 */

function init() {
	var tabela = $("#tabela");
	var linha_template = $(".template");
	var linha_template_editar = $(".template_editar");
	var lista_carregando = $("#lista-carregando");
	var lista_vazia = $("#lista-vazia");
	var lista_busca_carregando = $("#lista-busca-carregando");
	var lista_busca_vazia = $("#lista-busca-vazia");
	var erros = {}
	erros.flag = 0;
	
	linha_template.remove();
	linha_template_editar.remove();
	lista_vazia.hide();
	lista_busca_vazia.hide();
	lista_busca_carregando.hide();
	tabela.hide();
	
	$("BUTTON.inserir").click(function(e) {
		e.preventDefault();
		controlador_inserir($(this).parent());
	});
	
	$("BUTTON.buscar").click(function(e) {
		e.preventDefault();
		controlador_buscar($(this).parent());
	});
	
	controlador_carregar();
	
	function controlador_carregar() {
		ajax_carregar(function(modulos) {
			lista_carregando.hide();
			if (modulos.length != 0) {
				$(modulos).each(function(i, modulo){
					tabela.append(ui_criar_linha(modulo));
				});
				aplicar_zebra(tabela);
				tabela.show();
				lista_vazia.hide();
			} else {
				tabela.hide();
				lista_vazia.show();
			}
		},function(xhr, status){});
	}
	
	function controlador_buscar(form) {
		limpar_erros();
		setar_cores(form);
		var modulo = extrair(form);	
		tabela.find("TR.template").remove();
		tabela.find("TR.template_editar").remove();
		lista_busca_carregando.show();
		lista_busca_vazia.hide();
		lista_vazia.hide();
		tabela.hide();
		ajax_buscar(modulo, function(modulos) {
			lista_busca_carregando.hide();
			if (modulos.length != 0) {
				$(modulos).each(function(i, modulo){
					tabela.append(ui_criar_linha(modulo));
				});
				tabela.show();
				lista_busca_vazia.hide();
			} else {
				tabela.hide();
				lista_busca_vazia.show();
			}
			aplicar_zebra(tabela);
		}, function (xhr){});	
	}
	
	function controlador_inserir(form) {
		var modulo = extrair(form);
		setar_cores(form);
		if(erros.flag == 0)
		{
			var	linha = ui_criar_linha(modulo);
			linha.find("IMG.carregando").show();
			tabela.append(linha);
			aplicar_zebra(tabela);
			tabela.show();
			lista_vazia.hide();
			lista_busca_vazia.hide();
						
			ajax_inserir(modulo, function(modulo) {
				var nova_linha = ui_criar_linha(modulo);
				linha.replaceWith(nova_linha);
				aplicar_zebra(tabela);
			}, function (xhr){
				linha.remove();
			});
		}
	}
	
	function controlador_remover(modulo, linha) {
		linha.find("IMG.carregando").show();
		ajax_remover(modulo, function() {
			linha.remove();
			
			if( tabela.find("TR").length <= 1 )
			{
				tabela.hide();
				lista_vazia.show();
			}
			
			aplicar_zebra(tabela);
		},function(xhr){});
	}
	
	function controlador_salvar(modulo,linha_editar) {
		var	novo_modulo = extrair(linha_editar);
		setar_cores(linha_editar);
		if(erros.flag == 0)
		{
			novo_modulo.id = modulo.id;
			var linha = ui_criar_linha(novo_modulo);
			linha.find("IMG.carregando").show();
			linha_editar.replaceWith(linha);
			aplicar_zebra(tabela);
			
			ajax_salvar(novo_modulo, function(modulo) {
				var nova_linha = ui_criar_linha(modulo);
				linha.replaceWith(nova_linha);
				aplicar_zebra(tabela);
			}, function(xhr) {
				var nova_linha = ui_criar_linha_editar(modulo);
				linha.replaceWith(nova_linha);
			});
		}
	}
	
	function controlador_editar(modulo,linha) {
		tabela.find(".template_editar .cancelar").click();
		
		var linha_editar = ui_criar_linha_editar(modulo);
		linha.replaceWith(linha_editar);
		aplicar_zebra(tabela);
	}
	
	function controlador_cancelar(modulo,linha_editar) {
		var linha = ui_criar_linha(modulo);
		linha_editar.replaceWith(linha);
		aplicar_zebra(tabela);
	}
	
	function ui_criar_linha(modulo) {
		var linha = linha_template.clone();
		
		linha.attr("id",modulo.id);
		linha.find(".linha_nome").text(modulo.nome);
		linha.find(".linha_objetivo").text(modulo.objetivo);
		linha.find(".linha_descricao").text(modulo.descricao);
		linha.find(".carregando").hide();
		
		linha.find(".editar").click(function (e) {
			e.preventDefault();
			controlador_editar(modulo, linha);
		});
		
		linha.find(".remover").click(function (e) {
			e.preventDefault();
			controlador_remover(modulo, linha);
		});
		
		return linha;
	}
	
	function ui_criar_linha_editar(modulo) {
		var linha_editar = linha_template_editar.clone();
		
		linha_editar.attr("id",modulo.id);
		linha_editar.find("INPUT[name=nome]").val(modulo.nome);
		linha_editar.find("INPUT[name=objetivo]").val(modulo.objetivo);
		linha_editar.find("INPUT[name=descricao]").val(modulo.descricao);
		linha_editar.find(".carregando").hide();
		
		linha_editar.find(".salvar").click(function (e) {
			e.preventDefault();
			controlador_salvar(modulo, linha_editar);
		});
		
		linha_editar.find(".cancelar").click(function (e) {
			e.preventDefault();
			controlador_cancelar(modulo, linha_editar);
		});
		
		return linha_editar;
	}
	
	function extrair(form) {
		var modulo = {}
		
		modulo.nome = form.find("INPUT[name=nome]").val().slice(0,30);
		modulo.objetivo = form.find("INPUT[name=objetivo]").val().slice(0,30);
		modulo.descricao = form.find("INPUT[name=descricao]").val().slice(0,60);
		
		verificar(modulo)
		
		return modulo;
	}
	
	function limpar_erros()
	{
		erros.flag = 0;
		erros.nome = 0;
		erros.objetivo = 0;
		erros.descricao = 0;
	}
	
	function verificar(professor)
	{
		limpar_erros();
		if(professor.nome.length == 0)
		{
			erros.flag = 1;
			erros.nome = 1;
		}
		if(professor.objetivo.length == 0)
		{
			erros.flag = 1;
			erros.objetivo = 1;
		}
		if(professor.descricao.length == 0)
		{
			erros.flag = 1;
			erros.descricao = 1;
		}
	}
	
	function setar_cores(form)
	{
		if(erros.nome == 1)
		{
			form.find("LABEL[for=nome]").css("color","#FF0000");
		}
		else
		{
			form.find("LABEL[for=nome]").css("color","#000000");
		}
		
		if(erros.objetivo == 1)
		{
			form.find("LABEL[for=objetivo]").css("color","#FF0000");
		}
		else
		{
			form.find("LABEL[for=objetivo]").css("color","#000000");
		}
		
		if(erros.descricao == 1)
		{
			form.find("LABEL[for=descricao]").css("color","#FF0000");
		}
		else
		{
			form.find("LABEL[for=descricao]").css("color","#000000");
		}
	}
	
	function ajax_carregar(callback_success, callback_error) {
		$.ajax({url: "api/modulo/listar.php",
		type: "get",
		dataType: "json",
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_inserir(modulo, callback_success, callback_error) {
		$.ajax({url: "api/modulo/inserir.php",
		type: "post",
		dataType: "json",
		data: modulo,
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_buscar(modulo, callback_success, callback_error) {
		$.ajax({url: "api/modulo/buscar.php",
		type: "get",
		dataType: "json",
		data: modulo,
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_remover(modulo, callback_success, callback_error) {
		$.ajax({url: "api/modulo/remover.php",
		type: "post",
		dataType: "json",
		data: modulo,
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_salvar(modulo, callback_success, callback_error) {
		$.ajax({url: "api/modulo/editar.php",
		type: "post",
		dataType: "json",
		data: modulo,
		success: callback_success,
		error: callback_error});
	}
}

$(init);