 package br.com.lika.hpv.model.laudo;
 
 import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.validator.NotEmpty;
 
 @Entity
 public class TemplateTextosLaudo
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=500)
   @NotEmpty(message="O texto do template do laudo não pode ser vazio.")
   private String texto;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public String getTexto() {
     return this.texto;
   }
   public void setTexto(String texto) {
     this.texto = texto;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.laudo.TemplateTextosLaudo
 * JD-Core Version:    0.6.0
 */