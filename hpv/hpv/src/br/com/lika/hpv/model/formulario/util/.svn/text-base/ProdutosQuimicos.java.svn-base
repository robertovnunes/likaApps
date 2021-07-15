 package br.com.lika.hpv.model.formulario.util;
 
 import br.com.lika.hpv.model.formulario.SituacaoSocioEconomicaDemografica;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class ProdutosQuimicos
 {
 
   @Id
   @GeneratedValue
   private Long id;
   private Character tintas;
   private Character combustiveis;
   private Character preservativoMadeira;
   private Character solvente;
   private Character inseticidas;
   private Character corantes;
   private Character resinas;
   private Character acidos;
   private Character plasticos;
   private Character borracha;
   private Character ns_nr;
 
   @Column(length=50)
   private String outros;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.MERGE}, fetch=FetchType.LAZY)
   private SituacaoSocioEconomicaDemografica situacaoSocioEconomicaDemografica;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public Character getTintas() {
     return this.tintas;
   }
   public void setTintas(Character tintas) {
     this.tintas = tintas;
   }
   public Character getCombustiveis() {
     return this.combustiveis;
   }
   public void setCombustiveis(Character combustiveis) {
     this.combustiveis = combustiveis;
   }
   public Character getPreservativoMadeira() {
     return this.preservativoMadeira;
   }
   public void setPreservativoMadeira(Character preservativoMadeira) {
     this.preservativoMadeira = preservativoMadeira;
   }
   public Character getSolvente() {
     return this.solvente;
   }
   public void setSolvente(Character solvente) {
     this.solvente = solvente;
   }
   public Character getInseticidas() {
     return this.inseticidas;
   }
   public void setInseticidas(Character inseticidas) {
     this.inseticidas = inseticidas;
   }
   public Character getCorantes() {
     return this.corantes;
   }
   public void setCorantes(Character corantes) {
     this.corantes = corantes;
   }
   public Character getResinas() {
     return this.resinas;
   }
   public void setResinas(Character resinas) {
     this.resinas = resinas;
   }
   public Character getAcidos() {
     return this.acidos;
   }
   public void setAcidos(Character acidos) {
     this.acidos = acidos;
   }
   public Character getPlasticos() {
     return this.plasticos;
   }
   public void setPlasticos(Character plasticos) {
     this.plasticos = plasticos;
   }
   public Character getBorracha() {
     return this.borracha;
   }
   public void setBorracha(Character borracha) {
     this.borracha = borracha;
   }
   public Character getNs_nr() {
     return this.ns_nr;
   }
   public void setNs_nr(Character ns_nr) {
     this.ns_nr = ns_nr;
   }
   public String getOutros() {
     return this.outros;
   }
   public void setOutros(String outros) {
     this.outros = outros;
   }
   public SituacaoSocioEconomicaDemografica getSituacaoSocioEconomicaDemografica() {
     return this.situacaoSocioEconomicaDemografica;
   }
 
   public void setSituacaoSocioEconomicaDemografica(SituacaoSocioEconomicaDemografica situacaoSocioEconomicaDemografica) {
     this.situacaoSocioEconomicaDemografica = situacaoSocioEconomicaDemografica;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.ProdutosQuimicos
 * JD-Core Version:    0.6.0
 */