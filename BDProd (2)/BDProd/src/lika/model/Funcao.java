/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 * 
 * @author Marcio
 */
@Entity
@Table(name = "funcao")
public class Funcao implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Integer idFuncao;
	private String nome;
	private String descricao;
	@OneToOne
	@JoinColumn(name = "idPessoaAtualizou")
	private Usuario usuarioAtualizou;
	@Temporal(javax.persistence.TemporalType.TIMESTAMP)
	private Date dataAtualizacao;

	public String getNome() {
		return nome;
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

	public Funcao(String nome, Integer idFuncao) {
		this.nome = nome;
		this.idFuncao = idFuncao;
	}

	public String getDescricao() {
		return descricao;
	}

	public Integer getIdFuncao() {
		return idFuncao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public void setIdFuncao(Integer idFuncao) {
		this.idFuncao = idFuncao;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Funcao() {
	}
}
