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

import model.endereco.Bairro;
import model.endereco.Cidade;
import model.endereco.Logradouro;
import model.endereco.Pais;
import model.endereco.UF;

@Entity
@Table(name="conclusao")
public class Conclusao implements Serializable{

	public int id;
	
	public int classificacao; //1 - Dengue Clássico -	2 - Dengue com Complicações	 3 - Febre Hemorrágica do Dengue - FHD	4 - Síndrome do Choque da Dengue - SCD	5- Descartado	
	public int criterioConfirmacao; //1 - Laboratório 3 - Em Investigação 	2 - Clínico-Epidemiológico
	
	public int localInfeccao; // 1 SIM, 2 NAO, 3 Indeterminado
	public UF estado;
	public Pais pais;
	public Cidade cidade;
	public String distrito;
	public Bairro bairro;
	public Logradouro logradouro;
	public String numero;
	public String complemento;
	
	public int doencaTrabalho; //1 SIM, 2 NAO, 3 Ignorado
	public int evolucaoCaso; //1-Cura 2- Óbito por dengue 3- Óbito por outras causas 4-	Óbito em investigação 9- Ignorado
	
	
	public Date dataObito;
	public Date dataEncerramento;
	
	public String longitude;
	public String latitude;
	
	public Conclusao(){}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="localInfeccao")
	public int getLocalInfeccao() {
		return localInfeccao;
	}

	public void setLocalInfeccao(int localInfeccao) {
		this.localInfeccao = localInfeccao;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="estado", nullable=true)
	public UF getEstado() {
		return estado;
	}

	public void setEstado(UF estado) {
		this.estado = estado;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="pais", nullable=true)
	public Pais getPais() {
		return pais;
	}

	public void setPais(Pais pais) {
		this.pais = pais;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="cidade", nullable=true)
	public Cidade getCidade() {
		return cidade;
	}

	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}

	@Column(name="distrito")
	public String getDistrito() {
		return distrito;
	}

	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="bairro", nullable=true)
	public Bairro getBairro() {
		return bairro;
	}

	public void setBairro(Bairro bairro) {
		this.bairro = bairro;
	}

	@Column(name="doencaTrabalho")
	public int getDoencaTrabalho() {
		return doencaTrabalho;
	}

	public void setDoencaTrabalho(int doencaTrabalho) {
		this.doencaTrabalho = doencaTrabalho;
	}
	
	@Column(name="evolucaoCaso")
	public int getEvolucaoCaso() {
		return evolucaoCaso;
	}

	public void setEvolucaoCaso(int evolucaoCaso) {
		this.evolucaoCaso = evolucaoCaso;
	}

	@Column(name="dataObito")
	public Date getDataObito() {
		return dataObito;
	}

	public void setDataObito(Date dataObito) {
		this.dataObito = dataObito;
	}
	
	@Column(name="dataEncerramento")
	public Date getDataEncerramento() {
		return dataEncerramento;
	}

	public void setDataEncerramento(Date dataEncerramento) {
		this.dataEncerramento = dataEncerramento;
	}

	@Column(name="classificacao")
	public int getClassificacao() {
		return classificacao;
	}

	public void setClassificacao(int classificacao) {
		this.classificacao = classificacao;
	}

	@Column(name="criterioConfirmacao")
	public int getCriterioConfirmacao() {
		return criterioConfirmacao;
	}

	public void setCriterioConfirmacao(int criterioConfirmacao) {
		this.criterioConfirmacao = criterioConfirmacao;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="logradouro", nullable=true)
	public Logradouro getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(Logradouro logradouro) {
		this.logradouro = logradouro;
	}
	
	@Column(name="numero")
	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	@Column(name="complemento")
	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}
	
	@Column(name="longitude")
	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	@Column(name="latitude")
	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	@Transient
	public String getDataEncerramentoFormatada(){
		return DataUtil.formatarData(dataEncerramento);
	}
	
	@Transient
	public String getDataObitoFormatada(){
		return DataUtil.formatarData(dataObito);
	}

}
