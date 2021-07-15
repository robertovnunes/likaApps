package model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the curso database table.
 * 
 */
@Entity
@Table(name="curso")
@NamedQuery(name="Curso.findAll", query="SELECT c FROM Curso c")
public class Curso implements Serializable {
	private static final long serialVersionUID = 1L;

	//bi-directional many-to-many association to Aluno
	@ManyToMany
	@JoinTable(
		name="curso_has_aluno"
		, joinColumns={
			@JoinColumn(name="Curso_id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="Aluno_id", nullable=false)
			}
		)
	private Set<Aluno> alunos;

	//bi-directional many-to-one association to Ambulatorio
	@OneToMany(mappedBy="curso")
	private Set<Ambulatorio> ambulatorios;

	@Column(nullable=false)
	private int ano;

	private Timestamp dataCriacao;

	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	private Date dataFim;

	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	private Date dataInicio;

	@Column(nullable=false, length=300)
	private String ementa;

	//bi-directional many-to-one association to EstudoCaso
	@OneToMany(mappedBy="curso")
	private Set<EstudoCaso> estudocasos;

	//bi-directional many-to-one association to Feedback
	@OneToMany(mappedBy="curso")
	private Set<Feedback> feedbacks;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(nullable=false, length=100)
	private String nome;

	@Column(nullable=false, length=300)
	private String objetivo;

	//bi-directional many-to-many association to Professor
	@ManyToMany(mappedBy="cursos")
	private Set<Professor> professors;

	public Curso() {
	}

	public Ambulatorio addAmbulatorio(Ambulatorio ambulatorio) {
		getAmbulatorios().add(ambulatorio);
		ambulatorio.setCurso(this);

		return ambulatorio;
	}

	public EstudoCaso addEstudocaso(EstudoCaso estudocaso) {
		getEstudocasos().add(estudocaso);
		estudocaso.setCurso(this);

		return estudocaso;
	}

	public Feedback addFeedback(Feedback feedback) {
		getFeedbacks().add(feedback);
		feedback.setCurso(this);

		return feedback;
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(Curso.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){
				
				retorno = true;
			}
		}
		
		return retorno;
	}

	public Set<Aluno> getAlunos() {
		return this.alunos;
	}

	public Set<Ambulatorio> getAmbulatorios() {
		return this.ambulatorios;
	}

	public int getAno() {
		return this.ano;
	}

	public Timestamp getDataCriacao() {
		return this.dataCriacao;
	}

	public Date getDataFim() {
		return this.dataFim;
	}

	public Date getDataInicio() {
		return this.dataInicio;
	}

	public String getEmenta() {
		return this.ementa;
	}

	public Set<EstudoCaso> getEstudocasos() {
		return this.estudocasos;
	}

	public Set<Feedback> getFeedbacks() {
		return this.feedbacks;
	}

	public int getId() {
		return this.id;
	}

	public String getNome() {
		return this.nome;
	}

	public String getObjetivo() {
		return this.objetivo;
	}

	public Set<Professor> getProfessors() {
		return this.professors;
	}

	public Ambulatorio removeAmbulatorio(Ambulatorio ambulatorio) {
		getAmbulatorios().remove(ambulatorio);
		ambulatorio.setCurso(null);

		return ambulatorio;
	}

	public EstudoCaso removeEstudocaso(EstudoCaso estudocaso) {
		getEstudocasos().remove(estudocaso);
		estudocaso.setCurso(null);

		return estudocaso;
	}

	public Feedback removeFeedback(Feedback feedback) {
		getFeedbacks().remove(feedback);
		feedback.setCurso(null);

		return feedback;
	}

	public void setAlunos(Set<Aluno> alunos) {
		this.alunos = alunos;
	}

	public void setAmbulatorios(Set<Ambulatorio> ambulatorios) {
		this.ambulatorios = ambulatorios;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public void setDataCriacao(Timestamp dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

	public void setEmenta(String ementa) {
		this.ementa = ementa;
	}

	public void setEstudocasos(Set<EstudoCaso> estudocasos) {
		this.estudocasos = estudocasos;
	}

	public void setFeedbacks(Set<Feedback> feedbacks) {
		this.feedbacks = feedbacks;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setObjetivo(String objetivo) {
		this.objetivo = objetivo;
	}

	public void setProfessors(Set<Professor> professors) {
		this.professors = professors;
	}
	
	@Override
	public String toString() {
		
		return String.valueOf(this.id);
	}
}