package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the pontochaveprofessor database table.
 * 
 */
@Entity
@Table(name="pontochaveprofessor")
@NamedQuery(name="PontoChaveProfessor.findAll", query="SELECT p FROM PontoChaveProfessor p")
public class PontoChaveProfessor implements Serializable {
	private static final long serialVersionUID = 1L;

	//bi-directional many-to-one association to EstudoCaso
	@ManyToOne
	@JoinColumn(name="estudocaso_id", nullable=false)
	private EstudoCaso estudocaso;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int idpontochaveprofessor;

	@Column(length=1000)
	private String justificativa;

	@Column(length=500)
	private String nome;

	public PontoChaveProfessor() {
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(PontoChaveProfessor.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){
				
				retorno = true;
			}
		}
		
		return retorno;
	}

	public EstudoCaso getEstudocaso() {
		return this.estudocaso;
	}

	public int getIdpontochaveprofessor() {
		return this.idpontochaveprofessor;
	}

	public String getJustificativa() {
		return this.justificativa;
	}

	public String getNome() {
		return this.nome;
	}

	public void setEstudocaso(EstudoCaso estudocaso) {
		this.estudocaso = estudocaso;
	}

	public void setIdpontochaveprofessor(int idpontochaveprofessor) {
		this.idpontochaveprofessor = idpontochaveprofessor;
	}

	public void setJustificativa(String justificativa) {
		this.justificativa = justificativa;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	@Override
	public String toString() {
		
		return String.valueOf(this.idpontochaveprofessor);
	}
}