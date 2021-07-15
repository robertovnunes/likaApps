package model.endereco;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="residencia")
public class Residencia implements Serializable{
	
	public int id;
	
	public Logradouro logradouro;
	public String numero;
	public String complemento;
	public String referencia;
	public String distrito;
	public Integer zona;
	
	/** Atributos utilizados quando o logradouro não está informado. No caso usuario residente em outro pais diferente do brasil  */
	public Cidade cidade;
	public UF estado;
	public Pais pais;
	
	public String geocampo1;
	public String geocampo2;
	public String telefone;
	
	public Residencia(){}


	public Residencia(Logradouro logradouro, String numero,
			String complemento, String referencia, String distrito,
			Integer zona, Pais pais) {
		super();
		this.logradouro = logradouro;
		this.numero = numero;
		this.complemento = complemento;
		this.referencia = referencia;
		this.distrito = distrito;
		this.zona = zona;
		this.pais = pais;
	}

	public Residencia(int id, Logradouro logradouro, String numero,
			String complemento, String referencia, String distrito,
			Integer zona, Pais pais) {
		super();
		this.logradouro = logradouro;
		this.numero = numero;
		this.complemento = complemento;
		this.referencia = referencia;
		this.distrito = distrito;
		this.zona = zona;
		this.pais = pais;
		this.id = id;
	}


	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="idResidencia", nullable=false)
	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}


	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="ID_LOGRADOURO", nullable=true)
	public Logradouro getLogradouro() {
		return logradouro;
	}



	public void setLogradouro(Logradouro logradouro) {
		this.logradouro = logradouro;
	}


	@Column(name="NU_NUMERO")
	public String getNumero() {
		return numero;
	}



	public void setNumero(String numero) {
		this.numero = numero;
	}


	@Column(name="NM_COMPLEM")
	public String getComplemento() {
		return complemento;
	}



	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}


	@Column(name="NM_REFEREN")
	public String getReferencia() {
		return referencia;
	}



	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}


	@Column(name="DISTRITO")
	public String getDistrito() {
		return distrito;
	}



	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}


	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="ID_PAIS", nullable=true)
	public Pais getPais() {
		return pais;
	}



	public void setPais(Pais pais) {
		this.pais = pais;
	}


	@Column(name="CS_ZONA")
	public Integer getZona() {
		return zona;
	}



	public void setZona(Integer zona) {
		this.zona = zona;
	}



	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="ID_MUNICIPIO", nullable=true)
	public Cidade getCidade() {
		return cidade;
	}




	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}



	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="ID_UF", nullable=true)
	public UF getEstado() {
		return estado;
	}




	public void setEstado(UF estado) {
		this.estado = estado;
	}


	@Column(name="geocampo1")
	public String getGeocampo1() {
		return geocampo1;
	}


	public void setGeocampo1(String geocampo1) {
		this.geocampo1 = geocampo1;
	}

	@Column(name="geocampo2")
	public String getGeocampo2() {
		return geocampo2;
	}


	public void setGeocampo2(String geocampo2) {
		this.geocampo2 = geocampo2;
	}

	@Column(name="telefone")
	public String getTelefone() {
		return telefone;
	}


	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
	
	
}
