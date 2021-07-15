package model.paciente.prontuario.atendimento.examefisico;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.swing.text.StyledEditorKit.BoldAction;

@Entity
@Table(name="examefisico_ExameOlhos")
public class ExameOlhos implements Serializable {

	public int id;
	public boolean semQueixas;
	public boolean acuidadeDiminuida;
	public boolean acuidadePreservada;
	public boolean deformidade;
	public boolean dor;
	public boolean edema;
	public boolean hiperemia;
	public boolean ictericia;
	public boolean lacrimejamento;
	public boolean prurido;
	public boolean ptose;
	public boolean ressecamento;
	public boolean secrecao;
	public boolean lentesCorretivas;
	public String outros;
	
	public ExameOlhos(){}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="semQueixas", nullable=false)
	public boolean getSemQueixas() {
		return semQueixas;
	}

	public void setSemQueixas(boolean semQueixas) {
		this.semQueixas = semQueixas;
	}
	
	@Column(name="deformidade", nullable=true)
	public boolean getDeformidade() {
		return deformidade;
	}

	public void setDeformidade(boolean deformidade) {
		this.deformidade = deformidade;
	}

	@Column(name="dor", nullable=true)
	public boolean getDor() {
		return dor;
	}

	public void setDor(boolean dor) {
		this.dor = dor;
	}

	@Column(name="edema", nullable=true)
	public boolean getEdema() {
		return edema;
	}

	public void setEdema(boolean edema) {
		this.edema = edema;
	}

	@Column(name="hiperemia", nullable=true)
	public boolean getHiperemia() {
		return hiperemia;
	}

	public void setHiperemia(boolean hiperemia) {
		this.hiperemia = hiperemia;
	}

	@Column(name="ictericia", nullable=true)
	public boolean getIctericia() {
		return ictericia;
	}

	public void setIctericia(boolean ictericia) {
		this.ictericia = ictericia;
	}

	@Column(name="lacrimejamento", nullable=true)
	public boolean getLacrimejamento() {
		return lacrimejamento;
	}

	public void setLacrimejamento(boolean lacrimejamento) {
		this.lacrimejamento = lacrimejamento;
	}

	@Column(name="prurido", nullable=true)
	public boolean getPrurido() {
		return prurido;
	}

	public void setPrurido(boolean prurido) {
		this.prurido = prurido;
	}

	@Column(name="ptose", nullable=true)
	public boolean getPtose() {
		return ptose;
	}

	public void setPtose(boolean ptose) {
		this.ptose = ptose;
	}

	@Column(name="ressecamento", nullable=true)
	public boolean getRessecamento() {
		return ressecamento;
	}

	public void setRessecamento(boolean ressecamento) {
		this.ressecamento = ressecamento;
	}

	@Column(name="secrecao", nullable=true)
	public boolean getSecrecao() {
		return secrecao;
	}

	public void setSecrecao(boolean secrecao) {
		this.secrecao = secrecao;
	}

	@Column(name="lentesCorretivas", nullable=true)
	public boolean getLentesCorretivas() {
		return lentesCorretivas;
	}

	public void setLentesCorretivas(boolean lentesCorretivas) {
		this.lentesCorretivas = lentesCorretivas;
	}

	@Column(name="outros", nullable=true)
	public String getOutros() {
		return outros;
	}

	public void setOutros(String outros) {
		this.outros = outros;
	}

	@Column(name="acuidadeDiminuida", nullable=true)
	public boolean getAcuidadeDiminuida() {
		return acuidadeDiminuida;
	}

	public void setAcuidadeDiminuida(boolean acuidadeDiminuida) {
		this.acuidadeDiminuida = acuidadeDiminuida;
	}

	@Column(name="acuidadePreservada", nullable=true)
	public boolean getAcuidadePreservada() {
		return acuidadePreservada;
	}

	public void setAcuidadePreservada(boolean acuidadePreservada) {
		this.acuidadePreservada = acuidadePreservada;
	}
}
