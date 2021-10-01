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
	var opcao_turma_template = $(".template-turma");
	var opcao_turma_vazia_template = $(".template-turma-vazia");
	var opcao_modulo_template = $(".template-modulo");
	var opcao_modulo_vazia_template = $(".template-modulo-vazia");
	var select_turma;
	var select_modulo;
	var erros = {};
	erros.flag = 0;
	
	opcao_turma_template.remove();
	opcao_turma_vazia_template.remove();
	opcao_modulo_template.remove();
	opcao_modulo_vazia_template.remove();
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
		ajax_carregar_turma(function(turmas) {
			var entrada_turmas = $("SELECT[name=turma]");
			if (turmas.length != 0) {
				entrada_turmas.append(ui_criar_opcao_turma({'id':0,'nome':'Selecione uma Turma'}));
				$(turmas).each(function(i, turma){
					entrada_turmas.append(ui_criar_opcao_turma(turma));
				});
			} else {
				entrada_turmas.append(opcao_turma_vazia_template.clone());
			}
			select_turma = entrada_turmas;
		}, function(xhr, status) {});
		
		ajax_carregar_modulo(function(modulos) {
			var entrada_modulos = $("SELECT[name=modulo]");
			if (modulos.length != 0) {
				entrada_modulos.append(ui_criar_opcao_modulo({'id':0,'nome':'Selecione um Módulo'}));
				$(modulos).each(function(i, modulo){
					entrada_modulos.append(ui_criar_opcao_modulo(modulo));
				});
			} else {
				entrada_modulos.append(opcao_modulo_vazia_template.clone());
			}
			select_modulo = entrada_modulos;
		}, function(xhr, status) {});
		
		ajax_carregar(function(equipes) {
			lista_carregando.hide();
			if (equipes.length != 0) {
				$(equipes).each(function(i, equipe){
					tabela.append(ui_criar_linha(equipe));
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
		var equipe = extrair(form);	
		tabela.find("TR.template").remove();
		tabela.find("TR.template_editar").remove();
		lista_busca_carregando.show();
		lista_busca_vazia.hide();
		lista_vazia.hide();
		tabela.hide();
		ajax_buscar(equipe, function(equipes) {
			lista_busca_carregando.hide();
			if (equipes.length != 0) {
				$(equipes).each(function(i, equipe){
					tabela.append(ui_criar_linha(equipe));
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
		var equipe = extrair(form);
		setar_cores(form);
		if(erros.flag == 0)
		{
			var	linha = ui_criar_linha(equipe);
			linha.find("IMG.carregando").show();
			tabela.append(linha);
			aplicar_zebra(tabela);
			tabela.show();
			lista_vazia.hide();
			lista_busca_vazia.hide();
			
			ajax_inserir(equipe, function(equipe) {
				var nova_linha = ui_criar_linha(equipe);
				linha.replaceWith(nova_linha);
				aplicar_zebra(tabela);
			}, function (xhr){
				linha.remove();
			});
		}
	}
	
	function controlador_remover(equipe, linha) {
		linha.find("IMG.carregando").show();
		ajax_remover(equipe, function() {
			linha.remove();
			
			if( tabela.find("TR").length <= 1 )
			{
				tabela.hide();
				lista_vazia.show();
			}
			
			aplicar_zebra(tabela);
		},function(xhr){});
	}
	
	function controlador_salvar(equipe,linha_editar) {
		var	nova_equipe = extrair(linha_editar);
		setar_cores(linha_editar);
		if(erros.flag == 0)
		{
			nova_equipe.id = equipe.id;
			
			var linha = ui_criar_linha(nova_equipe);
			linha.find("IMG.carregando").show();
			linha_editar.replaceWith(linha);
			aplicar_zebra(tabela);
			
			ajax_salvar(nova_equipe, function(equipe) {
				var nova_linha = ui_criar_linha(equipe);
				linha.replaceWith(nova_linha);
				aplicar_zebra(tabela);
			}, function(xhr) {
				var nova_linha = ui_criar_linha_editar(equipe);
				linha.replaceWith(nova_linha);
			});
		}
	}
	
	function controlador_editar(equipe,linha) {
		tabela.find(".template_editar .cancelar").click();
		
		var linha_editar = ui_criar_linha_editar(equipe);
		linha.replaceWith(linha_editar);
		aplicar_zebra(tabela);
	}
	
	function controlador_cancelar(equipe,linha_editar) {
		var linha = ui_criar_linha(equipe);
		linha_editar.replaceWith(linha);
		aplicar_zebra(tabela);
	}
	
	function ui_criar_linha(equipe) {
		var linha = linha_template.clone();
		
		linha.attr("id",equipe.id);
		linha.find(".linha_nome").text(equipe.nome);
		
		linha.find(".linha_turma").text($(".popup SELECT[name=turma] OPTION[value="+equipe.idTurma+"]").text());
		if( equipe.idTurma == 0 )
		{
			linha.find(".linha_turma").text("");
		}
		
		linha.find(".linha_modulo").text($(".popup SELECT[name=modulo] OPTION[value="+equipe.idModulo+"]").text());
		if( equipe.idModulo == 0 )
		{
			linha.find(".linha_modulo").text("");
		}
		
		linha.find(".carregando").hide();
		
		linha.find(".editar").click(function (e) {
			e.preventDefault();
			controlador_editar(equipe, linha);
		});
		
		linha.find(".remover").click(function (e) {
			e.preventDefault();
			controlador_remover(equipe, linha);
		});
		
		return linha;
	}
	
	function ui_criar_opcao_turma(turma)
	{
		var opcao_turma = opcao_turma_template.clone();

		opcao_turma.val(turma.id);
		opcao_turma.text(turma.nome);
		
		return opcao_turma;
	}
	
	function ui_criar_opcao_modulo(modulo)
	{
		var opcao_modulo = opcao_modulo_template.clone();

		opcao_modulo.val(modulo.id);
		opcao_modulo.text(modulo.nome);
		
		return opcao_modulo;
	}
	
	function ui_criar_linha_editar(equipe) {
		var linha_editar = linha_template_editar.clone();
		
		linha_editar.attr("id",equipe.id);
		linha_editar.find("INPUT[name=nome]").val(equipe.nome);
		linha_editar.find("INPUT[name=descricao]").val(equipe.descricao);
		
		linha_editar.find("SELECT[name=turma]").append(select_turma.find("OPTION").clone());
		linha_editar.find("SELECT[name=turma] OPTION[value="+equipe.idTurma+"]").attr("selected", true);
		
		linha_editar.find("SELECT[name=modulo]").append(select_modulo.find("OPTION").clone());
		linha_editar.find("SELECT[name=modulo] OPTION[value="+equipe.idModulo+"]").attr("selected", true);
		
		linha_editar.find(".carregando").hide();
		
		linha_editar.find(".salvar").click(function (e) {
			e.preventDefault();
			controlador_salvar(equipe, linha_editar);
		});
		
		linha_editar.find(".cancelar").click(function (e) {
			e.preventDefault();
			controlador_cancelar(equipe, linha_editar);
		});
		
		return linha_editar;
	}
	
	function extrair(form) {
		var equipe = {}
		
		equipe.nome = form.find("INPUT[name=nome]").val().slice(0,30);
		equipe.descricao = form.find("INPUT[name=descricao]").val().slice(0,60);
		equipe.idTurma = form.find("SELECT[name=turma] OPTION:selected").val();
		equipe.idModulo = form.find("SELECT[name=modulo] OPTION:selected").val();
		
		verificar(equipe);
		
		return equipe;
	}
	
	function limpar_erros()
	{
		erros.flag = 0;
		erros.nome = 0;
		erros.descricao = 0;
	}
	
	function verificar(equipe)
	{
		limpar_erros();
		
		if(equipe.nome.length == 0)
		{
			erros.flag = 1;
			erros.nome = 1;
		}
		if(equipe.descricao.length == 0)
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
		$.ajax({url: "api/equipe/listar.php",
		type: "get",
		dataType: "json",
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_inserir(equipe, callback_success, callback_error) {
		$.ajax({url: "api/equipe/inserir.php",
		type: "post",
		dataType: "json",
		data: equipe,
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_buscar(equipe, callback_success, callback_error) {
		$.ajax({url: "api/equipe/buscar.php",
		type: "get",
		dataType: "json",
		data: equipe,
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_remover(equipe, callback_success, callback_error) {
		$.ajax({url: "api/equipe/remover.php",
		type: "post",
		dataType: "json",
		data: equipe,
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_salvar(equipe, callback_success, callback_error) {
		$.ajax({url: "api/equipe/editar.php",
		type: "post",
		dataType: "json",
		data: equipe,
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_carregar_turma(callback_success, callback_error) {
		$.ajax({url: "api/turma/listar.php",
		type: "get",
		dataType: "json",
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_carregar_modulo(callback_success, callback_error) {
		$.ajax({url: "api/modulo/listar.php",
		type: "get",
		dataType: "json",
		success: callback_success,
		error: callback_error});
	}
}

$(init);