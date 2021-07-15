package model.usuario;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="enfermeiro")
@PrimaryKeyJoinColumn(name="id") 
public class Enfermeiro extends Usuario{

	public String conselho;
	public int id;
	
	public Enfermeiro(){}

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
