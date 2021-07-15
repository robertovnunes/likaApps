 package br.com.lika.hpv.model.formulario.util;
 
 import br.com.lika.hpv.model.formulario.HistoricoClinico;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class Cancer
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=3)
   private String medicoDisseLocalCancer;
   private Integer idadeQuandoDisseramCancer;
 
   @Column(length=3)
   private String iniciouTratamentoCancer;
 
   @Column(length=3)
   private String continuaTratamentoCancer;
 
   @Column(length=25)
   private String porqueParouTratamentoCancer;
 
   @Column(length=50)
   private String localCancer;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH}, fetch=FetchType.LAZY)
   private HistoricoClinico historicoClinico;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public String getMedicoDisseLocalCancer() {
     return this.medicoDisseLocalCancer;
   }
   public void setMedicoDisseLocalCancer(String medicoDisseLocalCancer) {
     this.medicoDisseLocalCancer = medicoDisseLocalCancer;
   }
   public Integer getIdadeQuandoDisseramCancer() {
     return this.idadeQuandoDisseramCancer;
   }
   public void setIdadeQuandoDisseramCancer(Integer idadeQuandoDisseramCancer) {
     this.idadeQuandoDisseramCancer = idadeQuandoDisseramCancer;
   }
   public String getIniciouTratamentoCancer() {
     return this.iniciouTratamentoCancer;
   }
   public void setIniciouTratamentoCancer(String iniciouTratamentoCancer) {
     this.iniciouTratamentoCancer = iniciouTratamentoCancer;
   }
   public String getContinuaTratamentoCancer() {
     return this.continuaTratamentoCancer;
   }
   public void setContinuaTratamentoCancer(String continuaTratamentoCancer) {
     this.continuaTratamentoCancer = continuaTratamentoCancer;
   }
   public String getPorqueParouTratamentoCancer() {
     return this.porqueParouTratamentoCancer;
   }
   public void setPorqueParouTratamentoCancer(String porqueParouTratamentoCancer) {
     this.porqueParouTratamentoCancer = porqueParouTratamentoCancer;
   }
   public String getLocalCancer() {
     return this.localCancer;
   }
   public void setLocalCancer(String localCancer) {
     this.localCancer = localCancer;
   }
   public HistoricoClinico getHistoricoClinico() {
     return this.historicoClinico;
   }
   public void setHistoricoClinico(HistoricoClinico historicoClinico) {
     this.historicoClinico = historicoClinico;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.Cancer
 * JD-Core Version:    0.6.0
 */