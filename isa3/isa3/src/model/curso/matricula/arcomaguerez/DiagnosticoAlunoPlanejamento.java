package model.curso.matricula.arcomaguerez;

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

import model.Nanda;

@Entity
@Table(name="diagnostico_aluno_planejamento")
public class DiagnosticoAlunoPlanejamento implements Serializable{

	public int id;
	public String etiologia;
	public String sinaisESintomas;
	public Nanda nomenclatura;

	public DiagnosticoAlunoPlanejamento(){
		nomenclatura = new Nanda();
	}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="etiologia", nullable=false)
	public String getEtiologia() {
		return etiologia;
	}


	public void setEtiologia(String etiologia) {
		this.etiologia = etiologia;
	}

	@Column(name="sinaisESintomas", nullable=false)
	public String getSinaisESintomas() {
		return sinaisESintomas;
	}


	public void setSinaisESintomas(String sinaisESintomas) {
		this.sinaisESintomas = sinaisESintomas;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idNanda",nullable=false)
	public Nanda getNomenclatura() {
		return nomenclatura;
	}


	public void setNomenclatura(Nanda nomenclatura) {
		this.nomenclatura = nomenclatura;
	}
	

}
