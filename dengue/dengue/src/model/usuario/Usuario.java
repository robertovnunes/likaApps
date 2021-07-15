package model.usuario;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import model.sistema.Arquivo;
import model.sistema.CNES;


@Entity
@Table(name="usuario")
@PrimaryKeyJoinColumn(name="idusuario") 
public class Usuario extends Pessoa implements Serializable {
	
	public String senha;
	public String login;
	public int idusuario;
	
	//dados Investigador
	public String funcao;
	public Arquivo assinatura;
	public CNES unidadeSaude;

	
	@Transient
	public TipoUsuario tipoUsuario;
	
	public Usuario(){}
	
	@Column(name="idusuario", nullable=false, insertable=false, updatable=false)
	public int getIdusuario() {
		return idusuario;
	}

	public void setIdusuario(int idusuario) {
		this.idusuario = idusuario;
	}
	
	public Usuario(String senha, String login) {
		this.senha = senha;
		this.login = login;
	}

	@Column(name="senha", nullable=false)
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	@Column(name="login", nullable=false)
	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}
	
	@Transient
	public TipoUsuario getTipoUsuario(){
		return tipoUsuario;
	}

	public void setTipoUsuario(TipoUsuario tipoUsuario){
		this.tipoUsuario = tipoUsuario;
	}

	@Column(name="funcao", nullable=true)
	public String getFuncao() {
		return funcao;
	}

	public void setFuncao(String funcao) {
		this.funcao = funcao;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="assinatura",nullable=true)
	public Arquivo getAssinatura() {
		return assinatura;
	}

	public void setAssinatura(Arquivo assinatura) {
		this.assinatura = assinatura;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="unidadeSaude", nullable=true)
	public CNES getUnidadeSaude() {
		return unidadeSaude;
	}

	public void setUnidadeSaude(CNES unidadeSaude) {
		this.unidadeSaude = unidadeSaude;
	}
	
}
