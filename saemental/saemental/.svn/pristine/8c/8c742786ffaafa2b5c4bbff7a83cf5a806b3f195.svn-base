package model.paciente.prontuario.atendimento;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import model.paciente.prontuario.Prontuario;
import model.usuario.Usuario;
import util.DataUtil;


@Entity
@Inheritance(strategy=InheritanceType.JOINED) 
@Table(name="atendimento")
public class Atendimento implements Serializable{
	
	public int id;
	public Prontuario prontuario;
	public Usuario usuario;
	public Date dataHoraCriacao;
	public Date dataHoraAtualizacao;
	public Boolean assinar;
	public Usuario usuarioAssinou;
	public Date dataHoraAssinatura;
	public Alta alta;
	public TipoAtendimento tipo;
	public boolean possuiAdendo;
	public boolean possuiAvaliacao;
	

	public Atendimento(){}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="idAtendimento", nullable=false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idProntuario",nullable=false)
	public Prontuario getProntuario() {
		return prontuario;
	}
	public void setProntuario(Prontuario prontuario) {
		this.prontuario = prontuario;
	}
	
	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idUsuario",nullable=false)
	public Usuario getUsuario() {
		return usuario;
	}
	
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idUsuarioAssinou",nullable=true)
	public Usuario getUsuarioAssinou() {
		return usuarioAssinou;
	}
	
	public void setUsuarioAssinou(Usuario usuarioAssinou) {
		this.usuarioAssinou = usuarioAssinou;
	}
	
	@Column(name="dataHoraAssinatura", nullable=true)
	public Date getDataHoraAssinatura() {
		return dataHoraAssinatura;
	}

	public void setDataHoraAssinatura(Date dataHoraAssinatura) {
		this.dataHoraAssinatura = dataHoraAssinatura;
	}

	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="fk_idAlta",nullable=true)
	public Alta getAlta() {
		return alta;
	}

	public void setAlta(Alta alta) {
		this.alta = alta;
	}
	
	@Column(name="dataHoraCriacao", nullable=false)
	public Date getDataHoraCriacao() {
		return dataHoraCriacao;
	}

	public void setDataHoraCriacao(Date dataHoraCriacao) {
		this.dataHoraCriacao = dataHoraCriacao;
	}
	
	@Column(name="assinar", nullable=false)
	public Boolean getAssinar() {
		return assinar;
	}

	public void setAssinar(Boolean assinar) {
		this.assinar = assinar;
	}


	@Column(name="dataHoraAtualizacao", nullable=false)
	public Date getDataHoraAtualizacao() {
		return dataHoraAtualizacao;
	}

	public void setDataHoraAtualizacao(Date dataHoraAtualizacao) {
		this.dataHoraAtualizacao = dataHoraAtualizacao;
	}
	
	@Transient
	public String getDataFormatada(){
		return DataUtil.formatarData(dataHoraCriacao);
	}
	
	@Transient
	public String getHoraFormatada(){
		return DataUtil.formatarHora(dataHoraCriacao);
	}
	
	@Transient
	public String getDataAtualizacaoFormatada(){
		return DataUtil.formatarData(dataHoraAtualizacao);
	}
	
	@Transient
	public String getHoraAtualizacaoFormatada(){
		return DataUtil.formatarHora(dataHoraAtualizacao);
	}
	
	@Transient
	public String getDataAssinaturaFormatada(){
		return DataUtil.formatarData(dataHoraAssinatura);
	}
	
	@Transient
	public String getHoraAssinaturaFormatada(){
		return DataUtil.formatarHora(dataHoraAssinatura);
	}
	
	@Transient
	public TipoAtendimento getTipo() {
		return tipo;
	}

	public void setTipo(TipoAtendimento tipo) {
		this.tipo = tipo;
	}
	
	@Transient
	public boolean getPossuiAdendo(){
		return possuiAdendo;
	}
	
	public void setPossuiAdendo(boolean possuiAdendo){
		this.possuiAdendo = possuiAdendo;
	}
	
	@Transient
	public boolean getPossuiAvaliacao(){
		return possuiAvaliacao;
	}
	
	public void setPossuiAvaliacao(boolean possuiAvaliacao){
		this.possuiAvaliacao = possuiAvaliacao;
	}
}
