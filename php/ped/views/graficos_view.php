<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">-->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	    <meta name="language" content="pt-br" />
		<title>Gr&aacute;ficos</title>
		
		
		<!-- 1. Add these JavaScript inclusions in the head of your page -->
		<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
		<script type="text/javascript" src="js/highcharts.js"></script>
		<!--[if IE]>
			<script type="text/javascript" src="../js/excanvas.compiled.js"></script>
		<![endif]-->
		
		
		<!-- 2. Add the JavaScript to initialize the chart on document ready -->
		<script type="text/javascript">
		var chartPeso;
		var chartComp;
        var chartAltura;
        var chartPerCef;
        var chartPerTor;
        var chartPerAbd;
        var chartPrgTri;
        var chartPrgSub;
   		$(document).ready(function() {
   			
			chartPeso = new Highcharts.Chart({
				chart: {
					renderTo: 'container',
					defaultSeriesType: 'line',
					margin: [50, 200, 60, 60]
				},
				title: {
					text: 'Peso',
					style: {
						margin: '10px 100px 0 0' // center it
					}
				},
				xAxis: {
					categories: ['0', '1', '2', '3', '4', '5',
						'6', '7', '8', '9', '10'],
					title: {
						text: 'Atendimento',
						style: {
								margin: '10px 100px 0 0'
						}
					}
				},
				yAxis: {
					title: {
						text: 'Gramas (g)'
					},
					plotLines: [{
						value: 0,
						width: 1,
						color: '#808080'
					}]
				},
				tooltip: {
					formatter: function() {
			                return '<b>'+ this.series.name +'</b><br/>'+
							this.x +': '+ this.y +'g';
					}
				},
				legend: {
					layout: 'vertical',
					style: {
						left: 'auto',
						bottom: 'auto',
						right: '10px',
						top: '100px'
					}
				},
				series: [{
					name: 'Peso',
					data: [<?php 
						$val1 = 1;
						foreach ($table as $t){
							if ($val1 == sizeOf($table)) echo $t['pesoin'];
							else echo $t['pesoin'].", ";
							if ($val1 == sizeOf($table)) echo $t['pesoat'];
							else echo $t['pesoat'].", ";
							$val1++;
						}
					?>]
				}, ]
			});
			
    		chartAltura = new Highcharts.Chart({
				chart: {
					renderTo: 'container1',
					defaultSeriesType: 'line',
					margin: [50, 200, 60, 60]
				},
				title: {
					text: 'Altura',
					style: {
						margin: '10px 100px 0 0' // center it
					}
				},
				xAxis: {
					categories: ['0','1', '2', '3', '4', '5', '6',
						'7', '8', '9', '10'],
					title: {
						text: 'Month'
					}
				},
				yAxis: {
					title: {
						text: 'Cent&iacute;metro (cm)'
					},
					plotLines: [{
						value: 0,
						width: 1,
						color: '#808080'
					}]
				},
				tooltip: {
					formatter: function() {
			                return '<b>'+ this.series.name +'</b><br/>'+
							this.x +': '+ this.y +'cm';
					}
				},
				legend: {
					layout: 'vertical',
					style: {
						left: 'auto',
						bottom: 'auto',
						right: '10px',
						top: '100px'
					}
				},
				series: [{
					name: 'Altura',
					data: [<?php
						$val1 = 1;
						foreach ($table2 as $t){
							if ($val1 == sizeOf($t)) echo $t['alturain'];
							else echo $t['alturain'].", ";
							if ($val1 == sizeOf($t)) echo $t['altat'];
							else echo $t['altat'].", ";
							$val1++;
						}
					?>]
				}]
			});

		
		chartComp = new Highcharts.Chart({
				chart: {
					renderTo: 'container2',
					defaultSeriesType: 'line',
					margin: [50, 200, 60, 60]
				},
				title: {
					text: 'Perímetros',
					style: {
						margin: '10px 100px 0 0' // center it
					}
				},
				xAxis: {
					categories: ['0','1', '2', '3', '4', '5', '6',
						'7', '8', '9', '10'],
					title: {
						text: 'Month'
					}
				},
				yAxis: {
					title: {
						text: 'Cent&iacute;metro (cm)'
					},
					plotLines: [{
						value: 0,
						width: 1,
						color: '#808080'
					}]
				},
				tooltip: {
					formatter: function() {
			                return '<b>'+ this.series.name +'</b><br/>'+
							this.x +': '+ this.y +'cm';
					}
				},
				legend: {
					layout: 'vertical',
					style: {
						left: 'auto',
						bottom: 'auto',
						right: '10px',
						top: '100px'
					}
				},
				series: [{
					name: 'Per&iacute;metro Cef&aacute;lico',
					data: [<?php
						$val1 = 1;
						foreach ($table3 as $t){
							if ($val1 == sizeOf($t)) echo $t['permcef'];
							else echo $t['permcef'].", ";
							$val1++;
						}
					?>]
				}, {
					name: 'Per&iacute;metro Torácico',
					data: [<?php
						$val1 = 1;
						foreach ($table4 as $t){
							if ($val1 == sizeOf($t)) echo $t['permtora'];
							else echo $t['permtora'].", ";
							$val1++;
						}
					?>]
				}, {
					name: 'Per&iacute;metro Abdominal',
					data: [<?php
						$val1 = 0;
						foreach ($table5 as $t){
							if ($val1 == sizeOf($t)) echo $t['permab'];
							else echo $t['permab'].", ";
							$val1++;
						}
					?>]
				}, {
					name: 'Prega Tricipital',
					data: [<?php
						$val1 = 0;
						foreach ($table6 as $t){
							if ($val1 == sizeOf($t)) echo $t['pregatric'];
							else echo $t['pregatric'].", ";
							$val1++;
						}
					?>]
				}, {
					name: 'Prega Sub-escapular',
					data: [<?php
						$val1 = 0;
						foreach ($table7 as $t){
							if ($val1 == sizeOf($t)) echo $t['pregasubesc'];
							else echo $t['pregasubesc'].", ";
							$val1++;
						}
					?>]
				}]
			});


		});
		
		</script>
	</head>
	<body>
		<!-- 3. Add the container -->
	<?php if ($print) {?>
		<div id="container" style="width: 600px; height: 300px; margin: 0 auto"></div>
        <div id="container1" style="width: 600px; height: 300px; margin:0 auto"></div>
        <div id="container2" style="width: 600px; height: 300px; margin: 0 auto"></div>
	<?php } else {?>
		É preciso inserir valores em Histórico -> Neo-natal para exibir o gráfico.
	<?php } ?>
	</body>
</html>
