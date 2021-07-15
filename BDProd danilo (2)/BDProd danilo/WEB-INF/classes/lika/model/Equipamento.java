/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.Transient;

/**
 * 
 * @author Marcio
 */
@Entity
@Table(name = "equipamento")
public class Equipamento implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Transient
	private boolean editando = false;

	public boolean isEditando() {
		return editando;
	}

	public void setEditando(boolean editando) {
		this.editando = editando;
	}

	@Id
	@GeneratedValue
	private Integer idEquipamento;
	private String nome;
	@Column(name = "statusMaterial")
	private String status;
	private String localizacao;
	private String numeroTombamento;
	private String descricao;
	@ManyToOne
	@JoinColumn(name = "Laboratorio_idLaboratorio")
	private Laboratorio laboratorio;
	@ManyToOne
	@JoinColumn(name = "Projeto_idProjeto", nullable = false, insertable = false, updatable = false)
	private Projeto projeto;
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

	public Equipamento() {
	}

	public Equipamento(Integer idEquipamento, String nome, String tombamento) {
		this.idEquipamento = idEquipamento;
		this.nome = nome;
		this.numeroTombamento = tombamento;
	}

	public Integer getIdEquipamento() {
		return idEquipamento;
	}

	public void setIdEquipamento(Integer idEquipamento) {
		this.idEquipamento = idEquipamento;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getLocalizacao() {
		return localizacao;
	}

	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}

	public String getNumeroTombamento() {
		return numeroTombamento;
	}

	public void setNumeroTombamento(String numeroTombamento) {
		this.numeroTombamento = numeroTombamento;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Laboratorio getLaboratorio() {
		return laboratorio;
	}

	public void setLaboratorio(Laboratorio laboratorio) {
		this.laboratorio = laboratorio;
	}

	public Projeto getProjeto() {
		return projeto;
	}

	public void setProjeto(Projeto projeto) {
		this.projeto = projeto;
	}
}
