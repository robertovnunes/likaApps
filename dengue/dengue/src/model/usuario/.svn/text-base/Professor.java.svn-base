package model.usuario;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="professor")
@PrimaryKeyJoinColumn(name="id") 
public class Professor extends Usuario implements Serializable{

	public String conselho;
	public int id;
	
	public Professor(){}

	@Column(name="id", nullable=false, insertable=false, updatable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="conselho", nullable=false)
	public String getConselho() {
		return conselho;
	}
	
	public void setConselho(String conselho) {
		this.conselho = conselho;
	}

}
