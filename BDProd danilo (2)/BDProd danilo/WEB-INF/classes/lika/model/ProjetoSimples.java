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
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 
 * @author Marcio
 */
@Entity
@Table(name = "projetoSimples")
public class ProjetoSimples implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Integer idProjetoSimples;
	private String nome;
	private String subprojeto;
	private String tipoDuracao;
	private String duracao;
	private Date dataInicio;

	public Date getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

	@ManyToOne
	@JoinColumn(name = "Aluno")
	private Aluno Aluno;

	public String getTipoDuracao() {
		return tipoDuracao;
	}

	public void setTipoDuracao(String tipoDuracao) {
		this.tipoDuracao = tipoDuracao;
	}

	public String getDuracao() {
		return duracao;
	}

	public void setDuracao(String duracao) {
		this.duracao = duracao;
	}

	public Integer getIdProjetoSimples() {
		return idProjetoSimples;
	}

	public void setIdProjetoSimples(Integer idProjetoSimples) {
		this.idProjetoSimples = idProjetoSimples;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSubprojeto() {
		return subprojeto;
	}

	public void setSubprojeto(String subprojeto) {
		this.subprojeto = subprojeto;
	}

	public Aluno getAluno() {
		return Aluno;
	}

	public void setAluno(Aluno aluno) {
		Aluno = aluno;
	}

}
