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
 * The persistent class for the alunoestudocaso database table.
 * 
 */
@Entity
@Table(name="alunoestudocaso")
@NamedQuery(name="AlunoEstudoCaso.findAll", query="SELECT a FROM AlunoEstudoCaso a")
public class AlunoEstudoCaso implements Serializable {
	private static final long serialVersionUID = 1L;

	//bi-directional many-to-one association to Aluno
	@ManyToOne
	@JoinColumn(name="Aluno_id", nullable=false)
	private Aluno aluno;

	//bi-directional many-to-one association to Avaliacao
	@OneToMany(mappedBy="alunoestudocaso", cascade=CascadeType.ALL)
	private Set<Avaliacao> avaliacaos;

	//bi-directional many-to-one association to DiagnosticoAluno
	@OneToMany(mappedBy="alunoestudocaso", cascade={CascadeType.ALL})
	private Set<DiagnosticoAluno> diagnosticoalunos;

	//bi-directional many-to-one association to EstudoCaso
	@ManyToOne
	@JoinColumn(name="EstudoCaso_id", nullable=false)
	private EstudoCaso estudocaso;

	@Column(nullable=false)
	private int faseAtual;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	//bi-directional many-to-one association to PontoChaveAluno
	@OneToMany(mappedBy="alunoestudocaso")
	private Set<PontoChaveAluno> pontochavealunos;

	//bi-directional many-to-one association to Referencia
	@OneToMany(mappedBy="alunoestudocaso")
	private Set<Referencia> referencias;

	public AlunoEstudoCaso() {
	}

	public Avaliacao addAvaliacao(Avaliacao avaliacao) {
		getAvaliacaos().add(avaliacao);
		avaliacao.setAlunoestudocaso(this);

		return avaliacao;
	}

	public DiagnosticoAluno addDiagnosticoaluno(DiagnosticoAluno diagnosticoaluno) {
		getDiagnosticoalunos().add(diagnosticoaluno);
		diagnosticoaluno.setAlunoestudocaso(this);

		return diagnosticoaluno;
	}

	public PontoChaveAluno addPontochavealuno(PontoChaveAluno pontochavealuno) {
		getPontochavealunos().add(pontochavealuno);
		pontochavealuno.setAlunoestudocaso(this);

		return pontochavealuno;
	}

	public Referencia addReferencia(Referencia referencia) {
		getReferencias().add(referencia);
		referencia.setAlunoestudocaso(this);

		return referencia;
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(AlunoEstudoCaso.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){
				
				retorno = true;
			}
		}
		
		return retorno;
	}

	public Aluno getAluno() {
		return this.aluno;
	}

	public Set<Avaliacao> getAvaliacaos() {
		return this.avaliacaos;
	}

	public Set<DiagnosticoAluno> getDiagnosticoalunos() {
		return this.diagnosticoalunos;
	}

	public EstudoCaso getEstudocaso() {
		return this.estudocaso;
	}

	public int getFaseAtual() {
		return this.faseAtual;
	}

	public int getId() {
		return this.id;
	}

	public Set<PontoChaveAluno> getPontochavealunos() {
		return this.pontochavealunos;
	}

	public Set<Referencia> getReferencias() {
		return this.referencias;
	}

	public Avaliacao removeAvaliacao(Avaliacao avaliacao) {
		getAvaliacaos().remove(avaliacao);
		avaliacao.setAlunoestudocaso(null);

		return avaliacao;
	}

	public DiagnosticoAluno removeDiagnosticoaluno(DiagnosticoAluno diagnosticoaluno) {
		getDiagnosticoalunos().remove(diagnosticoaluno);
		diagnosticoaluno.setAlunoestudocaso(null);

		return diagnosticoaluno;
	}

	public PontoChaveAluno removePontochavealuno(PontoChaveAluno pontochavealuno) {
		getPontochavealunos().remove(pontochavealuno);
		pontochavealuno.setAlunoestudocaso(null);

		return pontochavealuno;
	}

	public Referencia removeReferencia(Referencia referencia) {
		getReferencias().remove(referencia);
		referencia.setAlunoestudocaso(null);

		return referencia;
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}

	public void setAvaliacaos(Set<Avaliacao> avaliacaos) {
		this.avaliacaos = avaliacaos;
	}

	public void setDiagnosticoalunos(Set<DiagnosticoAluno> diagnosticoalunos) {
		this.diagnosticoalunos = diagnosticoalunos;
	}

	public void setEstudocaso(EstudoCaso estudocaso) {
		this.estudocaso = estudocaso;
	}

	public void setFaseAtual(int faseAtual) {
		this.faseAtual = faseAtual;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setPontochavealunos(Set<PontoChaveAluno> pontochavealunos) {
		this.pontochavealunos = pontochavealunos;
	}
	
	public void setReferencias(Set<Referencia> referencias) {
		this.referencias = referencias;
	}
	
	@Override
	public String toString() {
		
		return String.valueOf(this.id);
	}
}