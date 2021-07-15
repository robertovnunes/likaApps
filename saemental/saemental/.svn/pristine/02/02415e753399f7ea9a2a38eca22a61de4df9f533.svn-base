package model.paciente.prontuario.atendimento.examefisico;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="examefisico_ExamePescoco")
public class ExamePescoco implements Serializable{

	public int id;
	public boolean semQueixas;
	public boolean veiasDistendidas;
	public boolean veiasNormais;
	public String veiasOutros;
	public boolean tireoideVolAumentado;
	public boolean tireoideVolNormal;
	public String tireoideOutros;
	public boolean gangliosMoveis;
	public boolean gangliosFixos;
	public boolean gangliosPalpaveis;
	public String gangliosOutros;
	
	public ExamePescoco(){}
	
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

	@Column(name="veiasDistendidas", nullable=true)
	public boolean getVeiasDistendidas() {
		return veiasDistendidas;
	}

	public void setVeiasDistendidas(boolean veiasDistendidas) {
		this.veiasDistendidas = veiasDistendidas;
	}

	@Column(name="veiasNormais", nullable=true)
	public boolean getVeiasNormais() {
		return veiasNormais;
	}

	public void setVeiasNormais(boolean veiasNormais) {
		this.veiasNormais = veiasNormais;
	}

	@Column(name="veiasOutros", nullable=true)
	public String getVeiasOutros() {
		return veiasOutros;
	}

	public void setVeiasOutros(String veiasOutros) {
		this.veiasOutros = veiasOutros;
	}

	@Column(name="tireoideVolAumentado", nullable=true)
	public boolean getTireoideVolAumentado() {
		return tireoideVolAumentado;
	}

	public void setTireoideVolAumentado(boolean tireoideVolAumentado) {
		this.tireoideVolAumentado = tireoideVolAumentado;
	}

	@Column(name="tireoideVolNormal", nullable=true)
	public boolean getTireoideVolNormal() {
		return tireoideVolNormal;
	}

	public void setTireoideVolNormal(boolean tireoideVolNormal) {
		this.tireoideVolNormal = tireoideVolNormal;
	}

	@Column(name="tireoideOutros", nullable=true)
	public String getTireoideOutros() {
		return tireoideOutros;
	}

	public void setTireoideOutros(String tireoideOutros) {
		this.tireoideOutros = tireoideOutros;
	}

	@Column(name="gangliosMoveis", nullable=true)
	public boolean getGangliosMoveis() {
		return gangliosMoveis;
	}

	public void setGangliosMoveis(boolean gangliosMoveis) {
		this.gangliosMoveis = gangliosMoveis;
	}

	@Column(name="gangliosFixos", nullable=true)
	public boolean getGangliosFixos() {
		return gangliosFixos;
	}

	public void setGangliosFixos(boolean gangliosFixos) {
		this.gangliosFixos = gangliosFixos;
	}

	@Column(name="gangliosPalpaveis", nullable=true)
	public boolean getGangliosPalpaveis() {
		return gangliosPalpaveis;
	}

	public void setGangliosPalpaveis(boolean gangliosPalpaveis) {
		this.gangliosPalpaveis = gangliosPalpaveis;
	}

	@Column(name="gangliosOutros", nullable=true)
	public String getGangliosOutros() {
		return gangliosOutros;
	}

	public void setGangliosOutros(String gangliosOutros) {
		this.gangliosOutros = gangliosOutros;
	}
}
