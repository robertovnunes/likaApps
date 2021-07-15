/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 * 
 * @author Marcio
 */
@Entity
@Table(name = "usuario")
public class Usuario implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Integer idUsuario;
	private String perfil;
	private String login;
	private String senha;
	@Transient
	private String confirmacaoSenha;
	@Transient
	private String senhaAntiga;

	@Transient
	private boolean admin;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Pessoa_idPessoa")
	private Pesquisador pessoa;

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public String getSenhaAntiga() {
		return senhaAntiga;
	}

	public void setSenhaAntiga(String senhaAntiga) {
		this.senhaAntiga = senhaAntiga;
	}

	public String getConfirmacaoSenha() {
		return confirmacaoSenha;
	}

	public void setConfirmacaoSenha(String confirmacaoSenha) {
		this.confirmacaoSenha = confirmacaoSenha;
	}

	public Pesquisador getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pesquisador pessoa) {
		this.pessoa = pessoa;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getLogin() {
		return login;
	}

	public String getSenha() {
		return senha;
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}

	public Integer getIdUsuario() {
		return idUsuario;
	}

	public String getPerfil() {
		return perfil;
	}
}
