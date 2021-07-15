package model.paciente.prontuario.atendimento.examefisico;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="examefisico_ExameAuditivo")
public class ExameAuditivo implements Serializable{
	
	public int id;
	public boolean semQueixas;
	public boolean cerume;
	public boolean deformidade;
	public boolean dor;
	public boolean edema;
	public boolean hiperacusia;
	public boolean hiperemia;
	public boolean hipoacusia;
	public boolean lesoes;
	public boolean otorragia;
	public boolean prurido;
	public boolean secrecao;
	public boolean zumbido;
	public boolean deficitAuditivo;
	public boolean usoAparelhoAuditivo;
	public String outros;
	
	public ExameAuditivo(){}
	
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

	@Column(name="cerume", nullable=true)
	public boolean getCerume() {
		return cerume;
	}

	public void setCerume(boolean cerume) {
		this.cerume = cerume;
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

	@Column(name="hiperacusia", nullable=true)
	public boolean getHiperacusia() {
		return hiperacusia;
	}

	public void setHiperacusia(boolean hiperacusia) {
		this.hiperacusia = hiperacusia;
	}

	@Column(name="hiperemia", nullable=true)
	public boolean getHiperemia() {
		return hiperemia;
	}

	public void setHiperemia(boolean hiperemia) {
		this.hiperemia = hiperemia;
	}

	@Column(name="hipoacusia", nullable=true)
	public boolean getHipoacusia() {
		return hipoacusia;
	}

	public void setHipoacusia(boolean hipoacusia) {
		this.hipoacusia = hipoacusia;
	}

	@Column(name="lesoes", nullable=true)
	public boolean getLesoes() {
		return lesoes;
	}

	public void setLesoes(boolean lesoes) {
		this.lesoes = lesoes;
	}

	@Column(name="otorragia", nullable=true)
	public boolean getOtorragia() {
		return otorragia;
	}

	public void setOtorragia(boolean otorragia) {
		this.otorragia = otorragia;
	}
	
	@Column(name="prurido", nullable=true)
	public boolean getPrurido() {
		return prurido;
	}

	public void setPrurido(boolean prurido) {
		this.prurido = prurido;
	}

	@Column(name="secrecao", nullable=true)
	public boolean getSecrecao() {
		return secrecao;
	}

	public void setSecrecao(boolean secrecao) {
		this.secrecao = secrecao;
	}

	@Column(name="zumbido", nullable=true)
	public boolean getZumbido() {
		return zumbido;
	}

	public void setZumbido(boolean zumbido) {
		this.zumbido = zumbido;
	}

	@Column(name="deficitAuditivo", nullable=true)
	public boolean getDeficitAuditivo() {
		return deficitAuditivo;
	}

	public void setDeficitAuditivo(boolean deficitAuditivo) {
		this.deficitAuditivo = deficitAuditivo;
	}
	
	@Column(name="usoAparelhoAuditivo", nullable=true)
	public boolean getUsoAparelhoAuditivo() {
		return usoAparelhoAuditivo;
	}

	public void setUsoAparelhoAuditivo(boolean usoAparelhoAuditivo) {
		this.usoAparelhoAuditivo = usoAparelhoAuditivo;
	}

	@Column(name="outros", nullable=true)
	public String getOutros() {
		return outros;
	}

	public void setOutros(String outros) {
		this.outros = outros;
	}

}
