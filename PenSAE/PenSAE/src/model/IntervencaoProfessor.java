package model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the intervencaoprofessor database table.
 * 
 */
@Entity
@Table(name="intervencaoprofessor")
@NamedQuery(name="IntervencaoProfessor.findAll", query="SELECT i FROM IntervencaoProfessor i")
public class IntervencaoProfessor implements Serializable {
	private static final long serialVersionUID = 1L;

	//bi-directional many-to-one association to Cipe
	@ManyToOne
	@JoinColumn(name="cipe_idcipe", nullable=false)
	private Cipe cipe;

	@Column(nullable=false, length=500)
	private String descricao;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	//bi-directional many-to-many association to MetaProfessor
	@ManyToMany(mappedBy="intervencaoprofessors", cascade={CascadeType.ALL})
	private Set<MetaProfessor> metaprofessors;

	public IntervencaoProfessor() {
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(IntervencaoProfessor.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){
				
				retorno = true;
			}
		}
		
		return retorno;
	}

	public Cipe getCipe() {
		return this.cipe;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public int getId() {
		return this.id;
	}

	public Set<MetaProfessor> getMetaprofessors() {
		return this.metaprofessors;
	}

	public void setCipe(Cipe cipe) {
		this.cipe = cipe;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public void setId(int id) {
		this.id = id;
	}
	public void setMetaprofessors(Set<MetaProfessor> metaprofessors) {
		this.metaprofessors = metaprofessors;
	}
	
	@Override
	public String toString() {
		
		return String.valueOf(this.id);
	}
}