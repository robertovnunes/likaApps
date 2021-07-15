package model.paciente.prontuario.atendimento;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import model.paciente.prontuario.atendimento.antecedentes.Antecedentes;
import model.paciente.prontuario.atendimento.examefisico.ExameFisico;
import model.paciente.prontuario.atendimento.examemental.ExameMental;
import model.paciente.prontuario.atendimento.necessidades.NecessidadesBasicas;
import model.paciente.prontuario.atendimento.queixa.Queixa;

@Entity
@Table(name="admissao")
@PrimaryKeyJoinColumn(name="id") 
public class Admissao extends Atendimento implements Serializable{

	public int id;
	public Queixa queixa;
	public ExameFisico exameFisico;
	public ExameMental exameMental;
	public NecessidadesBasicas necessidadesBasicas;
	public Antecedentes antecedentes;
	public boolean ehReadmissao;
	
	public Admissao (){}
	
	@Column(name="id", nullable=false, insertable=false, updatable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idQueixa",nullable=true)
	public Queixa getQueixa() {
		return queixa;
	}

	public void setQueixa(Queixa queixa) {
		this.queixa = queixa;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idExameFisico",nullable=true)
	public ExameFisico getExameFisico() {
		return exameFisico;
	}

	public void setExameFisico(ExameFisico exameFisico) {
		this.exameFisico = exameFisico;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idExameMental",nullable=true)
	public ExameMental getExameMental() {
		return exameMental;
	}

	public void setExameMental(ExameMental exameMental) {
		this.exameMental = exameMental;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idNecessidades",nullable=true)
	public NecessidadesBasicas getNecessidadesBasicas() {
		return necessidadesBasicas;
	}

	public void setNecessidadesBasicas(NecessidadesBasicas necessidadesBasicas) {
		this.necessidadesBasicas = necessidadesBasicas;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idAntecedentes",nullable=true)
	public Antecedentes getAntecedentes() {
		return antecedentes;
	}

	public void setAntecedentes(Antecedentes antecedentes) {
		this.antecedentes = antecedentes;
	}

	@Column(name="ehReadmissao", nullable=false)
	public boolean getEhReadmissao() {
		return ehReadmissao;
	}

	public void setEhReadmissao(boolean ehReadmissao) {
		this.ehReadmissao = ehReadmissao;
	}
	
}
