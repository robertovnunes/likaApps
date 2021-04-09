package clin.model;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
@PrimaryKeyJoinColumn(name = "ficha_idFicha")
public class FichaIS extends Ficha{
	
	private boolean geral;
	private boolean febre;
	private int duracaoFebre;
	private boolean febreContinua;
	private boolean febreAferidaPorTermometro;
	private String febreObservacao;
	private boolean anorexia;
	private boolean astenia;
	private boolean cefaleiaGeral;
	private String alteracaoPeso;
	private int peso;
	private boolean outros;
	private String descricaoOutros;
	private boolean pelosFaneros;
	private boolean sudorese;
	private String descricaoSudorese;
	private boolean pruridoPelosFaneros;
	private String descricaoPrurido;
	private boolean areaHipoAnestesia;
	private String descricaoAreaHipoAnestesia;
	private boolean lesoesCutaneas;
	private String descricaoLesoesCutaneas;
	private boolean lesoesCutaneasLocalizadas;
	private String descricaoLesoesCutaneasLocalizadas;
	private String tipoDeLesao;
	private boolean alteracoesPelosCabelos;
	private String descricaoAlteracoesPelosCabelos;
	private boolean outrosPelosFaneros;
	private String descricaoOutrosPelosFaneros;
	private boolean cabecaPescoco;
	private boolean dorCabecaPescoco;
	private boolean alteracoesMovimento;
	private boolean dorOcularCefaleia;
	private boolean diplopia;
	private boolean fotofobia;
	private boolean sensacaoCorpoEstranho;
	private boolean queimacao;
	private boolean nistagmo;
	private boolean lacrimejamento;
	private boolean escotomas;
	private boolean sensacaoOlhoSeco;
	private boolean secrecao;
	private boolean alteracaoAcuidadeVisual;
	private boolean dorOuvidos;
	private boolean alteracaoAcuidadeAuditiva;
	private boolean zumbido;
	private boolean pruridoOuvido;
	private boolean outrosOuvido;
	private String descricaoOutrosOuvido;
	private boolean ar;
	private boolean epitaxe;
	private boolean alteracoesOlfato;
	private boolean tosse;
	private String tipoTosse;
	private boolean hemoptise;
	private boolean expectoracao;
	private String descricaoExpectoracao;
	private boolean dispneia;
	private String tipoDispneia;
	private String tipoDorToracica;
	private String localizacaoDorToracica;
	private boolean outrosAR;
	private String descricaoOutrosAR;
	private boolean acv;
	private boolean precordalgia;
	private String tipoDorPrecordalgia;
	private String frequenciaDorPrecordalgia;
	private boolean palpitacoes;
	private boolean dpn;
	private boolean ortopneia;
	private boolean edemaMMII;
	private boolean desmaio;
	private boolean outrosACV;
	private String descricaoOutrosACV;
	private boolean agi;
	private boolean sialose;
	private boolean halitose;
	private boolean regurgitacao;
	private boolean eructacao;
	private boolean soluco;
	private boolean pirose;
	private boolean nauseas;
	private boolean hematemese;
	private boolean melena;
	private boolean hematoquezia;
	private boolean disfagia;
	private boolean odinofagia;
	private boolean incontinenciaFecal;
	private boolean constipacao;
	private boolean dorAbdominal;
	private String localizacaoDorAbdominal;
	private boolean alteracoesApetite;
	private String descricaoAlteracoesApetite;
	private boolean outrosAGI;
	private String descricaoOutrosAGI;
	private boolean vomitos;
	private String descricaoVomitos;
	private boolean agu;
	private boolean disuria;
	private boolean poliaciuria;
	private boolean poliuria;
	private boolean nicturia;
	private boolean hematuria;
	private boolean alteracaoCorUrina;
	private boolean alteracaoCheiroUrina;
	private boolean urgenciaMiccional;
	private boolean incontinenciaUrinaria;
	private boolean corrimentoVaginal;
	private boolean pruridoVaginal;
	private boolean dorMamas;
	private String descricaoDorMamas;
	private boolean nodulos;
	private String descricaoNodulos;
	private boolean secrecaoPapilar;
	private boolean outrosAGU;
	private String descricaoOutrosAGU;
	private boolean ame;
	private boolean dorArticulacoes;
	private boolean rigidezArticular;
	private boolean matinal;
	private String duracaoMatinal;
	private boolean fraqueza;
	private boolean atrofia;
	private boolean hipertrofia;
	private boolean espasmos;
	private boolean outrosAME;
	private String descricaoOutrosAME;
	private boolean sn;
	private boolean cefaleia;
	private boolean tonturaVertigem;
	private boolean convulsoes;
	private boolean alteracoesMemoria;
	private boolean transtornosVisuais;
	private boolean transtornosAuditivos;
	private boolean transtornosMarcha;
	private boolean deficitForca;
	private boolean alteracoesSensibilidade;
	private boolean transtornosEsfincterianos;
	private boolean incontinencias;
	private String descricaoIncontinencias;
	private boolean transtornosSono;
	private String descricaoTranstornosSono;
	private boolean outrosSN;
	private String descricaoOutrosSN;
	private boolean dorToracica;
	private String descricaoAlteracoesOlfato;
	public boolean isGeral() {
		return geral;
	}
	public void setGeral(boolean geral) {
		this.geral = geral;
	}
	public boolean isFebre() {
		return febre;
	}
	public void setFebre(boolean febre) {
		this.febre = febre;
	}
	public int getDuracaoFebre() {
		return duracaoFebre;
	}
	public void setDuracaoFebre(int duracaoFebre) {
		this.duracaoFebre = duracaoFebre;
	}
	public boolean isFebreContinua() {
		return febreContinua;
	}
	public void setFebreContinua(boolean febreContinua) {
		this.febreContinua = febreContinua;
	}
	public boolean isFebreAferidaPorTermometro() {
		return febreAferidaPorTermometro;
	}
	public void setFebreAferidaPorTermometro(boolean febreAferidaPorTermometro) {
		this.febreAferidaPorTermometro = febreAferidaPorTermometro;
	}
	public String getFebreObservacao() {
		return febreObservacao;
	}
	public void setFebreObservacao(String febreObservacao) {
		this.febreObservacao = febreObservacao;
	}
	public boolean isAnorexia() {
		return anorexia;
	}
	public void setAnorexia(boolean anorexia) {
		this.anorexia = anorexia;
	}
	public boolean isAstenia() {
		return astenia;
	}
	public void setAstenia(boolean astenia) {
		this.astenia = astenia;
	}
	public boolean isCefaleiaGeral() {
		return cefaleiaGeral;
	}
	public void setCefaleiaGeral(boolean cefaleiaGeral) {
		this.cefaleiaGeral = cefaleiaGeral;
	}
	public String getAlteracaoPeso() {
		return alteracaoPeso;
	}
	public void setAlteracaoPeso(String alteracaoPeso) {
		this.alteracaoPeso = alteracaoPeso;
	}
	public int getPeso() {
		return peso;
	}
	public void setPeso(int peso) {
		this.peso = peso;
	}
	public boolean isOutros() {
		return outros;
	}
	public void setOutros(boolean outros) {
		this.outros = outros;
	}
	public String getDescricaoOutros() {
		return descricaoOutros;
	}
	public void setDescricaoOutros(String descricaoOutros) {
		this.descricaoOutros = descricaoOutros;
	}
	public boolean isPelosFaneros() {
		return pelosFaneros;
	}
	public void setPelosFaneros(boolean pelosFaneros) {
		this.pelosFaneros = pelosFaneros;
	}
	public boolean isSudorese() {
		return sudorese;
	}
	public void setSudorese(boolean sudorese) {
		this.sudorese = sudorese;
	}
	public String getDescricaoSudorese() {
		return descricaoSudorese;
	}
	public void setDescricaoSudorese(String descricaoSudorese) {
		this.descricaoSudorese = descricaoSudorese;
	}
	public boolean isPruridoPelosFaneros() {
		return pruridoPelosFaneros;
	}
	public void setPruridoPelosFaneros(boolean pruridoPelosFaneros) {
		this.pruridoPelosFaneros = pruridoPelosFaneros;
	}
	public String getDescricaoPrurido() {
		return descricaoPrurido;
	}
	public void setDescricaoPrurido(String descricaoPrurido) {
		this.descricaoPrurido = descricaoPrurido;
	}
	public boolean isAreaHipoAnestesia() {
		return areaHipoAnestesia;
	}
	public void setAreaHipoAnestesia(boolean areaHipoAnestesia) {
		this.areaHipoAnestesia = areaHipoAnestesia;
	}
	public String getDescricaoAreaHipoAnestesia() {
		return descricaoAreaHipoAnestesia;
	}
	public void setDescricaoAreaHipoAnestesia(String descricaoAreaHipoAnestesia) {
		this.descricaoAreaHipoAnestesia = descricaoAreaHipoAnestesia;
	}
	public boolean isLesoesCutaneas() {
		return lesoesCutaneas;
	}
	public void setLesoesCutaneas(boolean lesoesCutaneas) {
		this.lesoesCutaneas = lesoesCutaneas;
	}
	public String getDescricaoLesoesCutaneas() {
		return descricaoLesoesCutaneas;
	}
	public void setDescricaoLesoesCutaneas(String descricaoLesoesCutaneas) {
		this.descricaoLesoesCutaneas = descricaoLesoesCutaneas;
	}
	public boolean isLesoesCutaneasLocalizadas() {
		return lesoesCutaneasLocalizadas;
	}
	public void setLesoesCutaneasLocalizadas(boolean lesoesCutaneasLocalizadas) {
		this.lesoesCutaneasLocalizadas = lesoesCutaneasLocalizadas;
	}
	public String getDescricaoLesoesCutaneasLocalizadas() {
		return descricaoLesoesCutaneasLocalizadas;
	}
	public void setDescricaoLesoesCutaneasLocalizadas(
			String descricaoLesoesCutaneasLocalizadas) {
		this.descricaoLesoesCutaneasLocalizadas = descricaoLesoesCutaneasLocalizadas;
	}
	public String getTipoDeLesao() {
		return tipoDeLesao;
	}
	public void setTipoDeLesao(String tipoDeLesao) {
		this.tipoDeLesao = tipoDeLesao;
	}
	public boolean isAlteracoesPelosCabelos() {
		return alteracoesPelosCabelos;
	}
	public void setAlteracoesPelosCabelos(boolean alteracoesPelosCabelos) {
		this.alteracoesPelosCabelos = alteracoesPelosCabelos;
	}
	public String getDescricaoAlteracoesPelosCabelos() {
		return descricaoAlteracoesPelosCabelos;
	}
	public void setDescricaoAlteracoesPelosCabelos(
			String descricaoAlteracoesPelosCabelos) {
		this.descricaoAlteracoesPelosCabelos = descricaoAlteracoesPelosCabelos;
	}
	public boolean isOutrosPelosFaneros() {
		return outrosPelosFaneros;
	}
	public void setOutrosPelosFaneros(boolean outrosPelosFaneros) {
		this.outrosPelosFaneros = outrosPelosFaneros;
	}
	public String getDescricaoOutrosPelosFaneros() {
		return descricaoOutrosPelosFaneros;
	}
	public void setDescricaoOutrosPelosFaneros(String descricaoOutrosPelosFaneros) {
		this.descricaoOutrosPelosFaneros = descricaoOutrosPelosFaneros;
	}
	public boolean isCabecaPescoco() {
		return cabecaPescoco;
	}
	public void setCabecaPescoco(boolean cabecaPescoco) {
		this.cabecaPescoco = cabecaPescoco;
	}
	public boolean isDorCabecaPescoco() {
		return dorCabecaPescoco;
	}
	public void setDorCabecaPescoco(boolean dorCabecaPescoco) {
		this.dorCabecaPescoco = dorCabecaPescoco;
	}
	public boolean isAlteracoesMovimento() {
		return alteracoesMovimento;
	}
	public void setAlteracoesMovimento(boolean alteracoesMovimento) {
		this.alteracoesMovimento = alteracoesMovimento;
	}
	public boolean isDorOcularCefaleia() {
		return dorOcularCefaleia;
	}
	public void setDorOcularCefaleia(boolean dorOcularCefaleia) {
		this.dorOcularCefaleia = dorOcularCefaleia;
	}
	public boolean isDiplopia() {
		return diplopia;
	}
	public void setDiplopia(boolean diplopia) {
		this.diplopia = diplopia;
	}
	public boolean isFotofobia() {
		return fotofobia;
	}
	public void setFotofobia(boolean fotofobia) {
		this.fotofobia = fotofobia;
	}
	public boolean isSensacaoCorpoEstranho() {
		return sensacaoCorpoEstranho;
	}
	public void setSensacaoCorpoEstranho(boolean sensacaoCorpoEstranho) {
		this.sensacaoCorpoEstranho = sensacaoCorpoEstranho;
	}
	public boolean isQueimacao() {
		return queimacao;
	}
	public void setQueimacao(boolean queimacao) {
		this.queimacao = queimacao;
	}
	public boolean isNistagmo() {
		return nistagmo;
	}
	public void setNistagmo(boolean nistagmo) {
		this.nistagmo = nistagmo;
	}
	public boolean isLacrimejamento() {
		return lacrimejamento;
	}
	public void setLacrimejamento(boolean lacrimejamento) {
		this.lacrimejamento = lacrimejamento;
	}
	public boolean isEscotomas() {
		return escotomas;
	}
	public void setEscotomas(boolean escotomas) {
		this.escotomas = escotomas;
	}
	public boolean isSensacaoOlhoSeco() {
		return sensacaoOlhoSeco;
	}
	public void setSensacaoOlhoSeco(boolean sensacaoOlhoSeco) {
		this.sensacaoOlhoSeco = sensacaoOlhoSeco;
	}
	public boolean isSecrecao() {
		return secrecao;
	}
	public void setSecrecao(boolean secrecao) {
		this.secrecao = secrecao;
	}
	public boolean isAlteracaoAcuidadeVisual() {
		return alteracaoAcuidadeVisual;
	}
	public void setAlteracaoAcuidadeVisual(boolean alteracaoAcuidadeVisual) {
		this.alteracaoAcuidadeVisual = alteracaoAcuidadeVisual;
	}
	public boolean isDorOuvidos() {
		return dorOuvidos;
	}
	public void setDorOuvidos(boolean dorOuvidos) {
		this.dorOuvidos = dorOuvidos;
	}
	public boolean isAlteracaoAcuidadeAuditiva() {
		return alteracaoAcuidadeAuditiva;
	}
	public void setAlteracaoAcuidadeAuditiva(boolean alteracaoAcuidadeAuditiva) {
		this.alteracaoAcuidadeAuditiva = alteracaoAcuidadeAuditiva;
	}
	public boolean isZumbido() {
		return zumbido;
	}
	public void setZumbido(boolean zumbido) {
		this.zumbido = zumbido;
	}
	public boolean isPruridoOuvido() {
		return pruridoOuvido;
	}
	public void setPruridoOuvido(boolean pruridoOuvido) {
		this.pruridoOuvido = pruridoOuvido;
	}
	public boolean isOutrosOuvido() {
		return outrosOuvido;
	}
	public void setOutrosOuvido(boolean outrosOuvido) {
		this.outrosOuvido = outrosOuvido;
	}
	public String getDescricaoOutrosOuvido() {
		return descricaoOutrosOuvido;
	}
	public void setDescricaoOutrosOuvido(String descricaoOutrosOuvido) {
		this.descricaoOutrosOuvido = descricaoOutrosOuvido;
	}
	public boolean isAr() {
		return ar;
	}
	public void setAr(boolean ar) {
		this.ar = ar;
	}
	public boolean isEpitaxe() {
		return epitaxe;
	}
	public void setEpitaxe(boolean epitaxe) {
		this.epitaxe = epitaxe;
	}
	public boolean isAlteracoesOlfato() {
		return alteracoesOlfato;
	}
	public void setAlteracoesOlfato(boolean alteracoesOlfato) {
		this.alteracoesOlfato = alteracoesOlfato;
	}
	public boolean isTosse() {
		return tosse;
	}
	public void setTosse(boolean tosse) {
		this.tosse = tosse;
	}
	public String getTipoTosse() {
		return tipoTosse;
	}
	public void setTipoTosse(String tipoTosse) {
		this.tipoTosse = tipoTosse;
	}
	public boolean isHemoptise() {
		return hemoptise;
	}
	public void setHemoptise(boolean hemoptise) {
		this.hemoptise = hemoptise;
	}
	public boolean isExpectoracao() {
		return expectoracao;
	}
	public void setExpectoracao(boolean expectoracao) {
		this.expectoracao = expectoracao;
	}
	public String getDescricaoExpectoracao() {
		return descricaoExpectoracao;
	}
	public void setDescricaoExpectoracao(String descricaoExpectoracao) {
		this.descricaoExpectoracao = descricaoExpectoracao;
	}
	public boolean isDispneia() {
		return dispneia;
	}
	public void setDispneia(boolean dispneia) {
		this.dispneia = dispneia;
	}
	public String getTipoDispneia() {
		return tipoDispneia;
	}
	public void setTipoDispneia(String tipoDispneia) {
		this.tipoDispneia = tipoDispneia;
	}
	public String getTipoDorToracica() {
		return tipoDorToracica;
	}
	public void setTipoDorToracica(String tipoDorToracica) {
		this.tipoDorToracica = tipoDorToracica;
	}
	public String getLocalizacaoDorToracica() {
		return localizacaoDorToracica;
	}
	public void setLocalizacaoDorToracica(String localizacaoDorToracica) {
		this.localizacaoDorToracica = localizacaoDorToracica;
	}
	public boolean isOutrosAR() {
		return outrosAR;
	}
	public void setOutrosAR(boolean outrosAR) {
		this.outrosAR = outrosAR;
	}
	public String getDescricaoOutrosAR() {
		return descricaoOutrosAR;
	}
	public void setDescricaoOutrosAR(String descricaoOutrosAR) {
		this.descricaoOutrosAR = descricaoOutrosAR;
	}
	public boolean isAcv() {
		return acv;
	}
	public void setAcv(boolean acv) {
		this.acv = acv;
	}
	public boolean isPrecordalgia() {
		return precordalgia;
	}
	public void setPrecordalgia(boolean precordalgia) {
		this.precordalgia = precordalgia;
	}
	public String getTipoDorPrecordalgia() {
		return tipoDorPrecordalgia;
	}
	public void setTipoDorPrecordalgia(String tipoDorPrecordalgia) {
		this.tipoDorPrecordalgia = tipoDorPrecordalgia;
	}
	public String getFrequenciaDorPrecordalgia() {
		return frequenciaDorPrecordalgia;
	}
	public void setFrequenciaDorPrecordalgia(String frequenciaDorPrecordalgia) {
		this.frequenciaDorPrecordalgia = frequenciaDorPrecordalgia;
	}
	public boolean isPalpitacoes() {
		return palpitacoes;
	}
	public void setPalpitacoes(boolean palpitacoes) {
		this.palpitacoes = palpitacoes;
	}
	public boolean isDpn() {
		return dpn;
	}
	public void setDpn(boolean dpn) {
		this.dpn = dpn;
	}
	public boolean isOrtopneia() {
		return ortopneia;
	}
	public void setOrtopneia(boolean ortopneia) {
		this.ortopneia = ortopneia;
	}
	public boolean isEdemaMMII() {
		return edemaMMII;
	}
	public void setEdemaMMII(boolean edemaMMII) {
		this.edemaMMII = edemaMMII;
	}
	public boolean isDesmaio() {
		return desmaio;
	}
	public void setDesmaio(boolean desmaio) {
		this.desmaio = desmaio;
	}
	public boolean isOutrosACV() {
		return outrosACV;
	}
	public void setOutrosACV(boolean outrosACV) {
		this.outrosACV = outrosACV;
	}
	public String getDescricaoOutrosACV() {
		return descricaoOutrosACV;
	}
	public void setDescricaoOutrosACV(String descricaoOutrosACV) {
		this.descricaoOutrosACV = descricaoOutrosACV;
	}
	public boolean isAgi() {
		return agi;
	}
	public void setAgi(boolean agi) {
		this.agi = agi;
	}
	public boolean isSialose() {
		return sialose;
	}
	public void setSialose(boolean sialose) {
		this.sialose = sialose;
	}
	public boolean isHalitose() {
		return halitose;
	}
	public void setHalitose(boolean halitose) {
		this.halitose = halitose;
	}
	public boolean isRegurgitacao() {
		return regurgitacao;
	}
	public void setRegurgitacao(boolean regurgitacao) {
		this.regurgitacao = regurgitacao;
	}
	public boolean isEructacao() {
		return eructacao;
	}
	public void setEructacao(boolean eructacao) {
		this.eructacao = eructacao;
	}
	public boolean isSoluco() {
		return soluco;
	}
	public void setSoluco(boolean soluco) {
		this.soluco = soluco;
	}
	public boolean isPirose() {
		return pirose;
	}
	public void setPirose(boolean pirose) {
		this.pirose = pirose;
	}
	public boolean isNauseas() {
		return nauseas;
	}
	public void setNauseas(boolean nauseas) {
		this.nauseas = nauseas;
	}
	public boolean isHematemese() {
		return hematemese;
	}
	public void setHematemese(boolean hematemese) {
		this.hematemese = hematemese;
	}
	public boolean isMelena() {
		return melena;
	}
	public void setMelena(boolean melena) {
		this.melena = melena;
	}
	public boolean isHematoquezia() {
		return hematoquezia;
	}
	public void setHematoquezia(boolean hematoquezia) {
		this.hematoquezia = hematoquezia;
	}
	public boolean isDisfagia() {
		return disfagia;
	}
	public void setDisfagia(boolean disfagia) {
		this.disfagia = disfagia;
	}
	public boolean isOdinofagia() {
		return odinofagia;
	}
	public void setOdinofagia(boolean odinofagia) {
		this.odinofagia = odinofagia;
	}
	public boolean isIncontinenciaFecal() {
		return incontinenciaFecal;
	}
	public void setIncontinenciaFecal(boolean incontinenciaFecal) {
		this.incontinenciaFecal = incontinenciaFecal;
	}
	public boolean isConstipacao() {
		return constipacao;
	}
	public void setConstipacao(boolean constipacao) {
		this.constipacao = constipacao;
	}
	public boolean isDorAbdominal() {
		return dorAbdominal;
	}
	public void setDorAbdominal(boolean dorAbdominal) {
		this.dorAbdominal = dorAbdominal;
	}
	public String getLocalizacaoDorAbdominal() {
		return localizacaoDorAbdominal;
	}
	public void setLocalizacaoDorAbdominal(String localizacaoDorAbdominal) {
		this.localizacaoDorAbdominal = localizacaoDorAbdominal;
	}
	public boolean isAlteracoesApetite() {
		return alteracoesApetite;
	}
	public void setAlteracoesApetite(boolean alteracoesApetite) {
		this.alteracoesApetite = alteracoesApetite;
	}
	public String getDescricaoAlteracoesApetite() {
		return descricaoAlteracoesApetite;
	}
	public void setDescricaoAlteracoesApetite(String descricaoAlteracoesApetite) {
		this.descricaoAlteracoesApetite = descricaoAlteracoesApetite;
	}
	public boolean isOutrosAGI() {
		return outrosAGI;
	}
	public void setOutrosAGI(boolean outrosAGI) {
		this.outrosAGI = outrosAGI;
	}
	public String getDescricaoOutrosAGI() {
		return descricaoOutrosAGI;
	}
	public void setDescricaoOutrosAGI(String descricaoOutrosAGI) {
		this.descricaoOutrosAGI = descricaoOutrosAGI;
	}
	public boolean isVomitos() {
		return vomitos;
	}
	public void setVomitos(boolean vomitos) {
		this.vomitos = vomitos;
	}
	public String getDescricaoVomitos() {
		return descricaoVomitos;
	}
	public void setDescricaoVomitos(String descricaoVomitos) {
		this.descricaoVomitos = descricaoVomitos;
	}
	public boolean isAgu() {
		return agu;
	}
	public void setAgu(boolean agu) {
		this.agu = agu;
	}
	public boolean isDisuria() {
		return disuria;
	}
	public void setDisuria(boolean disuria) {
		this.disuria = disuria;
	}
	public boolean isPoliaciuria() {
		return poliaciuria;
	}
	public void setPoliaciuria(boolean poliaciuria) {
		this.poliaciuria = poliaciuria;
	}
	public boolean isPoliuria() {
		return poliuria;
	}
	public void setPoliuria(boolean poliuria) {
		this.poliuria = poliuria;
	}
	public boolean isNicturia() {
		return nicturia;
	}
	public void setNicturia(boolean nicturia) {
		this.nicturia = nicturia;
	}
	public boolean isHematuria() {
		return hematuria;
	}
	public void setHematuria(boolean hematuria) {
		this.hematuria = hematuria;
	}
	public boolean isAlteracaoCorUrina() {
		return alteracaoCorUrina;
	}
	public void setAlteracaoCorUrina(boolean alteracaoCorUrina) {
		this.alteracaoCorUrina = alteracaoCorUrina;
	}
	public boolean isAlteracaoCheiroUrina() {
		return alteracaoCheiroUrina;
	}
	public void setAlteracaoCheiroUrina(boolean alteracaoCheiroUrina) {
		this.alteracaoCheiroUrina = alteracaoCheiroUrina;
	}
	public boolean isUrgenciaMiccional() {
		return urgenciaMiccional;
	}
	public void setUrgenciaMiccional(boolean urgenciaMiccional) {
		this.urgenciaMiccional = urgenciaMiccional;
	}
	public boolean isIncontinenciaUrinaria() {
		return incontinenciaUrinaria;
	}
	public void setIncontinenciaUrinaria(boolean incontinenciaUrinaria) {
		this.incontinenciaUrinaria = incontinenciaUrinaria;
	}
	public boolean isCorrimentoVaginal() {
		return corrimentoVaginal;
	}
	public void setCorrimentoVaginal(boolean corrimentoVaginal) {
		this.corrimentoVaginal = corrimentoVaginal;
	}
	public boolean isPruridoVaginal() {
		return pruridoVaginal;
	}
	public void setPruridoVaginal(boolean pruridoVaginal) {
		this.pruridoVaginal = pruridoVaginal;
	}
	public boolean isDorMamas() {
		return dorMamas;
	}
	public void setDorMamas(boolean dorMamas) {
		this.dorMamas = dorMamas;
	}
	public String getDescricaoDorMamas() {
		return descricaoDorMamas;
	}
	public void setDescricaoDorMamas(String descricaoDorMamas) {
		this.descricaoDorMamas = descricaoDorMamas;
	}
	public boolean isNodulos() {
		return nodulos;
	}
	public void setNodulos(boolean nodulos) {
		this.nodulos = nodulos;
	}
	public String getDescricaoNodulos() {
		return descricaoNodulos;
	}
	public void setDescricaoNodulos(String descricaoNodulos) {
		this.descricaoNodulos = descricaoNodulos;
	}
	public boolean isSecrecaoPapilar() {
		return secrecaoPapilar;
	}
	public void setSecrecaoPapilar(boolean secrecaoPapilar) {
		this.secrecaoPapilar = secrecaoPapilar;
	}
	public boolean isOutrosAGU() {
		return outrosAGU;
	}
	public void setOutrosAGU(boolean outrosAGU) {
		this.outrosAGU = outrosAGU;
	}
	public String getDescricaoOutrosAGU() {
		return descricaoOutrosAGU;
	}
	public void setDescricaoOutrosAGU(String descricaoOutrosAGU) {
		this.descricaoOutrosAGU = descricaoOutrosAGU;
	}
	public boolean isAme() {
		return ame;
	}
	public void setAme(boolean ame) {
		this.ame = ame;
	}
	public boolean isDorArticulacoes() {
		return dorArticulacoes;
	}
	public void setDorArticulacoes(boolean dorArticulacoes) {
		this.dorArticulacoes = dorArticulacoes;
	}
	public boolean isRigidezArticular() {
		return rigidezArticular;
	}
	public void setRigidezArticular(boolean rigidezArticular) {
		this.rigidezArticular = rigidezArticular;
	}
	public boolean isMatinal() {
		return matinal;
	}
	public void setMatinal(boolean matinal) {
		this.matinal = matinal;
	}
	public String getDuracaoMatinal() {
		return duracaoMatinal;
	}
	public void setDuracaoMatinal(String duracaoMatinal) {
		this.duracaoMatinal = duracaoMatinal;
	}
	public boolean isFraqueza() {
		return fraqueza;
	}
	public void setFraqueza(boolean fraqueza) {
		this.fraqueza = fraqueza;
	}
	public boolean isAtrofia() {
		return atrofia;
	}
	public void setAtrofia(boolean atrofia) {
		this.atrofia = atrofia;
	}
	public boolean isHipertrofia() {
		return hipertrofia;
	}
	public void setHipertrofia(boolean hipertrofia) {
		this.hipertrofia = hipertrofia;
	}
	public boolean isEspasmos() {
		return espasmos;
	}
	public void setEspasmos(boolean espasmos) {
		this.espasmos = espasmos;
	}
	public boolean isOutrosAME() {
		return outrosAME;
	}
	public void setOutrosAME(boolean outrosAME) {
		this.outrosAME = outrosAME;
	}
	public String getDescricaoOutrosAME() {
		return descricaoOutrosAME;
	}
	public void setDescricaoOutrosAME(String descricaoOutrosAME) {
		this.descricaoOutrosAME = descricaoOutrosAME;
	}
	public boolean isSn() {
		return sn;
	}
	public void setSn(boolean sn) {
		this.sn = sn;
	}
	public boolean isCefaleia() {
		return cefaleia;
	}
	public void setCefaleia(boolean cefaleia) {
		this.cefaleia = cefaleia;
	}
	public boolean isTonturaVertigem() {
		return tonturaVertigem;
	}
	public void setTonturaVertigem(boolean tonturaVertigem) {
		this.tonturaVertigem = tonturaVertigem;
	}
	public boolean isConvulsoes() {
		return convulsoes;
	}
	public void setConvulsoes(boolean convulsoes) {
		this.convulsoes = convulsoes;
	}
	public boolean isAlteracoesMemoria() {
		return alteracoesMemoria;
	}
	public void setAlteracoesMemoria(boolean alteracoesMemoria) {
		this.alteracoesMemoria = alteracoesMemoria;
	}
	public boolean isTranstornosVisuais() {
		return transtornosVisuais;
	}
	public void setTranstornosVisuais(boolean transtornosVisuais) {
		this.transtornosVisuais = transtornosVisuais;
	}
	public boolean isTranstornosAuditivos() {
		return transtornosAuditivos;
	}
	public void setTranstornosAuditivos(boolean transtornosAuditivos) {
		this.transtornosAuditivos = transtornosAuditivos;
	}
	public boolean isTranstornosMarcha() {
		return transtornosMarcha;
	}
	public void setTranstornosMarcha(boolean transtornosMarcha) {
		this.transtornosMarcha = transtornosMarcha;
	}
	public boolean isDeficitForca() {
		return deficitForca;
	}
	public void setDeficitForca(boolean deficitForca) {
		this.deficitForca = deficitForca;
	}
	public boolean isAlteracoesSensibilidade() {
		return alteracoesSensibilidade;
	}
	public void setAlteracoesSensibilidade(boolean alteracoesSensibilidade) {
		this.alteracoesSensibilidade = alteracoesSensibilidade;
	}
	public boolean isTranstornosEsfincterianos() {
		return transtornosEsfincterianos;
	}
	public void setTranstornosEsfincterianos(boolean transtornosEsfincterianos) {
		this.transtornosEsfincterianos = transtornosEsfincterianos;
	}
	public boolean isIncontinencias() {
		return incontinencias;
	}
	public void setIncontinencias(boolean incontinencias) {
		this.incontinencias = incontinencias;
	}
	public String getDescricaoIncontinencias() {
		return descricaoIncontinencias;
	}
	public void setDescricaoIncontinencias(String descricaoIncontinencias) {
		this.descricaoIncontinencias = descricaoIncontinencias;
	}
	public boolean isTranstornosSono() {
		return transtornosSono;
	}
	public void setTranstornosSono(boolean transtornosSono) {
		this.transtornosSono = transtornosSono;
	}
	public String getDescricaoTranstornosSono() {
		return descricaoTranstornosSono;
	}
	public void setDescricaoTranstornosSono(String descricaoTranstornosSono) {
		this.descricaoTranstornosSono = descricaoTranstornosSono;
	}
	public boolean isOutrosSN() {
		return outrosSN;
	}
	public void setOutrosSN(boolean outrosSN) {
		this.outrosSN = outrosSN;
	}
	public String getDescricaoOutrosSN() {
		return descricaoOutrosSN;
	}
	public void setDescricaoOutrosSN(String descricaoOutrosSN) {
		this.descricaoOutrosSN = descricaoOutrosSN;
	}
	public boolean isDorToracica() {
		return dorToracica;
	}
	public void setDorToracica(boolean dorToracica) {
		this.dorToracica = dorToracica;
	}
	public String getDescricaoAlteracoesOlfato() {
		return descricaoAlteracoesOlfato;
	}
	public void setDescricaoAlteracoesOlfato(String descricaoAlteracoesOlfato) {
		this.descricaoAlteracoesOlfato = descricaoAlteracoesOlfato;
	}

	
	

}
