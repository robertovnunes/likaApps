 package br.com.lika.hpv.model.formulario;
 
 import br.com.lika.hpv.model.formulario.util.MetaisPesados;
 import br.com.lika.hpv.model.formulario.util.ProdutosQuimicos;
 import br.com.lika.hpv.model.formulario.util.Radiacoes;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class SituacaoSocioEconomicaDemografica
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=10)
   private String etnia;
 
   @Column(length=26)
   private String situacaoConjugal;
 
   @Column(length=30)
   private String escolaridade;
 
   @Column(length=100)
   private String principalOcupacaoNome;
 
   @Column(length=50)
   private String principalOcupacaoCBO;
 
   @Column(length=3)
   private String principalOcupacaoTempoAnos;
 
   @Column(length=2)
   private String principalOcupacaoTempoMeses;
 
   @Column(length=50)
   private String ondeTrabalha;
 
   @Column(length=100)
   private String ocupacaoQueTevePorMaisTempoNome;
 
   @Column(length=50)
   private String ocupacaoQueTevePorMaisTempoCBO;
 
   @Column(length=5)
   private String jaTeveContatoProdutoQuimico;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="situacaoSocioEconomicaDemografica", targetEntity=ProdutosQuimicos.class)
   private ProdutosQuimicos produtosQuimicos;
 
   @Column(length=5)
   private String jaTeveContatoMetaisPesados;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, targetEntity=MetaisPesados.class, mappedBy="situacaoSocioEconomicaDemografica")
   private MetaisPesados metaisPesados;
 
   @Column(length=5)
   private String jaTeveContatoRadiacao;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="situacaoSocioEconomicaDemografica", targetEntity=Radiacoes.class)
   private Radiacoes radiacoes;
 
   @Column(length=37)
   private String renda;
   private Integer numeroPessoasDomicilio;
 
   @Column(length=100)
   private String profissaoFormacao;
 
   @Column(length=100)
   private String profissaoFormacaoCBO;
   private Integer profissaoFormacaoAnos;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.MERGE}, fetch=FetchType.LAZY)
   private Formulario formulario;
 
   public Long getId()
   {
     return this.id;
   }
 
   public void setId(Long id)
   {
     this.id = id;
   }
 
   public String getEtnia()
   {
     return this.etnia;
   }
 
   public void setEtnia(String etnia)
   {
     this.etnia = etnia;
   }
 
   public String getSituacaoConjugal()
   {
     return this.situacaoConjugal;
   }
 
   public void setSituacaoConjugal(String situacaoConjugal)
   {
     this.situacaoConjugal = situacaoConjugal;
   }
 
   public String getEscolaridade()
   {
     return this.escolaridade;
   }
 
   public void setEscolaridade(String escolaridade)
   {
     this.escolaridade = escolaridade;
   }
 
   public String getPrincipalOcupacaoNome()
   {
     return this.principalOcupacaoNome;
   }
 
   public void setPrincipalOcupacaoNome(String principalOcupacaoNome)
   {
     this.principalOcupacaoNome = principalOcupacaoNome;
   }
 
   public String getPrincipalOcupacaoCBO()
   {
     return this.principalOcupacaoCBO;
   }
 
   public void setPrincipalOcupacaoCBO(String principalOcupacaoCBO)
   {
     this.principalOcupacaoCBO = principalOcupacaoCBO;
   }
 
   public String getPrincipalOcupacaoTempoAnos()
   {
     return this.principalOcupacaoTempoAnos;
   }
 
   public void setPrincipalOcupacaoTempoAnos(String principalOcupacaoTempoAnos)
   {
     this.principalOcupacaoTempoAnos = principalOcupacaoTempoAnos;
   }
 
   public String getPrincipalOcupacaoTempoMeses()
   {
     return this.principalOcupacaoTempoMeses;
   }
 
   public void setPrincipalOcupacaoTempoMeses(String principalOcupacaoTempoMeses)
   {
     this.principalOcupacaoTempoMeses = principalOcupacaoTempoMeses;
   }
 
   public String getOndeTrabalha()
   {
     return this.ondeTrabalha;
   }
 
   public void setOndeTrabalha(String ondeTrabalha)
   {
     this.ondeTrabalha = ondeTrabalha;
   }
 
   public String getOcupacaoQueTevePorMaisTempoNome()
   {
     return this.ocupacaoQueTevePorMaisTempoNome;
   }
 
   public void setOcupacaoQueTevePorMaisTempoNome(String ocupacaoQueTevePorMaisTempoNome)
   {
     this.ocupacaoQueTevePorMaisTempoNome = ocupacaoQueTevePorMaisTempoNome;
   }
 
   public String getOcupacaoQueTevePorMaisTempoCBO()
   {
     return this.ocupacaoQueTevePorMaisTempoCBO;
   }
 
   public void setOcupacaoQueTevePorMaisTempoCBO(String ocupacaoQueTevePorMaisTempoCBO)
   {
     this.ocupacaoQueTevePorMaisTempoCBO = ocupacaoQueTevePorMaisTempoCBO;
   }
 
   public String getJaTeveContatoProdutoQuimico()
   {
     return this.jaTeveContatoProdutoQuimico;
   }
 
   public void setJaTeveContatoProdutoQuimico(String jaTeveContatoProdutoQuimico)
   {
     this.jaTeveContatoProdutoQuimico = jaTeveContatoProdutoQuimico;
   }
 
   public ProdutosQuimicos getProdutosQuimicos()
   {
     return this.produtosQuimicos;
   }
 
   public void setProdutosQuimicos(ProdutosQuimicos produtosQuimicos)
   {
     this.produtosQuimicos = produtosQuimicos;
   }
 
   public String getJaTeveContatoMetaisPesados()
   {
     return this.jaTeveContatoMetaisPesados;
   }
 
   public void setJaTeveContatoMetaisPesados(String jaTeveContatoMetaisPesados)
   {
     this.jaTeveContatoMetaisPesados = jaTeveContatoMetaisPesados;
   }
 
   public MetaisPesados getMetaisPesados()
   {
     return this.metaisPesados;
   }
 
   public void setMetaisPesados(MetaisPesados metaisPesados)
   {
     this.metaisPesados = metaisPesados;
   }
 
   public String getJaTeveContatoRadiacao()
   {
     return this.jaTeveContatoRadiacao;
   }
 
   public void setJaTeveContatoRadiacao(String jaTeveContatoRadiacao)
   {
     this.jaTeveContatoRadiacao = jaTeveContatoRadiacao;
   }
 
   public Radiacoes getRadiacoes()
   {
     return this.radiacoes;
   }
 
   public void setRadiacoes(Radiacoes radiacoes)
   {
     this.radiacoes = radiacoes;
   }
 
   public Formulario getFormulario()
   {
     return this.formulario;
   }
 
   public void setFormulario(Formulario formulario)
   {
     this.formulario = formulario;
   }
 
   public String getRenda()
   {
     return this.renda;
   }
 
   public void setRenda(String renda)
   {
     this.renda = renda;
   }
 
   public Integer getNumeroPessoasDomicilio()
   {
     return this.numeroPessoasDomicilio;
   }
 
   public void setNumeroPessoasDomicilio(Integer numeroPessoasDomicilio)
   {
     this.numeroPessoasDomicilio = numeroPessoasDomicilio;
   }
 
   public String getProfissaoFormacao()
   {
     return this.profissaoFormacao;
   }
 
   public void setProfissaoFormacao(String profissaoFormacao)
   {
     this.profissaoFormacao = profissaoFormacao;
   }
 
   public String getProfissaoFormacaoCBO()
   {
     return this.profissaoFormacaoCBO;
   }
 
   public void setProfissaoFormacaoCBO(String profissaoFormacaoCBO)
   {
     this.profissaoFormacaoCBO = profissaoFormacaoCBO;
   }
 
   public Integer getProfissaoFormacaoAnos()
   {
     return this.profissaoFormacaoAnos;
   }
 
   public void setProfissaoFormacaoAnos(Integer profissaoFormacaoAnos)
   {
     this.profissaoFormacaoAnos = profissaoFormacaoAnos;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.SituacaoSocioEconomicaDemografica
 * JD-Core Version:    0.6.0
 */