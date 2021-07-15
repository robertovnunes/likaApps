 package br.com.lika.hpv.model.formulario.util;
 
 import br.com.lika.hpv.model.formulario.Tabagismo;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class Fumo
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=50)
   private String quantoTempoFuma;
   private Character cigarroPalha;
   private Character cigarroComFiltro;
   private Character cigarroSemFiltro;
   private Character cigarroCharuto;
   private Character cigarroCachimbo;
   private Character cigarroIndiano;
 
   @Column(length=20)
   private String quantidadeCigarrosPorDia;
 
   @Column(length=30)
   private String primeiroCigarroDepoisAcordar;
   private Character jaParouFumarPeloMenosUmDia;
 
   @Column(length=35)
   private String ultimaVezTentouPararFumar;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.MERGE}, fetch=FetchType.LAZY)
   private Tabagismo tabagismo;
 
   @Column(length=20)
   private String tipoQuantidadeFumavaDia;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public String getQuantoTempoFuma() {
     return this.quantoTempoFuma;
   }
   public void setQuantoTempoFuma(String quantoTempoFuma) {
     this.quantoTempoFuma = quantoTempoFuma;
   }
   public Character getCigarroPalha() {
     return this.cigarroPalha;
   }
   public void setCigarroPalha(Character cigarroPalha) {
     this.cigarroPalha = cigarroPalha;
   }
   public Character getCigarroComFiltro() {
     return this.cigarroComFiltro;
   }
   public void setCigarroComFiltro(Character cigarroComFiltro) {
     this.cigarroComFiltro = cigarroComFiltro;
   }
   public Character getCigarroSemFiltro() {
     return this.cigarroSemFiltro;
   }
   public void setCigarroSemFiltro(Character cigarroSemFiltro) {
     this.cigarroSemFiltro = cigarroSemFiltro;
   }
   public Character getCigarroCharuto() {
     return this.cigarroCharuto;
   }
   public void setCigarroCharuto(Character cigarroCharuto) {
     this.cigarroCharuto = cigarroCharuto;
   }
   public Character getCigarroCachimbo() {
     return this.cigarroCachimbo;
   }
   public void setCigarroCachimbo(Character cigarroCachimbo) {
     this.cigarroCachimbo = cigarroCachimbo;
   }
   public Character getCigarroIndiano() {
     return this.cigarroIndiano;
   }
   public void setCigarroIndiano(Character cigarroIndiano) {
     this.cigarroIndiano = cigarroIndiano;
   }
   public String getQuantidadeCigarrosPorDia() {
     return this.quantidadeCigarrosPorDia;
   }
   public void setQuantidadeCigarrosPorDia(String quantidadeCigarrosPorDia) {
     this.quantidadeCigarrosPorDia = quantidadeCigarrosPorDia;
   }
   public String getPrimeiroCigarroDepoisAcordar() {
     return this.primeiroCigarroDepoisAcordar;
   }
   public void setPrimeiroCigarroDepoisAcordar(String primeiroCigarroDepoisAcordar) {
     this.primeiroCigarroDepoisAcordar = primeiroCigarroDepoisAcordar;
   }
   public Character getJaParouFumarPeloMenosUmDia() {
     return this.jaParouFumarPeloMenosUmDia;
   }
   public void setJaParouFumarPeloMenosUmDia(Character jaParouFumarPeloMenosUmDia) {
     this.jaParouFumarPeloMenosUmDia = jaParouFumarPeloMenosUmDia;
   }
   public String getUltimaVezTentouPararFumar() {
     return this.ultimaVezTentouPararFumar;
   }
   public void setUltimaVezTentouPararFumar(String ultimaVezTentouPararFumar) {
     this.ultimaVezTentouPararFumar = ultimaVezTentouPararFumar;
   }
   public Tabagismo getTabagismo() {
     return this.tabagismo;
   }
   public void setTabagismo(Tabagismo tabagismo) {
     this.tabagismo = tabagismo;
   }
   public String getTipoQuantidadeFumavaDia() {
     return this.tipoQuantidadeFumavaDia;
   }
   public void setTipoQuantidadeFumavaDia(String tipoQuantidadeFumavaDia) {
     this.tipoQuantidadeFumavaDia = tipoQuantidadeFumavaDia;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.Fumo
 * JD-Core Version:    0.6.0
 */