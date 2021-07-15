 package br.com.lika.hpv.model.formulario.util;
 
 import br.com.lika.hpv.model.formulario.HistoricoClinico;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class MalEstar
 {
 
   @Id
   @GeneratedValue
   private Long id;
   private Boolean tontura;
   private Boolean fraqueza;
   private Boolean nauseas;
   private Boolean sonolencia;
 
   @Column(length=50)
   private String coceira;
 
   @Column(length=50)
   private String dor;
 
   @Column(length=50)
   private String outros;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.MERGE}, fetch=FetchType.LAZY)
   private HistoricoClinico historicoClinico;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public Boolean getTontura() {
     return this.tontura;
   }
   public void setTontura(Boolean tontura) {
     this.tontura = tontura;
   }
   public Boolean getFraqueza() {
     return this.fraqueza;
   }
   public void setFraqueza(Boolean fraqueza) {
     this.fraqueza = fraqueza;
   }
   public Boolean getNauseas() {
     return this.nauseas;
   }
   public void setNauseas(Boolean nauseas) {
     this.nauseas = nauseas;
   }
   public Boolean getSonolencia() {
     return this.sonolencia;
   }
   public void setSonolencia(Boolean sonolencia) {
     this.sonolencia = sonolencia;
   }
   public String getCoceira() {
     return this.coceira;
   }
   public void setCoceira(String coceira) {
     this.coceira = coceira;
   }
   public String getDor() {
     return this.dor;
   }
   public void setDor(String dor) {
     this.dor = dor;
   }
   public HistoricoClinico getHistoricoClinico() {
     return this.historicoClinico;
   }
   public void setHistoricoClinico(HistoricoClinico historicoClinico) {
     this.historicoClinico = historicoClinico;
   }
   public String getOutros() {
     return this.outros;
   }
   public void setOutros(String outros) {
     this.outros = outros;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.MalEstar
 * JD-Core Version:    0.6.0
 */