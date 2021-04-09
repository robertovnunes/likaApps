package clin.model;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;

@Entity
public class Paciente {

	@Id
	@GeneratedValue
	private Integer idPaciente;
	@Column(length = 10, unique = true)
	private Integer prontuario;
	// @NotEmpty(message = "O \"Nome\" deve ser informado.")
	private String nome;
	// @NotEmpty(message = "A \"Data de Nascimento\" deve ser informada.")
	private Date dataNascimento;
	// @NotEmpty(message = "O \"CPF\" deve ser informado.")
	private String CPF;
	private String sexo;
	// @NotEmpty(message = "O \"RG\" deve ser informado.")
	private String RG;
	private String orgaoExpedidor;
	// @NotEmpty(message = "O \"Nome da Mãe\" deve ser informado.")
	private String nomeDaMae;
	private String endereco;
	// @Email(message = "Insira um e-mail válido no campo de e-mail.")
	private String email;
	private String estadoCivil;
	private String profissao;
	private String corDaPele;
	private String escolaridade;
	private String naturalidade;
	private String rendaMensal;
	private Integer pessoasNaMesmaCasa;
	private String religiao;
	private Integer idade;
	private String CNS;

	// Relacionamentos

	@OneToMany(cascade = { CascadeType.ALL })
	@JoinColumn(name = "Paciente_idPaciente")
	private List<Telefone> telefones = new ArrayList<Telefone>();

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderBy("dataAtendimento ASC")
	@JoinColumn(name = "Paciente_idPaciente")
	private List<Atendimento> atemdimentos = new ArrayList<Atendimento>();

	@OneToOne
	@JoinColumn(name = "salvoPor")
	private Usuario salvoPor;

	// Getters e Setters

	public List<Atendimento> getAtemdimentos() {
		return atemdimentos;
	}

	public String getReligiao() {
		return religiao;
	}

	public void setReligiao(String religiao) {
		this.religiao = religiao;
	}

	public void setAtemdimentos(List<Atendimento> atemdimentos) {
		this.atemdimentos = atemdimentos;
	}

	public Usuario getSalvoPor() {
		return salvoPor;
	}

	public void setSalvoPor(Usuario salvoPor) {
		this.salvoPor = salvoPor;
	}

	public Integer getIdPaciente() {
		return idPaciente;
	}

	public void setIdPaciente(Integer idPaciente) {
		this.idPaciente = idPaciente;
	}

	public Integer getProntuario() {
		return prontuario;
	}

	public void setProntuario(Integer prontuario) {
		this.prontuario = prontuario;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getCPF() {
		return CPF;
	}

	public void setCPF(String cPF) {
		CPF = cPF;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getRG() {
		return RG;
	}

	public void setRG(String rG) {
		RG = rG;
	}

	public String getOrgaoExpedidor() {
		return orgaoExpedidor;
	}

	public void setOrgaoExpedidor(String orgaoExpedidor) {
		this.orgaoExpedidor = orgaoExpedidor;
	}

	public String getNomeDaMae() {
		return nomeDaMae;
	}

	public void setNomeDaMae(String nomeDaMae) {
		this.nomeDaMae = nomeDaMae;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEstadoCivil() {
		return estadoCivil;
	}

	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public String getProfissao() {
		return profissao;
	}

	public void setProfissao(String profissao) {
		this.profissao = profissao;
	}

	public String getCorDaPele() {
		return corDaPele;
	}

	public void setCorDaPele(String corDaPele) {
		this.corDaPele = corDaPele;
	}

	public String getEscolaridade() {
		return escolaridade;
	}

	public void setEscolaridade(String escolaridade) {
		this.escolaridade = escolaridade;
	}

	public String getNaturalidade() {
		return naturalidade;
	}

	public void setNaturalidade(String naturalidade) {
		this.naturalidade = naturalidade;
	}

	public String getRendaMensal() {
		return rendaMensal;
	}

	public void setRendaMensal(String rendaMensal) {
		this.rendaMensal = rendaMensal;
	}

	public Integer getPessoasNaMesmaCasa() {
		return pessoasNaMesmaCasa;
	}

	public void setPessoasNaMesmaCasa(Integer pessoasNaMesmaCasa) {
		this.pessoasNaMesmaCasa = pessoasNaMesmaCasa;
	}

	public List<Telefone> getTelefones() {
		return telefones;
	}

	public void setTelefones(List<Telefone> telefones) {
		this.telefones = telefones;
	}

	public void setIdade(Integer idade) {
		this.idade = idade;
	}

	public Integer getIdade() {
		return idade;
	}

	public void setCNS(String cNS) {
		CNS = cNS;
	}

	public String getCNS() {
		return CNS;
	}

}
