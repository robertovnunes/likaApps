package model.paciente;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import model.Endereco;
import model.paciente.prontuario.Prontuario;
import model.usuario.Usuario;

@Entity
@Table(name="paciente")
public class Paciente implements Serializable{

	public int id;
	public String nome;
	public String cpf;
	public Prontuario prontuario;
	public String idade;
	public String telefone;
	public Endereco endereco;
	public String nomeMae;
	public String nascimento;
	public String sexo;
	public String raca;
	public int qtdFilhos;
	public String estadoCivil;
	public String religiao;
	public String escolaridade;
	public String profissao;
	public Date dataCriacao;
	public Usuario usuario;
	
	public Paciente(){}
	
	@Column(name="dataCriacao", nullable=false)
	public Date getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="fk_idUsuario", nullable=true)
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	@Column(name="nome_mae", nullable=true)
	public String getNomeMae() {
		return nomeMae;
	}

	public void setNomeMae(String nomeMae) {
		this.nomeMae = nomeMae;
	}

	@Column(name="nascimento", nullable=false)
	public String getNascimento() {
		return nascimento;
	}

	public void setNascimento(String nascimento) {
		this.nascimento = nascimento;
	}

	@Column(name="sexo", nullable=false)
	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	@Column(name="raca", nullable=false)
	public String getRaca() {
		return raca;
	}

	public void setRaca(String raca) {
		this.raca = raca;
	}

	@Column(name="qtd_filho", nullable=false)
	public int getQtdFilhos() {
		return qtdFilhos;
	}

	public void setQtdFilhos(int qtdFilhos) {
		this.qtdFilhos = qtdFilhos;
	}

	@Column(name="estado_civil", nullable=false)
	public String getEstadoCivil() {
		return estadoCivil;
	}

	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	@Column(name="religiao", nullable=false)
	public String getReligiao() {
		return religiao;
	}

	public void setReligiao(String religiao) {
		this.religiao = religiao;
	}

	@Column(name="escolaridade", nullable=false)
	public String getEscolaridade() {
		return escolaridade;
	}

	public void setEscolaridade(String escolaridade) {
		this.escolaridade = escolaridade;
	}

	@Column(name="profissao", nullable=false)
	public String getProfissao() {
		return profissao;
	}

	public void setProfissao(String profissao) {
		this.profissao = profissao;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="idPaciente", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="nome", nullable=false)
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Column(name="cpf", nullable=false)
	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="fk_idProntuario", nullable=false)
	public Prontuario getProntuario() {
		return prontuario;
	}

	public void setProntuario(Prontuario prontuario) {
		this.prontuario = prontuario;
	}

	@Column(name="idade", nullable=false)
	public String getIdade() {
		return idade;
	}

	public void setIdade(String idade) {
		this.idade = idade;
	}

	@Column(name="telefone", nullable=true)
	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idEndereco",nullable=false)
	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}


}
