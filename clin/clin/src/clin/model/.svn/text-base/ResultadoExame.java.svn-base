package clin.model;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class ResultadoExame {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer idResultadoExame;
	private Date dataResultado;

	// Relacionamentos
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "exame_idExame")
	private Exame exame;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "informadoPor")
	private Medico solicitadoPor;

	// Getters e Setters
	public Integer getIdResultadoExame() {
		return idResultadoExame;
	}

	public Medico getSolicitadoPor() {
		return solicitadoPor;
	}

	public void setSolicitadoPor(Medico solicitadoPor) {
		this.solicitadoPor = solicitadoPor;
	}

	public void setIdResultadoExame(Integer idResultadoExame) {
		this.idResultadoExame = idResultadoExame;
	}

	public Date getDataResultado() {
		return dataResultado;
	}

	public void setDataResultado(Date dataResultado) {
		this.dataResultado = dataResultado;
	}

	public Exame getExame() {
		return exame;
	}

	public void setExame(Exame exame) {
		this.exame = exame;
	}

}
