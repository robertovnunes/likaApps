 package br.com.lika.hpv.model.formulario.util;
 
 import br.com.lika.hpv.model.formulario.HistoricoClinico;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class MedicacaoMenorPausa
 {
 
   @Id
   @GeneratedValue
   private Long id;
   private Boolean hormonal;
   private Boolean quimico;
   private Boolean ns_nr;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.MERGE}, fetch=FetchType.LAZY)
   private HistoricoClinico historicoClinico;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public Boolean getHormonal() {
     return this.hormonal;
   }
   public void setHormonal(Boolean hormonal) {
     this.hormonal = hormonal;
   }
   public Boolean getQuimico() {
     return this.quimico;
   }
   public void setQuimico(Boolean quimico) {
     this.quimico = quimico;
   }
   public Boolean getNs_nr() {
     return this.ns_nr;
   }
   public void setNs_nr(Boolean ns_nr) {
     this.ns_nr = ns_nr;
   }
   public HistoricoClinico getHistoricoClinico() {
     return this.historicoClinico;
   }
   public void setHistoricoClinico(HistoricoClinico historicoClinico) {
     this.historicoClinico = historicoClinico;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.MedicacaoMenorPausa
 * JD-Core Version:    0.6.0
 */