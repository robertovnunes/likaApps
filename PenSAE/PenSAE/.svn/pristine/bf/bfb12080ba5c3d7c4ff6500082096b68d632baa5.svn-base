package model;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * The persistent class for the estudocaso database table.
 * 
 */
@Entity
@Table(name="estudocaso")
@NamedQuery(name="EstudoCaso.findAll", query="SELECT e FROM EstudoCaso e")
public class EstudoCaso implements Serializable {
	private static final long serialVersionUID = 1L;

	//bi-directional many-to-one association to AlunoEstudoCaso
	@OneToMany(mappedBy="estudocaso")
	private Set<AlunoEstudoCaso> alunoestudocasos;

	//bi-directional many-to-many association to CompetenciaHabilidadeEspecifica
	@ManyToMany(cascade=CascadeType.PERSIST)
	@JoinTable(
			name="estudocaso_has_competenciashabilidadesespecificas"
			, joinColumns={
					@JoinColumn(name="estudocaso_id", nullable=false)
			}
			, inverseJoinColumns={
					@JoinColumn(name="competenciashabilidadesespecificas_id", nullable=false)
			}
			)
	private Set<CompetenciaHabilidadeEspecifica> competenciashabilidadesespecificas;

	//bi-directional many-to-many association to CompetenciaHabilidadeGeral
	@ManyToMany(cascade=CascadeType.PERSIST)
	@JoinTable(
			name="estudocaso_has_competenciashabilidadesgerais"
			, joinColumns={
					@JoinColumn(name="estudocaso_id", nullable=false)
			}
			, inverseJoinColumns={
					@JoinColumn(name="competenciashabilidadesgerais_id", nullable=false)
			}
			)
	private Set<CompetenciaHabilidadeGeral> competenciashabilidadesgerais;

	//bi-directional many-to-one association to Curso
	@ManyToOne
	@JoinColumn(name="curso_id", nullable=false)
	private Curso curso;

	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	private Date dataCriacao;

	@Column(nullable=false, length=5000)
	private String descricao;

	//bi-directional many-to-many association to Estudocaso
	@ManyToMany(mappedBy="estudocasos", cascade=CascadeType.MERGE)
	private Set<Descritor> descritors;

	//bi-directional many-to-one association to Glossario
	@OneToMany(mappedBy="estudocaso")
	private Set<Glossario> glossarios;

	//bi-directional many-to-one association to DiagnosticoProfessor
	@OneToMany(mappedBy="estudocaso", cascade={CascadeType.ALL})
	private Set<DiagnosticoProfessor> diagnosticoprofessors;

	@Column(nullable=false)
	private int grauDificuldade;

	@Column(nullable=false)
	private Boolean habilitado;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Lob
	private byte[] imagem;

	@Column(nullable=false, length=200)
	private String nome;

	@Column(length=500)
	private String objetivosEspecificos;

	@Column(length=500)
	private String objetivosGerais;

	//bi-directional many-to-one association to PontoChaveProfessor
	@OneToMany(mappedBy="estudocaso", cascade={CascadeType.ALL})
	private Set<PontoChaveProfessor> pontochaveprofessors;

	@Column(length=500)
	private String pontosChave;

	@Column(nullable=false, length=100)
	private String responsavel;

	public EstudoCaso() {
	}

	public AlunoEstudoCaso addAlunoestudocaso(AlunoEstudoCaso alunoestudocaso) {
		getAlunoestudocasos().add(alunoestudocaso);
		alunoestudocaso.setEstudocaso(this);

		return alunoestudocaso;
	}

	public DiagnosticoProfessor addDiagnosticoprofessor(DiagnosticoProfessor diagnosticoprofessor) {
		getDiagnosticoprofessors().add(diagnosticoprofessor);
		diagnosticoprofessor.setEstudocaso(this);

		return diagnosticoprofessor;
	}

