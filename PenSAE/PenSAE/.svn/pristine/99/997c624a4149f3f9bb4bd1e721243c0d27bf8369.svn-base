package model;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the usuario database table.
 * 
 */
@Entity
@Table(name="usuario")
@NamedQuery(name="Usuario.findAll", query="SELECT u FROM Usuario u")
public class Usuario implements Serializable {
	private static final long serialVersionUID = 1L;

	//bi-directional many-to-one association to Aluno
	@OneToMany(mappedBy="usuario", cascade={CascadeType.ALL})
	private Set<Aluno> alunos;

	@Column(nullable=false)
	private Boolean cadastroLiberado;

	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	private Date dataCadastro;

	@Temporal(TemporalType.DATE)
	private Date dataNascimento;

	@Column(nullable=false, length=100)
	private String email;

	private int estadoCivil;

	//bi-directional many-to-one association to Glossario
	@OneToMany(mappedBy="usuario")
	private Set<Glossario> glossarios;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(nullable=false, length=100)
	private String instituicao;

	@Column(nullable=false, length=50)
	private String login;

	@Column(nullable=false, length=100)
	private String nome;

	private int numFilhos;

	private int perfil;

	//bi-directional many-to-one association to Professor
	@OneToMany(mappedBy="usuario", cascade={CascadeType.ALL})
	private Set<Professor> professors;

	private int rendaFamiliar;

	@Column(nullable=false, length=128)
	private String senha;

	private int sexo;

	//bi-directional many-to-one association to UsuarioHasIdioma
	@OneToMany(mappedBy="usuario", cascade={CascadeType.ALL})
	private Set<UsuarioHasIdioma> usuarioHasIdiomas;

	public Usuario() {
	}

	public Aluno addAluno(Aluno aluno) {
		getAlunos().add(aluno);
		aluno.setUsuario(this);

		return aluno;
	}

	public Glossario addGlossario(Glossario glossario) {
		getGlossarios().add(glossario);
		glossario.setUsuario(this);

		return glossario;
	}

	public Professor addProfessor(Professor professor) {
		getProfessors().add(professor);
		professor.setUsuario(this);

		return professor;
	}

	public UsuarioHasIdioma addUsuarioHasIdioma(UsuarioHasIdioma usuarioHasIdioma) {
		getUsuarioHasIdiomas().add(usuarioHasIdioma);
		usuarioHasIdioma.setUsuario(this);

		return usuarioHasIdioma;
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;

		if(obj != null){

			if(obj.getClass().equals(Usuario.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){

				retorno = true;
			}
		}

		return retorno;
	}

	public Set<Aluno> getAlunos() {
		return this.alunos;
	}

	public Boolean getCadastroLiberado() {
		return this.cadastroLiberado;
	}

	public Date getDataCadastro() {
		return this.dataCadastro;
	}

	public Date getDataNascimento() {
		return this.dataNascimento;
	}

	public String getEmail() {
		return this.email;
	}

	public int getEstadoCivil() {
		return this.estadoCivil;
	}

	public Set<Glossario> getGlossarios() {
		return this.glossarios;
	}

	public int getId() {
		return this.id;
	}

	public String getInstituicao() {
		return this.instituicao;
	}

	public String getLogin() {
		return this.login;
	}

	public String getNome() {
		return this.nome;
	}

	public int getNumFilhos() {
		return this.numFilhos;
	}

	public int getPerfil() {
		return this.perfil;
	}

	public Set<Professor> getProfessors() {
		return this.professors;
	}

	public int getRendaFamiliar() {
		return this.rendaFamiliar;
	}

	public String getSenha() {
		return this.senha;
	}

	public int getSexo() {
		return this.sexo;
	}

	public Set<UsuarioHasIdioma> getUsuarioHasIdiomas() {
		return this.usuarioHasIdiomas;
	}

	public Aluno removeAluno(Aluno aluno) {
		getAlunos().remove(aluno);
		aluno.setUsuario(null);

		return aluno;
	}

	public Glossario removeGlossario(Glossario glossario) {
		getGlossarios().remove(glossario);
		glossario.setUsuario(null);

		return glossario;
	}

	public Professor removeProfessor(Professor professor) {
		getProfessors().remove(professor);
		professor.setUsuario(null);

		return professor;
	}

	public UsuarioHasIdioma removeUsuarioHasIdioma(UsuarioHasIdioma usuarioHasIdioma) {
		getUsuarioHasIdiomas().remove(usuarioHasIdioma);
		usuarioHasIdioma.setUsuario(null);

		return usuarioHasIdioma;
	}

	public void setAlunos(Set<Aluno> alunos) {
		this.alunos = alunos;
	}

	public void setCadastroLiberado(Boolean cadastroLiberado) {
		this.cadastroLiberado = cadastroLiberado;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setEstadoCivil(int estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public void setGlossarios(Set<Glossario> glossarios) {
		this.glossarios = glossarios;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setInstituicao(String instituicao) {
		this.instituicao = instituicao;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setNumFilhos(int numFilhos) {
		this.numFilhos = numFilhos;
	}

	public void setPerfil(int perfil) {
		this.perfil = perfil;
	}

	public void setProfessors(Set<Professor> professors) {
		this.professors = professors;
	}

	public void setRendaFamiliar(int rendaFamiliar) {
		this.rendaFamiliar = rendaFamiliar;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public void setSexo(int sexo) {
		this.sexo = sexo;
	}

	public void setUsuarioHasIdiomas(Set<UsuarioHasIdioma> usuarioHasIdiomas) {
		this.usuarioHasIdiomas = usuarioHasIdiomas;
	}

	@Override
	public String toString() {

		return String.valueOf(this.id);
	}
}