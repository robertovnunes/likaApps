/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.model;

import java.io.Serializable;
import java.util.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.OrderBy;
import org.hibernate.validator.Email;
import org.hibernate.validator.NotEmpty;
import org.hibernate.validator.Pattern;

/**
 * 
 * @author Marcio
 */
@Entity
@Table(name = "pessoa")
@Inheritance(strategy = InheritanceType.JOINED)
public class Pessoa implements Serializable {
	

	public Pessoa(Integer idPessoa, String nome, String situacao,
			Date dataDesligamento) {
		this.idPessoa = idPessoa;
		this.nome = nome;
		this.situacao = situacao;
		this.dataDesligamento = dataDesligamento;
	}
	
	public boolean getTahDesligado(){
		System.out.println( this.situacao);
		if(this.situacao != null && this.situacao.equals(("Desligado"))){
			return true;
		}else{
			return false;
		}
	}

	@Transient
	private String nomeSubprojeto;

	public Pessoa(Integer idPessoa, String nome, String subProjeto, String t) {
		this.idPessoa = idPessoa;
		this.nome = nome;
		this.nomeSubprojeto = subProjeto;
	}

	public String getNomeSubprojeto() {
		return nomeSubprojeto;
	}

	public void setNomeSubprojeto(String nomeSubprojeto) {
		this.nomeSubprojeto = nomeSubprojeto;
	}

	@Transient
	protected int posicaoPublicacao;

	public int getPosicaoPublicacao() {
		return posicaoPublicacao;
	}

	public void setPosicaoPublicacao(int posicaoPublicacao) {
		this.posicaoPublicacao = posicaoPublicacao;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	protected Integer idPessoa;
	@NotEmpty
	@Pattern(regex = ".*[^\\s].*", message = "O campo Nome contém apenas espaços")
	protected String nome;
	protected byte[] foto;
	protected String mime;
	protected String CPF;
	protected String RG;
	protected String orgaoExpedidor;
	@Temporal(javax.persistence.TemporalType.DATE)
	protected Date nascimento;
	protected String filiacaoPai;
	protected String filiacaoMae;
	// @Email(message = "O campo Email n�o � um email v�lido")
	protected String email;
	protected String situacao;
	protected String curriculoLattes;
	protected String endereco;
	protected char sexo;
	@Temporal(javax.persistence.TemporalType.DATE)
	protected Date dataAdmissao;
	protected String nomePublicacao;
	@Temporal(javax.persistence.TemporalType.DATE)
	protected Date dataDesligamento;
	protected String motivoDesligamento;
	protected String telefone;
	protected String celular;
	protected String foneComercial;
	protected String dddResidencial;
	protected String dddCelular;
	protected String dddComercial;
	protected String CEP;
	protected String uf;
	

	public String getCpf() {
		return this.CPF;
	}

	public void setCpf(String cpf) {
		this.CPF = cpf;
	}

	@ManyToOne
	@JoinColumn(name = "Departamento")
	private Departamento departamento = new Departamento();

	@OneToMany(fetch = FetchType.LAZY)
	@Cascade( { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	@JoinColumn(name = "pessoa")
	@OrderBy(clause = "conclusao")
	private List<Titulacao> titulacao = new ArrayList<Titulacao>();
	@OneToOne
	@JoinColumn(name = "Funcao_idFuncao")
	protected Funcao funcao;
	@OneToOne
	@Cascade( { org.hibernate.annotations.CascadeType.DELETE_ORPHAN,
			org.hibernate.annotations.CascadeType.PERSIST,
			org.hibernate.annotations.CascadeType.SAVE_UPDATE })
	@JoinColumn(name = "Cracha_idCracha")
	protected Cracha cracha;
	@ManyToMany(fetch = FetchType.LAZY, targetEntity = SubAreaDePesquisa.class)
	@JoinTable(name = "pessoasubareadepesquisa", joinColumns = @JoinColumn(name = "Pessoa_idPessoa"), inverseJoinColumns = @JoinColumn(name = "SubAreaDePesquisa_idSubAreaDePesquisa"))
	protected List<SubAreaDePesquisa> areasPesquisa = new ArrayList<SubAreaDePesquisa>();
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "pessoaprojeto", joinColumns = @JoinColumn(name = "Pessoa_idPessoa"), inverseJoinColumns = @JoinColumn(name = "Projeto_idProjeto"))
	protected List<Projeto> projetos = new ArrayList<Projeto>();
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "pessoagrupo", joinColumns = @JoinColumn(name = "Pessoa_idPessoa"), inverseJoinColumns = @JoinColumn(name = "Grupo_idGrupo"))
	protected List<GrupoDePesquisa> grupos = new ArrayList<GrupoDePesquisa>();
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "pessoalaboratorio", joinColumns = @JoinColumn(name = "Pessoa_idPessoa"), inverseJoinColumns = @JoinColumn(name = "Laboratorio_idLaboratorio"))
	protected List<Laboratorio> laboratorios = new ArrayList<Laboratorio>();

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idPessoaAtualizou")
	protected Usuario usuarioAtualizou;
	@Temporal(javax.persistence.TemporalType.TIMESTAMP)
	protected Date dataAtualizacao;
	@OneToOne(mappedBy = "pessoa")
	@Cascade( { CascadeType.DELETE_ORPHAN })
	private Usuario usuario;

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Pessoa(Integer idPessoa, String nome) {
		this.idPessoa = idPessoa;
		this.nome = nome;
	}

	public String getMime() {
		return mime;
	}

