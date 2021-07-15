package model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the feedback database table.
 * 
 */
@Entity
@Table(name="feedback")
@NamedQuery(name="Feedback.findAll", query="SELECT f FROM Feedback f")
public class Feedback implements Serializable {
	private static final long serialVersionUID = 1L;

	//bi-directional many-to-one association to Aluno
	@ManyToOne
	@JoinColumn(name="aluno_id", nullable=false)
	private Aluno aluno;

	//bi-directional many-to-one association to Curso
	@ManyToOne
	@JoinColumn(name="curso_id", nullable=false)
	private Curso curso;

	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	private Date data;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int idAvaliacao;

	@Column(nullable=false, length=5000)
	private String respostaDois;

	@Column(nullable=false, length=5000)
	private String respostaUm;

	public Feedback() {
	}

	public Feedback(Aluno aluno, Curso curso,
			String respostaPerguntaUm, String respostaPerguntaDois, Date data) {
		
		this.aluno = aluno;
		this.curso = curso;
		this.respostaUm = respostaPerguntaUm;
		this.respostaDois = respostaPerguntaDois;
		this.data = data;
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(Feedback.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){
				
				retorno = true;
			}
		}
		
		return retorno;
	}

	public Aluno getAluno() {
		return this.aluno;
	}

	public Curso getCurso() {
		return this.curso;
	}

	public Date getData() {
		return this.data;
	}

	public int getIdAvaliacao() {
		return this.idAvaliacao;
	}

	public String getRespostaDois() {
		return this.respostaDois;
	}

	public String getRespostaUm() {
		return this.respostaUm;
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public void setIdAvaliacao(int idAvaliacao) {
		this.idAvaliacao = idAvaliacao;
	}

	public void setRespostaDois(String respostaDois) {
		this.respostaDois = respostaDois;
	}
	public void setRespostaUm(String respostaUm) {
		this.respostaUm = respostaUm;
	}
	
	@Override
	public String toString() {
		
		return String.valueOf(this.idAvaliacao);
	}
}