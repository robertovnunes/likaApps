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
 * The persistent class for the referencias database table.
 * 
 */
@Entity
@Table(name="referencias")
@NamedQuery(name="Referencia.findAll", query="SELECT r FROM Referencia r")
public class Referencia implements Serializable {
	private static final long serialVersionUID = 1L;

	//bi-directional many-to-one association to AlunoEstudoCaso
	@ManyToOne
	@JoinColumn(name="alunoestudocaso_id", nullable=false)
	private AlunoEstudoCaso alunoestudocaso;

	@Column(length=100)
	private String baseDados;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(length=200)
	private String link;

	@Column(length=100)
	private String parametroBusca;

	public Referencia() {
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(Referencia.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){
				
				retorno = true;
			}
		}
		
		return retorno;
	}

	public AlunoEstudoCaso getAlunoestudocaso() {
		return this.alunoestudocaso;
	}

	public String getBaseDados() {
		return this.baseDados;
	}

	public int getId() {
		return this.id;
	}

	public String getLink() {
		return this.link;
	}

	public String getParametroBusca() {
		return this.parametroBusca;
	}

	public void setAlunoestudocaso(AlunoEstudoCaso alunoestudocaso) {
		this.alunoestudocaso = alunoestudocaso;
	}

	public void setBaseDados(String baseDados) {
		this.baseDados = baseDados;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public void setParametroBusca(String parametroBusca) {
		this.parametroBusca = parametroBusca;
	}
	
	@Override
	public String toString() {
		
		return String.valueOf(this.id);
	}
}