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
@Table(name="intervencoes")
public class Intervencoes  implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false, insertable=false, updatable=false)
	int id;
	
	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idNic",nullable=false)
	Nic nic;
	
	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idDiagnostico",nullable=false)
	Diagnostico diagnostico;
	
	public Intervencoes(){}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Nic getNic() {
		return nic;
	}

	public void setNic(Nic nic) {
		this.nic = nic;
	}

	public Diagnostico getDiagnostico() {
		return diagnostico;
	}

	public void setDiagnostico(Diagnostico diagnostico) {
		this.diagnostico = diagnostico;
	}
	
	@Override
	public Intervencoes clone() {
		Intervencoes clone = new Intervencoes();
		clone.diagnostico = diagnostico;
		clone.nic = nic;
		return clone;
	}
	
}
