package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the ambulatorio database table.
 * 
 */
@Entity
@Table(name="ambulatorio")
@NamedQuery(name="Ambulatorio.findAll", query="SELECT a FROM Ambulatorio a")
public class Ambulatorio implements Serializable {
	private static final long serialVersionUID = 1L;

	//bi-directional many-to-one association to Aluno
	@ManyToOne
	@JoinColumn(name="aluno_id", nullable=false)
	private Aluno aluno;

	//bi-directional many-to-one association to Curso
	@ManyToOne
	@JoinColumn(name="curso_id", nullable=false)
	private Curso curso;

	@Column(length=1000)
	private String equipamento;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(length=1000)
	private String mobilia;

	public Ambulatorio() {
	}

	public Ambulatorio(Aluno aluno, Curso curso, String mobilia,
			String equipamento) {
		this.aluno = aluno;
		this.curso = curso;
		this.mobilia = mobilia;
		this.equipamento = equipamento;
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(Ambulatorio.class) && 
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

	public String getEquipamento() {
		return this.equipamento;
	}

	public int getId() {
		return this.id;
	}

	public String getMobilia() {
		return this.mobilia;
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	public void setEquipamento(String equipamento) {
		this.equipamento = equipamento;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public void setMobilia(String mobilia) {
		this.mobilia = mobilia;
	}
	
	@Override
	public String toString() {
		
		return String.valueOf(this.id);
	}
}