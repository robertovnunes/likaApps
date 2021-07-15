package model.sistema;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="cnes")
public class CNES implements Serializable{

	public String codigo_unidade;
	public Date dataAtualizacao;
	public String nome_fantasia;
	public String codigo_municipio;
	public String codigo_siasus;
	public String cnpj;
	public String cpf;
	public String codigo_cnes;
	
	public String codigo_siasus1;
	public String codigo_siasus2;
	public String codigo_siasus3;
	public String codigo_siasus4;
	public String codigo_siasus5;
	
	public CNES(){}

	@Id
	@Column(name="CO_UNIDADE", nullable=false)
	public String getCodigo_unidade() {
		return codigo_unidade;
	}

	public void setCodigo_unidade(String codigo_unidade) {
		this.codigo_unidade = codigo_unidade;
	}

	@Column(name="DT_ATUALIZACAO")
	public Date getDataAtualizacao() {
		return dataAtualizacao;
	}

	public void setDataAtualizacao(Date dataAtualizacao) {
		this.dataAtualizacao = dataAtualizacao;
	}

	@Column(name="NO_FANTASIA")
	public String getNome_fantasia() {
		return nome_fantasia;
	}

	public void setNome_fantasia(String nome_fantasia) {
		this.nome_fantasia = nome_fantasia;
	}

	@Column(name="CO_MUNICIPIO_GESTOR")
	public String getCodigo_municipio() {
		return codigo_municipio;
	}

	public void setCodigo_municipio(String codigo_municipio) {
		this.codigo_municipio = codigo_municipio;
	}

	@Column(name="CO_SIASUS")
	public String getCodigo_siasus() {
		return codigo_siasus;
	}

	public void setCodigo_siasus(String codigo_siasus) {
		this.codigo_siasus = codigo_siasus;
	}

	@Column(name="NU_CNPJ")
	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	@Column(name="NU_CPF")
	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	@Column(name="CO_CNES")
	public String getCodigo_cnes() {
		return codigo_cnes;
	}

	public void setCodigo_cnes(String codigo_cnes) {
		this.codigo_cnes = codigo_cnes;
	}

	@Column(name="CO_SIASUS1")
	public String getCodigo_siasus1() {
		return codigo_siasus1;
	}

	public void setCodigo_siasus1(String codigo_siasus1) {
		this.codigo_siasus1 = codigo_siasus1;
	}

	@Column(name="CO_SIASUS2")
	public String getCodigo_siasus2() {
		return codigo_siasus2;
	}

	public void setCodigo_siasus2(String codigo_siasus2) {
		this.codigo_siasus2 = codigo_siasus2;
	}

	@Column(name="CO_SIASUS3")
	public String getCodigo_siasus3() {
		return codigo_siasus3;
	}

	public void setCodigo_siasus3(String codigo_siasus3) {
		this.codigo_siasus3 = codigo_siasus3;
	}

	@Column(name="CO_SIASUS4")
	public String getCodigo_siasus4() {
		return codigo_siasus4;
	}

	public void setCodigo_siasus4(String codigo_siasus4) {
		this.codigo_siasus4 = codigo_siasus4;
	}

	@Column(name="CO_SIASUS5")
	public String getCodigo_siasus5() {
		return codigo_siasus5;
	}

	public void setCodigo_siasus5(String codigo_siasus5) {
		this.codigo_siasus5 = codigo_siasus5;
	}
	
	
}
