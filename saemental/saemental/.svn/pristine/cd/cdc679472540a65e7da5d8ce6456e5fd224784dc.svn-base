package model.paciente.prontuario.atendimento.queixa;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="cid")
public class Cid implements Serializable{
	
	public int id;
	public String descricao;
	public String cid;
	
	public Cid(){}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="descricao", nullable=false)
	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	@Column(name="cid", nullable=false)
	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}
	
	@Override
	public Cid clone() {
		Cid clone = new Cid();
		clone.cid = cid;
		clone.descricao = descricao;
		return clone;
	}
	
}
