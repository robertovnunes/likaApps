 package br.com.lika.hpv.model.formulario.util;
 
 import br.com.lika.hpv.model.formulario.HistoricoClinico;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.ManyToOne;
 
 @Entity
 public class MedicacaoUsoContinuo
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=50)
   private String medicacao;
 
   @Column(length=100)
   private String tempo;
 
   @ManyToOne(cascade={javax.persistence.CascadeType.REFRESH}, targetEntity=HistoricoClinico.class)
   private HistoricoClinico historicoClinico;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public String getMedicacao() {
     return this.medicacao;
   }
   public void setMedicacao(String medicacao) {
     this.medicacao = medicacao;
   }
   public String getTempo() {
     return this.tempo;
   }
   public void setTempo(String tempo) {
     this.tempo = tempo;
   }
   public HistoricoClinico getHistoricoClinico() {
     return this.historicoClinico;
   }
   public void setHistoricoClinico(HistoricoClinico historicoClinico) {
     this.historicoClinico = historicoClinico;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.MedicacaoUsoContinuo
 * JD-Core Version:    0.6.0
 */