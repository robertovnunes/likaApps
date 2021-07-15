package model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the professor database table.
 * 
 */
@Entity
@Table(name="professor")
@NamedQuery(name="Professor.findAll", query="SELECT p FROM Professor p")
public class Professor implements Serializable {
	private static final long serialVersionUID = 1L;

	private int aplicacaoProblematizacao;

	@Column(length=45)
	private String aprendizadoIndividual;

	private int associacaoTeorica;

	private int cargaHorariaSemanal;

	@Column(length=200)
	private String contextoProblematizacao;

	//bi-directional many-to-many association to Curso
	@ManyToMany
	@JoinTable(
		name="curso_has_professor"
		, joinColumns={
			@JoinColumn(name="Professor_id", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="Curso_id", nullable=false)
			}
		)
	private Set<Curso> cursos;

	private byte dedicacaoExclusiva;

	private int desenvolveCooperacao;

	@Column(length=100)
	private String formaAssociacao;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	private int motivEnsino;

	@Column(length=200)
	private String motivEnsinoRazao;

	private int tempoAssistenciaGerencial;

	private int tempoDocencia;

	private int tempoOutros;

	@Column(length=45)
	private String titulacao;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="usuario_id", nullable=false)
	private Usuario usuario;

	@Column(length=45)
	private String utilizaTecnologia;

	public Professor() {
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(Professor.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){
				
				retorno = true;
			}
		}
		
		return retorno;
	}

	public int getAplicacaoProblematizacao() {
		return this.aplicacaoProblematizacao;
	}

	public String getAprendizadoIndividual() {
		return this.aprendizadoIndividual;
	}

	public int getAssociacaoTeorica() {
		return this.associacaoTeorica;
	}

	public int getCargaHorariaSemanal() {
		return this.cargaHorariaSemanal;
	}

	public String getContextoProblematizacao() {
		return this.contextoProblematizacao;
	}

	public Set<Curso> getCursos() {
		return this.cursos;
	}

	public byte getDedicacaoExclusiva() {
		return this.dedicacaoExclusiva;
	}

	public int getDesenvolveCooperacao() {
		return this.desenvolveCooperacao;
	}

	public String getFormaAssociacao() {
		return this.formaAssociacao;
	}

	public int getId() {
		return this.id;
	}

	public int getMotivEnsino() {
		return this.motivEnsino;
	}

	public String getMotivEnsinoRazao() {
		return this.motivEnsinoRazao;
	}

	public int getTempoAssistenciaGerencial() {
		return this.tempoAssistenciaGerencial;
	}

	public int getTempoDocencia() {
		return this.tempoDocencia;
	}

	public int getTempoOutros() {
		return this.tempoOutros;
	}

	public String getTitulacao() {
		return this.titulacao;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public String getUtilizaTecnologia() {
		return this.utilizaTecnologia;
	}

	public void setAplicacaoProblematizacao(int aplicacaoProblematizacao) {
		this.aplicacaoProblematizacao = aplicacaoProblematizacao;
	}

	public void setAprendizadoIndividual(String aprendizadoIndividual) {
		this.aprendizadoIndividual = aprendizadoIndividual;
	}

	public void setAssociacaoTeorica(int associacaoTeorica) {
		this.associacaoTeorica = associacaoTeorica;
	}

	public void setCargaHorariaSemanal(int cargaHorariaSemanal) {
		this.cargaHorariaSemanal = cargaHorariaSemanal;
	}

	public void setContextoProblematizacao(String contextoProblematizacao) {
		this.contextoProblematizacao = contextoProblematizacao;
	}

	public void setCursos(Set<Curso> cursos) {
		this.cursos = cursos;
	}

	public void setDedicacaoExclusiva(byte dedicacaoExclusiva) {
		this.dedicacaoExclusiva = dedicacaoExclusiva;
	}

	public void setDesenvolveCooperacao(int desenvolveCooperacao) {
		this.desenvolveCooperacao = desenvolveCooperacao;
	}

	public void setFormaAssociacao(String formaAssociacao) {
		this.formaAssociacao = formaAssociacao;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setMotivEnsino(int motivEnsino) {
		this.motivEnsino = motivEnsino;
	}

	public void setMotivEnsinoRazao(String motivEnsinoRazao) {
		this.motivEnsinoRazao = motivEnsinoRazao;
	}

	public void setTempoAssistenciaGerencial(int tempoAssistenciaGerencial) {
		this.tempoAssistenciaGerencial = tempoAssistenciaGerencial;
	}

	public void setTempoDocencia(int tempoDocencia) {
		this.tempoDocencia = tempoDocencia;
	}

	public void setTempoOutros(int tempoOutros) {
		this.tempoOutros = tempoOutros;
	}

	public void setTitulacao(String titulacao) {
		this.titulacao = titulacao;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public void setUtilizaTecnologia(String utilizaTecnologia) {
		this.utilizaTecnologia = utilizaTecnologia;
	}
	
	@Override
	public String toString() {
		
		return String.valueOf(this.id);
	}
}