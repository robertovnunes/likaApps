 package br.com.lika.hpv.model.laudo;
 
 import br.com.lika.hpv.model.formulario.Formulario;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
 
 @Entity
 public class LaudoSifilis extends LaudoViral
 {
   
@OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.MERGE}, fetch=FetchType.LAZY, optional=false)
   private Formulario formulario;
 
   public Formulario getFormulario()
   {
     return this.formulario;
   }
 
   public void setFormulario(Formulario formulario) {
     this.formulario = formulario;
   }
   

 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.laudo.LaudoSifilis
 * JD-Core Version:    0.6.0
 */