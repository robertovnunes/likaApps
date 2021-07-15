package model.paciente.prontuario.atendimento.antecedentes;

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
@Table(name="antecedente_familiar")
public class AntecedenteFamiliar implements Serializable{

	public int id;
	public String parente;
	public String patologia;
	public AntecedentesFamiliares antecedentesFamiliares;
	
	public AntecedenteFamiliar(){}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="parente", nullable=false)
	public String getParente() {
		return parente;
	}

	public void setParente(String parente) {
		this.parente = parente;
	}

	@Column(name="patologia", nullable=false)
	public String getPatologia() {
		return patologia;
	}

	public void setPatologia(String patologia) {
		this.patologia = patologia;
	}
	
	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idAntecedentesFamiliares",nullable=false)
	public AntecedentesFamiliares getAntecedentesFamiliares() {
		return antecedentesFamiliares;
	}

	public void setAntecedentesFamiliares(
			AntecedentesFamiliares antecedentesFamiliares) {
		this.antecedentesFamiliares = antecedentesFamiliares;
	}

}
