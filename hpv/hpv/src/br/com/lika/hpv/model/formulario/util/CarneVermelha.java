 package br.com.lika.hpv.model.formulario.util;
 
 import br.com.lika.hpv.model.formulario.HistoricoAlimentar;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class CarneVermelha
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=40)
   private String gordura;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.MERGE}, fetch=FetchType.LAZY)
   private HistoricoAlimentar historicoAlimentar;
 
   public HistoricoAlimentar getHistoricoAlimentar()
   {
     return this.historicoAlimentar;
   }
   public void setHistoricoAlimentar(HistoricoAlimentar historicoAlimentar) {
     this.historicoAlimentar = historicoAlimentar;
   }
   public Long getId() {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public String getGordura() {
     return this.gordura;
   }
   public void setGordura(String gordura) {
     this.gordura = gordura;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.CarneVermelha
 * JD-Core Version:    0.6.0
 */