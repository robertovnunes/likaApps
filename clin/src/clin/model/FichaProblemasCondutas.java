package clin.model;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
@PrimaryKeyJoinColumn(name = "ficha_idFicha")
public class FichaProblemasCondutas extends Ficha{
	
	private String CID;
	private String descricaoProblema;
	private String descricaoConduta;
	
	public String getCID() {
		return CID;
	}
	public void setCID(String cID) {
		CID = cID;
	}
	public String getDescricaoProblema() {
		return descricaoProblema;
	}
	public void setDescricaoProblema(String descricaoProblema) {
		this.descricaoProblema = descricaoProblema;
	}
	public String getDescricaoConduta() {
		return descricaoConduta;
	}
	public void setDescricaoConduta(String descricaoConduta) {
		this.descricaoConduta = descricaoConduta;
	}
	

}
