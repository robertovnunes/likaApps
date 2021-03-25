package clin.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(uniqueConstraints = { @UniqueConstraint(columnNames = "CPF"),
		@UniqueConstraint(columnNames = "login") })
@Inheritance(strategy = InheritanceType.JOINED)
public class Usuario {

	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	protected Integer idUsuario;
	// @Column(length = 200)
	// @NotEmpty(message = "O \"Nome\" deve ser informado.")
	protected String nome;
	// @Column(length = 50)
	// @NotEmpty(message = "O \"Login\" deve ser informado.")
	protected String login;
	// @Column(length = 20)
	protected String senha;
	// @Column(length = 15)
	// @NotEmpty(message = "O \"CPF\" deve ser informado.")
	protected String CPF;
	// @NotEmpty(message = "O \"E-mail\" deve ser informado.")
	// @Email(message = "Insira um e-mail válido no campo de e-mail.")
	protected String email;
	protected String telefone;
	protected String endereco;
	protected String sexo;
	protected String tipo;

	// Relacionamentos
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "salvoPor")
	private Usuario salvoPor;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "criadoPor")
	private List<Atendimento> atendimentosCriados;

	// Getters and Setters
	public Integer getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getCPF() {
		return CPF;
	}

	public void setCPF(String cPF) {
		CPF = cPF;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public Usuario getSalvoPor() {
		return salvoPor;
	}

	public void setSalvoPor(Usuario salvoPor) {
		this.salvoPor = salvoPor;
	}

	public List<Atendimento> getAtendimentosCriados() {
		return atendimentosCriados;
	}

	public void setAtendimentosCriados(List<Atendimento> atendimentosCriados) {
		this.atendimentosCriados = atendimentosCriados;
	}

}
