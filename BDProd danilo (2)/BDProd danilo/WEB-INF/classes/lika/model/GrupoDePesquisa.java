/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
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
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 * 
 * @author Marcio
 */
@Entity
@Table(name = "grupo")
public class GrupoDePesquisa implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	@Column(name = "idGrupo")
	private Integer idGrupoDePesquisa;
	private String nome;
	private String objetivo;
	private String descricao;
	private String situacao;
	private Date dataEncerramento;
	private String url;
	private String email;
	private Boolean grupoCnpq;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "pessoagrupo", joinColumns = @JoinColumn(name = "Grupo_idGrupo"), inverseJoinColumns = @JoinColumn(name = "Pessoa_idPessoa"))
	private List<Pessoa> integrantes = new ArrayList<Pessoa>();
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "Grupo_idGrupo")
	private List<Projeto> projetos = new ArrayList<Projeto>();
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "subareadepesquisagrupo", joinColumns = @JoinColumn(name = "Grupo_idGrupo"), inverseJoinColumns = @JoinColumn(name = "SubAreaDePesquisa_idSubAreaDePesquisa"))
	protected List<SubAreaDePesquisa> areasPesquisa = new ArrayList<SubAreaDePesquisa>();
	@ManyToOne
	@JoinColumn(name = "responsavel")
	private Pesquisador responsavel;
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

	public GrupoDePesquisa(Integer idGrupoDePesquisa, String nome) {
		this.idGrupoDePesquisa = idGrupoDePesquisa;
		this.nome = nome;
	}

	public List<SubAreaDePesquisa> getAreasPesquisa() {
		return areasPesquisa;
	}

	public void setAreasPesquisa(List<SubAreaDePesquisa> areasPesquisa) {
		this.areasPesquisa = areasPesquisa;
	}

	public GrupoDePesquisa() {
	}

	public Integer getIdGrupoDePesquisa() {
		return idGrupoDePesquisa;
	}

	public void setIdGrupoDePesquisa(Integer idGrupoDePesquisa) {
		this.idGrupoDePesquisa = idGrupoDePesquisa;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getObjetivo() {
		return objetivo;
	}

	public void setObjetivo(String objetivo) {
		this.objetivo = objetivo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getSituacao() {
		return situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public Date getDataEncerramento() {
		return dataEncerramento;
	}

	public void setDataEncerramento(Date dataEncerramento) {
		this.dataEncerramento = dataEncerramento;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Pessoa> getIntegrantes() {
		return integrantes;
	}

	public void setIntegrantes(List<Pessoa> integrantes) {
		this.integrantes = integrantes;
	}

	public List<Projeto> getProjetos() {
		return projetos;
	}

	public void setProjetos(List<Projeto> projetos) {
		this.projetos = projetos;
	}

	public Boolean getGrupoCnpq() {
		return grupoCnpq;
	}

	public Pesquisador getResponsavel() {
		return responsavel;
	}

	public void setResponsavel(Pesquisador responsavel) {
		this.responsavel = responsavel;
	}

	public void setGrupoCnpq(Boolean grupoCnpq) {
		this.grupoCnpq = grupoCnpq;
	}
}
