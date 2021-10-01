function habilitaPesoNascer(s){
	
	if (s == 'NA'){
		historico.pesonasc.disabled = true;
		
	} else {
		historico.pesonasc.disabled= false;
		
	}
}

function habilitaPesoAtual(s){
	
	if (s == 'NA'){
		historico.pesoat.disabled = true;
		
	} else {
		historico.pesoat.disabled= false;
		
	}
}


function habilitaTosse(s){
	if (s == 0){
		respiratorio.dtosse.disabled = true;
		respiratorio.ptosse.disabled = true;
		respiratorio.ttosse.disabled = true;
	} else {
		respiratorio.dtosse.disabled = false;
		respiratorio.ptosse.disabled = false;
		respiratorio.ttosse.disabled = false;
	}
}

function habilitaEvacuacao(s){
	if (s == 0){
		gastrointestinal.aspfezes.disabled = true;
		gastrointestinal.nfezes.disabled = true;
	} else {
		gastrointestinal.aspfezes.disabled = false;
		gastrointestinal.nfezes.disabled = false;
	}
}


function habilitaCorrVag(s){
	if (s == 0){
		genitourinario.corcorrvag.disabled = true;
		genitourinario.odorcorrvag.disabled = true;
		for (var i=0;i<3;i++){
			genitourinario.prucorrvag[i].disabled = true;
		} 
	} else {
		genitourinario.corcorrvag.disabled = false;
		genitourinario.odorcorrvag.disabled = false;
		for (var i=0;i<3;i++){
			genitourinario.prucorrvag[i].disabled = false;
		} 
	}
}

function habilitaCorrUret(s){
	if (s == 0){
		genitourinario.corcorruret.disabled = true;
		genitourinario.odorcorruret.disabled = true;
	} else {
		genitourinario.corcorruret.disabled = false;
		genitourinario.odorcorruret.disabled = false;
		
	}
	
	
}

function habilitaHistMenstr(s){
	if (s == 0){
		genitourinario.menarca.disabled = true;
		genitourinario.regularidade.disabled = true;
		genitourinario.fluxo.disabled = true;
	} else {
		genitourinario.menarca.disabled = false;
		genitourinario.regularidade.disabled = false;
		genitourinario.fluxo.disabled = false;
	}
}

function habilitaConvulsoes(s){
	if (s == 0){
		nervoso.conv1.disabled = true;
		nervoso.conv2.disabled = true;
	} else {
		nervoso.conv1.disabled = false;
		nervoso.conv2.disabled = false;
	}
}

function habilitaAcompMedico(s){

	if (s == 0){
		historico.nacpmed.disabled = true;
		historico.lacpmed.disabled = true;
	} else {
		historico.nacpmed.disabled = false;
		historico.lacpmed.disabled = false;
	}
}

function habilitaExCardioPres(s){

	if (s == 0){
		exame_cardio.pressaoartin.disabled = true;
		
	} else {
		exame_cardio.pressaoartin.disabled = false;
		
	}
}

function habilitaPesoMedind(s){

	if (s == 0){
		exame_medind.pesomedin.disabled = true;
		
	} else {
		exame_medind.pesomedin.disabled= false;
		
	}
}

function habilitaAlturaMedind(s){

	if (s == 0){
		exame_medind.alturamedin.disabled = true;
		
	} else {
		exame_medind.alturamedin.disabled= false;
		
	}
}


function habilitaExCardioFreq(s){

	if (s == 0){
		exame_cardio.freqcardin.disabled = true;
		
	} else {
		exame_cardio.freqcardin.disabled = false;
		
	}
}

function habilitaCirurgia(s){
	
	if (s == 0) historico.cirurgdc.disabled = true;
	else historico.cirurgdc.disabled = false;
}

/*function habilitaCirurgia2(s){

	if (s == 0 ){

		 historico.tdoencir.disabled = true;
		}
	else{
		historico.tdoencir.disabled = false;

	}
}*/
function habilitaCompParto(s){
	if (s == 0) historico.tcomplp.disabled = true;
	else historico.tcomplp.disabled = false;
}

function habilitaExpAgentTox(s){
	if (s == 0) historico.tagtox.disabled = true;
	else historico.tagtox.disabled = false;
}

function habilitaAlergMed(s){
	if (s == 0) historico.talergmed.disabled = true;
	else historico.talergmed.disabled = false;
}

function habilitaTestePez(s){
	if (s == 0){
		historico.fenilcet.disabled = true;
		historico.hipotir.disabled = true;
		historico.anemfalc.disabled = true;
	} else {
		historico.fenilcet.disabled = false;
		historico.hipotir.disabled = false;
		historico.anemfalc.disabled = false;
	}
}

function habilitaTriaAud(s){
	if (s == 0){
		historico.peate.disabled = true;
		historico.eoa.disabled = true;
	} else {
		historico.peate.disabled = false;
		historico.eoa.disabled = false;
	}
}

function habilitaAlergia(s){
	if (s == 0) historico.talerg.disabled = true;
	else historico.talerg.disabled = false;
}