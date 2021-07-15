package model.paciente.prontuario.atendimento.diagnosticointervencoes;

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

import model.paciente.prontuario.atendimento.Atendimento;

@Entity
@Table(name="processoenfermagem")
public class Diagnostico  implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false, insertable=false, updatable=false)
	int id;
	
	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idCipe",nullable=false)
	Cipe cipe;
	
	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idAtendimento",nullable=false)
	Atendimento atendimento;
	
	public Diagnostico(){}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Cipe getCipe() {
		return cipe;
	}
	public void setCipe(Cipe cipe) {
		this.cipe = cipe;
	}
	public Atendimento getAtendimento() {
		return atendimento;
	}
	public void setAtendimento(Atendimento atendimento) {
		this.atendimento = atendimento;
	}
	
	@Override
	public Diagnostico clone() {
		Diagnostico clone = new Diagnostico();
		clone.atendimento = atendimento;
		clone.cipe = cipe;
		return clone;
	}
	
}
