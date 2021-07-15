package model.paciente.prontuario.atendimento.examefisico;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="examefisico_ExamePadrao")
public class ExamePadrao implements Serializable{

	public int id;
	public String temperatura;
	public String temperaturaLocal;
	public String pulso;
	public String pulsoLocal;
	public String frequenciaCard;
	public String frequenciaCardPadrao;
	public String pressaoArterial;
	public String pressaoArterialLocal;
	public String frequenciaRespiratoria;
	public String frequenciaRespiratoriaPadrao;
	
	public ExamePadrao(){}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="temperatura", nullable=true)
	public String getTemperatura() {
		return temperatura;
	}

	public void setTemperatura(String temperatura) {
		this.temperatura = temperatura;
	}

	@Column(name="temperaturaLocal", nullable=true)
	public String getTemperaturaLocal() {
		return temperaturaLocal;
	}

	public void setTemperaturaLocal(String temperaturaLocal) {
		this.temperaturaLocal = temperaturaLocal;
	}

	@Column(name="pulso", nullable=true)
	public String getPulso() {
		return pulso;
	}

	public void setPulso(String pulso) {
		this.pulso = pulso;
	}

	@Column(name="pulsoLocal", nullable=true)
	public String getPulsoLocal() {
		return pulsoLocal;
	}

	public void setPulsoLocal(String pulsoLocal) {
		this.pulsoLocal = pulsoLocal;
	}

	@Column(name="frequenciaCard", nullable=true)
	public String getFrequenciaCard() {
		return frequenciaCard;
	}

	public void setFrequenciaCard(String frequenciaCard) {
		this.frequenciaCard = frequenciaCard;
	}

	@Column(name="frequenciaCardPadrao", nullable=true)
	public String getFrequenciaCardPadrao() {
		return frequenciaCardPadrao;
	}

	public void setFrequenciaCardPadrao(String frequenciaCardPadrao) {
		this.frequenciaCardPadrao = frequenciaCardPadrao;
	}

	@Column(name="pressaoArterial", nullable=true)
	public String getPressaoArterial() {
		return pressaoArterial;
	}

	public void setPressaoArterial(String pressaoArterial) {
		this.pressaoArterial = pressaoArterial;
	}

	@Column(name="pressaoArterialLocal", nullable=true)
	public String getPressaoArterialLocal() {
		return pressaoArterialLocal;
	}

	public void setPressaoArterialLocal(String pressaoArterialLocal) {
		this.pressaoArterialLocal = pressaoArterialLocal;
	}

	@Column(name="frequenciaRespiratoria", nullable=true)
	public String getFrequenciaRespiratoria() {
		return frequenciaRespiratoria;
	}

	public void setFrequenciaRespiratoria(String frequenciaRespiratoria) {
		this.frequenciaRespiratoria = frequenciaRespiratoria;
	}

	@Column(name="frequenciaRespiratoriaPadrao", nullable=true)
	public String getFrequenciaRespiratoriaPadrao() {
		return frequenciaRespiratoriaPadrao;
	}

	public void setFrequenciaRespiratoriaPadrao(String frequenciaRespiratoriaPadrao) {
		this.frequenciaRespiratoriaPadrao = frequenciaRespiratoriaPadrao;
	}
}
