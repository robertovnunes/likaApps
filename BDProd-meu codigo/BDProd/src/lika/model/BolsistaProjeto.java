package lika.model;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "bolsistaProjeto")
@PrimaryKeyJoinColumn(name = "pessoa_idPessoa")
public class BolsistaProjeto extends Pessoa {

	private String tipoBolsa;
	private String origemBolsa;
	private String valorBolsa;

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public BolsistaProjeto() {
		this.setDepartamento(null);
	}

	public BolsistaProjeto(Integer id, String nome, String CPF) {
		this.idPessoa = id;
		this.nome = nome;
		this.CPF = CPF;
	}

	public String getTipoBolsa() {
		return tipoBolsa;
	}

	public void setTipoBolsa(String tipoBolsa) {
		this.tipoBolsa = tipoBolsa;
	}

	public String getOrigemBolsa() {
		return origemBolsa;
	}

	public void setOrigemBolsa(String origemBolsa) {
		this.origemBolsa = origemBolsa;
	}

	public String getValorBolsa() {
		return valorBolsa;
	}

	public void setValorBolsa(String valorBolsa) {
		this.valorBolsa = valorBolsa;
	}

}
