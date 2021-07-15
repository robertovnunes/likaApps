/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 * 
 * @author Marcio
 */
@Entity
@Table(name = "subareadepesquisa")
public class SubAreaDePesquisa implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Integer idSubAreaDePesquisa;
	private String nome;
	private String finalidade;
	private String descricao;
	@ManyToMany(fetch = FetchType.LAZY, targetEntity = Projeto.class, mappedBy = "subAreasDePesquisas")
	private List<Projeto> projetos = new ArrayList<Projeto>();
	@ManyToMany(fetch = FetchType.LAZY, targetEntity = GrupoDePesquisa.class, mappedBy = "areasPesquisa")
	private List<GrupoDePesquisa> grupos = new ArrayList<GrupoDePesquisa>();
	@ManyToMany(fetch = FetchType.LAZY, targetEntity = Pessoa.class, mappedBy = "areasPesquisa")
	private List<Pessoa> integrantes = new ArrayList<Pessoa>();
	@ManyToMany(fetch = FetchType.LAZY, targetEntity = AreaDePesquisa.class)
	@JoinTable(name = "areadepesquisasubarea", joinColumns = @JoinColumn(name = "idSubAreaDePesquisa"), inverseJoinColumns = @JoinColumn(name = "idAreaDePesquisa"))
	private List<AreaDePesquisa> grandesAreasDePesquisas = new ArrayList<AreaDePesquisa>();
	@OneToOne
	@JoinColumn(name = "idPessoaAtualizou")
	private Usuario usuarioAtualizou;
	@Temporal(javax.persistence.TemporalType.TIMESTAMP)
	private Date dataAtualizacao;

	public SubAreaDePesquisa(Integer idSubAreaDePesquisa, String nome) {
		this.idSubAreaDePesquisa = idSubAreaDePesquisa;
		this.nome = nome;
	}

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

	public List<AreaDePesquisa> getGrandesAreasDePesquisas() {
		return grandesAreasDePesquisas;
	}

	public void setGrandesAreasDePesquisas(
			List<AreaDePesquisa> grandesAreasDePesquisas) {
		this.grandesAreasDePesquisas = grandesAreasDePesquisas;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}

	public SubAreaDePesquisa() {
	}

	public Integer getIdSubAreaDePesquisa() {
		return idSubAreaDePesquisa;
	}

	public void setIdSubAreaDePesquisa(Integer idSubAreaDePesquisa) {
		this.idSubAreaDePesquisa = idSubAreaDePesquisa;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getFinalidade() {
		return finalidade;
	}

	public void setFinalidade(String finalidade) {
		this.finalidade = finalidade;
	}

	public List<Projeto> getProjetos() {
		return projetos;
	}

	public void setProjetos(List<Projeto> projetos) {
		this.projetos = projetos;
	}

	public List<GrupoDePesquisa> getGrupos() {
		return grupos;
	}

	public void setGrupos(List<GrupoDePesquisa> grupos) {
		this.grupos = grupos;
	}

	public List<Pessoa> getIntegrantes() {
		return integrantes;
	}

	public void setIntegrantes(List<Pessoa> integrantes) {
		this.integrantes = integrantes;
	}
}
