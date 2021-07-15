package clin.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class Ficha {

	// Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer idFicha;

	// Relacionamentos
	@OneToOne
	@JoinColumn(name = "salvoPor")
	private Usuario salvoPor;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "assinadoPor")
	private Medico assinadoPor;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "atendimento_idAtendimento")
	private Atendimento atendimento;

	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@JoinColumn(name = "fichaRelacionada")
	private List<Adendo> adendos = new ArrayList<Adendo>();

	// Getters and Setters
	public Integer getIdFicha() {
		return idFicha;
	}

	public void setIdFicha(Integer idFicha) {
		this.idFicha = idFicha;
	}

	public Usuario getSalvoPor() {
		return salvoPor;
	}

	public void setSalvoPor(Usuario salvoPor) {
		this.salvoPor = salvoPor;
	}

	public Medico getAssinadoPor() {
		return assinadoPor;
	}

	public void setAssinadoPor(Medico assinadoPor) {
		this.assinadoPor = assinadoPor;
	}

	public Atendimento getAtendimento() {
		return atendimento;
	}

	public void setAtendimento(Atendimento atendimento) {
		this.atendimento = atendimento;
	}

	public List<Adendo> getAdendos() {
		return adendos;
	}

	public void setAdendos(List<Adendo> adendos) {
		this.adendos = adendos;
	}

}
