 package br.com.lika.hpv.model.amostra;
 
 import br.com.lika.hpv.model.formulario.Formulario;
 import java.util.Date;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class Amostra
 {
 
   @Id
   @GeneratedValue
   private Long id;
   private Date dnaUteroData;
 
   @Column(length=16)
   private String dnaUteroCodigoBarras;
 
   @Column(length=25)
   private String dnaUteroArmazenamentoFreezer;
 
   @Column(length=25)
   private String dnaUteroArmazenamentoGaveta;
 
   @Column(length=25)
   private String dnaUteroArmazenamentoCaixa;
   private Date dnaSangueData;
 
   @Column(length=16)
   private String dnaSangueCodigoBarras;
 
   @Column(length=25)
   private String dnaSangueArmazenamentoFreezer;
 
   @Column(length=25)
   private String dnaSangueArmazenamentoGaveta;
 
   @Column(length=25)
   private String dnaSangueArmazenamentoCaixa;
   private Date dnaSoroAlfaData;
 
   @Column(length=16)
   private String dnaSoroAlfaCodigoBarras;
 
   @Column(length=25)
   private String dnaSoroAlfaArmazenamentoFreezer;
 
   @Column(length=25)
   private String dnaSoroAlfaArmazenamentoGaveta;
 
   @Column(length=25)
   private String dnaSoroAlfaArmazenamentoCaixa;
   private Date dnaSoroBetaData;
 
   @Column(length=16)
   private String dnaSoroBetaCodigoBarras;
 
   @Column(length=25)
   private String dnaSoroBetaArmazenamentoFreezer;
 
   @Column(length=25)
   private String dnaSoroBetaArmazenamentoGaveta;
 
   @Column(length=25)
   private String dnaSoroBetaArmazenamentoCaixa;
   private Date dnaLaminaData;
 
   @Column(length=16)
   private String laminaCodigoBarras;
 
   @Column(length=25)
   private String dnaLaminaArmazenamentoFreezer;
 
   @Column(length=25)
   private String dnaLaminaArmazenamentoGaveta;
 
   @Column(length=25)
   private String dnaLaminaArmazenamentoCaixa;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.MERGE}, fetch=FetchType.LAZY, optional=false)
   private Formulario formulario;
 
   public Long getId()
   {
     return this.id;
   }
 
   public void setId(Long id) {
     this.id = id;
   }
 
   public Date getDnaUteroData() {
     return this.dnaUteroData;
   }
 
   public void setDnaUteroData(Date dnaUteroData) {
     this.dnaUteroData = dnaUteroData;
   }
 
   public String getDnaUteroCodigoBarras() {
     return this.dnaUteroCodigoBarras;
   }
 
   public void setDnaUteroCodigoBarras(String dnaUteroCodigoBarras) {
     this.dnaUteroCodigoBarras = dnaUteroCodigoBarras;
   }
 
   public String getDnaUteroArmazenamentoFreezer() {
     return this.dnaUteroArmazenamentoFreezer;
   }
 
   public void setDnaUteroArmazenamentoFreezer(String dnaUteroArmazenamentoFreezer) {
     this.dnaUteroArmazenamentoFreezer = dnaUteroArmazenamentoFreezer;
   }
 
   public String getDnaUteroArmazenamentoGaveta() {
     return this.dnaUteroArmazenamentoGaveta;
   }
 
   public void setDnaUteroArmazenamentoGaveta(String dnaUteroArmazenamentoGaveta) {
     this.dnaUteroArmazenamentoGaveta = dnaUteroArmazenamentoGaveta;
   }
 
   public String getDnaUteroArmazenamentoCaixa() {
     return this.dnaUteroArmazenamentoCaixa;
   }
 
   public void setDnaUteroArmazenamentoCaixa(String dnaUteroArmazenamentoCaixa) {
     this.dnaUteroArmazenamentoCaixa = dnaUteroArmazenamentoCaixa;
   }
 
   public Date getDnaSangueData() {
     return this.dnaSangueData;
   }
 
   public void setDnaSangueData(Date dnaSangueData) {
     this.dnaSangueData = dnaSangueData;
   }
 
   public String getDnaSangueCodigoBarras() {
     return this.dnaSangueCodigoBarras;
   }
 
   public void setDnaSangueCodigoBarras(String dnaSangueCodigoBarras) {
     this.dnaSangueCodigoBarras = dnaSangueCodigoBarras;
   }
 
   public String getDnaSangueArmazenamentoFreezer() {
     return this.dnaSangueArmazenamentoFreezer;
   }
 
   public void setDnaSangueArmazenamentoFreezer(String dnaSangueArmazenamentoFreezer)
   {
     this.dnaSangueArmazenamentoFreezer = dnaSangueArmazenamentoFreezer;
   }
 
   public String getDnaSangueArmazenamentoGaveta() {
     return this.dnaSangueArmazenamentoGaveta;
   }
 
   public void setDnaSangueArmazenamentoGaveta(String dnaSangueArmazenamentoGaveta) {
     this.dnaSangueArmazenamentoGaveta = dnaSangueArmazenamentoGaveta;
   }
 
   public String getDnaSangueArmazenamentoCaixa() {
     return this.dnaSangueArmazenamentoCaixa;
   }
 
   public void setDnaSangueArmazenamentoCaixa(String dnaSangueArmazenamentoCaixa) {
     this.dnaSangueArmazenamentoCaixa = dnaSangueArmazenamentoCaixa;
   }
 
   public Date getDnaSoroAlfaData() {
     return this.dnaSoroAlfaData;
   }
 
   public void setDnaSoroAlfaData(Date dnaSoroAlfaData) {
     this.dnaSoroAlfaData = dnaSoroAlfaData;
   }
 
   public String getDnaSoroAlfaCodigoBarras() {
     return this.dnaSoroAlfaCodigoBarras;
   }
 
   public void setDnaSoroAlfaCodigoBarras(String dnaSoroAlfaCodigoBarras) {
     this.dnaSoroAlfaCodigoBarras = dnaSoroAlfaCodigoBarras;
   }
 
   public String getDnaSoroAlfaArmazenamentoFreezer() {
     return this.dnaSoroAlfaArmazenamentoFreezer;
   }
 
   public void setDnaSoroAlfaArmazenamentoFreezer(String dnaSoroAlfaArmazenamentoFreezer)
   {
     this.dnaSoroAlfaArmazenamentoFreezer = dnaSoroAlfaArmazenamentoFreezer;
   }
 
   public String getDnaSoroAlfaArmazenamentoGaveta() {
     return this.dnaSoroAlfaArmazenamentoGaveta;
   }
 
   public void setDnaSoroAlfaArmazenamentoGaveta(String dnaSoroAlfaArmazenamentoGaveta)
   {
     this.dnaSoroAlfaArmazenamentoGaveta = dnaSoroAlfaArmazenamentoGaveta;
   }
 
   public String getDnaSoroAlfaArmazenamentoCaixa() {
     return this.dnaSoroAlfaArmazenamentoCaixa;
   }
 
   public void setDnaSoroAlfaArmazenamentoCaixa(String dnaSoroAlfaArmazenamentoCaixa)
   {
     this.dnaSoroAlfaArmazenamentoCaixa = dnaSoroAlfaArmazenamentoCaixa;
   }
 
   public Date getDnaSoroBetaData() {
     return this.dnaSoroBetaData;
   }
 
   public void setDnaSoroBetaData(Date dnaSoroBetaData) {
     this.dnaSoroBetaData = dnaSoroBetaData;
   }
 
   public String getDnaSoroBetaCodigoBarras() {
     return this.dnaSoroBetaCodigoBarras;
   }
 
   public void setDnaSoroBetaCodigoBarras(String dnaSoroBetaCodigoBarras) {
     this.dnaSoroBetaCodigoBarras = dnaSoroBetaCodigoBarras;
   }
 
   public String getDnaSoroBetaArmazenamentoFreezer() {
     return this.dnaSoroBetaArmazenamentoFreezer;
   }
 
   public void setDnaSoroBetaArmazenamentoFreezer(String dnaSoroBetaArmazenamentoFreezer)
   {
     this.dnaSoroBetaArmazenamentoFreezer = dnaSoroBetaArmazenamentoFreezer;
   }
 
   public String getDnaSoroBetaArmazenamentoGaveta() {
     return this.dnaSoroBetaArmazenamentoGaveta;
   }
 
   public void setDnaSoroBetaArmazenamentoGaveta(String dnaSoroBetaArmazenamentoGaveta)
   {
     this.dnaSoroBetaArmazenamentoGaveta = dnaSoroBetaArmazenamentoGaveta;
   }
 
   public String getDnaSoroBetaArmazenamentoCaixa() {
     return this.dnaSoroBetaArmazenamentoCaixa;
   }
 
   public void setDnaSoroBetaArmazenamentoCaixa(String dnaSoroBetaArmazenamentoCaixa)
   {
     this.dnaSoroBetaArmazenamentoCaixa = dnaSoroBetaArmazenamentoCaixa;
   }
 
   public Date getDnaLaminaData() {
     return this.dnaLaminaData;
   }
 
   public void setDnaLaminaData(Date dnaLaminaData) {
     this.dnaLaminaData = dnaLaminaData;
   }
 
   public String getLaminaCodigoBarras() {
     return this.laminaCodigoBarras;
   }
 
   public void setLaminaCodigoBarras(String laminaCodigoBarras) {
     this.laminaCodigoBarras = laminaCodigoBarras;
   }
 
   public String getDnaLaminaArmazenamentoFreezer() {
     return this.dnaLaminaArmazenamentoFreezer;
   }
 
   public void setDnaLaminaArmazenamentoFreezer(String dnaLaminaArmazenamentoFreezer)
   {
     this.dnaLaminaArmazenamentoFreezer = dnaLaminaArmazenamentoFreezer;
   }
 
   public String getDnaLaminaArmazenamentoGaveta() {
     return this.dnaLaminaArmazenamentoGaveta;
   }
 
   public void setDnaLaminaArmazenamentoGaveta(String dnaLaminaArmazenamentoGaveta) {
     this.dnaLaminaArmazenamentoGaveta = dnaLaminaArmazenamentoGaveta;
   }
 
   public String getDnaLaminaArmazenamentoCaixa() {
     return this.dnaLaminaArmazenamentoCaixa;
   }
 
   public void setDnaLaminaArmazenamentoCaixa(String dnaLaminaArmazenamentoCaixa) {
     this.dnaLaminaArmazenamentoCaixa = dnaLaminaArmazenamentoCaixa;
   }
 
   public Formulario getFormulario() {
     return this.formulario;
   }
 
   public void setFormulario(Formulario formulario) {
     this.formulario = formulario;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.amostra.Amostra
 * JD-Core Version:    0.6.0
 */