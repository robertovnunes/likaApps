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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 * 
 * @author Marcio
 */
@Entity
@Table(name = "areadepesquisa")
public class AreaDePesquisa implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Integer idAreaDePesquisa;
	private String nome;
	private String finalidade;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "areadepesquisasubarea", joinColumns = @JoinColumn(name = "idAreaDePesquisa"), inverseJoinColumns = @JoinColumn(name = "idSubAreaDePesquisa"))
	private List<SubAreaDePesquisa> subAreas = new ArrayList<SubAreaDePesquisa>();
	@OneToMany(mappedBy = "grandeArea", targetEntity = Projeto.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "GrandeAreaDePesquisa_idAreaDePesquisa")
	private List<Projeto> projetos = new ArrayList<Projeto>();
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

	public AreaDePesquisa(Integer idAreaDePesquisa, String nome) {
		this.idAreaDePesquisa = idAreaDePesquisa;
		this.nome = nome;
	}

	public void setProjetos(List<Projeto> projetos) {
		this.projetos = projetos;
	}

	public void setSubAreas(List<SubAreaDePesquisa> subAreas) {
		this.subAreas = subAreas;
	}

	public List<Projeto> getProjetos() {
		return projetos;
	}

	public List<SubAreaDePesquisa> getSubAreas() {
		return subAreas;
	}

	public String getNome() {
		return nome;
	}

	public String getFinalidade() {
		return finalidade;
	}

	public Integer getIdAreaDePesquisa() {
		return idAreaDePesquisa;
	}

	public void setFinalidade(String finalidade) {
		this.finalidade = finalidade;
	}

	public void setIdAreaDePesquisa(Integer idAreaDePesquisa) {
		this.idAreaDePesquisa = idAreaDePesquisa;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public AreaDePesquisa() {
	}

}
