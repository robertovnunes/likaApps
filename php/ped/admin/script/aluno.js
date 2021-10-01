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
	var opcao_equipe_template = $(".template-equipe");
	var opcao_equipe_vazia_template = $(".template-equipe-vazia");
	var select_equipe;
	var erros = {};
	erros.flag = 0;
	
	opcao_equipe_template.remove();
	opcao_equipe_vazia_template.remove();
	linha_template.remove();
	linha_template_editar.remove();
	lista_vazia.hide();
	lista_busca_vazia.hide();
	lista_busca_carregando.hide();
	//tabela.hide();

	$("BUTTON.inserir").click(function(e) {
		e.preventDefault();
		controlador_inserir($(this).parent());
	});
	
	$("BUTTON.buscar").click(function(e) {
		e.preventDefault();
		controlador_buscar($(this).parent());
	});
	
	$(".popup INPUT[name=cpf]").keypress(formatar_cpf).keyup(formatar_cpf);
	
	controle_carregar();
	
	function controle_carregar() {
		ajax_carregar_equipe(function(equipes) {
			var entrada_equipes = $(".popup SELECT[name=equipe]");
			if (equipes.length != 0) {
				entrada_equipes.append(ui_criar_opcao_equipe({'id':0,'nome':'Selecione uma equipe'}));
				$(equipes).each(function(i, equipe){
					entrada_equipes.append(ui_criar_opcao_equipe(equipe));
				});
			} else {
				entrada_equipes.append(opcao_equipe_vazia_template.clone());
			}
			select_equipe = entrada_equipes;
		}, function(xhr, status) {});
		
		ajax_carregar(function(alunos) {
			lista_carregando.hide();
			if (alunos.length != 0) {
				$(alunos).each(function(i, aluno){
					tabela.append(ui_criar_linha(aluno));
				});
				aplicar_zebra(tabela);
				tabela.show();
				//lista_vazia.hide();
			} else {
				tabela.hide();
				lista_vazia.show();
			}
		},function(xhr, status){});		
	}
	
	function controlador_buscar(form) {
		limpar_erros();
		setar_cores(form);
		var aluno = extrair(form);	
		tabela.find("TR.template").remove();
		tabela.find("TR.template_editar").remove();
		lista_busca_carregando.show();
		lista_busca_vazia.hide();
		lista_vazia.hide();
		tabela.hide();
		ajax_buscar(aluno, function(alunos) {
			lista_busca_carregando.hide();
			if (alunos.length != 0) {
				$(alunos).each(function(i, aluno){
					tabela.append(ui_criar_linha(aluno));
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
		var aluno = extrair(form);
		
		setar_cores(form);
		if(erros.flag == 0)
		{
			var	linha = ui_criar_linha(aluno);
			//linha.find("IMG.carregando").show();
			
			tabela.append(linha);
			aplicar_zebra(tabela);
			tabela.show();
			//lista_vazia.hide();
			//	lista_busca_vazia.hide();
			
			ajax_inserir(aluno,
						 function(aluno) { var nova_linha = ui_criar_linha(aluno); linha.replaceWith(nova_linha);aplicar_zebra(tabela);
			             },
						 function (xhr){linha.remove();}
						 );
			
			
		}
	}
	
	function controlador_remover(aluno, linha) {
		//linha.find("IMG.carregando").show();
		ajax_remover(aluno, function() {
			linha.remove();
			
			if( tabela.find("TR").length <= 1 )
			{
				tabela.hide();
				lista_vazia.show();
			}
			
			aplicar_zebra(tabela);
		},function(xhr){});
	}
	
	function controlador_salvar(aluno,linha_editar) {
		var	nova_aluno = extrair(linha_editar);
		setar_cores(linha_editar);
		if(erros.flag == 0)
		{
			nova_aluno.id = aluno.id;
	
			var linha = ui_criar_linha(nova_aluno);
			linha.find("IMG.carregando").show();
			linha_editar.replaceWith(linha);
			aplicar_zebra(tabela);
			
			ajax_salvar(nova_aluno, function(aluno) {
				var nova_linha = ui_criar_linha(nova_aluno);
				linha.replaceWith(nova_linha);
				aplicar_zebra(tabela);
			}, function(xhr) {
				var nova_linha = ui_criar_linha_editar(aluno);
				linha.replaceWith(nova_linha);
			});
		}
	}
	
	function controlador_editar(aluno,linha) {
		tabela.find(".template_editar .cancelar").click();
		
		var linha_editar = ui_criar_linha_editar(aluno);
		linha.replaceWith(linha_editar);
		aplicar_zebra(tabela);
	}
	
	function controlador_cancelar(aluno,linha_editar) {
		var linha = ui_criar_linha(aluno);
		linha_editar.replaceWith(linha);
		aplicar_zebra(tabela);
	}
	
	function ui_criar_linha(aluno) {
		var linha = linha_template.clone();
		linha.find(".linha_nome").text(aluno.nome);
		linha.find(".linha_login").text(aluno.login);
		linha.find(".linha_email").text(aluno.email);
		linha.find(".linha_equipe").text($(".popup SELECT[name=equipe] OPTION[value="+aluno.idEquipe+"]").text());
		
		if( aluno.idEquipe == 0 )
		{
			linha.find(".linha_equipe").text("");
		}
		
		linha.find(".carregando").hide();
		
		linha.find(".editar").click(function (e) {
			e.preventDefault();
			controlador_editar(aluno, linha);
		});
		
		linha.find(".remover").click(function (e) {
			e.preventDefault();
			controlador_remover(aluno, linha);
		});
		
		return linha;
	}
	
	function ui_criar_opcao_equipe(equipe)
	{
		var opcao_equipe = opcao_equipe_template.clone();

		opcao_equipe.val(equipe.id);
		opcao_equipe.text(equipe.nome);
		
		return opcao_equipe;
	}
	
	function ui_criar_linha_editar(aluno) {
		var linha_editar = linha_template_editar.clone();

		linha_editar.attr("id",aluno.id);
		linha_editar.find("INPUT[name=nome]").val(aluno.nome);
		linha_editar.find("INPUT[name=login]").val(aluno.login);
		linha_editar.find("INPUT[name=cpf]").val(aluno.cpf).keypress(formatar_cpf).keyup(formatar_cpf);
		linha_editar.find("INPUT[name=email]").val(aluno.email)
		
		linha_editar.find("SELECT[name=equipe]").append(select_equipe.find("OPTION").clone());
		linha_editar.find("SELECT[name=equipe] OPTION[value="+aluno.idEquipe+"]").attr("selected", true);
		
		linha_editar.find(".carregando").hide();
		
		linha_editar.find(".salvar").click(function (e) {
			e.preventDefault();
			controlador_salvar(aluno, linha_editar);
		});
		
		linha_editar.find(".cancelar").click(function (e) {
			e.preventDefault();
			controlador_cancelar(aluno, linha_editar);
		});
		
		return linha_editar;
	}
	
	function extrair(form) {
		var aluno = {}
		aluno.nome = form.find("INPUT[name=nome]").val().slice(0,50);
		aluno.cpf = form.find("INPUT[name=cpf]").val().slice(0,14);
		aluno.login = form.find("INPUT[name=login]").val().slice(0,15);
		aluno.senha = form.find("INPUT[name=senha]").val().slice(0,15);
		aluno.email = form.find("INPUT[name=email]").val().slice(0,100);
		aluno.idEquipe = form.find("SELECT[name=equipe] OPTION:selected").val();
		
		
		verificar(aluno);
		
		return aluno;
	}
	
	function limpar_erros()
	{
		erros.flag = 0;
		erros.nome = 0;
		erros.cpf = 0;
		erros.senha = 0;
		erros.login = 0;
		erros.email = 0;
	}
	
	function verificar(aluno)
	{
		limpar_erros();
		if(aluno.nome.length == 0)
		{
			erros.flag = 1;
			erros.nome = 1;
		}
		if(aluno.cpf.length != 14)
		{
			erros.flag = 1;
			erros.cpf = 1;
		}
		if(aluno.login.length == 0)
		{
			erros.flag = 1;
			erros.login = 1;
		}
		if(aluno.senha.length == 0)
		{
			erros.flag = 1;
			erros.senha = 1;
		}
		if(aluno.email.length == 0)
		{
			erros.flag = 1;
			erros.email= 1;
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
		if(erros.email == 1)
		{
			form.find("LABEL[for=email]").css("color","#FF0000");
		}
		else
		{
			form.find("LABEL[for=email]").css("color","#000000");
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
		$.ajax({url: "api/aluno/listar.php",
		type: "get",
		dataType: "json",
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_inserir(aluno, callback_success, callback_error) {
		$.ajax({url: "api/aluno/inserir.php",
		type: "post",
		dataType: "json",
		data: aluno,
		success: callback_success
		});
	}
	
	function ajax_buscar(aluno, callback_success, callback_error) {
		$.ajax({url: "api/aluno/buscar.php",
		type: "get",
		dataType: "json",
		data: aluno,
		success: callback_success
		});
	}
	
	function ajax_remover(aluno, callback_success, callback_error) {
		$.ajax({url: "api/aluno/remover.php",
		type: "post",
		dataType: "json",
		data: aluno,
		success: callback_success});
	}
	
	function ajax_salvar(aluno, callback_success, callback_error) {
		$.ajax({url: "api/aluno/editar.php",
		type: "post",
		dataType: "json",
		data: aluno,
		success: callback_success,
		error: callback_error});
	}
	
	function ajax_carregar_equipe(callback_success, callback_error) {
		$.ajax({url: "api/equipe/listar.php",
		type: "get",
		dataType: "json",
		success: callback_success,
		error: callback_error});
	}
}

$(init);
