 package br.com.lika.hpv.model.laudo;
 
 import br.com.lika.hpv.model.formulario.util.Data;
 import java.util.Date;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.Inheritance;
 import javax.persistence.InheritanceType;
 
 @Entity
 @Inheritance(strategy=InheritanceType.JOINED)
 public abstract class LaudoViral
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=120)
   private String unidadeSaudeFamilia;
   private Date dataColeta;
   private Date dataEntrega;
   private Date dataAtualizacaoLaudo;
 
   @Column(length=200)
   private String resultado;
 
   @Column(length=16)
   private String codigo;
 
   @Column(length=150)
   private String observacoes;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public String getUnidadeSaudeFamilia() {
     return this.unidadeSaudeFamilia;
   }
   public void setUnidadeSaudeFamilia(String unidadeSaudeFamilia) {
     this.unidadeSaudeFamilia = unidadeSaudeFamilia;
   }
   public Date getDataColeta() {
     Data data = new Data();
     if (this.dataColeta != null) {
       data.setTime(this.dataColeta.getTime());
       return data;
     }
     return null;
   }
   public void setDataColeta(Date dataColeta) {
     this.dataColeta = dataColeta;
   }
 
   public Date getDataAtualizacaoLaudo()
   {
     return this.dataAtualizacaoLaudo;
   }
   public void setDataAtualizacaoLaudo(Date dataAtualizacaoLaudo) {
     this.dataAtualizacaoLaudo = dataAtualizacaoLaudo;
   }
   public Date getDataEntrega() {
     Data data = new Data();
     if (this.dataEntrega != null) {
       data.setTime(this.dataEntrega.getTime());
       return data;
     }
     return null;
   }
   public void setDataEntrega(Date dataEntrega) {
     this.dataEntrega = dataEntrega;
   }
   public String getResultado() {
     return this.resultado;
   }
   public void setResultado(String resultado) {
     this.resultado = resultado;
   }
   public String getCodigo() {
     return this.codigo;
   }
   public void setCodigo(String codigo) {
     this.codigo = codigo;
   }
   public String getObservacoes() {
     return this.observacoes;
   }
   public void setObservacoes(String observacoes) {
     this.observacoes = observacoes;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.laudo.LaudoViral
 * JD-Core Version:    0.6.0
 */