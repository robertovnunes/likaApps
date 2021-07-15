package model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the competenciashabilidadesespecificas database table.
 * 
 */
@Entity
@Table(name="competenciashabilidadesespecificas")
@NamedQuery(name="CompetenciaHabilidadeEspecifica.findAll", query="SELECT c FROM CompetenciaHabilidadeEspecifica c")
public class CompetenciaHabilidadeEspecifica implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(nullable=false, length=200)
	private String descricao;

	//bi-directional many-to-many association to EstudoCaso
	@ManyToMany(mappedBy="competenciashabilidadesespecificas")
	private Set<EstudoCaso> estudocasos;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	public CompetenciaHabilidadeEspecifica() {
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(CompetenciaHabilidadeEspecifica.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){
				
				retorno = true;
			}
		}
		
		return retorno;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public Set<EstudoCaso> getEstudocasos() {
		return this.estudocasos;
	}

	public int getId() {
		return this.id;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public void setEstudocasos(Set<EstudoCaso> estudocasos) {
		this.estudocasos = estudocasos;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		
		return String.valueOf(this.id);
	}
}