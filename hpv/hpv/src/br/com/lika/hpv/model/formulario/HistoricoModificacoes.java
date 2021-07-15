package br.com.lika.hpv.model.formulario;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;

import br.com.lika.hpv.model.usuario.Usuario;

@Entity
public class HistoricoModificacoes {
	
	@Transient
	private Long user;
	
	@Id
	@GeneratedValue
	private Long id;
	
	
	@ManyToOne (fetch=FetchType.EAGER, optional=false)
	private Usuario usuario;
	
	@ManyToOne (fetch=FetchType.EAGER, optional=false)
	private Formulario formulario;
	
	@Column (nullable = false)
	private Date dataModificacao;
	
	@Column (nullable = false)
	private Integer etapa;

	
	public HistoricoModificacoes () {

	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Formulario getFormulario() {
		return formulario;
	}

	public void setFormulario(Formulario formulario) {
		this.formulario = formulario;
	}

	public Date getDataModificacao() {
		return dataModificacao;
	}

	public void setDataModificacao(Date dataModificacao) {
		this.dataModificacao = dataModificacao;
	}

	public HistoricoModificacoes(Long id, Usuario usuario,
			Formulario formulario, Date dataModificacao) {
		super();
		this.id = id;
		this.usuario = usuario;
		this.formulario = formulario;
		this.dataModificacao = dataModificacao;
	}

	public Long getUser() {
		return user;
	}

	public void setUser(Long user) {
		this.user = user;
	}

	public Integer getEtapa() {
		return etapa;
	}

	public void setEtapa(Integer etapa) {
		this.etapa = etapa;
	}
	
	
}
