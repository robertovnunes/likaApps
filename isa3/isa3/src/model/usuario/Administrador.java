package model.usuario;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import model.Endereco;

@Entity
@Table(name="administrador")
@PrimaryKeyJoinColumn(name="id") 
public class Administrador extends Usuario{

	public int id;
	
	public Administrador(){}
	

	public Administrador(String nome, String cpf, Endereco endereco, String senha,
			String login, String telefone, String sexo, int id,
			String instituicaoOrigem, String email) {
		super(nome, cpf, endereco, senha, login, email, sexo, telefone);
		this.id = id;
		this.instituicaoOrigem = instituicaoOrigem;
	}


	@Column(name="id", nullable=false, insertable=false, updatable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
