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
@Table(name="bairro")
public class Bairro implements Serializable{

	public int codigo;
	public Cidade cidade;
	public String descricao;
	
	public Bairro(){}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="bairro_codigo", nullable=false)
	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="cidade_codigo", nullable=false)
	public Cidade getCidade() {
		return cidade;
	}

	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}

	@Column(name="bairro_descricao")
	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	

}
