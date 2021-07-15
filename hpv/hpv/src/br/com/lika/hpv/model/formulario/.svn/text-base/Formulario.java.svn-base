 package br.com.lika.hpv.model.formulario;
 
 import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Cascade;
import org.hibernate.validator.NotNull;

import br.com.lika.hpv.model.amostra.Amostra;
import br.com.lika.hpv.model.anexo.Anexo;
import br.com.lika.hpv.model.formulario.util.Data;
import br.com.lika.hpv.model.laudo.LaudoCitopatologico;
import br.com.lika.hpv.model.laudo.LaudoClamidia;
import br.com.lika.hpv.model.laudo.LaudoHbv;
import br.com.lika.hpv.model.laudo.LaudoHcv;
import br.com.lika.hpv.model.laudo.LaudoHiv;
import br.com.lika.hpv.model.laudo.LaudoHpv;
import br.com.lika.hpv.model.laudo.LaudoSifilis;
 
 @Entity 
 public class Formulario
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column
   private Date dataCadastro;
 
   @NotNull
   @Column
   private Date data;

   @Column(length=30)
   private String numeroProntuario;
 
 
   @Column(length=30, unique = true)
   private String codigoPronex;
 
   @Column(length=100)
   private String localColeta;
 
   @Column(length=15)
   private String grupoParticipante;
 
   @Column(length=20)
   private String codigoBarras;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="formulario", targetEntity=InformacoesPessoais.class)
   private InformacoesPessoais informacoesPessoais;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="formulario", targetEntity=SituacaoSocioEconomicaDemografica.class)
   private SituacaoSocioEconomicaDemografica situacaoSocioEconomicaDemografica;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="formulario", targetEntity=HistoricoSexual.class)
   private HistoricoSexual historicoSexual;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="formulario", targetEntity=HistoricoClinico.class)
   private HistoricoClinico historicoClinico;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="formulario", targetEntity=HistoricoFamiliar.class)
   private HistoricoFamiliar historicoFamiliar;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="formulario", targetEntity=HistoricoAlimentar.class)
   private HistoricoAlimentar historicoAlimentar;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="formulario", targetEntity=Tabagismo.class)
   private Tabagismo tabagismo;
   
   @Column
   private Integer qntsDiasSemanaCaminhada;
 
   @Column(length=5)
   private String praticaAtividadesModeradas;
   
   @Column
   private Integer qntsDiasSemanaisPraticaEstasAtividades;
 
   @Column(length=17)
   private String estadoAtencaoEntrevistado;
 
   @Column(length=30)
   private String compreensaoEntrevistado;
   
   @Column
   private Date dataEntrevista;
 
   @Column(length=130)
   private String nomeEntrevistador;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="formulario", targetEntity=LaudoClamidia.class)
   private LaudoClamidia laudoClamidia;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="formulario", targetEntity=LaudoHbv.class)
   private LaudoHbv laudoHbv;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="formulario", targetEntity=LaudoHcv.class)
   private LaudoHcv laudoHcv;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="formulario", targetEntity=LaudoHiv.class)
   private LaudoHiv laudoHiv;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="formulario", targetEntity=LaudoHpv.class)
   private LaudoHpv laudoHpv;
 
   
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="formulario", targetEntity=LaudoSifilis.class)
   private LaudoSifilis laudoSifilis;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="formulario", targetEntity=LaudoCitopatologico.class)
   private LaudoCitopatologico laudoCitopatologico;
 
   @OneToOne(cascade={javax.persistence.CascadeType.ALL}, mappedBy="formulario", targetEntity=Amostra.class)
   private Amostra amostra;
 
   @OneToMany(cascade={javax.persistence.CascadeType.MERGE}, mappedBy="formulario", targetEntity=Anexo.class)
   @Cascade({org.hibernate.annotations.CascadeType.DELETE_ORPHAN, org.hibernate.annotations.CascadeType.ALL})
   private List<Anexo> anexos;
   
   @OneToMany(cascade=CascadeType.ALL, mappedBy="formulario", targetEntity=HistoricoModificacoes.class, fetch=FetchType.LAZY)
   private Set<HistoricoModificacoes> modificacoes;
   
   public Formulario(){
	   this.anexos = new ArrayList<Anexo>();
	   this.modificacoes = new HashSet<HistoricoModificacoes>();
   }
   
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public Date getDataCadastro() {
     return this.dataCadastro;
   }
   public void setDataCadastro(Date dataCadastro) {
     this.dataCadastro = dataCadastro;
   }
   public String getNumeroProntuario() {
     return this.numeroProntuario;
   }
   public void setNumeroProntuario(String numeroProntuario) {
     this.numeroProntuario = numeroProntuario;
   }
   public Data getData() {
     Data data = new Data();
     if (this.data != null) {
       data.setTime(this.data.getTime());
       return data;
     }
     return null;
   }
   public void setData(Date data) {
     this.data = data;
   }
   public String getCodigoPronex() {
     return this.codigoPronex;
   }
   public void setCodigoPronex(String codigoPronex) {
     this.codigoPronex = codigoPronex;
   }
   public String getLocalColeta() {
     return this.localColeta;
   }
   public void setLocalColeta(String localColeta) {
     this.localColeta = localColeta;
   }
   public String getGrupoParticipante() {
     return this.grupoParticipante;
   }
   public void setGrupoParticipante(String grupoParticipante) {
     this.grupoParticipante = grupoParticipante;
   }
   public String getCodigoBarras() {
     return this.codigoBarras;
   }
   public void setCodigoBarras(String codigoBarras) {
     this.codigoBarras = codigoBarras;
   }
   public InformacoesPessoais getInformacoesPessoais() {
     return this.informacoesPessoais;
   }
   public void setInformacoesPessoais(InformacoesPessoais informacoesPessoais) {
     this.informacoesPessoais = informacoesPessoais;
   }
   public SituacaoSocioEconomicaDemografica getSituacaoSocioEconomicaDemografica() {
     return this.situacaoSocioEconomicaDemografica;
   }
 
   public void setSituacaoSocioEconomicaDemografica(SituacaoSocioEconomicaDemografica situacaoSocioEconomicaDemografica) {
     this.situacaoSocioEconomicaDemografica = situacaoSocioEconomicaDemografica;
   }
   public HistoricoSexual getHistoricoSexual() {
     return this.historicoSexual;
   }
   public void setHistoricoSexual(HistoricoSexual historicoSexual) {
     this.historicoSexual = historicoSexual;
   }
   public HistoricoClinico getHistoricoClinico() {
     return this.historicoClinico;
   }
   public void setHistoricoClinico(HistoricoClinico historicoClinico) {
     this.historicoClinico = historicoClinico;
   }
   public HistoricoFamiliar getHistoricoFamiliar() {
     return this.historicoFamiliar;
   }
   public void setHistoricoFamiliar(HistoricoFamiliar historicoFamiliar) {
     this.historicoFamiliar = historicoFamiliar;
   }
   public HistoricoAlimentar getHistoricoAlimentar() {
     return this.historicoAlimentar;
   }
   public void setHistoricoAlimentar(HistoricoAlimentar historicoAlimentar) {
     this.historicoAlimentar = historicoAlimentar;
   }
   public Tabagismo getTabagismo() {
     return this.tabagismo;
   }
   public void setTabagismo(Tabagismo tabagismo) {
     this.tabagismo = tabagismo;
   }
   public Integer getQntsDiasSemanaCaminhada() {
     return this.qntsDiasSemanaCaminhada;
   }
   public void setQntsDiasSemanaCaminhada(Integer qntsDiasSemanaCaminhada) {
     this.qntsDiasSemanaCaminhada = qntsDiasSemanaCaminhada;
   }
   public String getPraticaAtividadesModeradas() {
     return this.praticaAtividadesModeradas;
   }
   public void setPraticaAtividadesModeradas(String praticaAtividadesModeradas) {
     this.praticaAtividadesModeradas = praticaAtividadesModeradas;
   }
   public Integer getQntsDiasSemanaisPraticaEstasAtividades() {
     return this.qntsDiasSemanaisPraticaEstasAtividades;
   }
 
   public void setQntsDiasSemanaisPraticaEstasAtividades(Integer qntsDiasSemanaisPraticaEstasAtividades) {
     this.qntsDiasSemanaisPraticaEstasAtividades = qntsDiasSemanaisPraticaEstasAtividades;
   }
   public String getEstadoAtencaoEntrevistado() {
     return this.estadoAtencaoEntrevistado;
   }
   public void setEstadoAtencaoEntrevistado(String estadoAtencaoEntrevistado) {
     this.estadoAtencaoEntrevistado = estadoAtencaoEntrevistado;
   }
   public String getCompreensaoEntrevistado() {
     return this.compreensaoEntrevistado;
   }
   public void setCompreensaoEntrevistado(String compreensaoEntrevistado) {
     this.compreensaoEntrevistado = compreensaoEntrevistado;
   }
   public Date getDataEntrevista() {
     Data data = new Data();
     if (this.dataEntrevista != null) {
       data.setTime(this.dataEntrevista.getTime());
       return data;
     }
     return null;
   }
   public void setDataEntrevista(Date dataEntrevista) {
     this.dataEntrevista = dataEntrevista;
   }
   public String getNomeEntrevistador() {
     return this.nomeEntrevistador;
   }
   public void setNomeEntrevistador(String nomeEntrevistador) {
     this.nomeEntrevistador = nomeEntrevistador;
   }
   public LaudoClamidia getLaudoClamidia() {
     return this.laudoClamidia;
   }
   public void setLaudoClamidia(LaudoClamidia laudoClamidia) {
     this.laudoClamidia = laudoClamidia;
   }
   public LaudoHbv getLaudoHbv() {
     return this.laudoHbv;
   }
   public void setLaudoHbv(LaudoHbv laudoHbv) {
     this.laudoHbv = laudoHbv;
   }
   public LaudoHcv getLaudoHcv() {
     return this.laudoHcv;
   }
   public void setLaudoHcv(LaudoHcv laudoHcv) {
     this.laudoHcv = laudoHcv;
   }
   public LaudoHiv getLaudoHiv() {
     return this.laudoHiv;
   }
   public void setLaudoHiv(LaudoHiv laudoHiv) {
     this.laudoHiv = laudoHiv;
   }
   public LaudoHpv getLaudoHpv() {
     return this.laudoHpv;
   }
   public void setLaudoHpv(LaudoHpv laudoHpv) {
     this.laudoHpv = laudoHpv;
   }
   public LaudoSifilis getLaudoSifilis() {
     return this.laudoSifilis;
   }
   public void setLaudoSifilis(LaudoSifilis laudoSifilis) {
     this.laudoSifilis = laudoSifilis;
   }
   public LaudoCitopatologico getLaudoCitopatologico() {
     return this.laudoCitopatologico;
   }
   public void setLaudoCitopatologico(LaudoCitopatologico laudoCitopatologico) {
     this.laudoCitopatologico = laudoCitopatologico;
   }
   public Amostra getAmostra() {
     return this.amostra;
   }
   public void setAmostra(Amostra amostra) {
     this.amostra = amostra;
   }
   public List<Anexo> getAnexos() {
     return this.anexos;
   }
   public void setAnexos(List<Anexo> anexos) {
     this.anexos = anexos;
   }
public Set<HistoricoModificacoes> getModificacoes() {
	return modificacoes;
}
public void setModificacoes(Set<HistoricoModificacoes> modificacoes) {
	this.modificacoes = modificacoes;
}
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.Formulario
 * JD-Core Version:    0.6.0
 */