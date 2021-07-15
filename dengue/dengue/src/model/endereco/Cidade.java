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
@Table(name="cidade")
public class Cidade implements Serializable{

	
	public int codigo_cidade;
	public UF estado;
	public String descricao;
	public String cep;
	public String ibge_codigo;
	
	
	public Cidade(){}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="cidade_codigo", nullable=false)
	public int getCodigo_cidade() {
		return codigo_cidade;
	}
	public void setCodigo_cidade(int codigo_cidade) {
		this.codigo_cidade = codigo_cidade;
	}
	
	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="uf_codigo", nullable=false)
	public UF getEstado() {
		return estado;
	}
	public void setEstado(UF estado) {
		this.estado = estado;
	}
	
	@Column(name="cidade_descricao")
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	@Column(name="cidade_cep")
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	
	@Column(name="ibge_codigo")
	public String getIbge_codigo() {
		return ibge_codigo;
	}
	public void setIbge_codigo(String ibge_codigo) {
		this.ibge_codigo = ibge_codigo;
	}

}
