package model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the descritors database table.
 * 
 */
@Entity
@Table(name="descritores")
@NamedQuery(name="Descritor.findAll", query="SELECT d FROM Descritor d")
public class Descritor implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String descritor;

	//bi-directional many-to-many association to Descritor
	@ManyToMany
	@JoinTable(
			name="estudocaso_has_descritores"
			, joinColumns={
					@JoinColumn(name="estudocaso_id")
			}
			, inverseJoinColumns={
					@JoinColumn(name="descritores_id")
			}
			)
	private Set<EstudoCaso> estudocasos;

	public Descritor() {
	}

	@Override
	public boolean equals(Object obj){

		boolean retorno = false;

		if(obj != null){

			if(obj.getClass().equals(Descritor.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){

				retorno = true;
			}
		}
		return retorno;
	}

	public String getDescritor() {
		return this.descritor;
	}

	public Set<EstudoCaso> getEstudocasos() {
		return this.estudocasos;
	}

	public int getId() {
		return this.id;
	}

	public void setDescritor(String descritor) {
		this.descritor = descritor;
	}

	public void setEstudocasos(Set<EstudoCaso> estudocasos) {
		this.estudocasos = estudocasos;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString(){
		return String.valueOf(getId());
	}
}