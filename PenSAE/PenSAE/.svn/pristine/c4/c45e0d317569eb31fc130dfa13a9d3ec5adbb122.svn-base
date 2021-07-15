package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the avaliacao database table.
 * 
 */
@Entity
@Table(name="avaliacao")
@NamedQuery(name="Avaliacao.findAll", query="SELECT a FROM Avaliacao a")
public class Avaliacao implements Serializable {
	private static final long serialVersionUID = 1L;

	//bi-directional many-to-one association to AlunoEstudoCaso
	@ManyToOne
	@JoinColumn(name="alunoestudocaso_id", nullable=false)
	private AlunoEstudoCaso alunoestudocaso;

	@Column(length=500)
	private String comentarioFinal;

	@Column(length=500)
	private String comentarioHipoteses;

	@Column(length=500)
	private String comentarioObservacao;

	@Column(length=500)
	private String comentarioPlanoCuidados;

	@Column(length=500)
	private String comentarioPontoChave;

	@Column(length=500)
	private String comentarioTeorizacao;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	private int notaFinal;

	private int notaHipoteses;

	private int notaObservacao;

	private int notaPlanoCuidados;

	private int notaPontoChave;

	private int notaTeorizacao;

	public Avaliacao() {
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(Avaliacao.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){
				
				retorno = true;
			}
		}
		
		return retorno;
	}

	public AlunoEstudoCaso getAlunoestudocaso() {
		return this.alunoestudocaso;
	}

	public String getComentarioFinal() {
		return this.comentarioFinal;
	}

	public String getComentarioHipoteses() {
		return this.comentarioHipoteses;
	}

	public String getComentarioObservacao() {
		return this.comentarioObservacao;
	}

	public String getComentarioPlanoCuidados() {
		return this.comentarioPlanoCuidados;
	}

	public String getComentarioPontoChave() {
		return this.comentarioPontoChave;
	}

	public String getComentarioTeorizacao() {
		return this.comentarioTeorizacao;
	}

	public int getId() {
		return this.id;
	}

	public int getNotaFinal() {
		return this.notaFinal;
	}

	public int getNotaHipoteses() {
		return this.notaHipoteses;
	}

	public int getNotaObservacao() {
		return this.notaObservacao;
	}

	public int getNotaPlanoCuidados() {
		return this.notaPlanoCuidados;
	}

	public int getNotaPontoChave() {
		return this.notaPontoChave;
	}

	public int getNotaTeorizacao() {
		return this.notaTeorizacao;
	}

	public void setAlunoestudocaso(AlunoEstudoCaso alunoestudocaso) {
		this.alunoestudocaso = alunoestudocaso;
	}

	public void setComentarioFinal(String comentarioFinal) {
		this.comentarioFinal = comentarioFinal;
	}

	public void setComentarioHipoteses(String comentarioHipoteses) {
		this.comentarioHipoteses = comentarioHipoteses;
	}

	public void setComentarioObservacao(String comentarioObservacao) {
		this.comentarioObservacao = comentarioObservacao;
	}

	public void setComentarioPlanoCuidados(String comentarioPlanoCuidados) {
		this.comentarioPlanoCuidados = comentarioPlanoCuidados;
	}

	public void setComentarioPontoChave(String comentarioPontoChave) {
		this.comentarioPontoChave = comentarioPontoChave;
	}

	public void setComentarioTeorizacao(String comentarioTeorizacao) {
		this.comentarioTeorizacao = comentarioTeorizacao;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setNotaFinal(int notaFinal) {
		this.notaFinal = notaFinal;
	}

	public void setNotaHipoteses(int notaHipoteses) {
		this.notaHipoteses = notaHipoteses;
	}

	public void setNotaObservacao(int notaObservacao) {
		this.notaObservacao = notaObservacao;
	}

	public void setNotaPlanoCuidados(int notaPlanoCuidados) {
		this.notaPlanoCuidados = notaPlanoCuidados;
	}

	public void setNotaPontoChave(int notaPontoChave) {
		this.notaPontoChave = notaPontoChave;
	}
	
	public void setNotaTeorizacao(int notaTeorizacao) {
		this.notaTeorizacao = notaTeorizacao;
	}

	@Override
	public String toString() {
		
		return String.valueOf(this.id);
	}
}