function hora1(){
	var time = new Date();
	var hora = time.getHours();
	var minuto = time.getMinutes();
	var segundo = time.getSeconds();
	if(hora < 10) hora = '0' + hora;
	if(minuto < 10) minuto = '0' + minuto;
	if(segundo < 10) segundo = '0' + segundo;
	var horario = hora + ':' + minuto + ':' + segundo;
	document.getElementById('timer').innerHTML = horario; 
	setTimeout('hora1()',1000);	
}

function renderDate(){
	days = new Array('Domingo','Segunda-Feira','Terça-Feira','Quarta-Feira','Quinta-Feira','Sexta-Feira','Sábado');
	var mydate = new Date();
	var year = mydate.getYear();
	if (year < 2000) {
		if (document.all)
			year = '19' + year;
		else
			year += 1900;
	}
	var day = mydate.getDay();
	var month = mydate.getMonth();
	var daym = mydate.getDate();
	var monthm = month + 1;
	if (daym < 10) daym = '0' + daym;
	if (monthm < 10) monthm = '0' + monthm;
	/* var dia = days[day] + ', ' + daym + ' de ' + months[month] + ' de ' + year; */
	var dia = days[day] + ', ' + daym + '/' + monthm + '/' + year;
	document.getElementById('data').innerHTML = dia;
	setTimeout('renderDate()',1000);
}