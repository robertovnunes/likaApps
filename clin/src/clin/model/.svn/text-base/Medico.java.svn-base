package clin.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;


@Entity
@PrimaryKeyJoinColumn(name = "usuario_idusuario")
public class Medico extends Usuario{
	
	
	// Atributos
	private String conselho;

	// Relacionamentos
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "assinadoPor")
	private List<Ficha> fichasAssinadas = new ArrayList<Ficha>();

	// Getters and Setters
	public String getConselho() {
		return conselho;
	}

	public void setConselho(String conselho) {
		this.conselho = conselho;
	}

	public List<Ficha> getFichasAssinadas() {
		return fichasAssinadas;
	}

	public void setFichasAssinadas(List<Ficha> fichasAssinadas) {
		this.fichasAssinadas = fichasAssinadas;
	}

}
