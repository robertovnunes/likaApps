package model.paciente.prontuario.atendimento.examemental;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="examemental")
public class ExameMental implements Serializable{

	public int id;
	public ExameMentalGeral exameMentalGeral;
	public ExameMentalMiniMental exameMentalMiniMental;
	
	public ExameMental(){}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idExameMentalGeral",nullable=true)
	public ExameMentalGeral getExameMentalGeral() {
		return exameMentalGeral;
	}

	public void setExameMentalGeral(ExameMentalGeral exameMentalGeral) {
		this.exameMentalGeral = exameMentalGeral;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idExameMentalMiniMental",nullable=true)
	public ExameMentalMiniMental getExameMentalMiniMental() {
		return exameMentalMiniMental;
	}

	public void setExameMentalMiniMental(ExameMentalMiniMental exameMentalMiniMental) {
		this.exameMentalMiniMental = exameMentalMiniMental;
	}
	
	@Override
	public ExameMental clone() {
		ExameMental clone = new ExameMental();
		clone.exameMentalGeral = exameMentalGeral;
		clone.exameMentalMiniMental = exameMentalMiniMental;
		return clone;
	}
	
}
