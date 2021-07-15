package model.paciente.prontuario.atendimento.examefisico;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="examefisico_ExameNariz")
public class ExameNariz implements Serializable{

	public int id;
	public boolean semQueixas;
	public boolean deformidade;
	public boolean dor;
	public boolean epistaxe;
	public boolean obstrucaoNasal;
	public boolean secrecaoNasal;
	public String outros;
	
	public ExameNariz(){}
	
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

	@Column(name="epistaxe", nullable=true)
	public boolean getEpistaxe() {
		return epistaxe;
	}

	public void setEpistaxe(boolean epistaxe) {
		this.epistaxe = epistaxe;
	}

	@Column(name="obstrucaoNasal", nullable=true)
	public boolean getObstrucaoNasal() {
		return obstrucaoNasal;
	}

	public void setObstrucaoNasal(boolean obstrucaoNasal) {
		this.obstrucaoNasal = obstrucaoNasal;
	}

	@Column(name="secrecaoNasal", nullable=true)
	public boolean getSecrecaoNasal() {
		return secrecaoNasal;
	}

	public void setSecrecaoNasal(boolean secrecaoNasal) {
		this.secrecaoNasal = secrecaoNasal;
	}

	@Column(name="outros", nullable=true)
	public String getOutros() {
		return outros;
	}

	public void setOutros(String outros) {
		this.outros = outros;
	}
}
