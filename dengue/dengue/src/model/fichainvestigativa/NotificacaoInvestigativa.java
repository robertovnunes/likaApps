package model.fichainvestigativa;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import model.usuario.Usuario;

@Entity
@Table(name="notificacao_investigativa")
public class NotificacaoInvestigativa implements Serializable {

	public int id;
	public DadosGerais dadosGerais;
	public Paciente paciente;
	public DadosLaboratoriais dadosLaboratoriais;
	public Conclusao conclusao;
	public DadosClinicosComplicacoes dadosClinicosComplicacoes;
	public Usuario investigador;
	public String observacoesAdicionais;
	
	public NotificacaoInvestigativa(){}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="dadosGerais", nullable=false)
	public DadosGerais getDadosGerais() {
		return dadosGerais;
	}

	public void setDadosGerais(DadosGerais dadosGerais) {
		this.dadosGerais = dadosGerais;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="paciente", nullable=false)
	public Paciente getPaciente() {
		return paciente;
	}

	public void setPaciente(Paciente paciente) {
		this.paciente = paciente;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="dadosLaboratoriais", nullable=false)
	public DadosLaboratoriais getDadosLaboratoriais() {
		return dadosLaboratoriais;
	}

	public void setDadosLaboratoriais(DadosLaboratoriais dadosLaboratoriais) {
		this.dadosLaboratoriais = dadosLaboratoriais;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="conclusao", nullable=false)
	public Conclusao getConclusao() {
		return conclusao;
	}

	public void setConclusao(Conclusao conclusao) {
		this.conclusao = conclusao;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="dadosClinicosComplicacoes", nullable=false)
	public DadosClinicosComplicacoes getDadosClinicosComplicacoes() {
		return dadosClinicosComplicacoes;
	}

	public void setDadosClinicosComplicacoes(
			DadosClinicosComplicacoes dadosClinicosComplicacoes) {
		this.dadosClinicosComplicacoes = dadosClinicosComplicacoes;
	}

	@Column(name="observacoesAdicionais", nullable=true)
	public String getObservacoesAdicionais() {
		return observacoesAdicionais;
	}

	public void setObservacoesAdicionais(String observacoesAdicionais) {
		this.observacoesAdicionais = observacoesAdicionais;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="investigador", nullable=false)
	public Usuario getInvestigador() {
		return investigador;
	}

	public void setInvestigador(Usuario investigador) {
		this.investigador = investigador;
	}

	
	
}
