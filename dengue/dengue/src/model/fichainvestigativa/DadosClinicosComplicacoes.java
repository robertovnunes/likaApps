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

import model.sistema.CNES;

@Entity
@Table(name="dados_clinicos_complicacoes")
public class DadosClinicosComplicacoes implements Serializable{

	public int id;
	
	public int hemorragica; //1- Sim 2- Não 9- Ignorado
	public String hemorragicaLocal; //Epistaxe, Gengivorragia, Hematuria, Sangramento Gastrointerstinal, Metrorragia, Pateguias, Prova do Laco Positiva
	public int extravasamentoPlasmatico; //1- Sim 2- Não 9- Ignorado
	public int extravasamentoEvidenciado; //1-Hemoconcentração 2-Derrames cavitários 3-Hipoproteinemia
	public int plaquetas;
	public int FHD_SCD; //1 - Grau I 2 - Grau II 3 - Grau III 4 - Grau IV
	public int complicacoesTipo; //1-Alterações neurológicas 2-Disfunção cardiorrespiratória 3-Insuficiência hepática 4-Plaquetas <20.000 mm3
								//5-Hemorragia digestiva 6-Derrames cavitários 7-Leucometria < 1000 8-Não se enquadra nos critérios de FHD
	public int ocorreuHospitalizacao; //1- Sim 2- Não 9- Ignorado
	public Date dataInternacao;
	public CNES hospital;
	public String telefoneHospital;
	
	public DadosClinicosComplicacoes(){}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="hemorragica")
	public int getHemorragica() {
		return hemorragica;
	}

	public void setHemorragica(int hemorragica) {
		this.hemorragica = hemorragica;
	}

	@Column(name="hemorragicaLocal")
	public String getHemorragicaLocal() {
		return hemorragicaLocal;
	}

	public void setHemorragicaLocal(String hemorragicaLocal) {
		this.hemorragicaLocal = hemorragicaLocal;
	}

	@Column(name="extravasamentoPlasmatico")
	public int getExtravasamentoPlasmatico() {
		return extravasamentoPlasmatico;
	}

	public void setExtravasamentoPlasmatico(int extravasamentoPlasmatico) {
		this.extravasamentoPlasmatico = extravasamentoPlasmatico;
	}

	@Column(name="extravasamentoEvidenciado")
	public int getExtravasamentoEvidenciado() {
		return extravasamentoEvidenciado;
	}

	public void setExtravasamentoEvidenciado(int extravasamentoEvidenciado) {
		this.extravasamentoEvidenciado = extravasamentoEvidenciado;
	}

	@Column(name="plaquetas")
	public int getPlaquetas() {
		return plaquetas;
	}

	public void setPlaquetas(int plaquetas) {
		this.plaquetas = plaquetas;
	}

	@Column(name="FHD_SCD")
	public int getFHD_SCD() {
		return FHD_SCD;
	}

	public void setFHD_SCD(int fHD_SCD) {
		FHD_SCD = fHD_SCD;
	}

	@Column(name="complicacoesTipo")
	public int getComplicacoesTipo() {
		return complicacoesTipo;
	}

	public void setComplicacoesTipo(int complicacoesTipo) {
		this.complicacoesTipo = complicacoesTipo;
	}

	@Column(name="ocorreuHospitalizacao")
	public int getOcorreuHospitalizacao() {
		return ocorreuHospitalizacao;
	}

	public void setOcorreuHospitalizacao(int ocorreuHospitalizacao) {
		this.ocorreuHospitalizacao = ocorreuHospitalizacao;
	}

	@Column(name="dataInternacao")
	public Date getDataInternacao() {
		return dataInternacao;
	}

	public void setDataInternacao(Date dataInternacao) {
		this.dataInternacao = dataInternacao;
	}

	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.PERSIST})
	@JoinColumn(name="hospital", nullable=true)
	public CNES getHospital() {
		return hospital;
	}

	public void setHospital(CNES hospital) {
		this.hospital = hospital;
	}

	@Column(name="telefoneHospital")
	public String getTelefoneHospital() {
		return telefoneHospital;
	}

	public void setTelefoneHospital(String telefoneHospital) {
		this.telefoneHospital = telefoneHospital;
	}

	@Transient
	public String getDataInternacaoFormatada(){
		return DataUtil.formatarData(dataInternacao);
	}
	
	
}
