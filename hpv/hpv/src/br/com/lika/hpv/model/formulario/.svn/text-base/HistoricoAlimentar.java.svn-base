 package br.com.lika.hpv.model.formulario;
 
 import br.com.lika.hpv.model.formulario.util.CarneVermelha;
 import br.com.lika.hpv.model.formulario.util.ConsumoBebidaAlcoolica;
 import br.com.lika.hpv.model.formulario.util.ConsumoBrotoSamambaia;
 import br.com.lika.hpv.model.formulario.util.Fogao;
 import br.com.lika.hpv.model.formulario.util.Frango;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class HistoricoAlimentar
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=8)
   private String consomeBebidasAlcoolicas;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="historicoAlimentar", targetEntity=ConsumoBebidaAlcoolica.class, fetch=FetchType.EAGER)
   private ConsumoBebidaAlcoolica consumoBebidaAlcoolica;
 
   @Column(length=5)
   private String consomeBrotoSamambaia;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="historicoAlimentar", targetEntity=ConsumoBrotoSamambaia.class, fetch=FetchType.EAGER)
   private ConsumoBrotoSamambaia consumoBrotoSamambaia;
 
   @Column(length=7)
   private String usaFogaoLenha;
   private Character temFogaoLenhaCasa;
   private Character costumaQueimarMadeira;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="historicoAlimentar", targetEntity=Fogao.class, fetch=FetchType.EAGER)
   private Fogao fogao;
 
   @Column(length=5)
   private String consomeFrango;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="historicoAlimentar", targetEntity=Frango.class, fetch=FetchType.EAGER)
   private Frango frango;
 
   @Column(length=5)
   private String consomeCarneVermelha;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="historicoAlimentar", targetEntity=CarneVermelha.class, fetch=FetchType.EAGER)
   private CarneVermelha carneVermelha;
   private Character consomePeixe;
   private Integer frequenciaConsomePeixeQuantidade;
 
   @Column(length=9)
   private String frequenciaConsomePeixeTempo;
 
   @Column(length=37)
   private String sal;
 
   @Column(length=3)
   private Integer bifeCarneQuantidade;
 
   @Column(length=10)
   private String bifeCarneTempo;
 
   @Column(length=3)
   private Integer hamburguerQuantidade;
 
   @Column(length=10)
   private String hamburguerTempo;
 
   @Column(length=3)
   private Integer linguicaSalsichaQuantidade;
 
   @Column(length=10)
   private String linguicaSalsichaTempo;
 
   @Column(length=3)
   private Integer porcoQuantidade;
 
   @Column(length=10)
   private String porcoTempo;
 
   @Column(length=3)
   private Integer queijoQuantidade;
 
   @Column(length=10)
   private String queijoTempo;
 
   @Column(length=3)
   private Integer margarinaQuantidade;
 
   @Column(length=10)
   private String margarinaTempo;
 
   @Column(length=3)
   private Integer biscoitoQuantidade;
 
   @Column(length=10)
   private String biscoitoTempo;
 
   @Column(length=3)
   private Integer boloQuantidade;
 
   @Column(length=10)
   private String boloTempo;
 
   @Column(length=3)
   private Integer batataFritaQuantidade;
 
   @Column(length=10)
   private String batataFritaTempo;
 
   @Column(length=3)
   private Integer carnesConservadosSalQuantidade;
 
   @Column(length=10)
   private String carnesConservadosSalTempo;
 
   @Column(length=3)
   private Integer enlatadosQuantidade;
 
   @Column(length=10)
   private String enlatadosTempo;
 
   @Column(length=3)
   private Integer friosQuantidade;
 
   @Column(length=10)
   private String friosTempo;
 
   @Column(length=3)
   private Integer preparadosNaBrasaQuantidade;
 
   @Column(length=10)
   private String preparadosNaBrasaTempo;
 
   @Column(length=3)
   private Integer leiteQuantidade;
 
   @Column(length=10)
   private String leiteTempo;
 
   @Column(length=3)
   private Integer frutasSucosQuantidade;
 
   @Column(length=10)
   private String frutasSucosTempo;
 
   @Column(length=3)
   private Integer batataComumQuantidade;
 
   @Column(length=10)
   private String batataComumTempo;
 
   @Column(length=3)
   private Integer legumesQuantidade;
 
   @Column(length=10)
   private String legumesTempo;
 
   @Column(length=3)
   private Integer hortalicasQuantidade;
 
   @Column(length=10)
   private String hortalicasTempo;
 
   @Column(length=3)
   private Integer feijaoQuantidade;
 
   @Column(length=10)
   private String feijaoTempo;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.MERGE}, fetch=FetchType.LAZY)
   private Formulario formulario;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public String getConsomeBebidasAlcoolicas() {
     return this.consomeBebidasAlcoolicas;
   }
   public void setConsomeBebidasAlcoolicas(String consomeBebidasAlcoolicas) {
     this.consomeBebidasAlcoolicas = consomeBebidasAlcoolicas;
   }
   public ConsumoBebidaAlcoolica getConsumoBebidaAlcoolica() {
     return this.consumoBebidaAlcoolica;
   }
 
   public void setConsumoBebidaAlcoolica(ConsumoBebidaAlcoolica consumoBebidaAlcoolica) {
     this.consumoBebidaAlcoolica = consumoBebidaAlcoolica;
   }
   public String getConsomeBrotoSamambaia() {
     return this.consomeBrotoSamambaia;
   }
   public void setConsomeBrotoSamambaia(String consomeBrotoSamambaia) {
     this.consomeBrotoSamambaia = consomeBrotoSamambaia;
   }
   public ConsumoBrotoSamambaia getConsumoBrotoSamambaia() {
     return this.consumoBrotoSamambaia;
   }
   public void setConsumoBrotoSamambaia(ConsumoBrotoSamambaia consumoBrotoSamambaia) {
     this.consumoBrotoSamambaia = consumoBrotoSamambaia;
   }
   public String getUsaFogaoLenha() {
     return this.usaFogaoLenha;
   }
   public void setUsaFogaoLenha(String usaFogaoLenha) {
     this.usaFogaoLenha = usaFogaoLenha;
   }
   public Character getTemFogaoLenhaCasa() {
     return this.temFogaoLenhaCasa;
   }
   public void setTemFogaoLenhaCasa(Character temFogaoLenhaCasa) {
     this.temFogaoLenhaCasa = temFogaoLenhaCasa;
   }
   public Character getCostumaQueimarMadeira() {
     return this.costumaQueimarMadeira;
   }
   public void setCostumaQueimarMadeira(Character costumaQueimarMadeira) {
     this.costumaQueimarMadeira = costumaQueimarMadeira;
   }
   public Fogao getFogao() {
     return this.fogao;
   }
   public void setFogao(Fogao fogao) {
     this.fogao = fogao;
   }
   public String getConsomeFrango() {
     return this.consomeFrango;
   }
   public void setConsomeFrango(String consomeFrango) {
     this.consomeFrango = consomeFrango;
   }
   public Frango getFrango() {
     return this.frango;
   }
   public void setFrango(Frango frango) {
     this.frango = frango;
   }
   public String getConsomeCarneVermelha() {
     return this.consomeCarneVermelha;
   }
   public void setConsomeCarneVermelha(String consomeCarneVermelha) {
     this.consomeCarneVermelha = consomeCarneVermelha;
   }
   public CarneVermelha getCarneVermelha() {
     return this.carneVermelha;
   }
   public void setCarneVermelha(CarneVermelha carneVermelha) {
     this.carneVermelha = carneVermelha;
   }
   public Character getConsomePeixe() {
     return this.consomePeixe;
   }
   public void setConsomePeixe(Character consomePeixe) {
     this.consomePeixe = consomePeixe;
   }
   public Integer getFrequenciaConsomePeixeQuantidade() {
     return this.frequenciaConsomePeixeQuantidade;
   }
 
   public void setFrequenciaConsomePeixeQuantidade(Integer frequenciaConsomePeixeQuantidade) {
     this.frequenciaConsomePeixeQuantidade = frequenciaConsomePeixeQuantidade;
   }
   public String getFrequenciaConsomePeixeTempo() {
     return this.frequenciaConsomePeixeTempo;
   }
   public void setFrequenciaConsomePeixeTempo(String frequenciaConsomePeixeTempo) {
     this.frequenciaConsomePeixeTempo = frequenciaConsomePeixeTempo;
   }
   public String getSal() {
     return this.sal;
   }
   public void setSal(String sal) {
     this.sal = sal;
   }
   public Integer getBifeCarneQuantidade() {
     return this.bifeCarneQuantidade;
   }
   public void setBifeCarneQuantidade(Integer bifeCarneQuantidade) {
     this.bifeCarneQuantidade = bifeCarneQuantidade;
   }
   public String getBifeCarneTempo() {
     return this.bifeCarneTempo;
   }
   public void setBifeCarneTempo(String bifeCarneTempo) {
     this.bifeCarneTempo = bifeCarneTempo;
   }
   public Integer getHamburguerQuantidade() {
     return this.hamburguerQuantidade;
   }
   public void setHamburguerQuantidade(Integer hamburguerQuantidade) {
     this.hamburguerQuantidade = hamburguerQuantidade;
   }
   public String getHamburguerTempo() {
     return this.hamburguerTempo;
   }
   public void setHamburguerTempo(String hamburguerTempo) {
     this.hamburguerTempo = hamburguerTempo;
   }
   public Integer getLinguicaSalsichaQuantidade() {
     return this.linguicaSalsichaQuantidade;
   }
   public void setLinguicaSalsichaQuantidade(Integer linguicaSalsichaQuantidade) {
     this.linguicaSalsichaQuantidade = linguicaSalsichaQuantidade;
   }
   public String getLinguicaSalsichaTempo() {
     return this.linguicaSalsichaTempo;
   }
   public void setLinguicaSalsichaTempo(String linguicaSalsichaTempo) {
     this.linguicaSalsichaTempo = linguicaSalsichaTempo;
   }
   public Integer getPorcoQuantidade() {
     return this.porcoQuantidade;
   }
   public void setPorcoQuantidade(Integer porcoQuantidade) {
     this.porcoQuantidade = porcoQuantidade;
   }
   public String getPorcoTempo() {
     return this.porcoTempo;
   }
   public void setPorcoTempo(String porcoTempo) {
     this.porcoTempo = porcoTempo;
   }
   public Integer getQueijoQuantidade() {
     return this.queijoQuantidade;
   }
   public void setQueijoQuantidade(Integer queijoQuantidade) {
     this.queijoQuantidade = queijoQuantidade;
   }
   public String getQueijoTempo() {
     return this.queijoTempo;
   }
   public void setQueijoTempo(String queijoTempo) {
     this.queijoTempo = queijoTempo;
   }
   public Integer getMargarinaQuantidade() {
     return this.margarinaQuantidade;
   }
   public void setMargarinaQuantidade(Integer margarinaQuantidade) {
     this.margarinaQuantidade = margarinaQuantidade;
   }
   public String getMargarinaTempo() {
     return this.margarinaTempo;
   }
   public void setMargarinaTempo(String margarinaTempo) {
     this.margarinaTempo = margarinaTempo;
   }
   public Integer getBiscoitoQuantidade() {
     return this.biscoitoQuantidade;
   }
   public void setBiscoitoQuantidade(Integer biscoitoQuantidade) {
     this.biscoitoQuantidade = biscoitoQuantidade;
   }
   public String getBiscoitoTempo() {
     return this.biscoitoTempo;
   }
   public void setBiscoitoTempo(String biscoitoTempo) {
     this.biscoitoTempo = biscoitoTempo;
   }
   public Integer getBoloQuantidade() {
     return this.boloQuantidade;
   }
   public void setBoloQuantidade(Integer boloQuantidade) {
     this.boloQuantidade = boloQuantidade;
   }
   public String getBoloTempo() {
     return this.boloTempo;
   }
   public void setBoloTempo(String boloTempo) {
     this.boloTempo = boloTempo;
   }
   public Integer getBatataFritaQuantidade() {
     return this.batataFritaQuantidade;
   }
   public void setBatataFritaQuantidade(Integer batataFritaQuantidade) {
     this.batataFritaQuantidade = batataFritaQuantidade;
   }
   public String getBatataFritaTempo() {
     return this.batataFritaTempo;
   }
   public void setBatataFritaTempo(String batataFritaTempo) {
     this.batataFritaTempo = batataFritaTempo;
   }
   public Integer getCarnesConservadosSalQuantidade() {
     return this.carnesConservadosSalQuantidade;
   }
 
   public void setCarnesConservadosSalQuantidade(Integer carnesConservadosSalQuantidade) {
     this.carnesConservadosSalQuantidade = carnesConservadosSalQuantidade;
   }
   public String getCarnesConservadosSalTempo() {
     return this.carnesConservadosSalTempo;
   }
   public void setCarnesConservadosSalTempo(String carnesConservadosSalTempo) {
     this.carnesConservadosSalTempo = carnesConservadosSalTempo;
   }
   public Integer getEnlatadosQuantidade() {
     return this.enlatadosQuantidade;
   }
   public void setEnlatadosQuantidade(Integer enlatadosQuantidade) {
     this.enlatadosQuantidade = enlatadosQuantidade;
   }
   public String getEnlatadosTempo() {
     return this.enlatadosTempo;
   }
   public void setEnlatadosTempo(String enlatadosTempo) {
     this.enlatadosTempo = enlatadosTempo;
   }
   public Integer getFriosQuantidade() {
     return this.friosQuantidade;
   }
   public void setFriosQuantidade(Integer friosQuantidade) {
     this.friosQuantidade = friosQuantidade;
   }
   public String getFriosTempo() {
     return this.friosTempo;
   }
   public void setFriosTempo(String friosTempo) {
     this.friosTempo = friosTempo;
   }
   public Integer getPreparadosNaBrasaQuantidade() {
     return this.preparadosNaBrasaQuantidade;
   }
   public void setPreparadosNaBrasaQuantidade(Integer preparadosNaBrasaQuantidade) {
     this.preparadosNaBrasaQuantidade = preparadosNaBrasaQuantidade;
   }
   public String getPreparadosNaBrasaTempo() {
     return this.preparadosNaBrasaTempo;
   }
   public void setPreparadosNaBrasaTempo(String preparadosNaBrasaTempo) {
     this.preparadosNaBrasaTempo = preparadosNaBrasaTempo;
   }
   public Integer getLeiteQuantidade() {
     return this.leiteQuantidade;
   }
   public void setLeiteQuantidade(Integer leiteQuantidade) {
     this.leiteQuantidade = leiteQuantidade;
   }
   public String getLeiteTempo() {
     return this.leiteTempo;
   }
   public void setLeiteTempo(String leiteTempo) {
     this.leiteTempo = leiteTempo;
   }
   public Integer getFrutasSucosQuantidade() {
     return this.frutasSucosQuantidade;
   }
   public void setFrutasSucosQuantidade(Integer frutasSucosQuantidade) {
     this.frutasSucosQuantidade = frutasSucosQuantidade;
   }
   public String getFrutasSucosTempo() {
     return this.frutasSucosTempo;
   }
   public void setFrutasSucosTempo(String frutasSucosTempo) {
     this.frutasSucosTempo = frutasSucosTempo;
   }
   public Integer getBatataComumQuantidade() {
     return this.batataComumQuantidade;
   }
   public void setBatataComumQuantidade(Integer batataComumQuantidade) {
     this.batataComumQuantidade = batataComumQuantidade;
   }
   public String getBatataComumTempo() {
     return this.batataComumTempo;
   }
   public void setBatataComumTempo(String batataComumTempo) {
     this.batataComumTempo = batataComumTempo;
   }
   public Integer getLegumesQuantidade() {
     return this.legumesQuantidade;
   }
   public void setLegumesQuantidade(Integer legumesQuantidade) {
     this.legumesQuantidade = legumesQuantidade;
   }
   public String getLegumesTempo() {
     return this.legumesTempo;
   }
   public void setLegumesTempo(String legumesTempo) {
     this.legumesTempo = legumesTempo;
   }
   public Integer getHortalicasQuantidade() {
     return this.hortalicasQuantidade;
   }
   public void setHortalicasQuantidade(Integer hortalicasQuantidade) {
     this.hortalicasQuantidade = hortalicasQuantidade;
   }
   public String getHortalicasTempo() {
     return this.hortalicasTempo;
   }
   public void setHortalicasTempo(String hortalicasTempo) {
     this.hortalicasTempo = hortalicasTempo;
   }
   public Integer getFeijaoQuantidade() {
     return this.feijaoQuantidade;
   }
   public void setFeijaoQuantidade(Integer feijaoQuantidade) {
     this.feijaoQuantidade = feijaoQuantidade;
   }
   public String getFeijaoTempo() {
     return this.feijaoTempo;
   }
   public void setFeijaoTempo(String feijaoTempo) {
     this.feijaoTempo = feijaoTempo;
   }
   public Formulario getFormulario() {
     return this.formulario;
   }
   public void setFormulario(Formulario formulario) {
     this.formulario = formulario;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.HistoricoAlimentar
 * JD-Core Version:    0.6.0
 */