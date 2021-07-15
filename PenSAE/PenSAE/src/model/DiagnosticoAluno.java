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
 * The persistent class for the diagnosticoaluno database table.
 * 
 */
@Entity
@Table(name="diagnosticoaluno")
@NamedQuery(name="DiagnosticoAluno.findAll", query="SELECT d FROM DiagnosticoAluno d")
public class DiagnosticoAluno implements Serializable {
	private static final long serialVersionUID = 1L;

	//bi-directional many-to-one association to AlunoEstudoCaso
	@ManyToOne
	@JoinColumn(name="AlunoEstudoCaso_id", nullable=false)
	private AlunoEstudoCaso alunoestudocaso;

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

	//bi-directional many-to-many association to MetaAluno
	@ManyToMany(mappedBy="diagnosticoalunos", cascade={CascadeType.ALL})
	private Set<MetaAluno> metaalunos;

	//bi-directional many-to-one association to PontoChaveAluno
	@ManyToOne
	@JoinColumn(name="respostaspontochave_id", nullable=false)
	private PontoChaveAluno pontochavealuno;

	public DiagnosticoAluno() {
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(DiagnosticoAluno.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){
				
				retorno = true;
			}
		}
		
		return retorno;
	}

	public AlunoEstudoCaso getAlunoestudocaso() {
		return this.alunoestudocaso;
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

	public Set<MetaAluno> getMetaalunos() {
		return this.metaalunos;
	}

	public PontoChaveAluno getPontochavealuno() {
		return this.pontochavealuno;
	}

	public void setAlunoestudocaso(AlunoEstudoCaso alunoestudocaso) {
		this.alunoestudocaso = alunoestudocaso;
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

	public void setMetaalunos(Set<MetaAluno> metaalunos) {
		this.metaalunos = metaalunos;
	}
	public void setPontochavealuno(PontoChaveAluno pontochavealuno) {
		this.pontochavealuno = pontochavealuno;
	}
	
	@Override
	public String toString() {
		
		return String.valueOf(this.id);
	}
}