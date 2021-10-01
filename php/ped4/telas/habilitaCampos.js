function habilitaTosse(s){
	if (s == 0){
		is.dtosse.disabled = true;
		is.ptosse.disabled = true;
		is.ttosse.disabled = true;
	} else {
		is.dtosse.disabled = false;
		is.ptosse.disabled = false;
		is.ttosse.disabled = false;
	}
}

function habilitaEvacuacao(s){
	if (s == 0){
		is.aspfezes.disabled = true;
		is.nfezes.disabled = true;
	} else {
		is.aspfezes.disabled = false;
		is.nfezes.disabled = false;
	}
}


function habilitaCorrVag(s){
	if (s == 0){
		is.corcorrvag.disabled = true;
		is.odorcorrvag.disabled = true;
		for (var i=0;i<3;i++){
			is.prucorrvag[i].disabled = true;
		} 
	} else {
		is.corcorrvag.disabled = false;
		is.odorcorrvag.disabled = false;
		for (var i=0;i<3;i++){
			is.prucorrvag[i].disabled = false;
		} 
	}
}

function habilitaCorrUret(s){
	if (s == 0){
		is.corcorrure.disabled = true;
		is.odorcorrure.disabled = true;
	} else {
		is.corcorrure.disabled = false;
		is.odorcorrure.disabled = false;
		
	}

	
}

function habilitaHistMenstr(s){
	if (s == 0){
		is.menarca.disabled = true;
		is.regularidade.disabled = true;
		is.fluxo.disabled = true;
	} else {
		is.menarca.disabled = false;
		is.regularidade.disabled = false;
		is.fluxo.disabled = false;
	}
}

function habilitaConvulsoes(s){
	if (s == 0){
		is.conv1.disabled = true;
		is.conv2.disabled = true;
	} else {
		is.conv1.disabled = false;
		is.conv2.disabled = false;
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