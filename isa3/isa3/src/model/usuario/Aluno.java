package model.usuario;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import model.Endereco;

@Entity
@Table(name="aluno")
@PrimaryKeyJoinColumn(name="id") 
public class Aluno extends Usuario implements Serializable{

	public int id;
	
	public Aluno(String nome, String cpf, Endereco endereco, String senha,
			String login, String telefone, String sexo, int id,
			String instituicaoOrigem, String email) {
		super(nome, cpf, endereco, senha, login, email, sexo, telefone);
		this.id = id;
		this.instituicaoOrigem = instituicaoOrigem;
	}

	public Aluno(){}
	
	@Column(name="id", nullable=false, insertable=false, updatable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
