package model.paciente.prontuario.atendimento.examefisico;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="examefisico_ExameMamas")
public class ExameMamas implements Serializable{

	public int id;
	public boolean semQueixas;
	public boolean mastite;
	public boolean nodulacao;
	public boolean displasia;
	public boolean deformidades;
	public boolean neoplasias;
	public boolean ginecomastia;
	public boolean secrecao;
	public boolean presencaColostroSim;
	public boolean presencaColostroNao;
	public String outros;
	
	public ExameMamas(){}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="semQueixas", nullable=true)
	public boolean getSemQueixas() {
		return semQueixas;
	}

	public void setSemQueixas(boolean semQueixas) {
		this.semQueixas = semQueixas;
	}

	@Column(name="mastite", nullable=true)
	public boolean getMastite() {
		return mastite;
	}

	public void setMastite(boolean mastite) {
		this.mastite = mastite;
	}

	@Column(name="nodulacao", nullable=true)
	public boolean getNodulacao() {
		return nodulacao;
	}

	public void setNodulacao(boolean nodulacao) {
		this.nodulacao = nodulacao;
	}

	@Column(name="displasia", nullable=true)
	public boolean getDisplasia() {
		return displasia;
	}

	public void setDisplasia(boolean displasia) {
		this.displasia = displasia;
	}

	@Column(name="deformidades", nullable=true)
	public boolean getDeformidades() {
		return deformidades;
	}

	public void setDeformidades(boolean deformidades) {
		this.deformidades = deformidades;
	}

	@Column(name="neoplasias", nullable=true)
	public boolean getNeoplasias() {
		return neoplasias;
	}

	public void setNeoplasias(boolean neoplasias) {
		this.neoplasias = neoplasias;
	}

	@Column(name="ginecomastia", nullable=true)
	public boolean getGinecomastia() {
		return ginecomastia;
	}

	public void setGinecomastia(boolean ginecomastia) {
		this.ginecomastia = ginecomastia;
	}

	@Column(name="secrecao", nullable=true)
	public boolean getSecrecao() {
		return secrecao;
	}

	public void setSecrecao(boolean secrecao) {
		this.secrecao = secrecao;
	}

	@Column(name="presencaColostroSim", nullable=true)
	public boolean getPresencaColostroSim() {
		return presencaColostroSim;
	}

	public void setPresencaColostroSim(boolean presencaColostroSim) {
		this.presencaColostroSim = presencaColostroSim;
	}
	
	@Column(name="presencaColostroNao", nullable=true)
	public boolean getPresencaColostroNao() {
		return presencaColostroNao;
	}

	public void setPresencaColostroNao(boolean presencaColostroNao) {
		this.presencaColostroNao = presencaColostroNao;
	}

	@Column(name="outros", nullable=true)
	public String getOutros() {
		return outros;
	}

	public void setOutros(String outros) {
		this.outros = outros;
	}
}
