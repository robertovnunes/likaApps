 package br.com.lika.hpv.model.formulario.util;
 
 import br.com.lika.hpv.model.formulario.HistoricoClinico;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class Diabetes
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=3)
   private String medicoReceitouDietaDiabetes;
 
   @Column(length=3)
   private String estaSeguindoDietaDiabetes;
 
   @Column(length=3)
   private String medicoReceitouMedicamentoDiabetes;
 
   @Column(length=18)
   private String remedioDiabetes;
 
   @Column(length=3)
   private String estaTomandoRemedioDiabetes;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH}, fetch=FetchType.LAZY)
   private HistoricoClinico historicoClinico;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public String getMedicoReceitouDietaDiabetes() {
     return this.medicoReceitouDietaDiabetes;
   }
   public void setMedicoReceitouDietaDiabetes(String medicoReceitouDietaDiabetes) {
     this.medicoReceitouDietaDiabetes = medicoReceitouDietaDiabetes;
   }
   public String getEstaSeguindoDietaDiabetes() {
     return this.estaSeguindoDietaDiabetes;
   }
   public void setEstaSeguindoDietaDiabetes(String estaSeguindoDietaDiabetes) {
     this.estaSeguindoDietaDiabetes = estaSeguindoDietaDiabetes;
   }
   public String getMedicoReceitouMedicamentoDiabetes() {
     return this.medicoReceitouMedicamentoDiabetes;
   }
 
   public void setMedicoReceitouMedicamentoDiabetes(String medicoReceitouMedicamentoDiabetes) {
     this.medicoReceitouMedicamentoDiabetes = medicoReceitouMedicamentoDiabetes;
   }
   public String getRemedioDiabetes() {
     return this.remedioDiabetes;
   }
   public void setRemedioDiabetes(String remedioDiabetes) {
     this.remedioDiabetes = remedioDiabetes;
   }
   public String getEstaTomandoRemedioDiabetes() {
     return this.estaTomandoRemedioDiabetes;
   }
   public void setEstaTomandoRemedioDiabetes(String estaTomandoRemedioDiabetes) {
     this.estaTomandoRemedioDiabetes = estaTomandoRemedioDiabetes;
   }
   public HistoricoClinico getHistoricoClinico() {
     return this.historicoClinico;
   }
   public void setHistoricoClinico(HistoricoClinico historicoClinico) {
     this.historicoClinico = historicoClinico;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.Diabetes
 * JD-Core Version:    0.6.0
 */