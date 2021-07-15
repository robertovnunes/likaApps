 package br.com.lika.hpv.model.formulario.util;
 
 import br.com.lika.hpv.model.formulario.HistoricoClinico;
 import javax.persistence.Column;
 import javax.persistence.Entity;
 import javax.persistence.FetchType;
 import javax.persistence.GeneratedValue;
 import javax.persistence.Id;
 import javax.persistence.OneToOne;
 
 @Entity
 public class Imunossupressoras
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=1)
   private String imunomoduladores;
 
   @Column(length=1)
   private String imunossupressora;
 
   @Column(length=1)
   private String antibiotico;
 
   @Column(length=1)
   private String cardiovascular;
 
   @Column(length=1)
   private String psicotropico;
 
   @Column(length=1)
   private Boolean ns_nr;
 
   @OneToOne(cascade={javax.persistence.CascadeType.REFRESH, javax.persistence.CascadeType.MERGE}, fetch=FetchType.LAZY)
   private HistoricoClinico historicoClinico;
 
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public String getImunomoduladores() {
     return this.imunomoduladores;
   }
   public void setImunomoduladores(String imunomoduladores) {
     this.imunomoduladores = imunomoduladores;
   }
   public String getImunossupressora() {
     return this.imunossupressora;
   }
   public void setImunossupressora(String imunossupressora) {
     this.imunossupressora = imunossupressora;
   }
   public String getAntibiotico() {
     return this.antibiotico;
   }
   public void setAntibiotico(String antibiotico) {
     this.antibiotico = antibiotico;
   }
   public String getCardiovascular() {
     return this.cardiovascular;
   }
   public void setCardiovascular(String cardiovascular) {
     this.cardiovascular = cardiovascular;
   }
   public String getPsicotropico() {
     return this.psicotropico;
   }
   public void setPsicotropico(String psicotropico) {
     this.psicotropico = psicotropico;
   }
   public Boolean getNs_nr() {
     return this.ns_nr;
   }
   public void setNs_nr(Boolean ns_nr) {
     this.ns_nr = ns_nr;
   }
   public HistoricoClinico getHistoricoClinico() {
     return this.historicoClinico;
   }
   public void setHistoricoClinico(HistoricoClinico historicoClinico) {
     this.historicoClinico = historicoClinico;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.Imunossupressoras
 * JD-Core Version:    0.6.0
 */