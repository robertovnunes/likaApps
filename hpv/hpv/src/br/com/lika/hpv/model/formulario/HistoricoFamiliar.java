 package br.com.lika.hpv.model.formulario;
 
 import br.com.lika.hpv.model.formulario.util.ParenteCancer;
 import br.com.lika.hpv.model.formulario.util.ParenteDoencaCronica;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class HistoricoFamiliar
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=5)
   private String algumParenteDoencaCronica;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="historicoFamiliar", targetEntity=ParenteDoencaCronica.class, fetch=FetchType.EAGER)
   private ParenteDoencaCronica parenteDoencaCronica;
 
   @Column(length=5)
   private String algumParenteCancer;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="historicoFamiliar", targetEntity=ParenteCancer.class, fetch=FetchType.EAGER)
   private ParenteCancer parenteCancer;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.MERGE}, fetch=FetchType.LAZY)
   private Formulario formulario;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public String getAlgumParenteDoencaCronica() {
     return this.algumParenteDoencaCronica;
   }
   public void setAlgumParenteDoencaCronica(String algumParenteDoencaCronica) {
     this.algumParenteDoencaCronica = algumParenteDoencaCronica;
   }
   public ParenteDoencaCronica getParenteDoencaCronica() {
     return this.parenteDoencaCronica;
   }
   public void setParenteDoencaCronica(ParenteDoencaCronica parenteDoencaCronica) {
     this.parenteDoencaCronica = parenteDoencaCronica;
   }
   public String getAlgumParenteCancer() {
     return this.algumParenteCancer;
   }
   public void setAlgumParenteCancer(String algumParenteCancer) {
     this.algumParenteCancer = algumParenteCancer;
   }
   public ParenteCancer getParenteCancer() {
     return this.parenteCancer;
   }
   public void setParenteCancer(ParenteCancer parenteCancer) {
     this.parenteCancer = parenteCancer;
   }
   public Formulario getFormulario() {
     return this.formulario;
   }
   public void setFormulario(Formulario formulario) {
     this.formulario = formulario;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.HistoricoFamiliar
 * JD-Core Version:    0.6.0
 */