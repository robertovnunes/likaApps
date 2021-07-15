 package br.com.lika.hpv.model.formulario;
 
 import br.com.lika.hpv.model.formulario.util.Data;
 import java.util.Date;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class InformacoesPessoais
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=120)
   private String nome;
   private Date dataNascimento;
 
   @Column(length=3)
   private Integer idade;
 
   @Column(length=9)
   private String sexo;
 
   @Column(length=100)
   private String residenciaAtualEndereco;
 
   @Column(length=60)
   private String residenciaAtualBairro;
 
   @Column(length=60)
   private String residenciaAtualCidade;
 
   @Column(length=60)
   private String residenciaAtualMunicipio;
 
   @Column(length=2)
   private String residenciaAtualEstadoUF;
 
   @Column(length=6)
   private String residenciaAtualZona;
 
   @Column(length=8)
   private Integer residenciaAtualCep;
 
   @Column(length=13)
   private String residenciaAtualTelefone;
 
   @Column(length=3)
   private Integer residenciaAtualTempoAnos;
 
   @Column(length=2)
   private Integer residenciaAtualTempoMeses;
   private Character residenciaAtualCondicoesMoradiaAlvenaria;
   private Character residenciaAtualCondicoesMoradiaPau_a_pique;
   private Character residenciaAtualCondicoesMoradiaAguaEncanada;
   private Character residenciaAtualCondicoesMoradiaEsgotoEncanado;
   private Character residenciaAtualCondicoesMoradiaCriacaoBovinos;
   private Character residenciaAtualCondicoesMoradiaCriacaoOutrosAnimais;
 
   @Column(length=80)
   private String residenciaAtualCondicoesMoradiaOutrosAnimais;
   private Character residenciaAtualProximidadeMineradora;
   private Character residenciaAtualProximidadePedraSabao;
   private Character residenciaAtualProximidadeFabricas;
 
   @Column(length=80)
   private String residenciaAtualProximidadeOutros;
 
   @Column(length=60)
   private String residenciaAnteriorCidade;
 
   @Column(length=2)
   private String residenciaAnteriorEstadoUF;
 
   @Column(length=50)
   private String residenciaAnteriorBairro;
 
   @Column(length=6)
   private String residenciaAnteriorZona;
 
   @Column(length=3)
   private Integer residenciaAnteriorTempoAnos;
 
   @Column(length=2)
   private Integer residenciaAnteriorTempoMeses;
   private Character residenciaAnteriorProximidadeMineradora;
   private Character residenciaAnteriorProximidadePedraSabao;
   private Character residenciaAnteriorProximidadeFabricas;
 
   @Column(length=80)
   private String residenciaAnteriorProximidadeOutros;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.MERGE}, fetch=FetchType.LAZY)
   private Formulario formulario;
 
   public Long getId()
   {
     return this.id;
   }
 
   public void setId(Long id) {
     this.id = id;
   }
 
   public String getNome() {
     return this.nome;
   }
 
   public void setNome(String nome) {
     this.nome = nome;
   }
 
   public Integer getIdade() {
     return this.idade;
   }
 
   public void setIdade(Integer idade) {
     this.idade = idade;
   }
 
   public String getSexo()
   {
     return this.sexo;
   }
 
   public void setSexo(String sexo) {
     this.sexo = sexo;
   }
 
   public String getResidenciaAtualEndereco() {
     return this.residenciaAtualEndereco;
   }
 
   public void setResidenciaAtualEndereco(String residenciaAtualEndereco) {
     this.residenciaAtualEndereco = residenciaAtualEndereco;
   }
 
   public String getResidenciaAtualBairro() {
     return this.residenciaAtualBairro;
   }
 
   public void setResidenciaAtualBairro(String residenciaAtualBairro) {
     this.residenciaAtualBairro = residenciaAtualBairro;
   }
 
   public String getResidenciaAtualCidade() {
     return this.residenciaAtualCidade;
   }
 
   public void setResidenciaAtualCidade(String residenciaAtualCidade) {
     this.residenciaAtualCidade = residenciaAtualCidade;
   }
 
   public String getResidenciaAtualEstadoUF() {
     return this.residenciaAtualEstadoUF;
   }
 
   public void setResidenciaAtualEstadoUF(String residenciaAtualEstadoUF) {
     this.residenciaAtualEstadoUF = residenciaAtualEstadoUF;
   }
 
   public String getResidenciaAtualZona() {
     return this.residenciaAtualZona;
   }
 
   public void setResidenciaAtualZona(String residenciaAtualZona) {
     this.residenciaAtualZona = residenciaAtualZona;
   }
 
   public Integer getResidenciaAtualCep() {
     return this.residenciaAtualCep;
   }
 
   public void setResidenciaAtualCep(Integer residenciaAtualCep) {
     this.residenciaAtualCep = residenciaAtualCep;
   }
 
   public String getResidenciaAtualTelefone() {
     return this.residenciaAtualTelefone;
   }
 
   public void setResidenciaAtualTelefone(String residenciaAtualTelefone) {
     this.residenciaAtualTelefone = residenciaAtualTelefone;
   }
 
   public Integer getResidenciaAtualTempoAnos() {
     return this.residenciaAtualTempoAnos;
   }
 
   public void setResidenciaAtualTempoAnos(Integer residenciaAtualTempoAnos) {
     this.residenciaAtualTempoAnos = residenciaAtualTempoAnos;
   }
 
   public Integer getResidenciaAtualTempoMeses() {
     return this.residenciaAtualTempoMeses;
   }
 
   public void setResidenciaAtualTempoMeses(Integer residenciaAtualTempoMeses) {
     this.residenciaAtualTempoMeses = residenciaAtualTempoMeses;
   }
 
   public Character getResidenciaAtualCondicoesMoradiaAlvenaria() {
     return this.residenciaAtualCondicoesMoradiaAlvenaria;
   }
 
   public void setResidenciaAtualCondicoesMoradiaAlvenaria(Character residenciaAtualCondicoesMoradiaAlvenaria)
   {
     this.residenciaAtualCondicoesMoradiaAlvenaria = residenciaAtualCondicoesMoradiaAlvenaria;
   }
 
   public Character getResidenciaAtualCondicoesMoradiaPau_a_pique() {
     return this.residenciaAtualCondicoesMoradiaPau_a_pique;
   }
 
   public void setResidenciaAtualCondicoesMoradiaPau_a_pique(Character residenciaAtualCondicoesMoradiaPau_a_pique)
   {
     this.residenciaAtualCondicoesMoradiaPau_a_pique = residenciaAtualCondicoesMoradiaPau_a_pique;
   }
 
   public Character getResidenciaAtualCondicoesMoradiaAguaEncanada() {
     return this.residenciaAtualCondicoesMoradiaAguaEncanada;
   }
 
   public void setResidenciaAtualCondicoesMoradiaAguaEncanada(Character residenciaAtualCondicoesMoradiaAguaEncanada)
   {
     this.residenciaAtualCondicoesMoradiaAguaEncanada = residenciaAtualCondicoesMoradiaAguaEncanada;
   }
 
   public Character getResidenciaAtualCondicoesMoradiaEsgotoEncanado() {
     return this.residenciaAtualCondicoesMoradiaEsgotoEncanado;
   }
 
   public void setResidenciaAtualCondicoesMoradiaEsgotoEncanado(Character residenciaAtualCondicoesMoradiaEsgotoEncanado)
   {
     this.residenciaAtualCondicoesMoradiaEsgotoEncanado = residenciaAtualCondicoesMoradiaEsgotoEncanado;
   }
 
   public Character getResidenciaAtualCondicoesMoradiaCriacaoBovinos() {
     return this.residenciaAtualCondicoesMoradiaCriacaoBovinos;
   }
 
   public void setResidenciaAtualCondicoesMoradiaCriacaoBovinos(Character residenciaAtualCondicoesMoradiaCriacaoBovinos)
   {
     this.residenciaAtualCondicoesMoradiaCriacaoBovinos = residenciaAtualCondicoesMoradiaCriacaoBovinos;
   }
 
   public Character getResidenciaAtualCondicoesMoradiaCriacaoOutrosAnimais() {
     return this.residenciaAtualCondicoesMoradiaCriacaoOutrosAnimais;
   }
 
   public void setResidenciaAtualCondicoesMoradiaCriacaoOutrosAnimais(Character residenciaAtualCondicoesMoradiaCriacaoOutrosAnimais)
   {
     this.residenciaAtualCondicoesMoradiaCriacaoOutrosAnimais = residenciaAtualCondicoesMoradiaCriacaoOutrosAnimais;
   }
 
   public String getResidenciaAtualCondicoesMoradiaOutrosAnimais() {
     return this.residenciaAtualCondicoesMoradiaOutrosAnimais;
   }
 
   public void setResidenciaAtualCondicoesMoradiaOutrosAnimais(String residenciaAtualCondicoesMoradiaOutrosAnimais)
   {
     this.residenciaAtualCondicoesMoradiaOutrosAnimais = residenciaAtualCondicoesMoradiaOutrosAnimais;
   }
 
   public Character getResidenciaAtualProximidadeMineradora() {
     return this.residenciaAtualProximidadeMineradora;
   }
 
   public void setResidenciaAtualProximidadeMineradora(Character residenciaAtualProximidadeMineradora)
   {
     this.residenciaAtualProximidadeMineradora = residenciaAtualProximidadeMineradora;
   }
 
   public Character getResidenciaAtualProximidadePedraSabao() {
     return this.residenciaAtualProximidadePedraSabao;
   }
 
   public void setResidenciaAtualProximidadePedraSabao(Character residenciaAtualProximidadePedraSabao)
   {
     this.residenciaAtualProximidadePedraSabao = residenciaAtualProximidadePedraSabao;
   }
 
   public Character getResidenciaAtualProximidadeFabricas() {
     return this.residenciaAtualProximidadeFabricas;
   }
 
   public void setResidenciaAtualProximidadeFabricas(Character residenciaAtualProximidadeFabricas)
   {
     this.residenciaAtualProximidadeFabricas = residenciaAtualProximidadeFabricas;
   }
 
   public String getResidenciaAtualProximidadeOutros() {
     return this.residenciaAtualProximidadeOutros;
   }
 
   public void setResidenciaAtualProximidadeOutros(String residenciaAtualProximidadeOutros)
   {
     this.residenciaAtualProximidadeOutros = residenciaAtualProximidadeOutros;
   }
 
   public String getResidenciaAnteriorCidade() {
     return this.residenciaAnteriorCidade;
   }
 
   public void setResidenciaAnteriorCidade(String residenciaAnteriorCidade) {
     this.residenciaAnteriorCidade = residenciaAnteriorCidade;
   }
 
   public String getResidenciaAnteriorEstadoUF() {
     return this.residenciaAnteriorEstadoUF;
   }
 
   public void setResidenciaAnteriorEstadoUF(String residenciaAnteriorEstadoUF) {
     this.residenciaAnteriorEstadoUF = residenciaAnteriorEstadoUF;
   }
 
   public String getResidenciaAnteriorZona() {
     return this.residenciaAnteriorZona;
   }
 
   public void setResidenciaAnteriorZona(String residenciaAnteriorZona) {
     this.residenciaAnteriorZona = residenciaAnteriorZona;
   }
 
   public Integer getResidenciaAnteriorTempoAnos() {
     return this.residenciaAnteriorTempoAnos;
   }
 
   public void setResidenciaAnteriorTempoAnos(Integer residenciaAnteriorTempoAnos) {
     this.residenciaAnteriorTempoAnos = residenciaAnteriorTempoAnos;
   }
 
   public Integer getResidenciaAnteriorTempoMeses() {
     return this.residenciaAnteriorTempoMeses;
   }
 
   public void setResidenciaAnteriorTempoMeses(Integer residenciaAnteriorTempoMeses) {
     this.residenciaAnteriorTempoMeses = residenciaAnteriorTempoMeses;
   }
 
   public Character getResidenciaAnteriorProximidadeMineradora() {
     return this.residenciaAnteriorProximidadeMineradora;
   }
 
   public void setResidenciaAnteriorProximidadeMineradora(Character residenciaAnteriorProximidadeMineradora)
   {
     this.residenciaAnteriorProximidadeMineradora = residenciaAnteriorProximidadeMineradora;
   }
 
   public Character getResidenciaAnteriorProximidadePedraSabao() {
     return this.residenciaAnteriorProximidadePedraSabao;
   }
 
   public void setResidenciaAnteriorProximidadePedraSabao(Character residenciaAnteriorProximidadePedraSabao)
   {
     this.residenciaAnteriorProximidadePedraSabao = residenciaAnteriorProximidadePedraSabao;
   }
 
   public Character getResidenciaAnteriorProximidadeFabricas() {
     return this.residenciaAnteriorProximidadeFabricas;
   }
 
   public void setResidenciaAnteriorProximidadeFabricas(Character residenciaAnteriorProximidadeFabricas)
   {
     this.residenciaAnteriorProximidadeFabricas = residenciaAnteriorProximidadeFabricas;
   }
 
   public String getResidenciaAnteriorProximidadeOutros() {
     return this.residenciaAnteriorProximidadeOutros;
   }
 
   public void setResidenciaAnteriorProximidadeOutros(String residenciaAnteriorProximidadeOutros)
   {
     this.residenciaAnteriorProximidadeOutros = residenciaAnteriorProximidadeOutros;
   }
 
   public Formulario getFormulario() {
     return this.formulario;
   }
 
   public void setFormulario(Formulario formulario) {
     this.formulario = formulario;
   }
 
   public void setDataNascimento(Date dataNascimento) {
     this.dataNascimento = dataNascimento;
   }
 
   public Data getDataNascimento() {
     Data data = new Data();
     if (this.dataNascimento != null) {
       data.setTime(this.dataNascimento.getTime());
       return data;
     }
     return null;
   }
 
   public String getResidenciaAnteriorBairro() {
     return this.residenciaAnteriorBairro;
   }
 
   public void setResidenciaAnteriorBairro(String residenciaAnteriorBairro) {
     this.residenciaAnteriorBairro = residenciaAnteriorBairro;
   }
 
   public String getResidenciaAtualMunicipio() {
     return this.residenciaAtualMunicipio;
   }
 
   public void setResidenciaAtualMunicipio(String residenciaAtualMunicipio) {
     this.residenciaAtualMunicipio = residenciaAtualMunicipio;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.InformacoesPessoais
 * JD-Core Version:    0.6.0
 */