 package br.com.lika.hpv.model.formulario.util;
 
 import br.com.lika.hpv.model.formulario.HistoricoAlimentar;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class Fogao
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=30)
   private String tempoTemFogaoCasa;
   private Character cozinhaNesteFogao;
 
   @Column(length=30)
   private String tempoCozinhaNesteFogao;
 
   @OneToOne(cascade={javax.persistence.CascadeType.MERGE, javax.persistence.CascadeType.REFRESH}, fetch=FetchType.LAZY)
   private HistoricoAlimentar historicoAlimentar;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public String getTempoTemFogaoCasa() {
     return this.tempoTemFogaoCasa;
   }
   public void setTempoTemFogaoCasa(String tempoTemFogaoCasa) {
     this.tempoTemFogaoCasa = tempoTemFogaoCasa;
   }
   public Character getCozinhaNesteFogao() {
     return this.cozinhaNesteFogao;
   }
   public void setCozinhaNesteFogao(Character cozinhaNesteFogao) {
     this.cozinhaNesteFogao = cozinhaNesteFogao;
   }
   public String getTempoCozinhaNesteFogao() {
     return this.tempoCozinhaNesteFogao;
   }
   public void setTempoCozinhaNesteFogao(String tempoCozinhaNesteFogao) {
     this.tempoCozinhaNesteFogao = tempoCozinhaNesteFogao;
   }
   public HistoricoAlimentar getHistoricoAlimentar() {
     return this.historicoAlimentar;
   }
   public void setHistoricoAlimentar(HistoricoAlimentar historicoAlimentar) {
     this.historicoAlimentar = historicoAlimentar;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.Fogao
 * JD-Core Version:    0.6.0
 */