package model.curso.matricula.arcomaguerez;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import model.curso.matricula.AvaliacaoProfessor;

@Entity
@Table(name="implementacao")
public class Implementacao implements Serializable{
	
	public int id;
	public AvaliacaoProfessor avaliacaoProfessor;
	public List<DiagnosticosImplementacoes> listaImplementacoesAluno;
	
	public Implementacao(){
		setAvaliacaoProfessor(new AvaliacaoProfessor());
	}
	

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER, cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idAvaliacaoProfessor", nullable=true)
	public AvaliacaoProfessor getAvaliacaoProfessor() {
		return avaliacaoProfessor;
	}

	public void setAvaliacaoProfessor(AvaliacaoProfessor avaliacaoProfessor) {
		this.avaliacaoProfessor = avaliacaoProfessor;
	}

	@ManyToMany(cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinTable(name = "implementacoes_aluno", joinColumns = { @JoinColumn(name = "implementacaoId") }, inverseJoinColumns = { @JoinColumn(name = "diagnosticoImplementacoesId") })
	public List<DiagnosticosImplementacoes> getListaImplementacoesAluno() {
		return listaImplementacoesAluno;
	}


	public void setListaImplementacoesAluno(
			List<DiagnosticosImplementacoes> listaImplementacoesAluno) {
		this.listaImplementacoesAluno = listaImplementacoesAluno;
	}
	
}
