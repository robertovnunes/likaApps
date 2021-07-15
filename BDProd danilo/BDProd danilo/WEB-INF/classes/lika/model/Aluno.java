/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 * 
 * @author Marcio
 */
@Entity
@Table(name = "aluno")
@PrimaryKeyJoinColumn(name = "pessoa_idPessoa")
public class Aluno extends Pessoa {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Aluno(Integer id, String nome) {
		this.idPessoa = id;
		this.nome = nome;
	}

	public Aluno(Integer id, String nome, String cpf) {
		this.idPessoa = id;
		this.CPF = cpf;
		this.nome = nome;
	}

	private String tipoAluno;
	private String tipoOrigemBolsa;
	private boolean possuiBolsa;
	private String origemBolsa;
	@ManyToOne
	@JoinColumn(name = "FuncionarioPesquisador_idPessoa")
	private Pesquisador orientador;
	private String projeto;
	private String duracao;
	private String tipoDuracaoProjeto;
	private String instituicaoOrigem;
	private String observacoes;

	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "Aluno")
	@Cascade( { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	private List<ProjetoSimples> projetosSimples = new ArrayList<ProjetoSimples>();

	public List<ProjetoSimples> getProjetosSimples() {
		return projetosSimples;
	}

	public void setProjetosSimples(List<ProjetoSimples> projetosSimples) {
		this.projetosSimples = projetosSimples;
	}

	public String getInstituicaoOrigem() {
		return instituicaoOrigem;
	}

	public void setInstituicaoOrigem(String instituicaoOrigem) {
		this.instituicaoOrigem = instituicaoOrigem;
	}

	public void setTipoDuracaoProjeto(String tipoDuracaoProjeto) {
		this.tipoDuracaoProjeto = tipoDuracaoProjeto;
	}

	public String getTipoDuracaoProjeto() {
		return tipoDuracaoProjeto;
	}

	public String getDuracao() {
		return duracao;
	}

	public String getProjeto() {
		return projeto;
	}
	
	public String getObservacoes() {
		return observacoes;
	}
	
	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}
	
	public void setDuracao(String duracao) {
		this.duracao = duracao;
	}

	public void setProjeto(String projeto) {
		this.projeto = projeto;
	}

	public void setOrigemBolsa(String origemBolsa) {
		this.origemBolsa = origemBolsa;
	}

	public String getOrigemBolsa() {
		return origemBolsa;
	}

	public boolean isPossuiBolsa() {
		return possuiBolsa;
	}

	public boolean getPossuiBolsa() {
		return possuiBolsa;
	}

	public void setPossuiBolsa(boolean possuiBolsa) {
		this.possuiBolsa = possuiBolsa;
	}

	public Pesquisador getOrientador() {
		return orientador;
	}

	public void setOrientador(Pesquisador orientador) {
		this.orientador = orientador;
	}

	public Aluno() {
	}

	public String getTipoAluno() {
		return tipoAluno;
	}

	public String getTipoOrigemBolsa() {
		return tipoOrigemBolsa;
	}

	public void setTipoAluno(String tipoAluno) {
		this.tipoAluno = tipoAluno;
	}

	public void setTipoOrigemBolsa(String tipoOrigemBolsa) {
		this.tipoOrigemBolsa = tipoOrigemBolsa;
	}
}
