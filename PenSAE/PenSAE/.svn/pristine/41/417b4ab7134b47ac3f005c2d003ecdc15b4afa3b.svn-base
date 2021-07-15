package model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;


/**
 * The persistent class for the cipe database table.
 * 
 */
@Entity
@Table(name="cipe")
@NamedQuery(name="Cipe.findAll", query="SELECT c FROM Cipe c")
public class Cipe implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(nullable=false)
	private int codigo;

	@Column(name="descricao_conceito", nullable=false, length=1000)
	private String descricaoConceito;

	//bi-directional many-to-one association to DiagnosticoAluno
	@OneToMany(mappedBy="cipe")
	private Set<DiagnosticoAluno> diagnosticoalunos;

	//bi-directional many-to-one association to DiagnosticoProfessor
	@OneToMany(mappedBy="cipe")
	private Set<DiagnosticoProfessor> diagnosticoprofessors;

	@Column(nullable=false, length=50)
	private String eixo;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int idcipe;

	//bi-directional many-to-one association to IntervencaoAluno
	@OneToMany(mappedBy="cipe")
	private Set<IntervencaoAluno> intervencaoalunos;

	//bi-directional many-to-one association to IntervencaoProfessor
	@OneToMany(mappedBy="cipe")
	private Set<IntervencaoProfessor> intervencaoprofessors;

	@Column(nullable=false, length=100)
	private String termo;

	@Column(nullable=false, length=10)
	private String versao;

	public Cipe() {
	}

	public DiagnosticoAluno addDiagnosticoaluno(DiagnosticoAluno diagnosticoaluno) {
		getDiagnosticoalunos().add(diagnosticoaluno);
		diagnosticoaluno.setCipe(this);

		return diagnosticoaluno;
	}

	public DiagnosticoProfessor addDiagnosticoprofessor(DiagnosticoProfessor diagnosticoprofessor) {
		getDiagnosticoprofessors().add(diagnosticoprofessor);
		diagnosticoprofessor.setCipe(this);

		return diagnosticoprofessor;
	}

	public IntervencaoAluno addIntervencaoaluno(IntervencaoAluno intervencaoaluno) {
		getIntervencaoalunos().add(intervencaoaluno);
		intervencaoaluno.setCipe(this);

		return intervencaoaluno;
	}

	public IntervencaoProfessor addIntervencaoprofessor(IntervencaoProfessor intervencaoprofessor) {
		getIntervencaoprofessors().add(intervencaoprofessor);
		intervencaoprofessor.setCipe(this);

		return intervencaoprofessor;
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(Cipe.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){
				
				retorno = true;
			}
		}
		
		return retorno;
	}

	public int getCodigo() {
		return this.codigo;
	}

	public String getDescricaoConceito() {
		return this.descricaoConceito;
	}

	public Set<DiagnosticoAluno> getDiagnosticoalunos() {
		return this.diagnosticoalunos;
	}

	public Set<DiagnosticoProfessor> getDiagnosticoprofessors() {
		return this.diagnosticoprofessors;
	}

	public String getEixo() {
		return this.eixo;
	}

	public int getIdcipe() {
		return this.idcipe;
	}

	public Set<IntervencaoAluno> getIntervencaoalunos() {
		return this.intervencaoalunos;
	}

	public Set<IntervencaoProfessor> getIntervencaoprofessors() {
		return this.intervencaoprofessors;
	}

	public String getTermo() {
		return this.termo;
	}

	public String getVersao() {
		return this.versao;
	}

	public DiagnosticoAluno removeDiagnosticoaluno(DiagnosticoAluno diagnosticoaluno) {
		getDiagnosticoalunos().remove(diagnosticoaluno);
		diagnosticoaluno.setCipe(null);

		return diagnosticoaluno;
	}

	public DiagnosticoProfessor removeDiagnosticoprofessor(DiagnosticoProfessor diagnosticoprofessor) {
		getDiagnosticoprofessors().remove(diagnosticoprofessor);
		diagnosticoprofessor.setCipe(null);

		return diagnosticoprofessor;
	}

	public IntervencaoAluno removeIntervencaoaluno(IntervencaoAluno intervencaoaluno) {
		getIntervencaoalunos().remove(intervencaoaluno);
		intervencaoaluno.setCipe(null);

		return intervencaoaluno;
	}

	public IntervencaoProfessor removeIntervencaoprofessor(IntervencaoProfessor intervencaoprofessor) {
		getIntervencaoprofessors().remove(intervencaoprofessor);
		intervencaoprofessor.setCipe(null);

		return intervencaoprofessor;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public void setDescricaoConceito(String descricaoConceito) {
		this.descricaoConceito = descricaoConceito;
	}

	public void setDiagnosticoalunos(Set<DiagnosticoAluno> diagnosticoalunos) {
		this.diagnosticoalunos = diagnosticoalunos;
	}

	public void setDiagnosticoprofessors(Set<DiagnosticoProfessor> diagnosticoprofessors) {
		this.diagnosticoprofessors = diagnosticoprofessors;
	}

	public void setEixo(String eixo) {
		this.eixo = eixo;
	}

	public void setIdcipe(int idcipe) {
		this.idcipe = idcipe;
	}

	public void setIntervencaoalunos(Set<IntervencaoAluno> intervencaoalunos) {
		this.intervencaoalunos = intervencaoalunos;
	}

	public void setIntervencaoprofessors(Set<IntervencaoProfessor> intervencaoprofessors) {
		this.intervencaoprofessors = intervencaoprofessors;
	}

	public void setTermo(String termo) {
		this.termo = termo;
	}
	
	public void setVersao(String versao) {
		this.versao = versao;
	}

	@Override
	public String toString() {
		
		return String.valueOf(this.idcipe);
	}
}