 package br.com.lika.hpv.model.formulario.util;
 
 import br.com.lika.hpv.model.formulario.HistoricoAlimentar;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class Frango
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=9)
   private String frequenciaQuantidadeConsumo;
 
   @Column(length=6)
   private String frequenciaTempoConsumo;
 
   @Column(length=40)
   private String peleFrango;
 
   @OneToOne(cascade={javax.persistence.CascadeType.MERGE, javax.persistence.CascadeType.REFRESH}, fetch=FetchType.LAZY)
   private HistoricoAlimentar historicoAlimentar;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public String getFrequenciaQuantidadeConsumo() {
     return this.frequenciaQuantidadeConsumo;
   }
   public void setFrequenciaQuantidadeConsumo(String frequenciaQuantidadeConsumo) {
     this.frequenciaQuantidadeConsumo = frequenciaQuantidadeConsumo;
   }
   public String getFrequenciaTempoConsumo() {
     return this.frequenciaTempoConsumo;
   }
   public void setFrequenciaTempoConsumo(String frequenciaTempoConsumo) {
     this.frequenciaTempoConsumo = frequenciaTempoConsumo;
   }
   public String getPeleFrango() {
     return this.peleFrango;
   }
   public void setPeleFrango(String peleFrango) {
     this.peleFrango = peleFrango;
   }
   public HistoricoAlimentar getHistoricoAlimentar() {
     return this.historicoAlimentar;
   }
   public void setHistoricoAlimentar(HistoricoAlimentar historicoAlimentar) {
     this.historicoAlimentar = historicoAlimentar;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.Frango
 * JD-Core Version:    0.6.0
 */