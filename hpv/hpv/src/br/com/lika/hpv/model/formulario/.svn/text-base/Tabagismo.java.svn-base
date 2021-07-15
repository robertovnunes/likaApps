 package br.com.lika.hpv.model.formulario;
 
 import br.com.lika.hpv.model.formulario.util.Fumo;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class Tabagismo
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=8)
   private String fuma;
   private Character contatoFumaca;
 
   @OneToOne(cascade={javax.persistence.CascadeType.PERSIST}, mappedBy="tabagismo", targetEntity=Fumo.class, fetch=FetchType.EAGER)
   private Fumo fumo;
   private Character jaExperimentouFumar;
 
   @Column(length=50)
   private String quantoTempoParouFumar;
 
   @Column(length=50)
   private String motivoParouFumar;
   private Character parouMotivoAgravamentoSaude;
 
   @Column(length=95)
   private String paraPararFumar;
 
   @Column(length=100)
   private String tratamentoParaPararFumar;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.MERGE}, fetch=FetchType.LAZY)
   private Formulario formulario;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public String getFuma() {
     return this.fuma;
   }
   public void setFuma(String fuma) {
     this.fuma = fuma;
   }
   public Character getContatoFumaca() {
     return this.contatoFumaca;
   }
   public void setContatoFumaca(Character contatoFumaca) {
     this.contatoFumaca = contatoFumaca;
   }
   public Fumo getFumo() {
     return this.fumo;
   }
   public void setFumo(Fumo fumo) {
     this.fumo = fumo;
   }
   public Character getJaExperimentouFumar() {
     return this.jaExperimentouFumar;
   }
   public void setJaExperimentouFumar(Character jaExperimentouFumar) {
     this.jaExperimentouFumar = jaExperimentouFumar;
   }
   public String getQuantoTempoParouFumar() {
     return this.quantoTempoParouFumar;
   }
   public void setQuantoTempoParouFumar(String quantoTempoParouFumar) {
     this.quantoTempoParouFumar = quantoTempoParouFumar;
   }
   public String getMotivoParouFumar() {
     return this.motivoParouFumar;
   }
   public void setMotivoParouFumar(String motivoParouFumar) {
     this.motivoParouFumar = motivoParouFumar;
   }
   public Character getParouMotivoAgravamentoSaude() {
     return this.parouMotivoAgravamentoSaude;
   }
   public void setParouMotivoAgravamentoSaude(Character parouMotivoAgravamentoSaude) {
     this.parouMotivoAgravamentoSaude = parouMotivoAgravamentoSaude;
   }
   public String getParaPararFumar() {
     return this.paraPararFumar;
   }
   public void setParaPararFumar(String paraPararFumar) {
     this.paraPararFumar = paraPararFumar;
   }
   public String getTratamentoParaPararFumar() {
     return this.tratamentoParaPararFumar;
   }
   public void setTratamentoParaPararFumar(String tratamentoParaPararFumar) {
     this.tratamentoParaPararFumar = tratamentoParaPararFumar;
   }
   public Formulario getFormulario() {
     return this.formulario;
   }
   public void setFormulario(Formulario formulario) {
     this.formulario = formulario;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.Tabagismo
 * JD-Core Version:    0.6.0
 */