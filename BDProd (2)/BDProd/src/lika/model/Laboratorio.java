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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

import org.hibernate.annotations.Cascade;

/**
 * 
 * @author Marcio
 */
@Entity
@Table(name = "laboratorio")
public class Laboratorio implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Integer idLaboratorio;
	private String nome;
	private String finalidade;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "pessoalaboratorio", joinColumns = @JoinColumn(name = "Laboratorio_idLaboratorio"), inverseJoinColumns = @JoinColumn(name = "Pessoa_idPessoa"))
	private List<Pessoa> integrantes = new ArrayList<Pessoa>();
	@OneToMany(fetch = FetchType.LAZY)
	@Cascade( { org.hibernate.annotations.CascadeType.MERGE,
			org.hibernate.annotations.CascadeType.SAVE_UPDATE })
	@JoinColumn(name = "Laboratorio_idLaboratorio")
	private List<Equipamento> equipamentos = new ArrayList<Equipamento>();
	@ManyToOne
	@JoinColumn(name = "gerente")
	private Pesquisador administrador;
	@ManyToOne
	@JoinColumn(name = "viceGerente")
	private Pesquisador viceAdministrador;
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

	public Laboratorio(Integer idLaboratorio, String nome) {
		this.idLaboratorio = idLaboratorio;
		this.nome = nome;
	}

	public Laboratorio() {
	}

	public Integer getIdLaboratorio() {
		return idLaboratorio;
	}

	public void setIdLaboratorio(Integer idLaboratorio) {
		this.idLaboratorio = idLaboratorio;
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

	public List<Pessoa> getIntegrantes() {
		return integrantes;
	}

	public void setIntegrantes(List<Pessoa> integrantes) {
		this.integrantes = integrantes;
	}

	public List<Equipamento> getEquipamentos() {
		return equipamentos;
	}

	public void setEquipamentos(List<Equipamento> equipamentos) {
		this.equipamentos = equipamentos;
	}

	public Pesquisador getAdministrador() {
		return administrador;
	}

	public void setAdministrador(Pesquisador administrador) {
		this.administrador = administrador;
	}

	public Pesquisador getViceAdministrador() {
		return viceAdministrador;
	}

	public void setViceAdministrador(Pesquisador viceAdministrador) {
		this.viceAdministrador = viceAdministrador;
	}
}
