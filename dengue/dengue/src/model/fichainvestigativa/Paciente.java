package model.fichainvestigativa;

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
import javax.persistence.Transient;

import util.DataUtil;

import model.endereco.Residencia;

@Entity
@Table(name="paciente")
public class Paciente implements Serializable {

	public int id;
	public String nome;
	public String sexo;
	public int gestante;  //1-1ºTrimestre 2-2ºTrimestre 3-3ºTrimestre 4- Idade gestacional Ignorada 5-Não 6- Não se aplica	9-Ignorado
	public int racaCor; //1-Branca 2-Preta 3-Amarela	4-Parda 5-Indígena 9- Ignorado
	public int escolaridade; //0-Analfabeto 1-1ª a 4ª série incompleta do EF (antigo primário ou 1º grau) 2-4ª série completa do EF (antigo primário ou 1º grau)
							//3-5ª à 8ª série incompleta do EF (antigo ginásio ou 1º grau) 4-Ensino fundamental completo (antigo ginásio ou 1º grau) 5-Ensino médio incompleto (antigo colegial ou 2º grau )
							//6-Ensino médio completo (antigo colegial ou 2º grau ) 7-Educação superior incompleta 8-Educação superior completa 9-Ignorado 10- Não se aplica
	public String numeroCartaoSUS;
	public String nomeMae;
	
	public String idade;
	public String idadeBebe; //1 - Hora; 2 - Dia; 3 - mes; 4 - ano
	public Date dataNascimento;
	public Residencia residencia;
	
	public Paciente(){	}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="nome")
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Column(name="sexo")
	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	@Column(name="gestante")
	public int getGestante() {
		return gestante;
	}

	public void setGestante(int gestante) {
		this.gestante = gestante;
	}

	@Column(name="racaCor")
	public int getRacaCor() {
		return racaCor;
	}

	public void setRacaCor(int racaCor) {
		this.racaCor = racaCor;
	}

	@Column(name="escolaridade")
	public int getEscolaridade() {
		return escolaridade;
	}

	public void setEscolaridade(int escolaridade) {
		this.escolaridade = escolaridade;
	}

	@Column(name="numeroCartaoSUS")
	public String getNumeroCartaoSUS() {
		return numeroCartaoSUS;
	}

	public void setNumeroCartaoSUS(String numeroCartaoSUS) {
		this.numeroCartaoSUS = numeroCartaoSUS;
	}

	@Column(name="nomeMae")
	public String getNomeMae() {
		return nomeMae;
	}

	public void setNomeMae(String nomeMae) {
		this.nomeMae = nomeMae;
	}

	@Column(name="dataNascimento")
	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="residencia", nullable=true)
	public Residencia getResidencia() {
		return residencia;
	}

	public void setResidencia(Residencia residencia) {
		this.residencia = residencia;
	}

	@Column(name="idade")
	public String getIdade() {
		return idade;
	}

	public void setIdade(String idade) {
		this.idade = idade;
	}

	@Column(name="idadeBebe")
	public String getIdadeBebe() {
		return idadeBebe;
	}

	public void setIdadeBebe(String idadeBebe) {
		this.idadeBebe = idadeBebe;
	}

	@Transient
	public String getDataNascimentoFormatada(){
		return DataUtil.formatarData(dataNascimento);
	}

}
