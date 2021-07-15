// Fun��o �nica que far� a transa��o
	function getEndereco() {
			// Se o campo CEP n�o estiver vazio
			if($.trim($("#cep").val()) != ""){
				
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
				getCidadeEstadoDoBairroSelecionado(codigoBairro);
			}
			
		}

	function getCidadeEstadoDoBairroSelecionado(codigoBairro){
		
		var url = "logradouro?q=" +codigoBairro+"&type=buscarCidadeEstadoPorBairro";
		
		$.ajax({
			type: "GET",
			url: url,
			data: {},
			success: retornoCidadeBairro,
			dataType: 'json'
		});
		
		function retornoCidadeBairro(data, textStatus, jqXHR){
			$("#estado").val(data['estado']);
			$("#cidade").val(data['cidade']);
			
			atualizarMapa();
		}
		
	}
	
	function atualizarMapa(){
		
		var address = $("#rua").val()+", "+$("#cidade option:selected").text()+", "+$("#estado option:selected").text()+", CEP "+$('#cep').val();
		console.log(address);
		$("#address").val(address);
		
		 var geocoder = new google.maps.Geocoder();
		   	
		geocoder.geocode( { 'address': address}, function(results, status) {

		    if (status == google.maps.GeocoderStatus.OK) {
		    	var latitude = results[0].geometry.location.lat();
		    	var longitude = results[0].geometry.location.lng();
		      
		    	var pos = new google.maps.LatLng(results[0].geometry.location.lat(),results[0].geometry.location.lng());
		    	
		    	 var map = new google.maps.Map(document.getElementById('map-canvas'),
			              mapOptions);
			      
		    	map.setCenter(pos);
		    	 
		    	  var marker2 = new google.maps.Marker({
				        map:map,
				        draggable:true,
				        animation: google.maps.Animation.DROP,
				        position: pos
				      });
		    	  
		    	 document.forms[0].latitude.value = latitude;
			      document.forms[0].longitude.value = longitude;
			      
			      google.maps.event.addListener(marker2, 'dragend', function(evt){
			    	  document.forms[0].latitude.value = marker2.getPosition().lat();
			    	  document.forms[0].longitude.value = marker2.getPosition().lng();
			    	});
			      
			    	 
			      
		    }
		});
		
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