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
	var erros = {};
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
	
	$(".popup INPUT[name=cpf]").keyup(formatar_cpf).keypress(formatar_cpf);
	
	controlador_carregar();
	
	function controlador_carregar() {
		ajax_carregar(function(professores) {
			lista_carregando.hide();
			if (professores.length != 0) {
				$(professores).each(function(i, professor){
					tabela.append(ui_criar_linha(professor));
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
		var professor = extrair(form);	
		tabela.find("TR.template").remove();
		tabela.find("TR.template_editar").remove();
		lista_busca_carregando.show();
		lista_busca_vazia.hide();
		lista_vazia.hide();
		tabela.hide();
		ajax_buscar(professor, function(professores) {
			lista_busca_carregando.hide();
			if (professores.length != 0) {
				$(professores).each(function(i, professor){
					tabela.append(ui_criar_linha(professor));
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
		var professor = extrair(form);
		setar_cores(form);
		if( erros.flag == 0 )
		{
			var	linha = ui_criar_linha(professor);
			linha.find("IMG.carregando").show();
			tabela.append(linha);
			aplicar_zebra(tabela);
			tabela.show();
			lista_vazia.hide();
			lista_busca_vazia.hide();
			
			ajax_inserir(professor, function(professor) {
				var nova_linha = ui_criar_linha(professor);
				linha.replaceWith(nova_linha);
				aplicar_zebra(tabela);
			}, function (xhr){
				linha.remove();
			});
		}
	}
	
	function controlador_remover(professor, linha) {
		linha.find("IMG.carregando").show();
		ajax_remover(professor, function() {
			linha.remove();
			
			if( tabela.find("TR").length <= 1 )
			{
				tabela.hide();
				lista_vazia.show();
			}
			
			aplicar_zebra(tabela);
		},function(xhr){});
	}
	
	function controlador_salvar(professor,linha_editar) {
		var	nova_professor = extrair(linha_editar)
		setar_cores(linha_editar);
		if(erros.flag == 0)
		{
			nova_professor.id = professor.id;
	
			var linha = ui_criar_linha(nova_professor);
			linha.find("IMG.carregando").show();
			linha_editar.replaceWith(linha);
			aplicar_zebra(tabela);
			
			ajax_salvar(nova_professor, function(professor) {
				var nova_linha = ui_criar_linha(professor);
				linha.replaceWith(nova_linha);
				aplicar_zebra(tabela);
			}, function(xhr) {
				var nova_linha = ui_criar_linha_editar(professor);
				linha.replaceWith(nova_linha);
			});
		}
	}
	
	function controlador_editar(professor,linha) {
		tabela.find(".template_editar .cancelar").click();
		
		var linha_editar = ui_criar_linha_editar(professor);
		linha.replaceWith(linha_editar);
		aplicar_zebra(tabela);
	}
	
	function controlador_cancelar(professor,linha_editar) {
		var linha = ui_criar_linha(professor);
		linha_editar.replaceWith(linha);
		aplicar_zebra(tabela);
	}
	
	function ui_criar_linha(professor) {
		var linha = linha_template.clone();
		
		linha.attr("id",professor.id);
		linha.find(".linha_nome").text(professor.nome);
		linha.find(".linha_login").text(professor.login);
		linha.find(".carregando").hide();
		
		linha.find(".editar").click(function (e) {
			e.preventDefault();
			controlador_editar(professor, linha);
		});
		
		linha.find(".remover").click(function (e) {
			e.preventDefault();
			controlador_remover(professor, linha);
		});
		
		return linha;
	}
	
	function ui_criar_linha_editar(professor) {
		var linha_editar = linha_template_editar.clone();
		
		linha_editar.attr("id",professor.id);
		linha_editar.find("INPUT[name=nome]").val(professor.nome);
		linha_editar.find("INPUT[name=login]").val(professor.login);
		linha_editar.find("INPUT[name=cpf]").val(professor.cpf).keypress(formatar_cpf).keyup(formatar_cpf);
		linha_editar.find(".carregando").hide();
		
		linha_editar.find(".salvar").click(function (e) {
			e.preventDefault();
			controlador_salvar(professor, linha_editar);
		});
		
		linha_editar.find(".cancelar").click(function (e) {
			e.preventDefault();
			controlador_cancelar(professor, linha_editar);
		});
		
		return linha_editar;
	}
	
	function extrair(form) {
		var professor = {}
		
		professor.nome = form.find("INPUT[name=nome]").val().slice(0,50);
		professor.cpf = form.find("INPUT[name=cpf]").val().slice(0,14);
		professor.login = form.find("INPUT[name=login]").val().slice(0,15);
		professor.senha = form.find("INPUT[name=senha]").val().slice(0,15);
		
		verificar(professor);
			
		return professor;
	}
	
	function limpar_erros()
	{
		erros.flag = 0;
		erros.nome = 0;
		erros.cpf = 0;
		erros.senha = 0;
		erros.login = 0;
	}
	
	function verificar(professor)
	{
		limpar_erros();
		if(professor.nome.length == 0)
		{
			erros.flag = 1;
			erros.nome = 1;
		}
		if(professor.cpf.length != 14)
		{
			erros.flag = 1;
			erros.cpf = 1;
		}
		if(professor.login.length == 0)
		{
			erros.flag = 1;
			erros.login = 1;
		}
		if(professor.senha.length == 0)
		{
			erros.flag = 1;
			erros.senha = 1;
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
		
		if(erros.cpf == 1)
		{
			form.find("LABEL[for=cpf]").css("color","#FF0000");
		}
		else
		{
			form.find("LABEL[for=cpf]").css("color","#000000");
		}
		
		if(erros.login == 1)
		{
			form.find("LABEL[for=login]").css("color","#FF0000");
		}
		else
		{
			form.find("LABEL[for=login]").css("color","#000000");
		}
		
		if(erros.senha == 1)
		{
			form.find("LABEL[for=senha]").css("color","#FF0000");
		}
		else
		{
			form.find("LABEL[for=senha]").css("color","#000000");
		}
	}
	
	function ajax_carregar(callback_success, callback_error) {
		$.ajax({url: "api/professor/listar.php",
		type: "get",
		dataType: "json",
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_inserir(professor, callback_success, callback_error) {
		$.ajax({url: "api/professor/inserir.php",
		type: "post",
		dataType: "json",
		data: professor,
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_buscar(professor, callback_success, callback_error) {
		$.ajax({url: "api/professor/buscar.php",
		type: "get",
		dataType: "json",
		data: professor,
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_remover(professor, callback_success, callback_error) {
		$.ajax({url: "api/professor/remover.php",
		type: "post",
		dataType: "json",
		data: professor,
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_salvar(professor, callback_success, callback_error) {
		$.ajax({url: "api/professor/editar.php",
		type: "post",
		dataType: "json",
		data: professor,
		success: callback_success,
		error: callback_error});
	}
}

$(init);