/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * @author Marcio
 */
@Entity
@Table(name = "cracha")
public class Cracha implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Integer idCracha;
	private String numeroCracha;
	private Date dataEmissao;
	private Date dataDesligamento;
	private String situacao;

	public Cracha() {
	}

	public boolean isDesligado() {
		return this.situacao.equals("Desligado");
	}

	public Date getDataDesligamento() {
		return dataDesligamento;
	}

	public void setDataDesligamento(Date dataDesligamento) {
		this.dataDesligamento = dataDesligamento;
	}

	public Integer getIdCracha() {
		return idCracha;
	}

	public void setIdCracha(Integer idCracha) {
		this.idCracha = idCracha;
	}

	public String getNumeroCracha() {
		return numeroCracha;
	}

	public void setNumeroCracha(String numeroCracha) {
		this.numeroCracha = numeroCracha;
	}

	public Date getDataEmissao() {
		return dataEmissao;
	}

	public void setDataEmissao(Date dataEmissao) {
		this.dataEmissao = dataEmissao;
	}

	public String getSituacao() {
		return situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}
}
