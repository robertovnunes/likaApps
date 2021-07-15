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
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;


/**
 * The persistent class for the pontochavealuno database table.
 * 
 */
@Entity
@Table(name="pontochavealuno")
@NamedQuery(name="PontoChaveAluno.findAll", query="SELECT p FROM PontoChaveAluno p")
public class PontoChaveAluno implements Serializable {
	private static final long serialVersionUID = 1L;

	//bi-directional many-to-one association to AlunoEstudoCaso
	@ManyToOne
	@JoinColumn(name="alunoestudocaso_id", nullable=false)
	private AlunoEstudoCaso alunoestudocaso;

	//bi-directional many-to-one association to DiagnosticoAluno
	@OneToMany(mappedBy="pontochavealuno", cascade={CascadeType.ALL})
	private Set<DiagnosticoAluno> diagnosticoalunos;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(nullable=false, length=200)
	private String justificativa;

	@Column(nullable=false, length=100)
	private String nome;

	public PontoChaveAluno() {
	}

	public DiagnosticoAluno addDiagnosticoaluno(DiagnosticoAluno diagnosticoaluno) {
		getDiagnosticoalunos().add(diagnosticoaluno);
		diagnosticoaluno.setPontochavealuno(this);

		return diagnosticoaluno;
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(PontoChaveAluno.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){
				
				retorno = true;
			}
		}
		
		return retorno;
	}

	public AlunoEstudoCaso getAlunoestudocaso() {
		return this.alunoestudocaso;
	}

	public Set<DiagnosticoAluno> getDiagnosticoalunos() {
		return this.diagnosticoalunos;
	}

	public int getId() {
		return this.id;
	}

	public String getJustificativa() {
		return this.justificativa;
	}

	public String getNome() {
		return this.nome;
	}

	public DiagnosticoAluno removeDiagnosticoaluno(DiagnosticoAluno diagnosticoaluno) {
		getDiagnosticoalunos().remove(diagnosticoaluno);
		diagnosticoaluno.setPontochavealuno(null);

		return diagnosticoaluno;
	}

	public void setAlunoestudocaso(AlunoEstudoCaso alunoestudocaso) {
		this.alunoestudocaso = alunoestudocaso;
	}

	public void setDiagnosticoalunos(Set<DiagnosticoAluno> diagnosticoalunos) {
		this.diagnosticoalunos = diagnosticoalunos;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setJustificativa(String justificativa) {
		this.justificativa = justificativa;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	@Override
	public String toString() {
		
		return String.valueOf(this.id);
	}
}