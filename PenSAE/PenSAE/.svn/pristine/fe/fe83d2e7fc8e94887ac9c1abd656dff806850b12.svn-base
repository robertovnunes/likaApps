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
 * The persistent class for the metaaluno database table.
 * 
 */
@Entity
@Table(name="metaaluno")
@NamedQuery(name="MetaAluno.findAll", query="SELECT m FROM MetaAluno m")
public class MetaAluno implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(nullable=false, length=200)
	private String descricao;

	//bi-directional many-to-many association to DiagnosticoAluno
	@ManyToMany
	@JoinTable(
		name="diagnosticoresposta_has_metaresposta"
		, joinColumns={
			@JoinColumn(name="Meta_id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="Diagnostico_id", nullable=false)
			}
		)
	private Set<DiagnosticoAluno> diagnosticoalunos;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	//bi-directional many-to-many association to IntervencaoAluno
	@ManyToMany(cascade=CascadeType.ALL)
	@JoinTable(
		name="metaresposta_has_intervencaoresposta"
		, joinColumns={
			@JoinColumn(name="Meta_id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="Intervencao_id", nullable=false)
			}
		)
	private Set<IntervencaoAluno> intervencaoalunos;

	public MetaAluno() {
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(MetaAluno.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){
				
				retorno = true;
			}
		}
		
		return retorno;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public Set<DiagnosticoAluno> getDiagnosticoalunos() {
		return this.diagnosticoalunos;
	}

	public int getId() {
		return this.id;
	}

	public Set<IntervencaoAluno> getIntervencaoalunos() {
		return this.intervencaoalunos;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public void setDiagnosticoalunos(Set<DiagnosticoAluno> diagnosticoalunos) {
		this.diagnosticoalunos = diagnosticoalunos;
	}

	public void setId(int id) {
		this.id = id;
	}
	public void setIntervencaoalunos(Set<IntervencaoAluno> intervencaoalunos) {
		this.intervencaoalunos = intervencaoalunos;
	}
	
	@Override
	public String toString() {
		
		return String.valueOf(this.id);
	}
}