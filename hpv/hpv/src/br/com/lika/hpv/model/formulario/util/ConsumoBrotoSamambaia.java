 package br.com.lika.hpv.model.formulario.util;
 
 import br.com.lika.hpv.model.formulario.HistoricoAlimentar;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class ConsumoBrotoSamambaia
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=2)
   private Integer tempoConsome;
 
   @Column(length=6)
   private String formaConsumo;
 
   @Column(length=2)
   private Integer quantidadeAguaDesprezada;
 
   @Column(length=3)
   private String quantidadeColheres;
 
   @Column(length=2)
   private Integer quantidadeVezes;
 
   @Column(length=10)
   private String quantidadeTempo;
 
   @OneToOne(cascade={javax.persistence.CascadeType.MERGE, javax.persistence.CascadeType.REFRESH}, fetch=FetchType.LAZY)
   private HistoricoAlimentar historicoAlimentar;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public Integer getTempoConsome() {
     return this.tempoConsome;
   }
   public void setTempoConsome(Integer tempoConsome) {
     this.tempoConsome = tempoConsome;
   }
   public String getFormaConsumo() {
     return this.formaConsumo;
   }
   public void setFormaConsumo(String formaConsumo) {
     this.formaConsumo = formaConsumo;
   }
   public Integer getQuantidadeAguaDesprezada() {
     return this.quantidadeAguaDesprezada;
   }
   public void setQuantidadeAguaDesprezada(Integer quantidadeAguaDesprezada) {
     this.quantidadeAguaDesprezada = quantidadeAguaDesprezada;
   }
   public String getQuantidadeColheres() {
     return this.quantidadeColheres;
   }
   public void setQuantidadeColheres(String quantidadeColheres) {
     this.quantidadeColheres = quantidadeColheres;
   }
   public Integer getQuantidadeVezes() {
     return this.quantidadeVezes;
   }
   public void setQuantidadeVezes(Integer quantidadeVezes) {
     this.quantidadeVezes = quantidadeVezes;
   }
   public String getQuantidadeTempo() {
     return this.quantidadeTempo;
   }
   public void setQuantidadeTempo(String quantidadeTempo) {
     this.quantidadeTempo = quantidadeTempo;
   }
   public HistoricoAlimentar getHistoricoAlimentar() {
     return this.historicoAlimentar;
   }
   public void setHistoricoAlimentar(HistoricoAlimentar historicoAlimentar) {
     this.historicoAlimentar = historicoAlimentar;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.ConsumoBrotoSamambaia
 * JD-Core Version:    0.6.0
 */