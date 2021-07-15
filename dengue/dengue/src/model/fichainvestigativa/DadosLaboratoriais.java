package model.fichainvestigativa;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import util.DataUtil;

@Entity
@Table(name="dados_laboratoriais")
public class DadosLaboratoriais implements Serializable{

	public int id;
	public Date dataInvestigacao;
	public String ocupacao;
	
	//Exame Sorologico (IgM)
	public Date dataColetaIgm;
	public int resultadoIgm; //1 - Reagente 2 - Não Reagente 	3 - Inconclusivo 4 - Não Realizado
	
	//Exame NS1
	public Date dataColetaNs1;
	public int resultadoNs1; //1- Positivo 2- Negativo	3- Inconclusivo 4 - Não realizado
	
	//Exame Isolamento Viral
	public Date dataColetaViral;
	public int resultadoViral; //1- Positivo 2- Negativo	3- Inconclusivo 4 - Não realizado
	
	//RT-PCR
	public Date dataColetaRT_PCR;
	public int resultadoRT_PCR; //1- Positivo 2- Negativo	3- Inconclusivo 4 - Não realizado
	
	//Sorotipo
	public int sorotipo; //DEM 1, DEM 2, DEM 3, DEM 4
	
	//Histopatologia
	public int resultadoHistopatologia; //1- Positivo 2- Negativo	3- Inconclusivo 4 - Não realizado
	
	//Imunohistoquímica
	public int resultadoImunohistoquimica; //1- Positivo 2- Negativo	3- Inconclusivo 4 - Não realizado
	
	//PCR por Biosensor
	public Date dataColetaPCRBiosensor;
	public int resultadoPCRBiosensor;//1- Positivo 2- Negativo	3- Inconclusivo 4 - Não realizado
		
	
	public DadosLaboratoriais(){}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="dataInvestigacao")
	public Date getDataInvestigacao() {
		return dataInvestigacao;
	}

	public void setDataInvestigacao(Date dataInvestigacao) {
		this.dataInvestigacao = dataInvestigacao;
	}

	@Column(name="ocupacao")
	public String getOcupacao() {
		return ocupacao;
	}

	public void setOcupacao(String ocupacao) {
		this.ocupacao = ocupacao;
	}

	@Column(name="dataColetaIgm")
	public Date getDataColetaIgm() {
		return dataColetaIgm;
	}

	public void setDataColetaIgm(Date dataColetaIgm) {
		this.dataColetaIgm = dataColetaIgm;
	}

	@Column(name="resultadoIgm")
	public int getResultadoIgm() {
		return resultadoIgm;
	}

	public void setResultadoIgm(int resultadoIgm) {
		this.resultadoIgm = resultadoIgm;
	}

	@Column(name="dataColetaNs1")
	public Date getDataColetaNs1() {
		return dataColetaNs1;
	}

	public void setDataColetaNs1(Date dataColetaNs1) {
		this.dataColetaNs1 = dataColetaNs1;
	}

	@Column(name="resultadoNs1")
	public int getResultadoNs1() {
		return resultadoNs1;
	}

	public void setResultadoNs1(int resultadoNs1) {
		this.resultadoNs1 = resultadoNs1;
	}

	@Column(name="dataColetaViral")
	public Date getDataColetaViral() {
		return dataColetaViral;
	}

	public void setDataColetaViral(Date dataColetaViral) {
		this.dataColetaViral = dataColetaViral;
	}

	@Column(name="resultadoViral")
	public int getResultadoViral() {
		return resultadoViral;
	}

	public void setResultadoViral(int resultadoViral) {
		this.resultadoViral = resultadoViral;
	}

	@Column(name="dataColetaRT_PCR")
	public Date getDataColetaRT_PCR() {
		return dataColetaRT_PCR;
	}

	public void setDataColetaRT_PCR(Date dataColetaRT_PCR) {
		this.dataColetaRT_PCR = dataColetaRT_PCR;
	}

	@Column(name="resultadoRT_PCR")
	public int getResultadoRT_PCR() {
		return resultadoRT_PCR;
	}

	public void setResultadoRT_PCR(int resultadoRT_PCR) {
		this.resultadoRT_PCR = resultadoRT_PCR;
	}

	@Column(name="sorotipo")
	public int getSorotipo() {
		return sorotipo;
	}

	public void setSorotipo(int sorotipo) {
		this.sorotipo = sorotipo;
	}

	@Column(name="resultadoHistopatologia")
	public int getResultadoHistopatologia() {
		return resultadoHistopatologia;
	}

	public void setResultadoHistopatologia(int resultadoHistopatologia) {
		this.resultadoHistopatologia = resultadoHistopatologia;
	}

	@Column(name="resultadoImunohistoquimica")
	public int getResultadoImunohistoquimica() {
		return resultadoImunohistoquimica;
	}

	public void setResultadoImunohistoquimica(int resultadoImunohistoquimica) {
		this.resultadoImunohistoquimica = resultadoImunohistoquimica;
	}

	@Transient
	public String getDataInvestigacaoFormatada(){
		return DataUtil.formatarData(dataInvestigacao);
	}
	
	@Transient
	public String getDataColetaIgmFormatada(){
		return DataUtil.formatarData(dataColetaIgm);
	}
	
	@Transient
	public String getDataColetaNs1Formatada(){
		return DataUtil.formatarData(dataColetaNs1);
	}
	
	@Transient
	public String getDataColetaRT_PCRFormatada(){
		return DataUtil.formatarData(dataColetaRT_PCR);
	}
	
	@Transient
	public String getDataColetaViralFormatada(){
		return DataUtil.formatarData(dataColetaViral);
	}

	@Transient
	public String getDataColetaPCRBiosensorFormatada(){
		return DataUtil.formatarData(dataColetaPCRBiosensor);
	}
	
	@Column(name="resultadoPCRBiosensor")
	public int getResultadoPCRBiosensor() {
		return resultadoPCRBiosensor;
	}

	public void setResultadoPCRBiosensor(int resultadoPCRBiosensor) {
		this.resultadoPCRBiosensor = resultadoPCRBiosensor;
	}

	@Column(name="dataColetaPCRBiosensor")
	public Date getDataColetaPCRBiosensor() {
		return dataColetaPCRBiosensor;
	}

	public void setDataColetaPCRBiosensor(Date dataColetaPCRBiosensor) {
		this.dataColetaPCRBiosensor = dataColetaPCRBiosensor;
	}
	
}
