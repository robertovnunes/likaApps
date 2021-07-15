 package br.com.lika.hpv.model.laudo.laudoHIV;
 
 import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.validator.NotEmpty;
 
 @Entity
 public class ReagenteHIV
 {
 
   @Column(length=300)
   @NotEmpty(message="Selecione um tipo de reagente")
   private String reagente;
 
   @Id
   @GeneratedValue
   private Long id;
   private Date dataCadastro;
 
   public String getReagente()
   {
     return this.reagente;
   }
 
   public void setReagente(String reagente) {
     this.reagente = reagente;
   }
 
   public Long getId() {
     return this.id;
   }
 
   public void setId(Long id) {
     this.id = id;
   }
 
   public Date getDataCadastro() {
     return this.dataCadastro;
   }
 
   public void setDataCadastro(Date dataCadastro) {
     this.dataCadastro = dataCadastro;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.laudo.laudoHIV.ReagenteHIV
 * JD-Core Version:    0.6.0
 */