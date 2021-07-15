 package br.com.lika.hpv.model.formulario.util;
 
 import br.com.lika.hpv.model.formulario.SituacaoSocioEconomicaDemografica;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class Radiacoes
 {
 
   @Id
   @GeneratedValue
   private Long id;
   private Character raioX;
   private Character solar;
   private Character ns_nr;
 
   @Column(length=30)
   private String outros;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.REFRESH})
   private SituacaoSocioEconomicaDemografica situacaoSocioEconomicaDemografica;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public Character getRaioX() {
     return this.raioX;
   }
   public void setRaioX(Character raioX) {
     this.raioX = raioX;
   }
   public Character getSolar() {
     return this.solar;
   }
   public void setSolar(Character solar) {
     this.solar = solar;
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
   public SituacaoSocioEconomicaDemografica getSituacaoSocioEconomicaDemografica() {
     return this.situacaoSocioEconomicaDemografica;
   }
 
   public void setSituacaoSocioEconomicaDemografica(SituacaoSocioEconomicaDemografica situacaoSocioEconomicaDemografica) {
     this.situacaoSocioEconomicaDemografica = situacaoSocioEconomicaDemografica;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.Radiacoes
 * JD-Core Version:    0.6.0
 */