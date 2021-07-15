 package br.com.lika.hpv.model.formulario.util;
 
 import br.com.lika.hpv.model.formulario.HistoricoFamiliar;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class ParenteCancer
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=30)
   private String grauParentesco;
 
   @Column(length=40)
   private String tipo;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.MERGE}, fetch=FetchType.LAZY)
   private HistoricoFamiliar historicoFamiliar;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public String getGrauParentesco() {
     return this.grauParentesco;
   }
   public void setGrauParentesco(String grauParentesco) {
     this.grauParentesco = grauParentesco;
   }
   public String getTipo() {
     return this.tipo;
   }
   public void setTipo(String tipo) {
     this.tipo = tipo;
   }
   public HistoricoFamiliar getHistoricoFamiliar() {
     return this.historicoFamiliar;
   }
   public void setHistoricoFamiliar(HistoricoFamiliar historicoFamiliar) {
     this.historicoFamiliar = historicoFamiliar;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.ParenteCancer
 * JD-Core Version:    0.6.0
 */