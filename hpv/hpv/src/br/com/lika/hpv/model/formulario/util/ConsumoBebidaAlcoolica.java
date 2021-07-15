 package br.com.lika.hpv.model.formulario.util;
 
 import br.com.lika.hpv.model.formulario.HistoricoAlimentar;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class ConsumoBebidaAlcoolica
 {
 
   @Id
   @GeneratedValue
   private Long id;
   private Character aguardente;
   private Character cerveja;
   private Character vinho;
   private Character whisky;
   private Character licor;
   private Character ns_nr;
 
   @Column(length=50)
   private String outros;
 
   @Column(length=3)
   private Integer idadeComecouBeber;
 
   @Column(length=12)
   private String frequencia;
 
   @Column(length=3)
   private String coposPorDia;
 
   @Column(length=3)
   private Integer idadeParou;
 
   @Column(length=2)
   private Integer tempoBebeu;
 
   @Column(length=5)
   private String tratamentoPararBeber;
 
   @OneToOne(cascade={javax.persistence.CascadeType.MERGE, javax.persistence.CascadeType.REFRESH}, fetch=FetchType.LAZY)
   private HistoricoAlimentar historicoAlimentar;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public Character getAguardente() {
     return this.aguardente;
   }
   public void setAguardente(Character aguardente) {
     this.aguardente = aguardente;
   }
   public Character getCerveja() {
     return this.cerveja;
   }
   public void setCerveja(Character cerveja) {
     this.cerveja = cerveja;
   }
   public Character getVinho() {
     return this.vinho;
   }
   public void setVinho(Character vinho) {
     this.vinho = vinho;
   }
   public Character getWhisky() {
     return this.whisky;
   }
   public void setWhisky(Character whisky) {
     this.whisky = whisky;
   }
   public Character getLicor() {
     return this.licor;
   }
   public void setLicor(Character licor) {
     this.licor = licor;
   }
   public Character getNs_nr() {
     return this.ns_nr;
   }
   public void setNs_nr(Character ns_nr) {
     this.ns_nr = ns_nr;
   }
   public String getOutros() {
     return this.outros;
   }
   public void setOutros(String outros) {
     this.outros = outros;
   }
   public Integer getIdadeComecouBeber() {
     return this.idadeComecouBeber;
   }
   public void setIdadeComecouBeber(Integer idadeComecouBeber) {
     this.idadeComecouBeber = idadeComecouBeber;
   }
   public String getFrequencia() {
     return this.frequencia;
   }
   public void setFrequencia(String frequencia) {
     this.frequencia = frequencia;
   }
   public String getCoposPorDia() {
     return this.coposPorDia;
   }
   public void setCoposPorDia(String coposPorDia) {
     this.coposPorDia = coposPorDia;
   }
   public Integer getIdadeParou() {
     return this.idadeParou;
   }
   public void setIdadeParou(Integer idadeParou) {
     this.idadeParou = idadeParou;
   }
   public Integer getTempoBebeu() {
     return this.tempoBebeu;
   }
   public void setTempoBebeu(Integer tempoBebeu) {
     this.tempoBebeu = tempoBebeu;
   }
   public String getTratamentoPararBeber() {
     return this.tratamentoPararBeber;
   }
   public void setTratamentoPararBeber(String tratamentoPararBeber) {
     this.tratamentoPararBeber = tratamentoPararBeber;
   }
   public HistoricoAlimentar getHistoricoAlimentar() {
     return this.historicoAlimentar;
   }
   public void setHistoricoAlimentar(HistoricoAlimentar historicoAlimentar) {
     this.historicoAlimentar = historicoAlimentar;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.ConsumoBebidaAlcoolica
 * JD-Core Version:    0.6.0
 */