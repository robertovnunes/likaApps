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
@Table(name="antecedentes")
public class Antecedentes implements Serializable{

	public int id;
	public AntecedentesFamiliares antecedentesFamiliares;
	public AntecedentesPessoais antecedentesPessoais;
	
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
	@JoinColumn(name="fk_idAntecedentesFamiliares",nullable=true)
	public AntecedentesFamiliares getAntecedentesFamiliares() {
		return antecedentesFamiliares;
	}

	public void setAntecedentesFamiliares(AntecedentesFamiliares antecedentesFamiliares) {
		this.antecedentesFamiliares = antecedentesFamiliares;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idAntecedentesPessoais",nullable=true)
	public AntecedentesPessoais getAntecedentesPessoais() {
		return antecedentesPessoais;
	}

	public void setAntecedentesPessoais(AntecedentesPessoais antecedentesPessoais) {
		this.antecedentesPessoais = antecedentesPessoais;
	}
	
	@Override
	public Antecedentes clone() {
		Antecedentes clone = new Antecedentes();
		clone.antecedentesFamiliares = antecedentesFamiliares;
		clone.antecedentesPessoais = antecedentesPessoais;
		return clone;
	}
	
}
