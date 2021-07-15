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

@Entity
@Table(name="resultados")
public class Resultados  implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false, insertable=false, updatable=false)
	int id;
	
	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idNoc",nullable=false)
	Noc noc;
	
	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idDiagnostico",nullable=false)
	Diagnostico diagnostico;
	
	public Resultados(){}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Noc getNoc() {
		return noc;
	}

	public void setNoc(Noc noc) {
		this.noc = noc;
	}

	public Diagnostico getDiagnostico() {
		return diagnostico;
	}

	public void setDiagnostico(Diagnostico diagnostico) {
		this.diagnostico = diagnostico;
	}
	
	@Override
	public Resultados clone() {
		Resultados clone = new Resultados();
		clone.diagnostico = diagnostico;
		clone.noc = noc;
		return clone;
	}
	
}
