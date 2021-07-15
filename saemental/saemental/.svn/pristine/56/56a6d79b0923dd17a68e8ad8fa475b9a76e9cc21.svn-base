package model.paciente.prontuario.atendimento.examefisico;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="examefisico_ExameCouroCabeludo")
public class ExameCouroCabeludo implements Serializable {

	public int id;
	public boolean semQueixas;
	public boolean lesoes;
	public boolean parasitose;
	public boolean sujidade;
	public boolean deformidadeCraniana;
	public String outros;
	
	public ExameCouroCabeludo(){}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="lesoes", nullable=true)
	public boolean getLesoes() {
		return lesoes;
	}

	public void setLesoes(boolean lesoes) {
		this.lesoes = lesoes;
	}

	@Column(name="parasitose", nullable=true)
	public boolean getParasitose() {
		return parasitose;
	}

	public void setParasitose(boolean parasitose) {
		this.parasitose = parasitose;
	}

	@Column(name="sujidade", nullable=true)
	public boolean getSujidade() {
		return sujidade;
	}

	public void setSujidade(boolean sujidade) {
		this.sujidade = sujidade;
	}

	@Column(name="deformidadeCraniana", nullable=true)
	public boolean getDeformidadeCraniana() {
		return deformidadeCraniana;
	}

	public void setDeformidadeCraniana(boolean deformidadeCraniana) {
		this.deformidadeCraniana = deformidadeCraniana;
	}

	@Column(name="outros", nullable=true)
	public String getOutros() {
		return outros;
	}

	public void setOutros(String outros) {
		this.outros = outros;
	}
	
	@Column(name="semQueixas", nullable=true)
	public boolean getSemQueixas() {
		return semQueixas;
	}

	public void setSemQueixas(boolean semQueixas) {
		this.semQueixas = semQueixas;
	}
}
