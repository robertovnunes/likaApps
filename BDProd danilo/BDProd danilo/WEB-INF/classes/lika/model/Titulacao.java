/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 
 * @author Marcio
 */
@Entity
@Table(name = "titulacao")
public class Titulacao implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Transient
	private boolean editando;

	public boolean isEditando() {
		return editando;
	}

	public void setEditando(boolean editando) {
		this.editando = editando;
	}

	@Id
	@GeneratedValue
	private Integer idTitulacao;
	private String curso;
	private String instituicao;
	private String titulacao;
	private String inicio; 
	private String conclusao;
	@ManyToOne
	@JoinColumn(name = "Pessoa", nullable = false, insertable = false, updatable = false)
	private Pessoa pessoa;

	public String getCurso() {
		return curso;
	}

	public String getConclusao() {
		return conclusao;
	}
	
	public String getInicio() {
		return inicio;
	}

	public void setConclusao(String conclusao) {
		this.conclusao = conclusao;
	}
	
	public void setInicio(String inicio) {
		this.inicio = inicio;
	}

	public void setCurso(String curso) {
		this.curso = curso;
	}

	public Integer getIdTitulacao() {
		return idTitulacao;
	}

	public void setIdTitulacao(Integer idTitulacao) {
		this.idTitulacao = idTitulacao;
	}

	public String getInstituicao() {
		return instituicao;
	}

	public void setInstituicao(String instituicao) {
		this.instituicao = instituicao;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public String getTitulacao() {
		return titulacao;
	}

	public void setTitulacao(String titulacao) {
		this.titulacao = titulacao;
	}
}
