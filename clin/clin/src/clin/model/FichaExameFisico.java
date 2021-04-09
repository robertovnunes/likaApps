package clin.model;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
@PrimaryKeyJoinColumn(name = "ficha_idFicha")
public class FichaExameFisico extends Ficha{
	
	private int peso;
	private int altura;
	private int ICM;
	private int PA;
	private int FC;
	private int FR;
	private String estadoGeral;
	private int temperatura;
	private boolean normocorado;
	private boolean hipocorado;
	private boolean ictericia;
	private boolean cianose;
	private boolean circulacaoColateral;
	private String localizacaoCirculacaoColateral;
	private boolean linfonodos;
	private String linfonodosCervical;
	private String linfonodosAxilar;
	private String linfonodosInguinal;
	private String outros;
	private String abaulamentosACV;
	private String localizacaoIctusCordis;
	private String extensaoIctusCordis;
	private String intensidadeIctusCordis;
	private boolean pulsos;
	private String carotideo;
	private String braquial;
	private String radial;
	private String femoral;
	private String popliteo;
	private String pedioso;
	private String tibialPosterior;
	private boolean estaseJugular;
	private boolean refluxoHepatojugular;
	private String ritmoCardiaco;
	private String bulhas;
	private boolean sopros;
	private String descricaoSopros;
	private boolean alteracaodeBulhas;
	private String descricaoAlteracaodeBulhas;
	private boolean cliquesEstalidos;
	private String descricaoCliquesEstalidos;
	private String outrosACV;
	private String observacaoACV;
	private String abaulamentosAR;
	private String formaDoTorax;
	private String depressoes;
	private String tipoRespiratorio;
	private String amplitudeDaRespiracao;
	private String expansibilidade;
	private String fremitoToracovocal;
	private String percussaoAR;
	private boolean sonsAnormaisContinuos;
	private boolean roncos;
	private boolean sibilos;
	private boolean estridor;
	private String localizacaoEstridor;
	private boolean atritoPleural;
	private String descricaoAtritoPleural;
	private String auscultaDaVozFalada;
	private String outrosAR;
	private String observacaoAR;
	private String agu;
	private String aparelhoOsteoarticula;
	private String sistemaNervoso;
	private int avaliacaoDoNivelDeConsciencia;
	private String descricaoNivelDeConsciencia;
	private String formaVolume;
	private String cicatrizUmbilical;
	private boolean pulsacoesVisiveis;
	private String descricaoPulsasoesVisiveis;
	private boolean movimentosPeristalticos;
	private String descricaoMovimentosPeristalticos;
	private String ruidosHidroaerios;
	private String sensibilidade;
	private String resistenciaParedeAbdominal;
	private String diastasesHernias;
	private String pulsacoes;
	private boolean massaPalpavel;
	private String descricaoMassaPalpavel;
	private boolean palpacaoFigado;
	private String descricaoPalpacaoFigado;
	private boolean palpacaoVesiculaBiliar;
	private String descricaoPalpacaoVesiculaBiliar;
	private boolean palpacaoBaco;
	private String descricaoPalpacaoBaco;
	private boolean palpacaoCeco;
	private String descricaoPalpacaoCeco;
	private boolean palpacaoColonTransverso;
	private String descricaopalpacaoColonTransverso;
	private boolean palpacaoSigmoide;
	private String descricaoPalpacaoSigmoide;
	private String figado;
	private boolean ascite;
	private boolean pequenoVolume;
	private boolean medioVolume;
	private boolean grandeVolume;
	private String observacaoAGI;
	private boolean edemas;
	private String descricaoEdemas;
	private boolean murmurioVesicularPresente;
	private String localizacaoMurmurioVesicular;
	private boolean estertoresGrossos;
	private String localizacaoEstertoresGrossos;
	private boolean sonsRespiratorios;
	private boolean sonsAnormaisDescontinuos;
	public int getPeso() {
		return peso;
	}
	public void setPeso(int peso) {
		this.peso = peso;
	}
	public int getAltura() {
		return altura;
	}
	public void setAltura(int altura) {
		this.altura = altura;
	}
	public int getICM() {
		return ICM;
	}
	public void setICM(int iCM) {
		ICM = iCM;
	}
	public int getPA() {
		return PA;
	}
	public void setPA(int pA) {
		PA = pA;
	}
	public int getFC() {
		return FC;
	}
	public void setFC(int fC) {
		FC = fC;
	}
	public int getFR() {
		return FR;
	}
	public void setFR(int fR) {
		FR = fR;
	}
	public String getEstadoGeral() {
		return estadoGeral;
	}
	public void setEstadoGeral(String estadoGeral) {
		this.estadoGeral = estadoGeral;
	}
	public int getTemperatura() {
		return temperatura;
	}
	public void setTemperatura(int temperatura) {
		this.temperatura = temperatura;
	}
	public boolean isNormocorado() {
		return normocorado;
	}
	public void setNormocorado(boolean normocorado) {
		this.normocorado = normocorado;
	}
	public boolean isHipocorado() {
		return hipocorado;
	}
	public void setHipocorado(boolean hipocorado) {
		this.hipocorado = hipocorado;
	}
	public boolean isIctericia() {
		return ictericia;
	}
	public void setIctericia(boolean ictericia) {
		this.ictericia = ictericia;
	}
	public boolean isCianose() {
		return cianose;
	}
	public void setCianose(boolean cianose) {
		this.cianose = cianose;
	}
	public boolean isCirculacaoColateral() {
		return circulacaoColateral;
	}
	public void setCirculacaoColateral(boolean circulacaoColateral) {
		this.circulacaoColateral = circulacaoColateral;
	}
	public String getLocalizacaoCirculacaoColateral() {
		return localizacaoCirculacaoColateral;
	}
	public void setLocalizacaoCirculacaoColateral(
			String localizacaoCirculacaoColateral) {
		this.localizacaoCirculacaoColateral = localizacaoCirculacaoColateral;
	}
	public boolean isLinfonodos() {
		return linfonodos;
	}
	public void setLinfonodos(boolean linfonodos) {
		this.linfonodos = linfonodos;
	}
	public String getLinfonodosCervical() {
		return linfonodosCervical;
	}
	public void setLinfonodosCervical(String linfonodosCervical) {
		this.linfonodosCervical = linfonodosCervical;
	}
	public String getLinfonodosAxilar() {
		return linfonodosAxilar;
	}
	public void setLinfonodosAxilar(String linfonodosAxilar) {
		this.linfonodosAxilar = linfonodosAxilar;
	}
	public String getLinfonodosInguinal() {
		return linfonodosInguinal;
	}
	public void setLinfonodosInguinal(String linfonodosInguinal) {
		this.linfonodosInguinal = linfonodosInguinal;
	}
	public String getOutros() {
		return outros;
	}
	public void setOutros(String outros) {
		this.outros = outros;
	}
	public String getAbaulamentosACV() {
		return abaulamentosACV;
	}
	public void setAbaulamentosACV(String abaulamentosACV) {
		this.abaulamentosACV = abaulamentosACV;
	}
	public String getLocalizacaoIctusCordis() {
		return localizacaoIctusCordis;
	}
	public void setLocalizacaoIctusCordis(String localizacaoIctusCordis) {
		this.localizacaoIctusCordis = localizacaoIctusCordis;
	}
	public String getExtensaoIctusCordis() {
		return extensaoIctusCordis;
	}
	public void setExtensaoIctusCordis(String extensaoIctusCordis) {
		this.extensaoIctusCordis = extensaoIctusCordis;
	}
	public String getIntensidadeIctusCordis() {
		return intensidadeIctusCordis;
	}
	public void setIntensidadeIctusCordis(String intensidadeIctusCordis) {
		this.intensidadeIctusCordis = intensidadeIctusCordis;
	}
	public boolean isPulsos() {
		return pulsos;
	}
	public void setPulsos(boolean pulsos) {
		this.pulsos = pulsos;
	}
	public String getCarotideo() {
		return carotideo;
	}
	public void setCarotideo(String carotideo) {
		this.carotideo = carotideo;
	}
	public String getBraquial() {
		return braquial;
	}
	public void setBraquial(String braquial) {
		this.braquial = braquial;
	}
	public String getRadial() {
		return radial;
	}
	public void setRadial(String radial) {
		this.radial = radial;
	}
	public String getFemoral() {
		return femoral;
	}
	public void setFemoral(String femoral) {
		this.femoral = femoral;
	}
	public String getPopliteo() {
		return popliteo;
	}
	public void setPopliteo(String popliteo) {
		this.popliteo = popliteo;
	}
	public String getPedioso() {
		return pedioso;
	}
	public void setPedioso(String pedioso) {
		this.pedioso = pedioso;
	}
	public String getTibialPosterior() {
		return tibialPosterior;
	}
	public void setTibialPosterior(String tibialPosterior) {
		this.tibialPosterior = tibialPosterior;
	}
	public boolean isEstaseJugular() {
		return estaseJugular;
	}
	public void setEstaseJugular(boolean estaseJugular) {
		this.estaseJugular = estaseJugular;
	}
	public boolean isRefluxoHepatojugular() {
		return refluxoHepatojugular;
	}
	public void setRefluxoHepatojugular(boolean refluxoHepatojugular) {
		this.refluxoHepatojugular = refluxoHepatojugular;
	}
	public String getRitmoCardiaco() {
		return ritmoCardiaco;
	}
	public void setRitmoCardiaco(String ritmoCardiaco) {
		this.ritmoCardiaco = ritmoCardiaco;
	}
	public String getBulhas() {
		return bulhas;
	}
	public void setBulhas(String bulhas) {
		this.bulhas = bulhas;
	}
	public boolean isSopros() {
		return sopros;
	}
	public void setSopros(boolean sopros) {
		this.sopros = sopros;
	}
	public String getDescricaoSopros() {
		return descricaoSopros;
	}
	public void setDescricaoSopros(String descricaoSopros) {
		this.descricaoSopros = descricaoSopros;
	}
	public boolean isAlteracaodeBulhas() {
		return alteracaodeBulhas;
	}
	public void setAlteracaodeBulhas(boolean alteracaodeBulhas) {
		this.alteracaodeBulhas = alteracaodeBulhas;
	}
	public String getDescricaoAlteracaodeBulhas() {
		return descricaoAlteracaodeBulhas;
	}
	public void setDescricaoAlteracaodeBulhas(String descricaoAlteracaodeBulhas) {
		this.descricaoAlteracaodeBulhas = descricaoAlteracaodeBulhas;
	}
	public boolean isCliquesEstalidos() {
		return cliquesEstalidos;
	}
	public void setCliquesEstalidos(boolean cliquesEstalidos) {
		this.cliquesEstalidos = cliquesEstalidos;
	}
	public String getDescricaoCliquesEstalidos() {
		return descricaoCliquesEstalidos;
	}
	public void setDescricaoCliquesEstalidos(String descricaoCliquesEstalidos) {
		this.descricaoCliquesEstalidos = descricaoCliquesEstalidos;
	}
	public String getOutrosACV() {
		return outrosACV;
	}
	public void setOutrosACV(String outrosACV) {
		this.outrosACV = outrosACV;
	}
	public String getObservacaoACV() {
		return observacaoACV;
	}
	public void setObservacaoACV(String observacaoACV) {
		this.observacaoACV = observacaoACV;
	}
	public String getAbaulamentosAR() {
		return abaulamentosAR;
	}
	public void setAbaulamentosAR(String abaulamentosAR) {
		this.abaulamentosAR = abaulamentosAR;
	}
	public String getFormaDoTorax() {
		return formaDoTorax;
	}
	public void setFormaDoTorax(String formaDoTorax) {
		this.formaDoTorax = formaDoTorax;
	}
	public String getDepressoes() {
		return depressoes;
	}
	public void setDepressoes(String depressoes) {
		this.depressoes = depressoes;
	}
	public String getTipoRespiratorio() {
		return tipoRespiratorio;
	}
	public void setTipoRespiratorio(String tipoRespiratorio) {
		this.tipoRespiratorio = tipoRespiratorio;
	}
	public String getAmplitudeDaRespiracao() {
		return amplitudeDaRespiracao;
	}
	public void setAmplitudeDaRespiracao(String amplitudeDaRespiracao) {
		this.amplitudeDaRespiracao = amplitudeDaRespiracao;
	}
	public String getExpansibilidade() {
		return expansibilidade;
	}
	public void setExpansibilidade(String expansibilidade) {
		this.expansibilidade = expansibilidade;
	}
	public String getFremitoToracovocal() {
		return fremitoToracovocal;
	}
	public void setFremitoToracovocal(String fremitoToracovocal) {
		this.fremitoToracovocal = fremitoToracovocal;
	}
	public String getPercussaoAR() {
		return percussaoAR;
	}
	public void setPercussaoAR(String percussaoAR) {
		this.percussaoAR = percussaoAR;
	}
	public boolean isSonsAnormaisContinuos() {
		return sonsAnormaisContinuos;
	}
	public void setSonsAnormaisContinuos(boolean sonsAnormaisContinuos) {
		this.sonsAnormaisContinuos = sonsAnormaisContinuos;
	}
	public boolean isRoncos() {
		return roncos;
	}
	public void setRoncos(boolean roncos) {
		this.roncos = roncos;
	}
	public boolean isSibilos() {
		return sibilos;
	}
	public void setSibilos(boolean sibilos) {
		this.sibilos = sibilos;
	}
	public boolean isEstridor() {
		return estridor;
	}
	public void setEstridor(boolean estridor) {
		this.estridor = estridor;
	}
	public String getLocalizacaoEstridor() {
		return localizacaoEstridor;
	}
	public void setLocalizacaoEstridor(String localizacaoEstridor) {
		this.localizacaoEstridor = localizacaoEstridor;
	}
	public boolean isAtritoPleural() {
		return atritoPleural;
	}
	public void setAtritoPleural(boolean atritoPleural) {
		this.atritoPleural = atritoPleural;
	}
	public String getDescricaoAtritoPleural() {
		return descricaoAtritoPleural;
	}
	public void setDescricaoAtritoPleural(String descricaoAtritoPleural) {
		this.descricaoAtritoPleural = descricaoAtritoPleural;
	}
	public String getAuscultaDaVozFalada() {
		return auscultaDaVozFalada;
	}
	public void setAuscultaDaVozFalada(String auscultaDaVozFalada) {
		this.auscultaDaVozFalada = auscultaDaVozFalada;
	}
	public String getOutrosAR() {
		return outrosAR;
	}
	public void setOutrosAR(String outrosAR) {
		this.outrosAR = outrosAR;
	}
	public String getObservacaoAR() {
		return observacaoAR;
	}
	public void setObservacaoAR(String observacaoAR) {
		this.observacaoAR = observacaoAR;
	}
	public String getAgu() {
		return agu;
	}
	public void setAgu(String agu) {
		this.agu = agu;
	}
	public String getAparelhoOsteoarticula() {
		return aparelhoOsteoarticula;
	}
	public void setAparelhoOsteoarticula(String aparelhoOsteoarticula) {
		this.aparelhoOsteoarticula = aparelhoOsteoarticula;
	}
	public String getSistemaNervoso() {
		return sistemaNervoso;
	}
	public void setSistemaNervoso(String sistemaNervoso) {
		this.sistemaNervoso = sistemaNervoso;
	}
	public int getAvaliacaoDoNivelDeConsciencia() {
		return avaliacaoDoNivelDeConsciencia;
	}
	public void setAvaliacaoDoNivelDeConsciencia(int avaliacaoDoNivelDeConsciencia) {
		this.avaliacaoDoNivelDeConsciencia = avaliacaoDoNivelDeConsciencia;
	}
	public String getDescricaoNivelDeConsciencia() {
		return descricaoNivelDeConsciencia;
	}
	public void setDescricaoNivelDeConsciencia(String descricaoNivelDeConsciencia) {
		this.descricaoNivelDeConsciencia = descricaoNivelDeConsciencia;
	}
	public String getFormaVolume() {
		return formaVolume;
	}
	public void setFormaVolume(String formaVolume) {
		this.formaVolume = formaVolume;
	}
	public String getCicatrizUmbilical() {
		return cicatrizUmbilical;
	}
	public void setCicatrizUmbilical(String cicatrizUmbilical) {
		this.cicatrizUmbilical = cicatrizUmbilical;
	}
	public boolean isPulsacoesVisiveis() {
		return pulsacoesVisiveis;
	}
	public void setPulsacoesVisiveis(boolean pulsacoesVisiveis) {
		this.pulsacoesVisiveis = pulsacoesVisiveis;
	}
	public String getDescricaoPulsasoesVisiveis() {
		return descricaoPulsasoesVisiveis;
	}
	public void setDescricaoPulsasoesVisiveis(String descricaoPulsasoesVisiveis) {
		this.descricaoPulsasoesVisiveis = descricaoPulsasoesVisiveis;
	}
	public boolean isMovimentosPeristalticos() {
		return movimentosPeristalticos;
	}
	public void setMovimentosPeristalticos(boolean movimentosPeristalticos) {
		this.movimentosPeristalticos = movimentosPeristalticos;
	}
	public String getDescricaoMovimentosPeristalticos() {
		return descricaoMovimentosPeristalticos;
	}
	public void setDescricaoMovimentosPeristalticos(
			String descricaoMovimentosPeristalticos) {
		this.descricaoMovimentosPeristalticos = descricaoMovimentosPeristalticos;
	}
	public String getRuidosHidroaerios() {
		return ruidosHidroaerios;
	}
	public void setRuidosHidroaerios(String ruidosHidroaerios) {
		this.ruidosHidroaerios = ruidosHidroaerios;
	}
	public String getSensibilidade() {
		return sensibilidade;
	}
	public void setSensibilidade(String sensibilidade) {
		this.sensibilidade = sensibilidade;
	}
	public String getResistenciaParedeAbdominal() {
		return resistenciaParedeAbdominal;
	}
	public void setResistenciaParedeAbdominal(String resistenciaParedeAbdominal) {
		this.resistenciaParedeAbdominal = resistenciaParedeAbdominal;
	}
	public String getDiastasesHernias() {
		return diastasesHernias;
	}
	public void setDiastasesHernias(String diastasesHernias) {
		this.diastasesHernias = diastasesHernias;
	}
	public String getPulsacoes() {
		return pulsacoes;
	}
	public void setPulsacoes(String pulsacoes) {
		this.pulsacoes = pulsacoes;
	}
	public boolean isMassaPalpavel() {
		return massaPalpavel;
	}
	public void setMassaPalpavel(boolean massaPalpavel) {
		this.massaPalpavel = massaPalpavel;
	}
	public String getDescricaoMassaPalpavel() {
		return descricaoMassaPalpavel;
	}
	public void setDescricaoMassaPalpavel(String descricaoMassaPalpavel) {
		this.descricaoMassaPalpavel = descricaoMassaPalpavel;
	}
	public boolean isPalpacaoFigado() {
		return palpacaoFigado;
	}
	public void setPalpacaoFigado(boolean palpacaoFigado) {
		this.palpacaoFigado = palpacaoFigado;
	}
	public String getDescricaoPalpacaoFigado() {
		return descricaoPalpacaoFigado;
	}
	public void setDescricaoPalpacaoFigado(String descricaoPalpacaoFigado) {
		this.descricaoPalpacaoFigado = descricaoPalpacaoFigado;
	}
	public boolean isPalpacaoVesiculaBiliar() {
		return palpacaoVesiculaBiliar;
	}
	public void setPalpacaoVesiculaBiliar(boolean palpacaoVesiculaBiliar) {
		this.palpacaoVesiculaBiliar = palpacaoVesiculaBiliar;
	}
	public String getDescricaoPalpacaoVesiculaBiliar() {
		return descricaoPalpacaoVesiculaBiliar;
	}
	public void setDescricaoPalpacaoVesiculaBiliar(
			String descricaoPalpacaoVesiculaBiliar) {
		this.descricaoPalpacaoVesiculaBiliar = descricaoPalpacaoVesiculaBiliar;
	}
	public boolean isPalpacaoBaco() {
		return palpacaoBaco;
	}
	public void setPalpacaoBaco(boolean palpacaoBaco) {
		this.palpacaoBaco = palpacaoBaco;
	}
	public String getDescricaoPalpacaoBaco() {
		return descricaoPalpacaoBaco;
	}
	public void setDescricaoPalpacaoBaco(String descricaoPalpacaoBaco) {
		this.descricaoPalpacaoBaco = descricaoPalpacaoBaco;
	}
	public boolean isPalpacaoCeco() {
		return palpacaoCeco;
	}
	public void setPalpacaoCeco(boolean palpacaoCeco) {
		this.palpacaoCeco = palpacaoCeco;
	}
	public String getDescricaoPalpacaoCeco() {
		return descricaoPalpacaoCeco;
	}
	public void setDescricaoPalpacaoCeco(String descricaoPalpacaoCeco) {
		this.descricaoPalpacaoCeco = descricaoPalpacaoCeco;
	}
	public boolean isPalpacaoColonTransverso() {
		return palpacaoColonTransverso;
	}
	public void setPalpacaoColonTransverso(boolean palpacaoColonTransverso) {
		this.palpacaoColonTransverso = palpacaoColonTransverso;
	}
	public String getDescricaopalpacaoColonTransverso() {
		return descricaopalpacaoColonTransverso;
	}
	public void setDescricaopalpacaoColonTransverso(
			String descricaopalpacaoColonTransverso) {
		this.descricaopalpacaoColonTransverso = descricaopalpacaoColonTransverso;
	}
	public boolean isPalpacaoSigmoide() {
		return palpacaoSigmoide;
	}
	public void setPalpacaoSigmoide(boolean palpacaoSigmoide) {
		this.palpacaoSigmoide = palpacaoSigmoide;
	}
	public String getDescricaoPalpacaoSigmoide() {
		return descricaoPalpacaoSigmoide;
	}
	public void setDescricaoPalpacaoSigmoide(String descricaoPalpacaoSigmoide) {
		this.descricaoPalpacaoSigmoide = descricaoPalpacaoSigmoide;
	}
	public String getFigado() {
		return figado;
	}
	public void setFigado(String figado) {
		this.figado = figado;
	}
	public boolean isAscite() {
		return ascite;
	}
	public void setAscite(boolean ascite) {
		this.ascite = ascite;
	}
	public boolean isPequenoVolume() {
		return pequenoVolume;
	}
	public void setPequenoVolume(boolean pequenoVolume) {
		this.pequenoVolume = pequenoVolume;
	}
	public boolean isMedioVolume() {
		return medioVolume;
	}
	public void setMedioVolume(boolean medioVolume) {
		this.medioVolume = medioVolume;
	}
	public boolean isGrandeVolume() {
		return grandeVolume;
	}
	public void setGrandeVolume(boolean grandeVolume) {
		this.grandeVolume = grandeVolume;
	}
	public String getObservacaoAGI() {
		return observacaoAGI;
	}
	public void setObservacaoAGI(String observacaoAGI) {
		this.observacaoAGI = observacaoAGI;
	}
	public boolean isEdemas() {
		return edemas;
	}
	public void setEdemas(boolean edemas) {
		this.edemas = edemas;
	}
	public String getDescricaoEdemas() {
		return descricaoEdemas;
	}
	public void setDescricaoEdemas(String descricaoEdemas) {
		this.descricaoEdemas = descricaoEdemas;
	}
	public boolean isMurmurioVesicularPresente() {
		return murmurioVesicularPresente;
	}
	public void setMurmurioVesicularPresente(boolean murmurioVesicularPresente) {
		this.murmurioVesicularPresente = murmurioVesicularPresente;
	}
	public String getLocalizacaoMurmurioVesicular() {
		return localizacaoMurmurioVesicular;
	}
	public void setLocalizacaoMurmurioVesicular(String localizacaoMurmurioVesicular) {
		this.localizacaoMurmurioVesicular = localizacaoMurmurioVesicular;
	}
	public boolean isEstertoresGrossos() {
		return estertoresGrossos;
	}
	public void setEstertoresGrossos(boolean estertoresGrossos) {
		this.estertoresGrossos = estertoresGrossos;
	}
	public String getLocalizacaoEstertoresGrossos() {
		return localizacaoEstertoresGrossos;
	}
	public void setLocalizacaoEstertoresGrossos(String localizacaoEstertoresGrossos) {
		this.localizacaoEstertoresGrossos = localizacaoEstertoresGrossos;
	}
	public boolean isSonsRespiratorios() {
		return sonsRespiratorios;
	}
	public void setSonsRespiratorios(boolean sonsRespiratorios) {
		this.sonsRespiratorios = sonsRespiratorios;
	}
	public boolean isSonsAnormaisDescontinuos() {
		return sonsAnormaisDescontinuos;
	}
	public void setSonsAnormaisDescontinuos(boolean sonsAnormaisDescontinuos) {
		this.sonsAnormaisDescontinuos = sonsAnormaisDescontinuos;
	}

	
	

}
