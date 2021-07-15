 package br.com.lika.hpv.model.laudo;
 
 import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.validator.NotEmpty;

import br.com.lika.hpv.model.formulario.Formulario;
 
 @Entity
 public class LaudoHiv extends LaudoViral
 {
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.MERGE}, fetch=FetchType.LAZY, optional=false)
   private Formulario formulario;
 
   @Column(length=300)
   @NotEmpty(message="Selecione um tipo de teste")
   private String reagente;
 
   public Formulario getFormulario()
   {
     return this.formulario;
   }
 
   public void setFormulario(Formulario formulario) {
     this.formulario = formulario;
   }
 
   public String getReagente() {
     return this.reagente;
   }
 
   public void setReagente(String reagente) {
     this.reagente = reagente;
   }

 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.laudo.LaudoHiv
 * JD-Core Version:    0.6.0
 */