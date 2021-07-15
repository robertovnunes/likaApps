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
@Table(name="logradouro")
public class Logradouro implements Serializable {

	public int codigo;
	public Bairro bairro;
	
	public String cep;
	public String rua;
	public String complemento;
	public String tipo_logradouro;
	
	public Logradouro(){}
	
	

	public Logradouro(Bairro bairro, String cep, String rua, String complemento) {
		super();
		this.bairro = bairro;
		this.cep = cep;
		this.rua = rua;
		this.complemento = complemento;
	}



	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="logradouro_codigo", nullable=false)
	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="bairro_codigo", nullable=false)
	public Bairro getBairro() {
		return bairro;
	}

	public void setBairro(Bairro bairro) {
		this.bairro = bairro;
	}

	@Column(name="cep")
	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	@Column(name="logradouro")
	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	@Column(name="complemento")
	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}


	@Column(name="tipo_logradouro")
	public String getTipo_logradouro() {
		return tipo_logradouro;
	}

	public void setTipo_logradouro(String tipo_logradouro) {
		this.tipo_logradouro = tipo_logradouro;
	}
	
}