	public void setMime(String mime) {
		this.mime = mime;
	}

	public Date getDataAtualizacao() {
		return dataAtualizacao;
	}

	public List<Titulacao> getTitulacao() {
		return titulacao;
	}

	public void setTitulacao(List<Titulacao> titulacao) {
		this.titulacao = titulacao;
	}

	public void setDataAtualizacao(Date dataAtualizacao) {
		this.dataAtualizacao = dataAtualizacao;
	}

	public Pessoa(Integer id, String nome, String cpf, String situacao,
			String assPublicacao) {
		this.idPessoa = id;
		this.nome = nome;
		this.CPF = cpf;
		this.situacao = situacao;

		this.nomePublicacao = assPublicacao;
	}

	public void setFuncao(Funcao funcao) {
		this.funcao = funcao;
	}

	public Funcao getFuncao() {
		return funcao;
	}

	public Departamento getDepartamento() {
		return departamento;
	}

	public void setDepartamento(Departamento departamento) {
		this.departamento = departamento;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getUf() {
		return uf;
	}

	public String getCEP() {
		return CEP;
	}

	public Date getDataDesligamento() {
		return dataDesligamento;
	}

	public String getDddCelular() {
		return dddCelular;
	}

	public String getDddComercial() {
		return dddComercial;
	}

	public String getDddResidencial() {
		return dddResidencial;
	}

	public String getFoneComercial() {
		return foneComercial;
	}

	public String getNomePublicacao() {
		return nomePublicacao;
	}

	public void setCEP(String CEP) {
		this.CEP = CEP;
	}

	public void setDataDesligamento(Date dataDesligamento) {
		this.dataDesligamento = dataDesligamento;
	}

	public void setDddCelular(String dddCelular) {
		this.dddCelular = dddCelular;
	}

	public void setDddComercial(String dddComercial) {
		this.dddComercial = dddComercial;
	}

	public void setDddResidencial(String dddResidencial) {
		this.dddResidencial = dddResidencial;
	}

	public void setFoneComercial(String foneComercial) {
		this.foneComercial = foneComercial;
	}

	public void setNomePublicacao(String nomePublicacao) {
		this.nomePublicacao = nomePublicacao;
	}

	public void setDataAdmissao(Date dataAdmissao) {
		this.dataAdmissao = dataAdmissao;
	}

	public Date getDataAdmissao() {
		return dataAdmissao;
	}

	public char getSexo() {
		return sexo;
	}

	public void setSexo(char sexo) {
		this.sexo = sexo;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public void setCPF(String CPF) {
		this.CPF = CPF;
	}

	public Pessoa() {
	}

	public void setRG(String RG) {
		this.RG = RG;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public void setCurriculoLattes(String curriculoLattes) {
		this.curriculoLattes = curriculoLattes;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setFiliacaoMae(String filiacaoMae) {
		this.filiacaoMae = filiacaoMae;
	}

	public void setFiliacaoPai(String filiacaoPai) {
		this.filiacaoPai = filiacaoPai;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

	public void setIdPessoa(Integer idPessoa) {
		this.idPessoa = idPessoa;
	}

	public void setNascimento(Date nascimento) {
		this.nascimento = nascimento;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setOrgaoExpedidor(String orgaoExpedidor) {
		this.orgaoExpedidor = orgaoExpedidor;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getCPF() {
		return CPF;
	}

	public String getRG() {
		return RG;
	}

	public void setGrupos(List<GrupoDePesquisa> grupos) {
		this.grupos = grupos;
	}

	public void setLaboratorios(List<Laboratorio> laboratorios) {
		this.laboratorios = laboratorios;
	}

	public void setProjetos(List<Projeto> projetos) {
		this.projetos = projetos;
	}

	public String getCelular() {
		return celular;
	}

	public String getCurriculoLattes() {
		return curriculoLattes;
	}

	public String getEmail() {
		return email;
	}

	public String getFiliacaoMae() {
		return filiacaoMae;
	}

	public String getFiliacaoPai() {
		return filiacaoPai;
	}

	public byte[] getFoto() {
		return foto;
	}

	public Integer getIdPessoa() {
		return idPessoa;
	}

	public Date getNascimento() {
		return nascimento;
	}

	public String getNome() {
		return nome;
	}

	public String getOrgaoExpedidor() {
		return orgaoExpedidor;
	}

	public String getSituacao() {
		return situacao;
	}

	public String getTelefone() {
		return telefone;
	}

	public Collection<GrupoDePesquisa> getGrupos() {
		return grupos;
	}

	public List<Laboratorio> getLaboratorios() {
		return laboratorios;
	}

	public List<Projeto> getProjetos() {
		return projetos;
	}

	public Cracha getCracha() {
		return cracha;
	}

	public void setCracha(Cracha cracha) {
		this.cracha = cracha;
	}

	public List<SubAreaDePesquisa> getAreasPesquisa() {
		return areasPesquisa;
	}

	public void setAreasPesquisa(List<SubAreaDePesquisa> areasPesquisa) {
		this.areasPesquisa = areasPesquisa;
	}

	public Usuario getUsuarioAtualizou() {
		return usuarioAtualizou;
	}

	public void setUsuarioAtualizou(Usuario usuarioAtualizou) {
		this.usuarioAtualizou = usuarioAtualizou;
	}

	public String getMotivoDesligamento() {
		return motivoDesligamento;
	}

	public void setMotivoDesligamento(String motivoDesligamento) {
		this.motivoDesligamento = motivoDesligamento;
	}
}
