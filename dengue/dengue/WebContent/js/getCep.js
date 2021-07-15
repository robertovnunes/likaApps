// Fun��o �nica que far� a transa��o
	function getEndereco() {
			// Se o campo CEP n�o estiver vazio
			if($.trim($("#cep").val()) != ""){
				/* 
					Para conectar no servi�o e executar o json, precisamos usar a fun��o
					getScript do jQuery, o getScript e o dataType:"jsonp" conseguem fazer o cross-domain, os outros
					dataTypes n�o possibilitam esta intera��o entre dom�nios diferentes
					Estou chamando a url do servi�o passando o par�metro "formato=javascript" e o CEP digitado no formul�rio
					http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#cep").val()
				*/
				
				
				/*
				$.getScript("http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#cep").val(), function(){
					// o getScript d� um eval no script, ent�o � s� ler!
					//Se o resultado for igual a 1
			  		if(resultadoCEP["resultado"]){
						// troca o valor dos elementos
						$("#rua").val(unescape(resultadoCEP["tipo_logradouro"])+": "+unescape(resultadoCEP["logradouro"]));
						$("#bairro").val(unescape(resultadoCEP["bairro"]));
						$("#cidade").val(unescape(resultadoCEP["cidade"]));
						var estado = resultadoCEP["uf"];
						document.getElementById('federacao').value = estado;
					}else{
						alert("Endere�o n�o encontrado");
					}
				});
				*/
				
				$("#loader").css("visibility","visible");
				$("#loader").attr("src","images/ajax-loader.gif");
				
				var url = "logradouro?q="+$('#cep').val();
				$.ajax({
					  type: "GET",
					  url: url,
					  data: {},
					  success: retornoLogradouro,
					  error: retornoLogradouroErro,
					  dataType: 'json'
					});
				
				function retornoLogradouro(data, textStatus, jqXHR){
					$("#loader").css("visibility","hidden");
					$("#rua").val(data['rua']);

					
					listarBairrosCodigo(data['bairro']['codigo'] );
					listarCidadesCodigo(data['bairro']['codigo'] );
					
					$("#pais").val(1058);
					
				}
				
				function retornoLogradouroErro(data, textStatus, jqXHR){
					$("#loader").attr("src","images/delete.png");
					
				}
				
				
								
			}	
			
			
	}
	
	
	function listarCidades(){
		
		var url = "cidade?q=" +$('#estado').val();
		
		$.ajax({
			type: "GET",
			url: url,
			data: {},
			success: retornoCidade,
			dataType: 'html'
		});
		
		function retornoCidade(data, textStatus, jqXHR){
			
			jQuery("#cidade").html(data); 
			
			jQuery("#bairro").html("<option value=''>SELECIONE</option>");
			
		}
		
	}
	
function listarCidadesCodigo(codigoBairro){
		
		var url = "cidade?q=" +codigoBairro+"&type=porCodigoBairro";
		
		$.ajax({
			type: "GET",
			url: url,
			data: {},
			success: retornoCidade,
			dataType: 'html'
		});
		
		function retornoCidade(data, textStatus, jqXHR){
			
			jQuery("#cidade").html(data); 
			getCidadeEstadoDoBairroSelecionado(codigoBairro );
		}
		
	}

function getCidadeEstadoDoBairroSelecionado(codigoBairro){
	
	var url = "logradouro?q=" +codigoBairro+"&type=buscarCidadeEstadoPorBairro";
	
	$.ajax({
		type: "GET",
		url: url,
		data: {},
		success: retorno,
		dataType: 'json'
	});
	
	function retorno(data, textStatus, jqXHR){
		$("#estado").val(data['estado']);
		$("#cidade").val(data['cidade']);
		
	}
	
}
function listarBairros(){
		
		var url = "bairro?q=" +$('#cidade').val();
		
		$.ajax({
			type: "GET",
			url: url,
			data: {},
			success: retornoBairro,
			dataType: 'html'
		});
		
		function retornoBairro(data, textStatus, jqXHR){
			
			jQuery("#bairro").html(data); 
			
			
		}
		
	}

function listarBairrosCodigo(codigoBairro){
	
	var url = "bairro?q=" +codigoBairro+"&type=porCodigoBairro";
	
	$.ajax({
		type: "GET",
		url: url,
		data: {},
		success: retornoBairro,
		dataType: 'html'
	});
	
	function retornoBairro(data, textStatus, jqXHR){
		
		jQuery("#bairro").html(data); 
		
		$("#bairro").val(codigoBairro);
		
		
	}
	
}