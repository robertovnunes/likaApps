 package br.com.lika.hpv.model.formulario;
 
 import br.com.lika.hpv.model.formulario.util.Cancer;
 import br.com.lika.hpv.model.formulario.util.Cirurgias;
 import br.com.lika.hpv.model.formulario.util.Diabetes;
import br.com.lika.hpv.model.formulario.util.Imunossupressoras;
 import br.com.lika.hpv.model.formulario.util.MalEstar;
 import br.com.lika.hpv.model.formulario.util.MedicacaoMenorPausa;
 import br.com.lika.hpv.model.formulario.util.MedicacaoUsoContinuo;
 import java.util.List;

import javax.persistence.CascadeType;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
 
 @Entity
 public class HistoricoClinico
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=5)
   private String altura;
 
   @Column(length=5)
   private String peso;
 
   @Column(length=10)
   private String frequenciaGinecologista;
 
   @Column(length=20)
   private String ultimoPreventivo;
 
   @Column(length=1)
   private String contraceptivoAtualAdesivo;
 
   @Column(length=1)
   private String contraceptivoAtualAnelVaginal;
 
   @Column(length=1)
   private String contraceptivoAtualCamisinhaFeminina;
 
   @Column(length=1)
   private String contraceptivoAtualCoitoInterrompido;
 
   @Column(length=1)
   private String contraceptivoAtualDiafragma;
 
   @Column(length=1)
   private String contraceptivoAtualDIU;
 
   @Column(length=1)
   private String contraceptivoAtualEspermaticida;
 
   @Column(length=1)
   private String contraceptivoAtualImplante;
 
   @Column(length=1)
   private String contraceptivoAtualInjecao;
 
   @Column(length=1)
   private String contraceptivoAtualLigaduraTrompa;
 
   @Column(length=1)
   private String contraceptivoAtualMetodoMuco;
 
   @Column(length=1)
   private String contraceptivoAtualNaoUsa;
 
   @Column(length=1)
   private String contraceptivoAtualOutro;
 
   @Column(length=1)
   private String contraceptivoAtualPilulaDiaSeguinte;

   @Column(length=1)
   private String contraceptivoAtualPilula;
   
   @Column(length=1)
   private String contraceptivoAtualPreservativoMasculino;
 
   @Column(length=1)
   private String contraceptivoAtualTabelinha;
 
   @Column(length=1)
   private String contraceptivoAtualVasectomiaParceiro;
 
   @Column(length=14)
   private String quantoTempoUsaContraceptivo;
 
   @Column(length=5)
   private String jaFezPapaNicolau;
 
   @Column(length=50)
   private String resultadoExamePapaNicolau;
 
   @Column(length=5)
   private String estaNaMenoPausa;
 
   @Column(length=5)
   private String usaMedicacaoMenorPausa;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="historicoClinico", targetEntity=MedicacaoMenorPausa.class, fetch=FetchType.EAGER)
   private MedicacaoMenorPausa medicacaoMenorPausa;
 
   @Column(length=5)
   private String jaRecebeuTransfusaoSanguinea;
 
   @Column(length=5)
   private String jaRecebeuTransplante;
 
   @Column(length=5)
   private String temDoencaCronica;
 
   @Column(length=60)
   private String doencaCronica;
 
   @Column(length=5)
   private String usaMedicacaoUsoContinuo;
 
   @Column(length=1)
   private String usaMedicacaoImunossupressora;
 
   @Column(length=1)
   private String usaMedicacaoAntibiotico;
 
   @Column(length=1)
   private String usaMedicacaoCardiovascular;
 
   @Column(length=1)
   private String usaMedicacaoPsicotropico;
 
   @Column(length=1)
   private String usaMedicacaoNSNR;
 
   @OneToMany(cascade={javax.persistence.CascadeType.MERGE}, mappedBy="historicoClinico", targetEntity=MedicacaoUsoContinuo.class)
   private List<MedicacaoUsoContinuo> medicacoesUsoContinuo;
 
   @Column(length=5)
   private String algumMalEstar;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="historicoClinico", targetEntity=MalEstar.class, fetch=FetchType.EAGER)
   private MalEstar malEstar;
 
   @Column(length=5)
   private String temPressaoAlta;
 
   @Column(length=3)
   private String medicoJaReceitouMedicacaoPressao;
 
   @Column(length=3)
   private String estaUsandoRemedioPraBaixarPressao;
 
   @Column(length=5)
   private String jaFezExameSangueColesterol;
 
   @Column(length=30)
   private String ultimaVezExameColesterol;
 
   @Column(length=5)
   private String alguemDisseColesterolAlto;
 
   @Column(length=5)
   private String jaFezExameMedirAcucarSangue;
 
   @Column(length=5)
   private String alguemDisseDiabetes;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="historicoClinico", targetEntity=Diabetes.class, fetch=FetchType.EAGER)
   private Diabetes diabetes;
 
   @Column(length=5)
   private String jaFezCirurgia;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="historicoClinico", targetEntity=Cirurgias.class, fetch=FetchType.EAGER)
   private Cirurgias cirurgias;
 
   @Column(length=5)
   private String alguemDisseCancer;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="historicoClinico", targetEntity=Cancer.class, fetch=FetchType.EAGER)
   private Cancer cancer;
 
   @Column(length=5)
   private String jaFezTratamentoRadiologicoPelvico;
 
   @Column(length=1)
   private String jaApresentouProblemaInfeccaoHPV;
 
   @Column(length=1)
   private String jaApresentouProblemaCorrimento;
 
   @Column(length=1)
   private String jaApresentouProblemaPrurido;
 
   @Column(length=1)
   private String jaApresentouProblemaArdencia;
 
   @Column(length=1)
   private String jaApresentouProblemaNSNR;
 
   @Column(length=1)
   private String jaApresentouProblemaClamidia;
 
   @Column(length=1)
   private String jaApresentouProblemaCandidiase;
 
   @Column(length=1)
   private String jaApresentouProblemaGonorreia;
 
   @Column(length=1)
   private String jaApresentouProblemaSifilis;
 
   @Column(length=60)
   private String jaApresentouProblemasOutros;
 
   @Column(length=1)
   private String jaTeveInfeccaoClamidia;
 
   @Column(length=1)
   private String jaTeveInfeccaoCandidiase;
 
   @Column(length=1)
   private String jaTeveInfeccaoGonorreia;
 
   @Column(length=1)
   private String jaTeveInfeccaoSifilis;
 
   @Column(length=1)
   private String jaTeveInfeccaoNSNR;
 
   @Column(length=60)
   private String jaTeveInfeccaoOutros;
 
   @Column(length=30)
   private String frequenciaPreventivoDepoisPrimeiraVez;
 
   @Column(length=3)
   private Integer quantidadePreventivosUltimos12meses;
   private String ultimoExamePreventivoFezPara;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.MERGE}, fetch=FetchType.LAZY)
   private Formulario formulario;
 
   @Column(length=1)
   private String jaTeveDoencaDorNasCostas;
 
   @Column(length=1)
   private String jaTeveDoencaArtriteReumatismo;
 
   @Column(length=1)
   private String jaTeveDoencaTendiniteLer;
 
   @Column(length=1)
   private String jaTeveDoencaAtaqueCoracao;
 
   @Column(length=1)
   private String jaTeveDoencaAngina;
 
   @Column(length=1)
   private String jaTeveDoencaInsuficienciaCardiaca;
 
   @Column(length=1)
   private String jaTeveDoencaDerrame;
 
   @Column(length=1)
   private String jaTeveDoencaDengue;
 
   @Column(length=1)
   private String jaTeveDoencaDepressao;
 
   @Column(length=1)
   private String jaTeveDoencaEnfisema;
 
   @Column(length=1)
   private String jaTeveDoencaAsma;
 
   @Column(length=1)
   private String jaTeveDoencaCirroseFigado;
 
   @Column(length=1)
   private String jaTeveDoencaHepatite;
 
   @Column(length=1)
   private String jaTeveDoencaTuberculose;
 
   @Column(length=1)
   private String jaTeveDoencaMalaria;
 
   @Column(length=1)
   private String jaTeveDoencaHanseniase;
 
   @Column(length=1)
   private String jaTeveDoencaAids;
 
   @Column(length=50)
   private String jaTeveDoencaOutra;
   
   @OneToOne (cascade=CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="historicoClinico", targetEntity=Imunossupressoras.class)
   private Imunossupressoras imunossupressoras;
   
   @OneToOne (cascade=CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="historicoClinico", targetEntity=MedicacaoUsoContinuo.class)
   private MedicacaoUsoContinuo medicacaoUsoContinuo;
   
   
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public String getAltura() {
     return this.altura;
   }
   public void setAltura(String altura) {
     this.altura = altura;
   }
   public String getPeso() {
     return this.peso;
   }
   public void setPeso(String peso) {
     this.peso = peso;
   }
   public String getFrequenciaGinecologista() {
     return this.frequenciaGinecologista;
   }
   public void setFrequenciaGinecologista(String frequenciaGinecologista) {
     this.frequenciaGinecologista = frequenciaGinecologista;
   }
   public String getUltimoPreventivo() {
     return this.ultimoPreventivo;
   }
   public void setUltimoPreventivo(String ultimoPreventivo) {
     this.ultimoPreventivo = ultimoPreventivo;
   }
   public String getContraceptivoAtualAdesivo() {
     return this.contraceptivoAtualAdesivo;
   }
   public void setContraceptivoAtualAdesivo(String contraceptivoAtualAdesivo) {
     this.contraceptivoAtualAdesivo = contraceptivoAtualAdesivo;
   }
   public String getContraceptivoAtualAnelVaginal() {
     return this.contraceptivoAtualAnelVaginal;
   }
 
   public void setContraceptivoAtualAnelVaginal(String contraceptivoAtualAnelVaginal) {
     this.contraceptivoAtualAnelVaginal = contraceptivoAtualAnelVaginal;
   }
   public String getContraceptivoAtualCamisinhaFeminina() {
     return this.contraceptivoAtualCamisinhaFeminina;
   }
 
   public void setContraceptivoAtualCamisinhaFeminina(String contraceptivoAtualCamisinhaFeminina) {
     this.contraceptivoAtualCamisinhaFeminina = contraceptivoAtualCamisinhaFeminina;
   }
   public String getContraceptivoAtualCoitoInterrompido() {
     return this.contraceptivoAtualCoitoInterrompido;
   }
 
   public void setContraceptivoAtualCoitoInterrompido(String contraceptivoAtualCoitoInterrompido) {
     this.contraceptivoAtualCoitoInterrompido = contraceptivoAtualCoitoInterrompido;
   }
   public String getContraceptivoAtualDiafragma() {
     return this.contraceptivoAtualDiafragma;
   }
   public void setContraceptivoAtualDiafragma(String contraceptivoAtualDiafragma) {
     this.contraceptivoAtualDiafragma = contraceptivoAtualDiafragma;
   }
   public String getContraceptivoAtualDIU() {
     return this.contraceptivoAtualDIU;
   }
   public void setContraceptivoAtualDIU(String contraceptivoAtualDIU) {
     this.contraceptivoAtualDIU = contraceptivoAtualDIU;
   }
   public String getContraceptivoAtualEspermaticida() {
     return this.contraceptivoAtualEspermaticida;
   }
 
   public void setContraceptivoAtualEspermaticida(String contraceptivoAtualEspermaticida) {
     this.contraceptivoAtualEspermaticida = contraceptivoAtualEspermaticida;
   }
   public String getContraceptivoAtualImplante() {
     return this.contraceptivoAtualImplante;
   }
   public void setContraceptivoAtualImplante(String contraceptivoAtualImplante) {
     this.contraceptivoAtualImplante = contraceptivoAtualImplante;
   }
   public String getContraceptivoAtualInjecao() {
     return this.contraceptivoAtualInjecao;
   }
   public void setContraceptivoAtualInjecao(String contraceptivoAtualInjecao) {
     this.contraceptivoAtualInjecao = contraceptivoAtualInjecao;
   }
   public String getContraceptivoAtualLigaduraTrompa() {
     return this.contraceptivoAtualLigaduraTrompa;
   }
 
   public void setContraceptivoAtualLigaduraTrompa(String contraceptivoAtualLigaduraTrompa) {
     this.contraceptivoAtualLigaduraTrompa = contraceptivoAtualLigaduraTrompa;
   }
   public String getContraceptivoAtualMetodoMuco() {
     return this.contraceptivoAtualMetodoMuco;
   }
   public void setContraceptivoAtualMetodoMuco(String contraceptivoAtualMetodoMuco) {
     this.contraceptivoAtualMetodoMuco = contraceptivoAtualMetodoMuco;
   }
   public String getContraceptivoAtualNaoUsa() {
     return this.contraceptivoAtualNaoUsa;
   }
   public void setContraceptivoAtualNaoUsa(String contraceptivoAtualNaoUsa) {
     this.contraceptivoAtualNaoUsa = contraceptivoAtualNaoUsa;
   }
   public String getContraceptivoAtualOutro() {
     return this.contraceptivoAtualOutro;
   }
   public void setContraceptivoAtualOutro(String contraceptivoAtualOutro) {
     this.contraceptivoAtualOutro = contraceptivoAtualOutro;
   }
   public String getContraceptivoAtualPilulaDiaSeguinte() {
     return this.contraceptivoAtualPilulaDiaSeguinte;
   }
 
   public void setContraceptivoAtualPilulaDiaSeguinte(String contraceptivoAtualPilulaDiaSeguinte) {
     this.contraceptivoAtualPilulaDiaSeguinte = contraceptivoAtualPilulaDiaSeguinte;
   }
   public String getContraceptivoAtualPreservativoMasculino() {
     return this.contraceptivoAtualPreservativoMasculino;
   }
 
   public void setContraceptivoAtualPreservativoMasculino(String contraceptivoAtualPreservativoMasculino) {
     this.contraceptivoAtualPreservativoMasculino = contraceptivoAtualPreservativoMasculino;
   }
   public String getContraceptivoAtualTabelinha() {
     return this.contraceptivoAtualTabelinha;
   }
   public void setContraceptivoAtualTabelinha(String contraceptivoAtualTabelinha) {
     this.contraceptivoAtualTabelinha = contraceptivoAtualTabelinha;
   }
   public String getContraceptivoAtualVasectomiaParceiro() {
     return this.contraceptivoAtualVasectomiaParceiro;
   }
 
   public void setContraceptivoAtualVasectomiaParceiro(String contraceptivoAtualVasectomiaParceiro) {
     this.contraceptivoAtualVasectomiaParceiro = contraceptivoAtualVasectomiaParceiro;
   }
   public String getQuantoTempoUsaContraceptivo() {
     return this.quantoTempoUsaContraceptivo;
   }
   public void setQuantoTempoUsaContraceptivo(String quantoTempoUsaContraceptivo) {
     this.quantoTempoUsaContraceptivo = quantoTempoUsaContraceptivo;
   }
   public String getJaFezPapaNicolau() {
     return this.jaFezPapaNicolau;
   }
   public void setJaFezPapaNicolau(String jaFezPapaNicolau) {
     this.jaFezPapaNicolau = jaFezPapaNicolau;
   }
   public String getUsaMedicacaoMenorPausa() {
     return this.usaMedicacaoMenorPausa;
   }
   public void setUsaMedicacaoMenorPausa(String usaMedicacaoMenorPausa) {
     this.usaMedicacaoMenorPausa = usaMedicacaoMenorPausa;
   }
   public MedicacaoMenorPausa getMedicacaoMenorPausa() {
     return this.medicacaoMenorPausa;
   }
   public void setMedicacaoMenorPausa(MedicacaoMenorPausa medicacaoMenorPausa) {
     this.medicacaoMenorPausa = medicacaoMenorPausa;
   }
   public String getJaRecebeuTransfusaoSanguinea() {
     return this.jaRecebeuTransfusaoSanguinea;
   }
   public void setJaRecebeuTransfusaoSanguinea(String jaRecebeuTransfusaoSanguinea) {
     this.jaRecebeuTransfusaoSanguinea = jaRecebeuTransfusaoSanguinea;
   }
   public String getTemDoencaCronica() {
     return this.temDoencaCronica;
   }
   public void setTemDoencaCronica(String temDoencaCronica) {
     this.temDoencaCronica = temDoencaCronica;
   }
   public String getDoencaCronica() {
     return this.doencaCronica;
   }
   public void setDoencaCronica(String doencaCronica) {
     this.doencaCronica = doencaCronica;
   }
   public String getUsaMedicacaoUsoContinuo() {
     return this.usaMedicacaoUsoContinuo;
   }
   public void setUsaMedicacaoUsoContinuo(String usaMedicacaoUsoContinuo) {
     this.usaMedicacaoUsoContinuo = usaMedicacaoUsoContinuo;
   }
   public List<MedicacaoUsoContinuo> getMedicacoesUsoContinuo() {
     return this.medicacoesUsoContinuo;
   }
 
   public void setMedicacoesUsoContinuo(List<MedicacaoUsoContinuo> medicacoesUsoContinuo) {
     this.medicacoesUsoContinuo = medicacoesUsoContinuo;
   }
   public String getAlgumMalEstar() {
     return this.algumMalEstar;
   }
   public void setAlgumMalEstar(String algumMalEstar) {
     this.algumMalEstar = algumMalEstar;
   }
   public MalEstar getMalEstar() {
     return this.malEstar;
   }
   public void setMalEstar(MalEstar malEstar) {
     this.malEstar = malEstar;
   }
   public String getTemPressaoAlta() {
     return this.temPressaoAlta;
   }
   public void setTemPressaoAlta(String temPressaoAlta) {
     this.temPressaoAlta = temPressaoAlta;
   }
   public String getMedicoJaReceitouMedicacaoPressao() {
     return this.medicoJaReceitouMedicacaoPressao;
   }
 
   public void setMedicoJaReceitouMedicacaoPressao(String medicoJaReceitouMedicacaoPressao) {
     this.medicoJaReceitouMedicacaoPressao = medicoJaReceitouMedicacaoPressao;
   }
   public String getEstaUsandoRemedioPraBaixarPressao() {
     return this.estaUsandoRemedioPraBaixarPressao;
   }
 
   public void setEstaUsandoRemedioPraBaixarPressao(String estaUsandoRemedioPraBaixarPressao) {
     this.estaUsandoRemedioPraBaixarPressao = estaUsandoRemedioPraBaixarPressao;
   }
   public String getJaFezExameSangueColesterol() {
     return this.jaFezExameSangueColesterol;
   }
   public void setJaFezExameSangueColesterol(String jaFezExameSangueColesterol) {
     this.jaFezExameSangueColesterol = jaFezExameSangueColesterol;
   }
   public String getUltimaVezExameColesterol() {
     return this.ultimaVezExameColesterol;
   }
   public void setUltimaVezExameColesterol(String ultimaVezExameColesterol) {
     this.ultimaVezExameColesterol = ultimaVezExameColesterol;
   }
   public String getAlguemDisseColesterolAlto() {
     return this.alguemDisseColesterolAlto;
   }
   public void setAlguemDisseColesterolAlto(String alguemDisseColesterolAlto) {
     this.alguemDisseColesterolAlto = alguemDisseColesterolAlto;
   }
   public String getJaFezExameMedirAcucarSangue() {
     return this.jaFezExameMedirAcucarSangue;
   }
   public void setJaFezExameMedirAcucarSangue(String jaFezExameMedirAcucarSangue) {
     this.jaFezExameMedirAcucarSangue = jaFezExameMedirAcucarSangue;
   }
   public String getAlguemDisseDiabetes() {
     return this.alguemDisseDiabetes;
   }
   public void setAlguemDisseDiabetes(String alguemDisseDiabetes) {
     this.alguemDisseDiabetes = alguemDisseDiabetes;
   }
   public Diabetes getDiabetes() {
     return this.diabetes;
   }
   public void setDiabetes(Diabetes diabetes) {
     this.diabetes = diabetes;
   }
   public String getJaFezCirurgia() {
     return this.jaFezCirurgia;
   }
   public void setJaFezCirurgia(String jaFezCirurgia) {
     this.jaFezCirurgia = jaFezCirurgia;
   }
   public Cirurgias getCirurgias() {
     return this.cirurgias;
   }
   public void setCirurgias(Cirurgias cirurgias) {
     this.cirurgias = cirurgias;
   }
   public String getAlguemDisseCancer() {
     return this.alguemDisseCancer;
   }
   public void setAlguemDisseCancer(String alguemDisseCancer) {
     this.alguemDisseCancer = alguemDisseCancer;
   }
   public Cancer getCancer() {
     return this.cancer;
   }
   public void setCancer(Cancer cancer) {
     this.cancer = cancer;
   }
   public String getJaFezTratamentoRadiologicoPelvico() {
     return this.jaFezTratamentoRadiologicoPelvico;
   }
 
   public void setJaFezTratamentoRadiologicoPelvico(String jaFezTratamentoRadiologicoPelvico) {
     this.jaFezTratamentoRadiologicoPelvico = jaFezTratamentoRadiologicoPelvico;
   }
   public String getJaApresentouProblemaInfeccaoHPV() {
     return this.jaApresentouProblemaInfeccaoHPV;
   }
 
   public void setJaApresentouProblemaInfeccaoHPV(String jaApresentouProblemaInfeccaoHPV) {
     this.jaApresentouProblemaInfeccaoHPV = jaApresentouProblemaInfeccaoHPV;
   }
   public String getJaApresentouProblemaCorrimento() {
     return this.jaApresentouProblemaCorrimento;
   }
 
   public void setJaApresentouProblemaCorrimento(String jaApresentouProblemaCorrimento) {
     this.jaApresentouProblemaCorrimento = jaApresentouProblemaCorrimento;
   }
   public String getJaApresentouProblemaPrurido() {
     return this.jaApresentouProblemaPrurido;
   }
   public void setJaApresentouProblemaPrurido(String jaApresentouProblemaPrurido) {
     this.jaApresentouProblemaPrurido = jaApresentouProblemaPrurido;
   }
   public String getJaApresentouProblemaArdencia() {
     return this.jaApresentouProblemaArdencia;
   }
   public void setJaApresentouProblemaArdencia(String jaApresentouProblemaArdencia) {
     this.jaApresentouProblemaArdencia = jaApresentouProblemaArdencia;
   }
   public String getJaApresentouProblemaNSNR() {
     return this.jaApresentouProblemaNSNR;
   }
   public void setJaApresentouProblemaNSNR(String jaApresentouProblemaNSNR) {
     this.jaApresentouProblemaNSNR = jaApresentouProblemaNSNR;
   }
   public String getJaApresentouProblemasOutros() {
     return this.jaApresentouProblemasOutros;
   }
   public void setJaApresentouProblemasOutros(String jaApresentouProblemasOutros) {
     this.jaApresentouProblemasOutros = jaApresentouProblemasOutros;
   }
   public String getJaTeveInfeccaoClamidia() {
     return this.jaTeveInfeccaoClamidia;
   }
   public void setJaTeveInfeccaoClamidia(String jaTeveInfeccaoClamidia) {
     this.jaTeveInfeccaoClamidia = jaTeveInfeccaoClamidia;
   }
   public String getJaTeveInfeccaoCandidiase() {
     return this.jaTeveInfeccaoCandidiase;
   }
   public void setJaTeveInfeccaoCandidiase(String jaTeveInfeccaoCandidiase) {
     this.jaTeveInfeccaoCandidiase = jaTeveInfeccaoCandidiase;
   }
   public String getJaTeveInfeccaoGonorreia() {
     return this.jaTeveInfeccaoGonorreia;
   }
   public void setJaTeveInfeccaoGonorreia(String jaTeveInfeccaoGonorreia) {
     this.jaTeveInfeccaoGonorreia = jaTeveInfeccaoGonorreia;
   }
   public String getJaTeveInfeccaoSifilis() {
     return this.jaTeveInfeccaoSifilis;
   }
   public void setJaTeveInfeccaoSifilis(String jaTeveInfeccaoSifilis) {
     this.jaTeveInfeccaoSifilis = jaTeveInfeccaoSifilis;
   }
   public String getJaTeveInfeccaoNSNR() {
     return this.jaTeveInfeccaoNSNR;
   }
   public void setJaTeveInfeccaoNSNR(String jaTeveInfeccaoNSNR) {
     this.jaTeveInfeccaoNSNR = jaTeveInfeccaoNSNR;
   }
   public String getJaTeveInfeccaoOutros() {
     return this.jaTeveInfeccaoOutros;
   }
   public void setJaTeveInfeccaoOutros(String jaTeveInfeccaoOutros) {
     this.jaTeveInfeccaoOutros = jaTeveInfeccaoOutros;
   }
   public String getFrequenciaPreventivoDepoisPrimeiraVez() {
     return this.frequenciaPreventivoDepoisPrimeiraVez;
   }
 
   public void setFrequenciaPreventivoDepoisPrimeiraVez(String frequenciaPreventivoDepoisPrimeiraVez) {
     this.frequenciaPreventivoDepoisPrimeiraVez = frequenciaPreventivoDepoisPrimeiraVez;
   }
   public Integer getQuantidadePreventivosUltimos12meses() {
     return this.quantidadePreventivosUltimos12meses;
   }
 
   public void setQuantidadePreventivosUltimos12meses(Integer quantidadePreventivosUltimos12meses) {
     this.quantidadePreventivosUltimos12meses = quantidadePreventivosUltimos12meses;
   }
   public String getUltimoExamePreventivoFezPara() {
     return this.ultimoExamePreventivoFezPara;
   }
   public void setUltimoExamePreventivoFezPara(String ultimoExamePreventivoFezPara) {
     this.ultimoExamePreventivoFezPara = ultimoExamePreventivoFezPara;
   }
   public Formulario getFormulario() {
     return this.formulario;
   }
   public void setFormulario(Formulario formulario) {
     this.formulario = formulario;
   }
   public String getJaRecebeuTransplante() {
     return this.jaRecebeuTransplante;
   }
   public void setJaRecebeuTransplante(String jaRecebeuTransplante) {
     this.jaRecebeuTransplante = jaRecebeuTransplante;
   }
   public String getResultadoExamePapaNicolau() {
     return this.resultadoExamePapaNicolau;
   }
   public void setResultadoExamePapaNicolau(String resultadoExamePapaNicolau) {
     this.resultadoExamePapaNicolau = resultadoExamePapaNicolau;
   }
   public String getEstaNaMenoPausa() {
     return this.estaNaMenoPausa;
   }
   public void setEstaNaMenoPausa(String estaNaMenorPausa) {
     this.estaNaMenoPausa = estaNaMenorPausa;
   }
   public String getUsaMedicacaoImunossupressora() {
     return this.usaMedicacaoImunossupressora;
   }
   public void setUsaMedicacaoImunossupressora(String usaMedicacaoImunossupressora) {
     this.usaMedicacaoImunossupressora = usaMedicacaoImunossupressora;
   }
   public String getUsaMedicacaoAntibiotico() {
     return this.usaMedicacaoAntibiotico;
   }
   public void setUsaMedicacaoAntibiotico(String usaMedicacaoAntibiotico) {
     this.usaMedicacaoAntibiotico = usaMedicacaoAntibiotico;
   }
   public String getUsaMedicacaoCardiovascular() {
     return this.usaMedicacaoCardiovascular;
   }
   public void setUsaMedicacaoCardiovascular(String usaMedicacaoCardiovascular) {
     this.usaMedicacaoCardiovascular = usaMedicacaoCardiovascular;
   }
   public String getUsaMedicacaoPsicotropico() {
     return this.usaMedicacaoPsicotropico;
   }
   public void setUsaMedicacaoPsicotropico(String usaMedicacaoPsicotropico) {
     this.usaMedicacaoPsicotropico = usaMedicacaoPsicotropico;
   }
   public String getUsaMedicacaoNSNR() {
     return this.usaMedicacaoNSNR;
   }
   public void setUsaMedicacaoNSNR(String usaMedicacaoNSNR) {
     this.usaMedicacaoNSNR = usaMedicacaoNSNR;
   }
   public String getJaApresentouProblemaClamidia() {
     return this.jaApresentouProblemaClamidia;
   }
   public void setJaApresentouProblemaClamidia(String jaApresentouProblemaClamidia) {
     this.jaApresentouProblemaClamidia = jaApresentouProblemaClamidia;
   }
   public String getJaApresentouProblemaCandidiase() {
     return this.jaApresentouProblemaCandidiase;
   }
 
   public void setJaApresentouProblemaCandidiase(String jaApresentouProblemaCandidiase) {
     this.jaApresentouProblemaCandidiase = jaApresentouProblemaCandidiase;
   }
   public String getJaApresentouProblemaGonorreia() {
     return this.jaApresentouProblemaGonorreia;
   }
 
   public void setJaApresentouProblemaGonorreia(String jaApresentouProblemaGonorreia) {
     this.jaApresentouProblemaGonorreia = jaApresentouProblemaGonorreia;
   }
   public String getJaApresentouProblemaSifilis() {
     return this.jaApresentouProblemaSifilis;
   }
   public void setJaApresentouProblemaSifilis(String jaApresentouProblemaSifilis) {
     this.jaApresentouProblemaSifilis = jaApresentouProblemaSifilis;
   }
   public String getJaTeveDoencaDorNasCostas() {
     return this.jaTeveDoencaDorNasCostas;
   }
   public void setJaTeveDoencaDorNasCostas(String jaTeveDoencaDorNasCostas) {
     this.jaTeveDoencaDorNasCostas = jaTeveDoencaDorNasCostas;
   }
   public String getJaTeveDoencaArtriteReumatismo() {
     return this.jaTeveDoencaArtriteReumatismo;
   }
 
   public void setJaTeveDoencaArtriteReumatismo(String jaTeveDoencaArtriteReumatismo) {
     this.jaTeveDoencaArtriteReumatismo = jaTeveDoencaArtriteReumatismo;
   }
   public String getJaTeveDoencaTendiniteLer() {
     return this.jaTeveDoencaTendiniteLer;
   }
   public void setJaTeveDoencaTendiniteLer(String jaTeveDoencaTendiniteLer) {
     this.jaTeveDoencaTendiniteLer = jaTeveDoencaTendiniteLer;
   }
   public String getJaTeveDoencaAtaqueCoracao() {
     return this.jaTeveDoencaAtaqueCoracao;
   }
   public void setJaTeveDoencaAtaqueCoracao(String jaTeveDoencaAtaqueCoracao) {
     this.jaTeveDoencaAtaqueCoracao = jaTeveDoencaAtaqueCoracao;
   }
   public String getJaTeveDoencaAngina() {
     return this.jaTeveDoencaAngina;
   }
   public void setJaTeveDoencaAngina(String jaTeveDoencaAngina) {
     this.jaTeveDoencaAngina = jaTeveDoencaAngina;
   }
   public String getJaTeveDoencaInsuficienciaCardiaca() {
     return this.jaTeveDoencaInsuficienciaCardiaca;
   }
 
   public void setJaTeveDoencaInsuficienciaCardiaca(String jaTeveDoencaInsuficienciaCardiaca) {
     this.jaTeveDoencaInsuficienciaCardiaca = jaTeveDoencaInsuficienciaCardiaca;
   }
   public String getJaTeveDoencaDerrame() {
     return this.jaTeveDoencaDerrame;
   }
   public void setJaTeveDoencaDerrame(String jaTeveDoencaDerrame) {
     this.jaTeveDoencaDerrame = jaTeveDoencaDerrame;
   }
   public String getJaTeveDoencaDengue() {
     return this.jaTeveDoencaDengue;
   }
   public void setJaTeveDoencaDengue(String jaTeveDoencaDengue) {
     this.jaTeveDoencaDengue = jaTeveDoencaDengue;
   }
   public String getJaTeveDoencaDepressao() {
     return this.jaTeveDoencaDepressao;
   }
   public void setJaTeveDoencaDepressao(String jaTeveDoencaDepressao) {
     this.jaTeveDoencaDepressao = jaTeveDoencaDepressao;
   }
   public String getJaTeveDoencaEnfisema() {
     return this.jaTeveDoencaEnfisema;
   }
   public void setJaTeveDoencaEnfisema(String jaTeveDoencaEnfisema) {
     this.jaTeveDoencaEnfisema = jaTeveDoencaEnfisema;
   }
   public String getJaTeveDoencaAsma() {
     return this.jaTeveDoencaAsma;
   }
   public void setJaTeveDoencaAsma(String jaTeveDoencaAsma) {
     this.jaTeveDoencaAsma = jaTeveDoencaAsma;
   }
   public String getJaTeveDoencaCirroseFigado() {
     return this.jaTeveDoencaCirroseFigado;
   }
   public void setJaTeveDoencaCirroseFigado(String jaTeveDoencaCirroseFigado) {
     this.jaTeveDoencaCirroseFigado = jaTeveDoencaCirroseFigado;
   }
   public String getJaTeveDoencaHepatite() {
     return this.jaTeveDoencaHepatite;
   }
   public void setJaTeveDoencaHepatite(String jaTeveDoencaHepatite) {
     this.jaTeveDoencaHepatite = jaTeveDoencaHepatite;
   }
   public String getJaTeveDoencaTuberculose() {
     return this.jaTeveDoencaTuberculose;
   }
   public void setJaTeveDoencaTuberculose(String jaTeveDoencaTuberculose) {
     this.jaTeveDoencaTuberculose = jaTeveDoencaTuberculose;
   }
   public String getJaTeveDoencaMalaria() {
     return this.jaTeveDoencaMalaria;
   }
   public void setJaTeveDoencaMalaria(String jaTeveDoencaMalaria) {
     this.jaTeveDoencaMalaria = jaTeveDoencaMalaria;
   }
   public String getJaTeveDoencaHanseniase() {
     return this.jaTeveDoencaHanseniase;
   }
   public void setJaTeveDoencaHanseniase(String jaTeveDoencaHanseniase) {
     this.jaTeveDoencaHanseniase = jaTeveDoencaHanseniase;
   }
   public String getJaTeveDoencaAids() {
     return this.jaTeveDoencaAids;
   }
   public void setJaTeveDoencaAids(String jaTeveDoencaAids) {
     this.jaTeveDoencaAids = jaTeveDoencaAids;
   }
   public String getJaTeveDoencaOutra() {
     return this.jaTeveDoencaOutra;
   }
   public void setJaTeveDoencaOutra(String jaTeveDoencaOutra) {
     this.jaTeveDoencaOutra = jaTeveDoencaOutra;
   }
public Imunossupressoras getImunossupressoras() {
	return imunossupressoras;
}
public void setImunossupressoras(Imunossupressoras imunossupressoras) {
	this.imunossupressoras = imunossupressoras;
}
public MedicacaoUsoContinuo getMedicacaoUsoContinuo() {
	return medicacaoUsoContinuo;
}
public void setMedicacaoUsoContinuo(MedicacaoUsoContinuo medicacaoUsoContinuo) {
	this.medicacaoUsoContinuo = medicacaoUsoContinuo;
}
public String getContraceptivoAtualPilula() {
	return contraceptivoAtualPilula;
}
public void setContraceptivoAtualPilula(String contraceptivoAtualPilula) {
	this.contraceptivoAtualPilula = contraceptivoAtualPilula;
}
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.HistoricoClinico
 * JD-Core Version:    0.6.0
 */