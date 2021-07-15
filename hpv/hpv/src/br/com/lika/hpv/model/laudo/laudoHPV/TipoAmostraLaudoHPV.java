 package br.com.lika.hpv.model.laudo.laudoHPV;
 
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 
 @Entity
 public class TipoAmostraLaudoHPV
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=100, unique=true)
   private String tipoAmostra;
 
   public Long getId()
   {
     return this.id;
   }
 
   public void setId(Long id) {
     this.id = id;
   }
 
   public String getTipoAmostra() {
     return this.tipoAmostra;
   }
 
   public void setTipoAmostra(String tipoAmostra) {
     this.tipoAmostra = tipoAmostra;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.laudo.laudoHPV.TipoAmostraLaudoHPV
 * JD-Core Version:    0.6.0
 */