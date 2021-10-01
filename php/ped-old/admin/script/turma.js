/**
 * @author Emanuel
 */

function init()
{
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
	
	$("BUTTON.inserir").click(function(e) 
	{
		e.preventDefault();
		controlador_inserir($(this).parent());
	});
	
	$("BUTTON.buscar").click(function(e) 
	{
		e.preventDefault();
		controlador_buscar($(this).parent());
	});
	
	controlador_carregar();
	
	function controlador_carregar() 
	{
		ajax_carregar(function(turmas)
		{
			lista_carregando.hide();
			if (turmas.length != 0)
			{
				$(turmas).each(function(i, turma)
				{
					tabela.append(ui_criar_linha(turma));
				});
				aplicar_zebra(tabela);
				tabela.show();
				lista_vazia.hide();
			}
			else 
			{
				tabela.hide();
				lista_vazia.show();
			}
		},function(xhr, status){});
	}
	
	function controlador_buscar(form) 
	{
		limpar_erros();
		setar_cores(form);
		var turma = extrair(form);	
		tabela.find("TR.template").remove();
		tabela.find("TR.template_editar").remove();
		lista_busca_carregando.show();
		lista_busca_vazia.hide();
		lista_vazia.hide();
		tabela.hide();
		ajax_buscar(turma, function(turmas) 
		{
			lista_busca_carregando.hide();
			if (turmas.length != 0) 
			{
				$(turmas).each(function(i, turma)
				{
					tabela.append(ui_criar_linha(turma));
				});
				tabela.show();
				lista_busca_vazia.hide();
			} 
			else 
			{
				tabela.hide();
				lista_busca_vazia.show();
			}
			aplicar_zebra(tabela);
		}, 
		function (xhr){});	
	}
	
	function controlador_inserir(form) 
	{
		var turma = extrair(form);
		setar_cores(form);
		if(erros.flag == 0)
		{
			var	linha = ui_criar_linha(turma);
			linha.find("IMG.carregando").show();
			tabela.append(linha);
			aplicar_zebra(tabela);
			tabela.show();
			lista_vazia.hide();
			lista_busca_vazia.hide();		
				
			ajax_inserir(turma, function(turma) 
			{
				var nova_linha = ui_criar_linha(turma);
				linha.replaceWith(nova_linha);
				aplicar_zebra(tabela);
			}, function (xhr)
			{
				linha.remove();
			});
		}
	}
	
	function controlador_remover(turma, linha) 
	{
		linha.find("IMG.carregando").show();
		ajax_remover(turma, function() 
		{
			linha.remove();
			
			if( tabela.find("TR").length <= 1 )
			{
				tabela.hide();
				lista_vazia.show();
			}
			
			aplicar_zebra(tabela);
		},
		function(xhr){});
	}
	
	function controlador_salvar(turma,linha_editar) 
	{
		var	nova_turma = extrair(linha_editar);
		setar_cores(linha_editar);
		if(erros.flag == 0)
		{
			nova_turma.id = turma.id;
			var linha = ui_criar_linha(nova_turma);
			linha.find("IMG.carregando").show();
			linha_editar.replaceWith(linha);
			aplicar_zebra(tabela);
			
			ajax_salvar(nova_turma, function(turma) 
			{
				var nova_linha = ui_criar_linha(turma);
				linha.replaceWith(nova_linha);
				aplicar_zebra(tabela);
			}, 
			function(xhr) 
			{
				var nova_linha = ui_criar_linha_editar(turma);
				linha.replaceWith(nova_linha);
			});
		}
	}
	
	function controlador_editar(turma,linha) 
	{
		tabela.find(".template_editar .cancelar").click();
		
		var linha_editar = ui_criar_linha_editar(turma);
		linha.replaceWith(linha_editar);
		aplicar_zebra(tabela);
	}
	
	function controlador_cancelar(turma,linha_editar) 
	{
		var linha = ui_criar_linha(turma);
		linha_editar.replaceWith(linha);
		aplicar_zebra(tabela);
	}
	
	function ui_criar_linha(turma) 
	{
		var linha = linha_template.clone();
		
		linha.attr("id",turma.id);
		linha.find(".linha_nome").text(turma.nome);
		linha.find(".linha_periodo").text(turma.periodo);
		linha.find(".carregando").hide();
		
		linha.find(".editar").click(function (e) 
		{
			e.preventDefault();
			controlador_editar(turma, linha);
		});
		
		linha.find(".remover").click(function (e) 
		{
			e.preventDefault();
			controlador_remover(turma, linha);
		});
		
		return linha;
	}
	
	function ui_criar_linha_editar(turma) 
	{
		var linha_editar = linha_template_editar.clone();
		
		linha_editar.attr("id",turma.id);
		linha_editar.find("INPUT[name=nome]").val(turma.nome);
		linha_editar.find("INPUT[name=periodo]").val(turma.periodo);
		linha_editar.find(".carregando").hide();
		
		linha_editar.find(".salvar").click(function (e) 
		{
			e.preventDefault();
			controlador_salvar(turma, linha_editar);
		});
		
		linha_editar.find(".cancelar").click(function (e) 
		{
			e.preventDefault();
			controlador_cancelar(turma, linha_editar);
		});
		
		return linha_editar;
	}
	
	function extrair(form) 
	{
		var turma = {}
		
		turma.nome = form.find("INPUT[name=nome]").val().slice(0,30);
		turma.periodo = form.find("INPUT[name=periodo]").val().slice(0,20);
		
		verificar(turma);
		
		return turma;
	}
	
	function limpar_erros()
	{
		erros.flag = 0;
		erros.nome = 0;
		erros.periodo = 0;
	}
	
	function verificar(professor)
	{
		limpar_erros();
		
		if(professor.nome.length == 0)
		{
			erros.flag = 1;
			erros.nome = 1;
		}
		if(professor.periodo.length == 0)
		{
			erros.flag = 1;
			erros.periodo = 1;
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
		
		if(erros.periodo == 1)
		{
			form.find("LABEL[for=periodo]").css("color","#FF0000");
		}
		else
		{
			form.find("LABEL[for=periodo]").css("color","#000000");
		}
	}
	
	function ajax_carregar(callback_success, callback_error) 
	{
		$.ajax({url: "api/turma/listar.php",
		type: "get",
		dataType: "json",
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_inserir(turma, callback_success, callback_error) 
	{
		$.ajax({url: "api/turma/inserir.php",
		type: "post",
		dataType: "json",
		data: turma,
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_buscar(turma, callback_success, callback_error) 
	{
		$.ajax({url: "api/turma/buscar.php",
		type: "get",
		dataType: "json",
		data: turma,
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_remover(turma, callback_success, callback_error) 
	{
		$.ajax({url: "api/turma/remover.php",
		type: "post",
		dataType: "json",
		data: turma,
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_salvar(turma, callback_success, callback_error) 
	{
		$.ajax({url: "api/turma/editar.php",
		type: "post",
		dataType: "json",
		data: turma,
		success: callback_success,
		error: callback_error});
	}
}

$(init);