package clin.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Adendo {

	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer idAdendo;

	private String texto;

	// Relacionamentos
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "escritoPor")
	private Usuario escritoPor;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fichaRelacionada")
	private Ficha fichaRelacionada;

	// Getters e Setters
	public Integer getIdAdendo() {
		return idAdendo;
	}

	public void setIdAdendo(Integer idAdendo) {
		this.idAdendo = idAdendo;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	public Usuario getEscritoPor() {
		return escritoPor;
	}

	public void setEscritoPor(Usuario escritoPor) {
		this.escritoPor = escritoPor;
	}

	public Ficha getFichaRelacionada() {
		return fichaRelacionada;
	}

	public void setFichaRelacionada(Ficha fichaRelacionada) {
		this.fichaRelacionada = fichaRelacionada;
	}

}
