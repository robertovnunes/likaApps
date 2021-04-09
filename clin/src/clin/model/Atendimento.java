package clin.model;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Atendimento {

	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer idAtendimento;

	private Date dataAtendimento;

	@Column(length = 10, unique = true)
	private int numeroAtendimento;

	// Relacionamentos
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "Atendimento_idAtendimento")
	private List<Ficha> fichas = new ArrayList<Ficha>();

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "criadoPor")
	private Usuario criadoPor;

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "paciente_idPaciente")
	private Paciente paciente;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "Atendimento_idAtendimento")
	private List<Exame> exames = new ArrayList<Exame>();

	// Getters e Setters

	public Paciente getPaciente() {
		return paciente;
	}

	public List<Exame> getExames() {
		return exames;
	}

	public void setExames(List<Exame> exames) {
		this.exames = exames;
	}

	public void setPaciente(Paciente paciente) {
		this.paciente = paciente;
	}

	public Usuario getCriadoPor() {
		return criadoPor;
	}

	public void setCriadoPor(Usuario criadoPor) {
		this.criadoPor = criadoPor;
	}

	public Integer getIdAtendimento() {
		return idAtendimento;
	}

	public void setIdAtendimento(Integer idAtendimento) {
		this.idAtendimento = idAtendimento;
	}

	public Date getDataAtendimento() {
		return dataAtendimento;
	}

	public void setDataAtendimento(Date dataAtendimento) {
		this.dataAtendimento = dataAtendimento;
	}

	public int getNumeroAtendimento() {
		return numeroAtendimento;
	}

	public void setNumeroAtendimento(int numeroAtendimento) {
		this.numeroAtendimento = numeroAtendimento;
	}

	public List<Ficha> getFichas() {
		return fichas;
	}

	public void setFichas(List<Ficha> fichas) {
		this.fichas = fichas;
	}

}
