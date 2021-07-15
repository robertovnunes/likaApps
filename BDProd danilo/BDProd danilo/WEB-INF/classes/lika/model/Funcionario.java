/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package lika.model;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 * 
 * @author Marcio
 */
@Entity
@Table(name = "funcionario")
@PrimaryKeyJoinColumn(name = "pessoa_idPessoa")
public class Funcionario extends Pessoa {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Funcionario() {
		this.setDepartamento(null);
	}

	public Funcionario(Integer idPessoa, String nome, String cpf) {
		this.idPessoa = idPessoa;
		this.nome = nome;
		this.CPF = cpf;
	}

}
