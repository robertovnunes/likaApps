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
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 * 
 * @author Marcio
 */
@Entity
@Table(name = "pesquisador")
@PrimaryKeyJoinColumn(name = "Pessoa_idPessoa")
public class Pesquisador extends Pessoa {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String SIAPE;
	private String instituicaoOrigem;
	private String tipo;

	
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "responsavel")
	private List<GrupoDePesquisa> gruposGerenciados = new ArrayList<GrupoDePesquisa>();
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "FuncionarioPesquisador_idPessoa")
	private List<Aluno> alunosOrientados = new ArrayList<Aluno>();
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "gerente")
	private List<Laboratorio> laboratorioGerenciado = new ArrayList<Laboratorio>();
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "viceGerente")
	private List<Laboratorio> laboratorioViceGerenciado = new ArrayList<Laboratorio>();
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "gerente")
	private List<Projeto> projetoResponsavel = new ArrayList<Projeto>();
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "viceGerente")
	private List<Projeto> projetoViceResponsavel = new ArrayList<Projeto>();

	public String getSIAPE() {
		return SIAPE;
	}

	public void setSIAPE(String sIAPE) {
		SIAPE = sIAPE;
	}

	public String getInstituicaoOrigem() {
		return instituicaoOrigem;
	}

	public void setInstituicaoOrigem(String instituicaoOrigem) {
		this.instituicaoOrigem = instituicaoOrigem;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	public List<GrupoDePesquisa> getGruposGerenciados() {
		return gruposGerenciados;
	}

	public void setGruposGerenciados(List<GrupoDePesquisa> gruposGerenciados) {
		this.gruposGerenciados = gruposGerenciados;
	}

	public List<Aluno> getAlunosOrientados() {
		return alunosOrientados;
	}

	public void setAlunosOrientados(List<Aluno> alunosOrientados) {
		this.alunosOrientados = alunosOrientados;
	}

	public List<Laboratorio> getLaboratorioGerenciado() {
		return laboratorioGerenciado;
	}

	public void setLaboratorioGerenciado(List<Laboratorio> laboratorioGerenciado) {
		this.laboratorioGerenciado = laboratorioGerenciado;
	}

	public List<Laboratorio> getLaboratorioViceGerenciado() {
		return laboratorioViceGerenciado;
	}

	public void setLaboratorioViceGerenciado(
			List<Laboratorio> laboratorioViceGerenciado) {
		this.laboratorioViceGerenciado = laboratorioViceGerenciado;
	}

	public List<Projeto> getProjetoResponsavel() {
		return projetoResponsavel;
	}

	public void setProjetoResponsavel(List<Projeto> projetoResponsavel) {
		this.projetoResponsavel = projetoResponsavel;
	}

	public List<Projeto> getProjetoViceResponsavel() {
		return projetoViceResponsavel;
	}

	public void setProjetoViceResponsavel(List<Projeto> projetoViceResponsavel) {
		this.projetoViceResponsavel = projetoViceResponsavel;
	}

	public Pesquisador(Integer idPessoa, String nome, String cpf) {
		this.idPessoa = idPessoa;
		this.nome = nome;
		this.CPF = cpf;
	}
	
	public Pesquisador(){
		
	}

}
