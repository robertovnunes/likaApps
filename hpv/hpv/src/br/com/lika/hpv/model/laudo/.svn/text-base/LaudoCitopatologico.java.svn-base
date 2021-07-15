 package br.com.lika.hpv.model.laudo;
 
 import br.com.lika.hpv.model.formulario.Formulario;
 import br.com.lika.hpv.model.formulario.util.Data;
 import java.util.Date;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class LaudoCitopatologico
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.MERGE}, fetch=FetchType.LAZY, optional=false)
   private Formulario formulario;
   private Date dataLiberacaoResultado;
   private Date dataRealizacaoExame;
   private Date dataAtualizacaoLaudo;
 
   @Column(length=25)
   private String tipoAmostra;
   private Character materialEctocerviceEndocervice;
   private Character materialEctocervice;
   private Character materialVaginal;
   private Character materialCupulaVaginal;
   private Character amostraNaoProcessadaPorAusenciaErro;
   private Character amostraNaoProcessadaPorLaminaDanificada;
   private Character amostraNaoProcessadaPorCausasAlheias;
   private Character amostraNaoProcessadaPorOutrasCausas;
 
   @Column(length=200)
   private String amostraNaoProcessadaPorTextoOutrasCausas;
 
   @Column(length=16)
   private String adequabilidadeAmostra;
   private Character adeqAmostraMaterialAcelularHipocelularMenos10porcentoEsfregaco;
   private Character adeqAmostraSangueMais75porcentoEsfregaco;
   private Character adeqAmostraLeucocitosObscurecendoMais75porcentoEsfregaco;
   private Character adeqAmostraArtefatosDessecamentoMais75porcentoEsfregaco;
   private Character adeqAmostraContaminantesExternosMais75porcentoEsfregaco;
   private Character adeqAmostraIntensaSuperposicaoCelularMais75porcentoEsfregaco;
   private Character adeqAmostraOutros;
 
   @Column(length=200)
   private String adeqAmostraTextoOutros;
   private Character epiteliosRepresentativosAmostraEscamoso;
   private Character epiteliosRepresentativosAmostraGlandular;
   private Character epiteliosRepresentativosAmostraMetaplasico;
   private Character microbiologiaLactobacillusSpp;
   private Character microbiologiaBacilos;
   private Character microbiologiaCocos;
   private Character microbiologiaSugestivoChlamydiaSpp;
   private Character microbiologiaActinomycesSpp;
   private Character microbiologiaCandidaSpp;
   private Character microbiologiaTrichomonasVaginalis;
   private Character microbiologiaEfeitoCitopaticoCompativelHerpes;
   private Character microbiologiaBacilosSupracitoplasmaticos;
   private Character microbiologiaLeptothrixSpp;
   private Character microbiologiaOutros;
   private String microbiologiaTextoOutros;
 
   @Column(length=74)
   private String diagnosticoDescritivo;
   private Character diagnosticoDescritivoInflamacao;
   private Character diagnosticoDescritivoReparacao;
   private Character diagnosticoDescritivoMetaplasiaEscamosaImatura;
   private Character diagnosticoDescritivoArtrofiaComInflamacao;
   private Character diagnosticoDescritivoRadiacao;
   private Character diagnosticoDescritivoOutros;
 
   @Column(length=200)
   private String diagnosticoDescritivoTextoOutros;
 
   @Column(length=50)
   private String atipiasCelulasEscamosas;
 
   @Column(length=100)
   private String lesaoIntraEpitelialEscamosaBaixoGrau;
 
   @Column(length=100)
   private String lesaoIntraEpitelialEscamosaAltoGrau;
 
   @Column(length=30)
   private String celulasGlandulares;
   private Character adenocarcinomaInSitu;
 
   @Column(length=50)
   private String adenocarcinoma;
   private Character presencaCelulasEndometriais;
 
   @Column(length=150)
   private String observacoesFinais;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public Formulario getFormulario() {
     return this.formulario;
   }
   public void setFormulario(Formulario formulario) {
     this.formulario = formulario;
   }
   public Date getDataLiberacaoResultado() {
     Data data = new Data();
     if (this.dataLiberacaoResultado != null) {
       data.setTime(this.dataLiberacaoResultado.getTime());
       return data;
     }
     return null;
   }
 
   public Data getDataRealizacaoExame() {
     Data data = new Data();
     if (this.dataRealizacaoExame != null) {
       data.setTime(this.dataRealizacaoExame.getTime());
       return data;
     }
     return null;
   }
 
   public String getTipoAmostra() {
     return this.tipoAmostra;
   }
   public void setTipoAmostra(String tipoAmostra) {
     this.tipoAmostra = tipoAmostra;
   }
   public Character getMaterialEctocerviceEndocervice() {
     return this.materialEctocerviceEndocervice;
   }
 
   public void setMaterialEctocerviceEndocervice(Character materialEctocerviceEndocervice) {
     this.materialEctocerviceEndocervice = materialEctocerviceEndocervice;
   }
   public Character getMaterialEctocervice() {
     return this.materialEctocervice;
   }
   public void setMaterialEctocervice(Character materialEctocervice) {
     this.materialEctocervice = materialEctocervice;
   }
   public Character getMaterialVaginal() {
     return this.materialVaginal;
   }
   public void setMaterialVaginal(Character materialVaginal) {
     this.materialVaginal = materialVaginal;
   }
   public Character getMaterialCupulaVaginal() {
     return this.materialCupulaVaginal;
   }
   public void setMaterialCupulaVaginal(Character materialCupulaVaginal) {
     this.materialCupulaVaginal = materialCupulaVaginal;
   }
   public Character getAmostraNaoProcessadaPorAusenciaErro() {
     return this.amostraNaoProcessadaPorAusenciaErro;
   }
 
   public void setAmostraNaoProcessadaPorAusenciaErro(Character amostraNaoProcessadaPorAusenciaErro) {
     this.amostraNaoProcessadaPorAusenciaErro = amostraNaoProcessadaPorAusenciaErro;
   }
   public Character getAmostraNaoProcessadaPorLaminaDanificada() {
     return this.amostraNaoProcessadaPorLaminaDanificada;
   }
 
   public void setAmostraNaoProcessadaPorLaminaDanificada(Character amostraNaoProcessadaPorLaminaDanificada) {
     this.amostraNaoProcessadaPorLaminaDanificada = amostraNaoProcessadaPorLaminaDanificada;
   }
   public Character getAmostraNaoProcessadaPorCausasAlheias() {
     return this.amostraNaoProcessadaPorCausasAlheias;
   }
 
   public void setAmostraNaoProcessadaPorCausasAlheias(Character amostraNaoProcessadaPorCausasAlheias) {
     this.amostraNaoProcessadaPorCausasAlheias = amostraNaoProcessadaPorCausasAlheias;
   }
   public Character getAmostraNaoProcessadaPorOutrasCausas() {
     return this.amostraNaoProcessadaPorOutrasCausas;
   }
 
   public void setAmostraNaoProcessadaPorOutrasCausas(Character amostraNaoProcessadaPorOutrasCausas) {
     this.amostraNaoProcessadaPorOutrasCausas = amostraNaoProcessadaPorOutrasCausas;
   }
   public String getAmostraNaoProcessadaPorTextoOutrasCausas() {
     return this.amostraNaoProcessadaPorTextoOutrasCausas;
   }
 
   public void setAmostraNaoProcessadaPorTextoOutrasCausas(String amostraNaoProcessadaPorTextoOutrasCausas) {
     this.amostraNaoProcessadaPorTextoOutrasCausas = amostraNaoProcessadaPorTextoOutrasCausas;
   }
   public String getAdequabilidadeAmostra() {
     return this.adequabilidadeAmostra;
   }
   public void setAdequabilidadeAmostra(String adequabilidadeAmostra) {
     this.adequabilidadeAmostra = adequabilidadeAmostra;
   }
   public Character getAdeqAmostraMaterialAcelularHipocelularMenos10porcentoEsfregaco() {
     return this.adeqAmostraMaterialAcelularHipocelularMenos10porcentoEsfregaco;
   }
 
   public void setAdeqAmostraMaterialAcelularHipocelularMenos10porcentoEsfregaco(Character adeqAmostraMaterialAcelularHipocelularMenos10porcentoEsfregaco) {
     this.adeqAmostraMaterialAcelularHipocelularMenos10porcentoEsfregaco = adeqAmostraMaterialAcelularHipocelularMenos10porcentoEsfregaco;
   }
   public Character getAdeqAmostraSangueMais75porcentoEsfregaco() {
     return this.adeqAmostraSangueMais75porcentoEsfregaco;
   }
 
   public void setAdeqAmostraSangueMais75porcentoEsfregaco(Character adeqAmostraSangueMais75porcentoEsfregaco) {
     this.adeqAmostraSangueMais75porcentoEsfregaco = adeqAmostraSangueMais75porcentoEsfregaco;
   }
   public Character getAdeqAmostraLeucocitosObscurecendoMais75porcentoEsfregaco() {
     return this.adeqAmostraLeucocitosObscurecendoMais75porcentoEsfregaco;
   }
 
   public void setAdeqAmostraLeucocitosObscurecendoMais75porcentoEsfregaco(Character adeqAmostraLeucocitosObscurecendoMais75porcentoEsfregaco) {
     this.adeqAmostraLeucocitosObscurecendoMais75porcentoEsfregaco = adeqAmostraLeucocitosObscurecendoMais75porcentoEsfregaco;
   }
   public Character getAdeqAmostraArtefatosDessecamentoMais75porcentoEsfregaco() {
     return this.adeqAmostraArtefatosDessecamentoMais75porcentoEsfregaco;
   }
 
   public void setAdeqAmostraArtefatosDessecamentoMais75porcentoEsfregaco(Character adeqAmostraArtefatosDessecamentoMais75porcentoEsfregaco) {
     this.adeqAmostraArtefatosDessecamentoMais75porcentoEsfregaco = adeqAmostraArtefatosDessecamentoMais75porcentoEsfregaco;
   }
   public Character getAdeqAmostraContaminantesExternosMais75porcentoEsfregaco() {
     return this.adeqAmostraContaminantesExternosMais75porcentoEsfregaco;
   }
 
   public void setAdeqAmostraContaminantesExternosMais75porcentoEsfregaco(Character adeqAmostraContaminantesExternosMais75porcentoEsfregaco) {
     this.adeqAmostraContaminantesExternosMais75porcentoEsfregaco = adeqAmostraContaminantesExternosMais75porcentoEsfregaco;
   }
   public Character getAdeqAmostraIntensaSuperposicaoCelularMais75porcentoEsfregaco() {
     return this.adeqAmostraIntensaSuperposicaoCelularMais75porcentoEsfregaco;
   }
 
   public void setAdeqAmostraIntensaSuperposicaoCelularMais75porcentoEsfregaco(Character adeqAmostraIntensaSuperposicaoCelularMais75porcentoEsfregaco) {
     this.adeqAmostraIntensaSuperposicaoCelularMais75porcentoEsfregaco = adeqAmostraIntensaSuperposicaoCelularMais75porcentoEsfregaco;
   }
   public Character getAdeqAmostraOutros() {
     return this.adeqAmostraOutros;
   }
   public void setAdeqAmostraOutros(Character adeqAmostraOutros) {
     this.adeqAmostraOutros = adeqAmostraOutros;
   }
   public String getAdeqAmostraTextoOutros() {
     return this.adeqAmostraTextoOutros;
   }
   public void setAdeqAmostraTextoOutros(String adeqAmostraTextoOutros) {
     this.adeqAmostraTextoOutros = adeqAmostraTextoOutros;
   }
   public Character getEpiteliosRepresentativosAmostraEscamoso() {
     return this.epiteliosRepresentativosAmostraEscamoso;
   }
 
   public void setEpiteliosRepresentativosAmostraEscamoso(Character epiteliosRepresentativosAmostraEscamoso) {
     this.epiteliosRepresentativosAmostraEscamoso = epiteliosRepresentativosAmostraEscamoso;
   }
   public Character getEpiteliosRepresentativosAmostraGlandular() {
     return this.epiteliosRepresentativosAmostraGlandular;
   }
 
   public void setEpiteliosRepresentativosAmostraGlandular(Character epiteliosRepresentativosAmostraGlandular) {
     this.epiteliosRepresentativosAmostraGlandular = epiteliosRepresentativosAmostraGlandular;
   }
   public Character getEpiteliosRepresentativosAmostraMetaplasico() {
     return this.epiteliosRepresentativosAmostraMetaplasico;
   }
 
   public void setEpiteliosRepresentativosAmostraMetaplasico(Character epiteliosRepresentativosAmostraMetaplasico) {
     this.epiteliosRepresentativosAmostraMetaplasico = epiteliosRepresentativosAmostraMetaplasico;
   }
   public Character getMicrobiologiaLactobacillusSpp() {
     return this.microbiologiaLactobacillusSpp;
   }
 
   public void setMicrobiologiaLactobacillusSpp(Character microbiologiaLactobacillusSpp) {
     this.microbiologiaLactobacillusSpp = microbiologiaLactobacillusSpp;
   }
   public Character getMicrobiologiaBacilos() {
     return this.microbiologiaBacilos;
   }
   public void setMicrobiologiaBacilos(Character microbiologiaBacilos) {
     this.microbiologiaBacilos = microbiologiaBacilos;
   }
   public Character getMicrobiologiaCocos() {
     return this.microbiologiaCocos;
   }
   public void setMicrobiologiaCocos(Character microbiologiaCocos) {
     this.microbiologiaCocos = microbiologiaCocos;
   }
   public Character getMicrobiologiaSugestivoChlamydiaSpp() {
     return this.microbiologiaSugestivoChlamydiaSpp;
   }
 
   public void setMicrobiologiaSugestivoChlamydiaSpp(Character microbiologiaSugestivoChlamydiaSpp) {
     this.microbiologiaSugestivoChlamydiaSpp = microbiologiaSugestivoChlamydiaSpp;
   }
   public Character getMicrobiologiaActinomycesSpp() {
     return this.microbiologiaActinomycesSpp;
   }
   public void setMicrobiologiaActinomycesSpp(Character microbiologiaActinomycesSpp) {
     this.microbiologiaActinomycesSpp = microbiologiaActinomycesSpp;
   }
   public Character getMicrobiologiaCandidaSpp() {
     return this.microbiologiaCandidaSpp;
   }
   public void setMicrobiologiaCandidaSpp(Character microbiologiaCandidaSpp) {
     this.microbiologiaCandidaSpp = microbiologiaCandidaSpp;
   }
   public Character getMicrobiologiaTrichomonasVaginalis() {
     return this.microbiologiaTrichomonasVaginalis;
   }
 
   public void setMicrobiologiaTrichomonasVaginalis(Character microbiologiaTrichomonasVaginalis) {
     this.microbiologiaTrichomonasVaginalis = microbiologiaTrichomonasVaginalis;
   }
   public Character getMicrobiologiaEfeitoCitopaticoCompativelHerpes() {
     return this.microbiologiaEfeitoCitopaticoCompativelHerpes;
   }
 
   public void setMicrobiologiaEfeitoCitopaticoCompativelHerpes(Character microbiologiaEfeitoCitopaticoCompativelHerpes) {
     this.microbiologiaEfeitoCitopaticoCompativelHerpes = microbiologiaEfeitoCitopaticoCompativelHerpes;
   }
   public Character getMicrobiologiaBacilosSupracitoplasmaticos() {
     return this.microbiologiaBacilosSupracitoplasmaticos;
   }
 
   public void setMicrobiologiaBacilosSupracitoplasmaticos(Character microbiologiaBacilosSupracitoplasmaticos) {
     this.microbiologiaBacilosSupracitoplasmaticos = microbiologiaBacilosSupracitoplasmaticos;
   }
   public Character getMicrobiologiaLeptothrixSpp() {
     return this.microbiologiaLeptothrixSpp;
   }
   public void setMicrobiologiaLeptothrixSpp(Character microbiologiaLeptothrixSpp) {
     this.microbiologiaLeptothrixSpp = microbiologiaLeptothrixSpp;
   }
   public Character getMicrobiologiaOutros() {
     return this.microbiologiaOutros;
   }
   public void setMicrobiologiaOutros(Character microbiologiaOutros) {
     this.microbiologiaOutros = microbiologiaOutros;
   }
   public String getMicrobiologiaTextoOutros() {
     return this.microbiologiaTextoOutros;
   }
   public void setMicrobiologiaTextoOutros(String microbiologiaTextoOutros) {
     this.microbiologiaTextoOutros = microbiologiaTextoOutros;
   }
   public String getDiagnosticoDescritivo() {
     return this.diagnosticoDescritivo;
   }
   public void setDiagnosticoDescritivo(String diagnosticoDescritivo) {
     this.diagnosticoDescritivo = diagnosticoDescritivo;
   }
   public Character getDiagnosticoDescritivoInflamacao() {
     return this.diagnosticoDescritivoInflamacao;
   }
 
   public void setDiagnosticoDescritivoInflamacao(Character diagnosticoDescritivoInflamacao) {
     this.diagnosticoDescritivoInflamacao = diagnosticoDescritivoInflamacao;
   }
   public Character getDiagnosticoDescritivoReparacao() {
     return this.diagnosticoDescritivoReparacao;
   }
 
   public void setDiagnosticoDescritivoReparacao(Character diagnosticoDescritivoReparacao) {
     this.diagnosticoDescritivoReparacao = diagnosticoDescritivoReparacao;
   }
   public Character getDiagnosticoDescritivoMetaplasiaEscamosaImatura() {
     return this.diagnosticoDescritivoMetaplasiaEscamosaImatura;
   }
 
   public void setDiagnosticoDescritivoMetaplasiaEscamosaImatura(Character diagnosticoDescritivoMetaplasiaEscamosaImatura) {
     this.diagnosticoDescritivoMetaplasiaEscamosaImatura = diagnosticoDescritivoMetaplasiaEscamosaImatura;
   }
   public Character getDiagnosticoDescritivoArtrofiaComInflamacao() {
     return this.diagnosticoDescritivoArtrofiaComInflamacao;
   }
 
   public void setDiagnosticoDescritivoArtrofiaComInflamacao(Character diagnosticoDescritivoArtrofiaComInflamacao) {
     this.diagnosticoDescritivoArtrofiaComInflamacao = diagnosticoDescritivoArtrofiaComInflamacao;
   }
   public Character getDiagnosticoDescritivoRadiacao() {
     return this.diagnosticoDescritivoRadiacao;
   }
 
   public void setDiagnosticoDescritivoRadiacao(Character diagnosticoDescritivoRadiacao) {
     this.diagnosticoDescritivoRadiacao = diagnosticoDescritivoRadiacao;
   }
   public Character getDiagnosticoDescritivoOutros() {
     return this.diagnosticoDescritivoOutros;
   }
   public void setDiagnosticoDescritivoOutros(Character diagnosticoDescritivoOutros) {
     this.diagnosticoDescritivoOutros = diagnosticoDescritivoOutros;
   }
   public String getDiagnosticoDescritivoTextoOutros() {
     return this.diagnosticoDescritivoTextoOutros;
   }
 
   public void setDiagnosticoDescritivoTextoOutros(String diagnosticoDescritivoTextoOutros) {
     this.diagnosticoDescritivoTextoOutros = diagnosticoDescritivoTextoOutros;
   }
   public String getAtipiasCelulasEscamosas() {
     return this.atipiasCelulasEscamosas;
   }
   public void setAtipiasCelulasEscamosas(String atipiasCelulasEscamosas) {
     this.atipiasCelulasEscamosas = atipiasCelulasEscamosas;
   }
   public String getLesaoIntraEpitelialEscamosaBaixoGrau() {
     return this.lesaoIntraEpitelialEscamosaBaixoGrau;
   }
 
   public void setLesaoIntraEpitelialEscamosaBaixoGrau(String lesaoIntraEpitelialEscamosaBaixoGrau) {
     this.lesaoIntraEpitelialEscamosaBaixoGrau = lesaoIntraEpitelialEscamosaBaixoGrau;
   }
   public String getLesaoIntraEpitelialEscamosaAltoGrau() {
     return this.lesaoIntraEpitelialEscamosaAltoGrau;
   }
 
   public void setLesaoIntraEpitelialEscamosaAltoGrau(String lesaoIntraEpitelialEscamosaAltoGrau) {
     this.lesaoIntraEpitelialEscamosaAltoGrau = lesaoIntraEpitelialEscamosaAltoGrau;
   }
   public String getCelulasGlandulares() {
     return this.celulasGlandulares;
   }
   public void setCelulasGlandulares(String celulasGlandulares) {
     this.celulasGlandulares = celulasGlandulares;
   }
   public Character getAdenocarcinomaInSitu() {
     return this.adenocarcinomaInSitu;
   }
   public void setAdenocarcinomaInSitu(Character adenocarcinomaInSitu) {
     this.adenocarcinomaInSitu = adenocarcinomaInSitu;
   }
   public String getAdenocarcinoma() {
     return this.adenocarcinoma;
   }
   public void setAdenocarcinoma(String adenocarcinoma) {
     this.adenocarcinoma = adenocarcinoma;
   }
   public Character getPresencaCelulasEndometriais() {
     return this.presencaCelulasEndometriais;
   }
   public void setPresencaCelulasEndometriais(Character presencaCelulasEndometriais) {
     this.presencaCelulasEndometriais = presencaCelulasEndometriais;
   }
   public void setDataLiberacaoResultado(Date dataLiberacaoResultado) {
     this.dataLiberacaoResultado = dataLiberacaoResultado;
   }
   public void setDataRealizacaoExame(Date dataRealizacaoExame) {
     this.dataRealizacaoExame = dataRealizacaoExame;
   }
   public String getObservacoesFinais() {
     return this.observacoesFinais;
   }
   public void setObservacoesFinais(String observacoesFinais) {
     this.observacoesFinais = observacoesFinais;
   }
 
   public Date getDataAtualizacaoLaudo()
   {
     return this.dataAtualizacaoLaudo;
   }
   public void setDataAtualizacaoLaudo(Date dataAtualizacaoLaudo) {
     this.dataAtualizacaoLaudo = dataAtualizacaoLaudo;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.laudo.LaudoCitopatologico
 * JD-Core Version:    0.6.0
 */