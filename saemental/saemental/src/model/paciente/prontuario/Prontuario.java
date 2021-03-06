package model.paciente.prontuario;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="prontuario")
public class Prontuario implements Serializable{

	public int id;
	public Date dataHora;
	public String numero;
	
	public Prontuario(){}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="dataHora", nullable=false)
	public Date getDataHora() {
		return dataHora;
	}

	public void setDataHora(Date dataHora) {
		this.dataHora = dataHora;
	}

	@Column(name="numero", nullable=false)
	public String getNumero() {
		return numero.toUpperCase();
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

}
