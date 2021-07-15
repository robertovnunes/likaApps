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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the metaprofessor database table.
 * 
 */
@Entity
@Table(name="metaprofessor")
@NamedQuery(name="MetaProfessor.findAll", query="SELECT m FROM MetaProfessor m")
public class MetaProfessor implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(nullable=false, length=200)
	private String descricao;

	//bi-directional many-to-many association to DiagnosticoProfessor
	@ManyToMany
	@JoinTable(
		name="diagnosticoprofessor_has_metaprofessor"
		, joinColumns={
			@JoinColumn(name="metaProfessor_id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="diagnosticoProfessor_id", nullable=false)
			}
		)
	private Set<DiagnosticoProfessor> diagnosticoprofessors;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	//bi-directional many-to-many association to IntervencaoProfessor
	@ManyToMany(cascade=CascadeType.ALL)
	@JoinTable(
		name="metaprofessor_has_intervencaoprofessor"
		, joinColumns={
			@JoinColumn(name="metaProfessor_id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="intervencaoProfessor_id", nullable=false)
			}
		)
	private Set<IntervencaoProfessor> intervencaoprofessors;

	public MetaProfessor() {
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(MetaProfessor.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){
				
				retorno = true;
			}
		}
		
		return retorno;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public Set<DiagnosticoProfessor> getDiagnosticoprofessors() {
		return this.diagnosticoprofessors;
	}

	public int getId() {
		return this.id;
	}

	public Set<IntervencaoProfessor> getIntervencaoprofessors() {
		return this.intervencaoprofessors;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public void setDiagnosticoprofessors(Set<DiagnosticoProfessor> diagnosticoprofessors) {
		this.diagnosticoprofessors = diagnosticoprofessors;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setIntervencaoprofessors(Set<IntervencaoProfessor> intervencaoprofessors) {
		this.intervencaoprofessors = intervencaoprofessors;
	}
	@Override
	public String toString() {
		
		return String.valueOf(this.id);
	}
}