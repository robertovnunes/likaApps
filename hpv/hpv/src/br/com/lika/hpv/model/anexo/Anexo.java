 package br.com.lika.hpv.model.anexo;
 
 import br.com.lika.hpv.model.formulario.Formulario;
 import java.util.Date;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import org.hibernate.validator.NotNull;
 
 @Entity
 public class Anexo
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @ManyToOne(cascade={javax.persistence.CascadeType.REFRESH}, targetEntity=Formulario.class)
   private Formulario formulario;
 
   @Lob
   @Column(length=25000000)
   @NotNull(message="objeto_invalido")
   private byte[] anexo;
   private String tipo;
   private Date data;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public Formulario getFormulario() {
     return this.formulario;
   }
   public void setFormulario(Formulario formulario) {
     this.formulario = formulario;
   }
   public byte[] getAnexo() {
     return this.anexo;
   }
   public void setAnexo(byte[] anexo) {
     this.anexo = anexo;
   }
   public String getTipo() {
     return this.tipo;
   }
   public void setTipo(String tipo) {
     this.tipo = tipo;
   }
   public Date getData() {
     return this.data;
   }
   public void setData(Date data) {
     this.data = data;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.anexo.Anexo
 * JD-Core Version:    0.6.0
 */