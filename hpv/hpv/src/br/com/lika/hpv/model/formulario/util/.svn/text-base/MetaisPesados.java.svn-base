 package br.com.lika.hpv.model.formulario.util;
 
 import br.com.lika.hpv.model.formulario.SituacaoSocioEconomicaDemografica;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class MetaisPesados
 {
 
   @Id
   @GeneratedValue
   private Long id;
   private Boolean cromo;
   private Boolean cadmio;
   private Boolean niquel;
   private Boolean mercurio;
   private Boolean chumbo;
   private Boolean ns_nr;
 
   @Column(length=50)
   private String outros;
 
   @OneToOne(cascade={javax.persistence.CascadeType.MERGE, javax.persistence.CascadeType.REFRESH})
   private SituacaoSocioEconomicaDemografica situacaoSocioEconomicaDemografica;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public Boolean getCromo() {
     return this.cromo;
   }
   public void setCromo(Boolean cromo) {
     this.cromo = cromo;
   }
   public Boolean getCadmio() {
     return this.cadmio;
   }
   public void setCadmio(Boolean cadmio) {
     this.cadmio = cadmio;
   }
   public Boolean getNiquel() {
     return this.niquel;
   }
   public void setNiquel(Boolean niquel) {
     this.niquel = niquel;
   }
   public Boolean getMercurio() {
     return this.mercurio;
   }
   public void setMercurio(Boolean mercurio) {
     this.mercurio = mercurio;
   }
   public Boolean getChumbo() {
     return this.chumbo;
   }
   public void setChumbo(Boolean chumbo) {
     this.chumbo = chumbo;
   }
   public Boolean getNs_nr() {
     return this.ns_nr;
   }
   public void setNs_nr(Boolean ns_nr) {
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
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.MetaisPesados
 * JD-Core Version:    0.6.0
 */