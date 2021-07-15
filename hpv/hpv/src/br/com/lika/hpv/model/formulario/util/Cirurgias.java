 package br.com.lika.hpv.model.formulario.util;
 
 import br.com.lika.hpv.model.formulario.HistoricoClinico;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class Cirurgias
 {
 
   @Id
   @GeneratedValue
   private Long id;
   private String cirurgias;
   private String quando;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH}, fetch=FetchType.LAZY)
   private HistoricoClinico historicoClinico;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public String getCirurgias() {
     return this.cirurgias;
   }
   public void setCirurgias(String cirurgias) {
     this.cirurgias = cirurgias;
   }
   public String getQuando() {
     return this.quando;
   }
   public void setQuando(String quando) {
     this.quando = quando;
   }
   public HistoricoClinico getHistoricoClinico() {
     return this.historicoClinico;
   }
   public void setHistoricoClinico(HistoricoClinico historicoClinico) {
     this.historicoClinico = historicoClinico;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.Cirurgias
 * JD-Core Version:    0.6.0
 */