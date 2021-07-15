package model.paciente.prontuario.atendimento.examefisico;

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
@Table(name="exameFisico")
public class ExameFisico implements Serializable{

	public int id;
	public ExameAuditivo exameAuditivo;
	public ExameBoca exameBoca;
	public ExameCouroCabeludo exameCouroCabeludo;
	public ExameMamas exameMamas;
	public ExameNariz exameNariz;
	public ExameOlhos exameOlhos;
	public ExamePadrao examePadrao;
	public ExamePescoco examePescoco;
	public ExameSistCardiovascular exameSistCardiovascular;
	public ExameSistGastroIntestinal exameSistGastroIntestinal;
	public ExameSistGenitoUrinario exameSistGenitoUrinario;
	public ExameSistPelesAnexos exameSistPelesAnexos;
	public ExameSistRespiratorio exameSistRespiratorio;
	
	public ExameFisico(){}

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
	@JoinColumn(name="fk_idExameAuditivo",nullable=true)
	public ExameAuditivo getExameAuditivo() {
		return exameAuditivo;
	}

	public void setExameAuditivo(ExameAuditivo exameAuditivo) {
		this.exameAuditivo = exameAuditivo;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idExameBoca",nullable=true)
	public ExameBoca getExameBoca() {
		return exameBoca;
	}

	public void setExameBoca(ExameBoca exameBoca) {
		this.exameBoca = exameBoca;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idExameCouroCabeludo",nullable=true)
	public ExameCouroCabeludo getExameCouroCabeludo() {
		return exameCouroCabeludo;
	}

	public void setExameCouroCabeludo(ExameCouroCabeludo exameCouroCabeludo) {
		this.exameCouroCabeludo = exameCouroCabeludo;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idExameMamas",nullable=true)
	public ExameMamas getExameMamas() {
		return exameMamas;
	}

	public void setExameMamas(ExameMamas exameMamas) {
		this.exameMamas = exameMamas;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idExameNariz",nullable=true)
	public ExameNariz getExameNariz() {
		return exameNariz;
	}

	public void setExameNariz(ExameNariz exameNariz) {
		this.exameNariz = exameNariz;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idExameOlhos",nullable=true)
	public ExameOlhos getExameOlhos() {
		return exameOlhos;
	}

	public void setExameOlhos(ExameOlhos exameOlhos) {
		this.exameOlhos = exameOlhos;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idExamePadrao",nullable=true)
	public ExamePadrao getExamePadrao() {
		return examePadrao;
	}

	public void setExamePadrao(ExamePadrao examePadrao) {
		this.examePadrao = examePadrao;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idExamePescoco",nullable=true)
	public ExamePescoco getExamePescoco() {
		return examePescoco;
	}

	public void setExamePescoco(ExamePescoco examePescoco) {
		this.examePescoco = examePescoco;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idExameSistCardiovascular",nullable=true)
	public ExameSistCardiovascular getExameSistCardiovascular() {
		return exameSistCardiovascular;
	}

	public void setExameSistCardiovascular(
			ExameSistCardiovascular exameSistCardiovascular) {
		this.exameSistCardiovascular = exameSistCardiovascular;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idExameSistGastroIntestinal",nullable=true)
	public ExameSistGastroIntestinal getExameSistGastroIntestinal() {
		return exameSistGastroIntestinal;
	}

	public void setExameSistGastroIntestinal(
			ExameSistGastroIntestinal exameSistGastroIntestinal) {
		this.exameSistGastroIntestinal = exameSistGastroIntestinal;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idExameSistGenitoUrinario",nullable=true)
	public ExameSistGenitoUrinario getExameSistGenitoUrinario() {
		return exameSistGenitoUrinario;
	}

	public void setExameSistGenitoUrinario(
			ExameSistGenitoUrinario exameSistGenitoUrinario) {
		this.exameSistGenitoUrinario = exameSistGenitoUrinario;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idExameSistPelesAnexos",nullable=true)
	public ExameSistPelesAnexos getExameSistPelesAnexos() {
		return exameSistPelesAnexos;
	}

	public void setExameSistPelesAnexos(ExameSistPelesAnexos exameSistPelesAnexos) {
		this.exameSistPelesAnexos = exameSistPelesAnexos;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idExameSistRespiratorio",nullable=true)
	public ExameSistRespiratorio getExameSistRespiratorio() {
		return exameSistRespiratorio;
	}

	public void setExameSistRespiratorio(ExameSistRespiratorio exameSistRespiratorio) {
		this.exameSistRespiratorio = exameSistRespiratorio;
	}
	
	@Override
	public ExameFisico clone() {
		ExameFisico clone = new ExameFisico();
		clone.exameAuditivo = exameAuditivo;
		clone.exameBoca = exameBoca;
		clone.exameCouroCabeludo = exameCouroCabeludo;
		clone.exameMamas = exameMamas;
		clone.exameNariz = exameNariz;
		clone.exameOlhos = exameOlhos;
		clone.examePadrao = examePadrao;
		clone.examePescoco = examePescoco;
		clone.exameSistCardiovascular = exameSistCardiovascular;
		clone.exameSistGastroIntestinal = exameSistGastroIntestinal;
		clone.exameSistGenitoUrinario = exameSistGenitoUrinario;
		clone.exameSistPelesAnexos = exameSistPelesAnexos;
		clone.exameSistRespiratorio = exameSistRespiratorio;
		return clone;
	}
	
}
