/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.OrderBy;

/**
 * 
 * @author Marcio
 */
@Entity
@Table(name = "publicacao")
public class Publicacao implements Serializable {

	@Transient
	private boolean editado = false;

	public boolean isEditado() {
		return editado;
	}

	public void setEditado(boolean editado) {
		this.editado = editado;
	}

	@Transient
	private boolean editando;

	public boolean isEditando() {
		return editando;
	}

	public void setEditando(boolean editando) {
		this.editando = editando;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Integer idPublicacao;
	private String titulo;
	private String tipo;
	private String editora;
	private String conferencia;
	private String periodico;
	private String anoPublicacao;
	private String linkPublicacao;
	private String volume;
	private String serie;
	private String paginaInicial;
	private String paginaFinal;
	private String ISSN;
	private String DOI;
	private String localConferencia;
	private String pais;
	private String estado;
	private String nomeEvento;
	private String cidadeEvento;
	private String tituloAnaisEvento;
	private String fasciculo;
	private String ISBN;
	private String nomeEditora;
	private String cidadeEditora;
	private String natureza;
	private String tipoPublicacao;

	@OneToMany(fetch = FetchType.EAGER)
	@Cascade( { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN })
	@JoinColumn(name = "Publicacao_idPublicacao")
	@OrderBy(clause = "posicao")
	private List<Autor> autores = new ArrayList<Autor>();
	@ManyToOne
	@JoinColumn(name = "Projeto_idProjeto")
	private Projeto projeto;
	@OneToOne
	@JoinColumn(name = "idPessoaAtualizou")
	private Usuario usuarioAtualizou;
	@Temporal(javax.persistence.TemporalType.TIMESTAMP)
	private Date dataAtualizacao;

	public Publicacao(Integer idPublicacao, String titulo, String tipo,
			String anoPublicacao) {
		this.idPublicacao = idPublicacao;
		this.titulo = titulo;
		this.tipoPublicacao = tipo;
		this.anoPublicacao = anoPublicacao;
	}

	public Date getDataAtualizacao() {
		return dataAtualizacao;
	}

	public void setDataAtualizacao(Date dataAtualizacao) {
		this.dataAtualizacao = dataAtualizacao;
	}

	public Usuario getUsuarioAtualizou() {
		return usuarioAtualizou;
	}

	public void setUsuarioAtualizou(Usuario usuarioAtualizou) {
		this.usuarioAtualizou = usuarioAtualizou;
	}

	public Publicacao(Integer idPublicacao, String titulo) {
		this.idPublicacao = idPublicacao;
		this.titulo = titulo;
	}

	public void setTipoPublicacao(String tipoPublicacao) {
		this.tipoPublicacao = tipoPublicacao;
	}

	public String getTipoPublicacao() {
		return tipoPublicacao;
	}

	public void setNatureza(String natureza) {
		this.natureza = natureza;
	}

	public String getNatureza() {
		return natureza;
	}

	public void setISBN(String ISBN) {
		this.ISBN = ISBN;
	}

	public void setCidadeEditora(String cidadeEditora) {
		this.cidadeEditora = cidadeEditora;
	}

	public void setCidadeEvento(String cidadeEvento) {
		this.cidadeEvento = cidadeEvento;
	}

	public void setFasciculo(String fasciculo) {
		this.fasciculo = fasciculo;
	}

	public void setNomeEditora(String nomeEditora) {
		this.nomeEditora = nomeEditora;
	}

	public void setNomeEvento(String nomeEvento) {
		this.nomeEvento = nomeEvento;
	}

	public void setTituloAnaisEvento(String tituloAnaisEvento) {
		this.tituloAnaisEvento = tituloAnaisEvento;
	}

	public String getISBN() {
		return ISBN;
	}

	public String getCidadeEditora() {
		return cidadeEditora;
	}

	public String getCidadeEvento() {
		return cidadeEvento;
	}

	public String getFasciculo() {
		return fasciculo;
	}

	public String getNomeEditora() {
		return nomeEditora;
	}

	public String getNomeEvento() {
		return nomeEvento;
	}

	public String getTituloAnaisEvento() {
		return tituloAnaisEvento;
	}

	public String getEstado() {
		return estado;
	}

	public String getPais() {
		return pais;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public void setLocalConferencia(String localConferencia) {
		this.localConferencia = localConferencia;
	}

	public String getLocalConferencia() {
		return localConferencia;
	}

	public void setDOI(String DOI) {
		this.DOI = DOI;
	}

	public String getDOI() {
		return DOI;
	}

	public String getVolume() {
		return volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public String getSerie() {
		return serie;
	}

	public void setSerie(String serie) {
		this.serie = serie;
	}

	public String getPaginaInicial() {
		return paginaInicial;
	}

	public void setPaginaInicial(String paginaInicial) {
		this.paginaInicial = paginaInicial;
	}

	public String getPaginaFinal() {
		return paginaFinal;
	}

	public void setPaginaFinal(String paginaFinal) {
		this.paginaFinal = paginaFinal;
	}

	public String getISSN() {
		return ISSN;
	}

	public void setISSN(String issn) {
		ISSN = issn;
	}

	public Integer getIdPublicacao() {
		return idPublicacao;
	}

	public void setIdPublicacao(Integer idPublicacao) {
		this.idPublicacao = idPublicacao;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getEditora() {
		return editora;
	}

	public void setEditora(String editora) {
		this.editora = editora;
	}

	public String getConferencia() {
		return conferencia;
	}

	public String getPeriodico() {
		return periodico;
	}

	public void setConferencia(String conferencia) {
		this.conferencia = conferencia;
	}

	public void setPeriodico(String periodico) {
		this.periodico = periodico;
	}

	public void setAnoPublicacao(String anoPublicacao) {
		this.anoPublicacao = anoPublicacao;
	}

	public String getAnoPublicacao() {
		return anoPublicacao;
	}

	public String getLinkPublicacao() {
		return linkPublicacao;
	}

	public void setLinkPublicacao(String linkPublicacao) {
		this.linkPublicacao = linkPublicacao;
	}

	public List<Autor> getAutores() {
		return autores;
	}

	public void setAutores(List<Autor> autores) {
		this.autores = autores;
	}

	public Projeto getProjeto() {
		return projeto;
	}

	public void setProjeto(Projeto projeto) {
		this.projeto = projeto;
	}

	public Publicacao() {
	}
}