	public PontoChaveProfessor addPontochaveprofessor(PontoChaveProfessor pontochaveprofessor) {
		getPontochaveprofessors().add(pontochaveprofessor);
		pontochaveprofessor.setEstudocaso(this);

		return pontochaveprofessor;
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;

		if(obj != null){

			if(obj.getClass().equals(EstudoCaso.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){

				retorno = true;
			}
		}

		return retorno;
	}

	public Set<AlunoEstudoCaso> getAlunoestudocasos() {
		return this.alunoestudocasos;
	}

	public Set<CompetenciaHabilidadeEspecifica> getCompetenciashabilidadesespecificas() {
		return this.competenciashabilidadesespecificas;
	}

	public Set<CompetenciaHabilidadeGeral> getCompetenciashabilidadesgerais() {
		return this.competenciashabilidadesgerais;
	}

	public Curso getCurso() {
		return this.curso;
	}

	public Date getDataCriacao() {
		return this.dataCriacao;
	}

	public String getDescricao() {
		return this.descricao;
	}

	/**
	 * @return the descritors
	 */
	public Set<Descritor> getDescritors() {
		return descritors;
	}

	public Set<DiagnosticoProfessor> getDiagnosticoprofessors() {
		return this.diagnosticoprofessors;
	}

	public Set<Glossario> getGlossarios() {
		return this.glossarios;
	}

	public int getGrauDificuldade() {
		return this.grauDificuldade;
	}

	public Boolean getHabilitado() {
		return this.habilitado;
	}

	public int getId() {
		return this.id;
	}

	public byte[] getImagem() {
		return this.imagem;
	}

	public String getNome() {
		return this.nome;
	}

	public String getObjetivosEspecificos() {
		return this.objetivosEspecificos;
	}

	public String getObjetivosGerais() {
		return this.objetivosGerais;
	}

	public Set<PontoChaveProfessor> getPontochaveprofessors() {
		return this.pontochaveprofessors;
	}

	public String getPontosChave() {
		return this.pontosChave;
	}

	public String getResponsavel() {
		return this.responsavel;
	}

	public AlunoEstudoCaso removeAlunoestudocaso(AlunoEstudoCaso alunoestudocaso) {
		getAlunoestudocasos().remove(alunoestudocaso);
		alunoestudocaso.setEstudocaso(null);

		return alunoestudocaso;
	}

	public DiagnosticoProfessor removeDiagnosticoprofessor(DiagnosticoProfessor diagnosticoprofessor) {
		getDiagnosticoprofessors().remove(diagnosticoprofessor);
		diagnosticoprofessor.setEstudocaso(null);

		return diagnosticoprofessor;
	}

	public PontoChaveProfessor removePontochaveprofessor(PontoChaveProfessor pontochaveprofessor) {
		getPontochaveprofessors().remove(pontochaveprofessor);
		pontochaveprofessor.setEstudocaso(null);

		return pontochaveprofessor;
	}

	public void setAlunoestudocasos(Set<AlunoEstudoCaso> alunoestudocasos) {
		this.alunoestudocasos = alunoestudocasos;
	}

	public void setCompetenciashabilidadesespecificas(Set<CompetenciaHabilidadeEspecifica> competenciashabilidadesespecificas) {
		this.competenciashabilidadesespecificas = competenciashabilidadesespecificas;
	}

	public void setCompetenciashabilidadesgerais(Set<CompetenciaHabilidadeGeral> competenciashabilidadesgerais) {
		this.competenciashabilidadesgerais = competenciashabilidadesgerais;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	/**
	 * @param descritors the descritors to set
	 */
	public void setDescritors(Set<Descritor> descritors) {
		this.descritors = descritors;
	}

	public void setDiagnosticoprofessors(Set<DiagnosticoProfessor> diagnosticoprofessors) {
		this.diagnosticoprofessors = diagnosticoprofessors;
	}

	public void setGlossarios(Set<Glossario> glossarios) {
		this.glossarios = glossarios;
	}

	public void setGrauDificuldade(int grauDificuldade) {
		this.grauDificuldade = grauDificuldade;
	}

	public void setHabilitado(Boolean habilitado) {
		this.habilitado = habilitado;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setImagem(byte[] imagem) {
		this.imagem = imagem;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setObjetivosEspecificos(String objetivosEspecificos) {
		this.objetivosEspecificos = objetivosEspecificos;
	}

	public void setObjetivosGerais(String objetivosGerais) {
		this.objetivosGerais = objetivosGerais;
	}

	public void setPontochaveprofessors(Set<PontoChaveProfessor> pontochaveprofessors) {
		this.pontochaveprofessors = pontochaveprofessors;
	}

	public void setPontosChave(String pontosChave) {
		this.pontosChave = pontosChave;
	}

	public void setResponsavel(String responsavel) {
		this.responsavel = responsavel;
	}

	@Override
	public String toString() {

		return String.valueOf(this.id);
	}
}