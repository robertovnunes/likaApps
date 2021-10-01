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
		genitourinario.corcorrure.disabled = true;
		genitourinario.odorcorrure.disabled = true;
	} else {
		genitourinario.corcorrure.disabled = false;
		genitourinario.odorcorrure.disabled = false;
		
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
	
	if (s == 0) historico.tdoencir.disabled = true;
	else historico.tdoencir.disabled = false;
}

function habilitaCirurgia2(s){

	if (s == 0 ){
		
		 historico.tdoencir.disabled = true;
		}
	else{
		historico.tdoencir.disabled = false;

	}
}
function habilitaCompParto(s){
	if (s == 0) historico.tcomparto.disabled = true;
	else historico.tcomparto.disabled = false;
}

function habilitaExpAgentTox(s){
	if (s == 0) historico.texpagtox.disabled = true;
	else historico.texpagtox.disabled = false;
}

function habilitaAlergMed(s){
	if (s == 0) historico.talergmed.disabled = true;
	else historico.talergmed.disabled = false;
}

function habilitaTestePez(s){
	if (s == 0){
		historico.fenilcet.disabled = true;
		historico.hipotiroid.disabled = true;
		historico.anemiafalc.disabled = true;
	} else {
		historico.fenilcet.disabled = false;
		historico.hipotiroid.disabled = false;
		historico.anemiafalc.disabled = false;
	}
}

function habilitaTriaAud(s){
	if (s == 0){
		historico.PEATE.disabled = true;
		historico.EOA.disabled = true;
	} else {
		historico.PEATE.disabled = false;
		historico.EOA.disabled = false;
	}
}

function habilitaAlergia(s){
	if (s == 0) historico.talerg.disabled = true;
	else historico.talerg.disabled = false;
}