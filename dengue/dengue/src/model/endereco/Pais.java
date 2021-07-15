package model.endereco;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="paises")
public class Pais implements Serializable{

	public String codigo;
	public String codigo3;
	public int numeroCodificacao;
	public String nome;
	
	public Pais(){}
	
	@Column(name="iso", nullable=false)
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	
	@Column(name="iso3")
	public String getCodigo3() {
		return codigo3;
	}
	public void setCodigo3(String codigo3) {
		this.codigo3 = codigo3;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="numcode")
	public int getNumeroCodificacao() {
		return numeroCodificacao;
	}
	public void setNumeroCodificacao(int numeroCodificacao) {
		this.numeroCodificacao = numeroCodificacao;
	}
	
	@Column(name="nome")
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	

}
