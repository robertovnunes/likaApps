/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.model;

import java.io.Serializable;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;

/**
 * 
 * @author Marcio
 */
@Entity
@Table(name = "projeto")
public class Projeto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Transient
	private String nomeSubprojeto;

	public String getNomeSubprojeto() {
		return nomeSubprojeto;
	}

	public void setNomeSubprojeto(String nomeSubprojeto) {
		this.nomeSubprojeto = nomeSubprojeto;
	}

	public Projeto(Integer idProjeto, String nome, String subProjeto) {
		this.idProjeto = idProjeto;
		this.nome = nome;
		this.nomeSubprojeto = subProjeto;
	}

	@Id
	@GeneratedValue
	private Integer idProjeto;
	private String nome;
	@Temporal(javax.persistence.TemporalType.DATE)
	private Date dataInicio;
	@Column(name = "dataConclusao")
	@Temporal(javax.persistence.TemporalType.DATE)
	private Date dataFim;
	private String situacaoAtual;
	private String descricao;
	private boolean financiamento;
	private String orgaoFinanciador;
	private String valorTotal;
	private String valor;
	private String tipo;
	private String referencia;

	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "Projeto_idProjeto")
	@Cascade( { org.hibernate.annotations.CascadeType.MERGE,
			org.hibernate.annotations.CascadeType.SAVE_UPDATE })
	private List<Publicacao> publicacoes = new ArrayList<Publicacao>();
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "pessoaprojeto", joinColumns = @JoinColumn(name = "Projeto_idProjeto"), inverseJoinColumns = @JoinColumn(name = "Pessoa_idPessoa"))
	private List<Pessoa> participantes = new ArrayList<Pessoa>();
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "Projeto_idProjeto")
	@OrderBy(value = "nome desc")
	@Cascade( { org.hibernate.annotations.CascadeType.SAVE_UPDATE })
	private List<Equipamento> equipamentosAdiquiridos = new ArrayList<Equipamento>();
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "projetosubareadepesquisa", joinColumns = @JoinColumn(name = "Projeto_idProjeto"), inverseJoinColumns = @JoinColumn(name = "SubAreaDePesquisa_idSubAreaDePesquisa"))
	@OrderBy(value = "nome desc")
	private List<SubAreaDePesquisa> subAreasDePesquisas = new ArrayList<SubAreaDePesquisa>();
	@ManyToOne
	@JoinColumn(name = "GrandeAreaDePesquisa_idAreaDePesquisa")
	private AreaDePesquisa grandeArea;
	@ManyToOne
	@JoinColumn(name = "gerente")
	private Pesquisador gerente;
	@ManyToOne
	@JoinColumn(name = "viceGerente")
	private Pesquisador viceGerente;
	@ManyToOne
	@JoinColumn(name = "Grupo_idGrupo")
	private GrupoDePesquisa grupo;
	@OneToOne
	@JoinColumn(name = "idPessoaAtualizou")
	private Usuario usuarioAtualizou;
	@Temporal(javax.persistence.TemporalType.TIMESTAMP)
	private Date dataAtualizacao;

	public Date getDataAtualizacao() {
		return dataAtualizacao;
	}

	public void setDataAtualizacao(Date dataAtualizacao) {
		this.dataAtualizacao = dataAtualizacao;
	}

	public Usuario getUsuarioAtualizou() {
		return usuarioAtualizou;
	}

	public void setUsuarioAtualizou(Usuario usuarioAtualizou) {
		this.usuarioAtualizou = usuarioAtualizou;
	}

	// public Projeto(Integer idProjeto, String nome, String situacaoAtual) {
	// this.idProjeto = idProjeto;
	// this.nome = nome;
	// this.situacaoAtual = situacaoAtual;
	// }

	public Projeto(Integer idProjeto, String nome) {
		this.idProjeto = idProjeto;
		this.nome = nome;
	}

	public Projeto(Integer idProjeto, String nome, String situacao,
			String descricao) {
		this.idProjeto = idProjeto;
		this.nome = nome;
		this.situacaoAtual = situacao;
		this.descricao = descricao;
	}

	public List<SubAreaDePesquisa> getSubAreasDePesquisas() {
		return subAreasDePesquisas;
	}

	public AreaDePesquisa getGrandeArea() {
		return grandeArea;
	}

	public void setSubAreasDePesquisas(List<SubAreaDePesquisa> areasDePesquisas) {
		this.subAreasDePesquisas = areasDePesquisas;
	}

	public void setGrandeArea(AreaDePesquisa grandeArea) {
		this.grandeArea = grandeArea;
	}

	public Projeto() {
		this.tipo = "Interno";
	}

	public Integer getIdProjeto() {
		return idProjeto;
	}

	public void setIdProjeto(Integer idProjeto) {
		this.idProjeto = idProjeto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Date getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

	public Date getDataFim() {
		return dataFim;
	}

	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}

	public String getSituacaoAtual() {
		return situacaoAtual;
	}

	public void setSituacaoAtual(String situacaoAtual) {
		this.situacaoAtual = situacaoAtual;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public boolean isFinanciamento() {
		return financiamento;
	}

	public void setFinanciamento(boolean financiamento) {
		this.financiamento = financiamento;
	}

	public String getOrgaoFinanciador() {
		return orgaoFinanciador;
	}

	public void setOrgaoFinanciador(String orgaoFinanciador) {
		this.orgaoFinanciador = orgaoFinanciador;
	}

	public String getValorTotal() {
		return valorTotal;
	}

	public void setValorTotal(String valorTotal) {
		this.valorTotal = valorTotal;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getReferencia() {
		return referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}

	public List<Publicacao> getPublicacoes() {
		return publicacoes;
	}

	public void setPublicacoes(List<Publicacao> publicacoes) {
		this.publicacoes = publicacoes;
	}

	public List<Pessoa> getParticipantes() {
		return participantes;
	}

	public void setParticipantes(List<Pessoa> participantes) {
		this.participantes = participantes;
	}

	public List<Equipamento> getEquipamentosAdiquiridos() {
		return equipamentosAdiquiridos;
	}

	public void setEquipamentosAdiquiridos(
			List<Equipamento> equipamentosAdiquiridos) {
		this.equipamentosAdiquiridos = equipamentosAdiquiridos;
	}

	public Pesquisador getGerente() {
		return gerente;
	}

	public void setGerente(Pesquisador gerente) {
		this.gerente = gerente;
	}

	public Pesquisador getViceGerente() {
		return viceGerente;
	}

	public void setViceGerente(Pesquisador viceGerente) {
		this.viceGerente = viceGerente;
	}

	public GrupoDePesquisa getGrupo() {
		return grupo;
	}

	public void setGrupo(GrupoDePesquisa grupo) {
		this.grupo = grupo;
	}

}
