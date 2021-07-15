 package br.com.lika.hpv.model.formulario;
 
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class HistoricoSexual
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=3)
   private String jaTeveRelacaoSexual;
 
   @Column(length=33)
   private String estaGravida;
 
   @Column(length=3)
   private Integer idadePrimeiraRelacaoSexual;
 
   @Column(length=6)
   private String numeroParceiros;
 
   @Column(length=2)
   private Integer numeroGestacoes;
 
   @Column(length=2)
   private Integer idadePrimeiraGestacao;
 
   @Column(length=2)
   private Integer idadeNasceuPrimeiroFilho;
 
   @Column(length=2)
   private Integer numeroAbortos;
 
   @Column(length=2)
   private Integer numeroPartos;
 
   @Column(length=2)
   private Integer numeroPartosNormal;
 
   @Column(length=2)
   private Integer numeroPartosCesaria;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.MERGE}, fetch=FetchType.LAZY)
   private Formulario formulario;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public String getJaTeveRelacaoSexual() {
     return this.jaTeveRelacaoSexual;
   }
   public void setJaTeveRelacaoSexual(String jaTeveRelacaoSexual) {
     this.jaTeveRelacaoSexual = jaTeveRelacaoSexual;
   }
   public String getEstaGravida() {
     return this.estaGravida;
   }
   public void setEstaGravida(String estaGravida) {
     this.estaGravida = estaGravida;
   }
   public Integer getIdadePrimeiraRelacaoSexual() {
     return this.idadePrimeiraRelacaoSexual;
   }
   public void setIdadePrimeiraRelacaoSexual(Integer idadePrimeiraRelacaoSexual) {
     this.idadePrimeiraRelacaoSexual = idadePrimeiraRelacaoSexual;
   }
   public String getNumeroParceiros() {
     return this.numeroParceiros;
   }
   public void setNumeroParceiros(String numeroParceiros) {
     this.numeroParceiros = numeroParceiros;
   }
   public Integer getNumeroGestacoes() {
     return this.numeroGestacoes;
   }
   public void setNumeroGestacoes(Integer numeroGestacoes) {
     this.numeroGestacoes = numeroGestacoes;
   }
   public Integer getIdadePrimeiraGestacao() {
     return this.idadePrimeiraGestacao;
   }
   public void setIdadePrimeiraGestacao(Integer idadePrimeiraGestacao) {
     this.idadePrimeiraGestacao = idadePrimeiraGestacao;
   }
   public Integer getIdadeNasceuPrimeiroFilho() {
     return this.idadeNasceuPrimeiroFilho;
   }
   public void setIdadeNasceuPrimeiroFilho(Integer idadeNasceuPrimeiroFilho) {
     this.idadeNasceuPrimeiroFilho = idadeNasceuPrimeiroFilho;
   }
   public Integer getNumeroAbortos() {
     return this.numeroAbortos;
   }
   public void setNumeroAbortos(Integer numeroAbortos) {
     this.numeroAbortos = numeroAbortos;
   }
   public Integer getNumeroPartos() {
     return this.numeroPartos;
   }
   public void setNumeroPartos(Integer numeroPartos) {
     this.numeroPartos = numeroPartos;
   }
   public Integer getNumeroPartosNormal() {
     return this.numeroPartosNormal;
   }
   public void setNumeroPartosNormal(Integer numeroPartosNormal) {
     this.numeroPartosNormal = numeroPartosNormal;
   }
   public Integer getNumeroPartosCesaria() {
     return this.numeroPartosCesaria;
   }
   public void setNumeroPartosCesaria(Integer numeroPartosCesaria) {
     this.numeroPartosCesaria = numeroPartosCesaria;
   }
   public Formulario getFormulario() {
     return this.formulario;
   }
   public void setFormulario(Formulario formulario) {
     this.formulario = formulario;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.HistoricoSexual
 * JD-Core Version:    0.6.0
 */