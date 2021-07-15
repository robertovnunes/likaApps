package model.fichainvestigativa;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import util.DataUtil;

import model.endereco.Cidade;
import model.endereco.UF;
import model.sistema.CNES;

@Entity
@Table(name="dadosgerais")
public class DadosGerais implements Serializable{

	public int id;
	public String tipoNotificacao;
	public String agravo;
	public String cid10;
	public Date dataNotificacao;
	public UF estado;
	public Cidade cidade;
	public CNES unidadeSaude;
	public Date dataPrimeirosSintomas;
	
	public DadosGerais(){
		tipoNotificacao = "2 - Individual";
		agravo = "DENGUE";
		cid10 = "A 90";
		dataNotificacao = new Date();
	}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="tipoNotificacao")
	public String getTipoNotificacao() {
		return tipoNotificacao;
	}

	public void setTipoNotificacao(String tipoNotificacao) {
		this.tipoNotificacao = tipoNotificacao;
	}

	@Column(name="agravo")
	public String getAgravo() {
		return agravo;
	}

	public void setAgravo(String agravo) {
		this.agravo = agravo;
	}

	@Column(name="cid10")
	public String getCid10() {
		return cid10;
	}

	public void setCid10(String cid10) {
		this.cid10 = cid10;
	}

	@Column(name="dataNotificacao")
	public Date getDataNotificacao() {
		return dataNotificacao;
	}

	public void setDataNotificacao(Date dataNotificacao) {
		this.dataNotificacao = dataNotificacao;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="estado_codigo", nullable=true)
	public UF getEstado() {
		return estado;
	}

	public void setEstado(UF estado) {
		this.estado = estado;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="cidade_codigo", nullable=true)
	public Cidade getCidade() {
		return cidade;
	}

	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="unidadeSaude", nullable=true)
	public CNES getUnidadeSaude() {
		return unidadeSaude;
	}

	public void setUnidadeSaude(CNES unidadeSaude) {
		this.unidadeSaude = unidadeSaude;
	}

	@Column(name="dataPrimeirosSintomas")
	public Date getDataPrimeirosSintomas() {
		return dataPrimeirosSintomas;
	}

	public void setDataPrimeirosSintomas(Date dataPrimeirosSintomas) {
		this.dataPrimeirosSintomas = dataPrimeirosSintomas;
	}

	@Transient
	public String getDataNotificacaoFormatada(){
		return DataUtil.formatarData(dataNotificacao);
	}
	
	@Transient
	public String getDataPrimeirosSintomasFormatada(){
		return DataUtil.formatarData(dataPrimeirosSintomas);
	}
	
}
