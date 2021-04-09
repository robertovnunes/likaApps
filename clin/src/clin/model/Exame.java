package clin.model;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Exame {
	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer idExame;

	private String nomeExame;
	private Date dataExame;

	// Relacionamentos
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "Exame_idExame")
	private List<ResultadoExame> resultados = new ArrayList<ResultadoExame>();

	@ManyToOne
	@JoinColumn(name = "Atendimento_idAtendimento")
	private Atendimento atendimento;
	
	@OneToOne
	@JoinColumn(name = "solicitadoPor")
	private Medico solicitadoPor;
	
	// Getters e Setters

	
	public Integer getIdExame() {
		return idExame;
	}

	

	public Atendimento getAtendimento() {
		return atendimento;
	}



	public void setAtendimento(Atendimento atendimento) {
		this.atendimento = atendimento;
	}



	public Medico getSolicitadoPor() {
		return solicitadoPor;
	}

	public void setSolicitadoPor(Medico solicitadoPor) {
		this.solicitadoPor = solicitadoPor;
	}

	public void setIdExame(Integer idExame) {
		this.idExame = idExame;
	}

	public String getNomeExame() {
		return nomeExame;
	}

	public void setNomeExame(String nomeExame) {
		this.nomeExame = nomeExame;
	}

	public Date getDataExame() {
		return dataExame;
	}

	public void setDataExame(Date dataExame) {
		this.dataExame = dataExame;
	}

	public List<ResultadoExame> getResultados() {
		return resultados;
	}

	public void setResultados(List<ResultadoExame> resultados) {
		this.resultados = resultados;
	}

}
