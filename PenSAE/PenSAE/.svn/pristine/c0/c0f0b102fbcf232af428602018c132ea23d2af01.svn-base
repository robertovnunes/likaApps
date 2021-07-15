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
import javax.persistence.OneToMany;
import javax.persistence.Table;


/**
 * The persistent class for the aluno database table.
 * 
 */
@Entity
@Table(name="aluno")
@NamedQuery(name="Aluno.findAll", query="SELECT a FROM Aluno a")
public class Aluno implements Serializable {
	private static final long serialVersionUID = 1L;

	//bi-directional many-to-one association to AlunoEstudoCaso
	@OneToMany(mappedBy="aluno", cascade={CascadeType.ALL})
	private Set<AlunoEstudoCaso> alunoestudocasos;

	//bi-directional many-to-one association to Ambulatorio
	@OneToMany(mappedBy="aluno", cascade={CascadeType.ALL})
	private Set<Ambulatorio> ambulatorios;

	private Boolean atividadesExtras;

	//bi-directional many-to-many association to Curso
	@ManyToMany(mappedBy="alunos", cascade=CascadeType.MERGE)
	private Set<Curso> cursos;

	@Column(length=100)
	private String estiloAprendizagem;

	private Boolean existeReprovacao;

	//bi-directional many-to-one association to Feedback
	@OneToMany(mappedBy="aluno")
	private Set<Feedback> feedbacks;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(length=200)
	private String motivado;

	private int possuiExperiencia;

	@Column(length=300)
	private String qualAtividadesExtras;

	@Column(length=500)
	private String qualEstrategiaEstudo;

	@Column(length=200)
	private String qualExperiencia;

	@Column(length=100)
	private String qualLocalEstudo;

	@Column(length=100)
	private String qualReprovacao;

	private int quantasHorasEstudo;

	private int tipoEstiloAprendizagem;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="usuario_id", nullable=false)
	private Usuario usuario;

	public Aluno() {
	}

	public AlunoEstudoCaso addAlunoestudocaso(AlunoEstudoCaso alunoestudocaso) {
		getAlunoestudocasos().add(alunoestudocaso);
		alunoestudocaso.setAluno(this);

		return alunoestudocaso;
	}

	public Ambulatorio addAmbulatorio(Ambulatorio ambulatorio) {
		getAmbulatorios().add(ambulatorio);
		ambulatorio.setAluno(this);

		return ambulatorio;
	}

	public Feedback addFeedback(Feedback feedback) {
		getFeedbacks().add(feedback);
		feedback.setAluno(this);

		return feedback;
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(Aluno.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){
				
				retorno = true;
			}
		}
		
		return retorno;
	}

	public Set<AlunoEstudoCaso> getAlunoestudocasos() {
		return this.alunoestudocasos;
	}

	public Set<Ambulatorio> getAmbulatorios() {
		return this.ambulatorios;
	}

	public Boolean getAtividadesExtras() {
		return this.atividadesExtras;
	}

	public Set<Curso> getCursos() {
		return this.cursos;
	}

	public String getEstiloAprendizagem() {
		return this.estiloAprendizagem;
	}

	public Boolean getExisteReprovacao() {
		return this.existeReprovacao;
	}

	public Set<Feedback> getFeedbacks() {
		return this.feedbacks;
	}

	public int getId() {
		return this.id;
	}

	public String getMotivado() {
		return this.motivado;
	}

	public int getPossuiExperiencia() {
		return this.possuiExperiencia;
	}

	public String getQualAtividadesExtras() {
		return this.qualAtividadesExtras;
	}

	public String getQualEstrategiaEstudo() {
		return this.qualEstrategiaEstudo;
	}

	public String getQualExperiencia() {
		return this.qualExperiencia;
	}

	public String getQualLocalEstudo() {
		return this.qualLocalEstudo;
	}

	public String getQualReprovacao() {
		return this.qualReprovacao;
	}

	public int getQuantasHorasEstudo() {
		return this.quantasHorasEstudo;
	}

	public int getTipoEstiloAprendizagem() {
		return this.tipoEstiloAprendizagem;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public AlunoEstudoCaso removeAlunoestudocaso(AlunoEstudoCaso alunoestudocaso) {
		getAlunoestudocasos().remove(alunoestudocaso);
		alunoestudocaso.setAluno(null);

		return alunoestudocaso;
	}

	public Ambulatorio removeAmbulatorio(Ambulatorio ambulatorio) {
		getAmbulatorios().remove(ambulatorio);
		ambulatorio.setAluno(null);

		return ambulatorio;
	}

	public Feedback removeFeedback(Feedback feedback) {
		getFeedbacks().remove(feedback);
		feedback.setAluno(null);

		return feedback;
	}

	public void setAlunoestudocasos(Set<AlunoEstudoCaso> alunoestudocasos) {
		this.alunoestudocasos = alunoestudocasos;
	}

	public void setAmbulatorios(Set<Ambulatorio> ambulatorios) {
		this.ambulatorios = ambulatorios;
	}

	public void setAtividadesExtras(Boolean atividadesExtras) {
		this.atividadesExtras = atividadesExtras;
	}

	public void setCursos(Set<Curso> cursos) {
		this.cursos = cursos;
	}

	public void setEstiloAprendizagem(String estiloAprendizagem) {
		this.estiloAprendizagem = estiloAprendizagem;
	}

	public void setExisteReprovacao(Boolean existeReprovacao) {
		this.existeReprovacao = existeReprovacao;
	}

	public void setFeedbacks(Set<Feedback> feedbacks) {
		this.feedbacks = feedbacks;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setMotivado(String motivado) {
		this.motivado = motivado;
	}

	public void setPossuiExperiencia(int possuiExperiencia) {
		this.possuiExperiencia = possuiExperiencia;
	}

	public void setQualAtividadesExtras(String qualAtividadesExtras) {
		this.qualAtividadesExtras = qualAtividadesExtras;
	}

	public void setQualEstrategiaEstudo(String qualEstrategiaEstudo) {
		this.qualEstrategiaEstudo = qualEstrategiaEstudo;
	}

	public void setQualExperiencia(String qualExperiencia) {
		this.qualExperiencia = qualExperiencia;
	}

	public void setQualLocalEstudo(String qualLocalEstudo) {
		this.qualLocalEstudo = qualLocalEstudo;
	}

	public void setQualReprovacao(String qualReprovacao) {
		this.qualReprovacao = qualReprovacao;
	}

	public void setQuantasHorasEstudo(int quantasHorasEstudo) {
		this.quantasHorasEstudo = quantasHorasEstudo;
	}

	public void setTipoEstiloAprendizagem(int tipoEstiloAprendizagem) {
		this.tipoEstiloAprendizagem = tipoEstiloAprendizagem;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	@Override
	public String toString() {
		
		return String.valueOf(this.id);
	}
}