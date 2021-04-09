package clin.model;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
@PrimaryKeyJoinColumn(name = "ResultadoExame_idResultadoExame")
public class ResultadoLeucograma extends ResultadoExame{
	
	private String leuco;
	private String neutrofilos;
	private String linfocitos;
	private String monocitos;
	private String eosinofilos;
	private String basofilos;
	public String getLeuco() {
		return leuco;
	}
	public void setLeuco(String leuco) {
		this.leuco = leuco;
	}
	public String getNeutrofilos() {
		return neutrofilos;
	}
	public void setNeutrofilos(String neutrofilos) {
		this.neutrofilos = neutrofilos;
	}
	public String getLinfocitos() {
		return linfocitos;
	}
	public void setLinfocitos(String linfocitos) {
		this.linfocitos = linfocitos;
	}
	public String getMonocitos() {
		return monocitos;
	}
	public void setMonocitos(String monocitos) {
		this.monocitos = monocitos;
	}
	public String getEosinofilos() {
		return eosinofilos;
	}
	public void setEosinofilos(String eosinofilos) {
		this.eosinofilos = eosinofilos;
	}
	public String getBasofilos() {
		return basofilos;
	}
	public void setBasofilos(String basofilos) {
		this.basofilos = basofilos;
	}

	

}
