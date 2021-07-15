package model.paciente.prontuario.atendimento.examefisico;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="examefisico_ExameSistGastroIntestinal")
public class ExameSistGastroIntestinal implements Serializable{

	public int id;
	public boolean semQueixas;
	public boolean plano;
	public boolean globoso;
	public boolean semigloboso;
	public boolean escavado;
	public String abdomenOutros; 
	public boolean anorexiaSim;
	public boolean anorexiaNao; 
	public boolean asciteSim;
	public boolean asciteNao;  
	public boolean colicasSim;
	public boolean colicasNao;  
	public boolean constipacaoSim;
	public boolean constipacaoNao;  
	public boolean diarreiaSim;
	public boolean diarreiaNao;  
	public boolean disfagiaSim;
	public boolean disfagiaNao;  
	public boolean dispepsiaSim;
	public boolean dispepsiaNao;  
	public boolean distensaoAbdominalSim;
	public boolean distensaoAbdominalNao;  
	public boolean eructacaoSim;
	public boolean eructacaoNao;  
	public boolean flatulenciaSim;
	public boolean flatulenciaNao;  
	public boolean ganhoPesoSim;
	public boolean ganhoPesoNao;  
	public boolean halitoseSim;
	public boolean halitoseNao;  
	public boolean hematemeseSim;
	public boolean hematemeseNao;  
	public boolean melenaSim;
	public boolean melenaNao;  
	public boolean nauseasSim;
	public boolean nauseasNao;  
	public boolean odinofagiaSim;
	public boolean odinofagiaNao;  
	public boolean perdaPesoSim;
	public boolean perdaPesoNao;  
	public boolean piroseSim;
	public boolean piroseNao;  
	public boolean refluxoSim;
	public boolean refluxoNao;  
	public boolean sialorreiaSim;
	public boolean sialorreiaNao;  
	public boolean singultoSim;
	public boolean singultoNao;  
	public boolean vomitosSim;
	public boolean vomitosNao;  
	public boolean dorSim;
	public boolean dorNao;
	public String dorOnde;  
	public String outros;  


	public ExameSistGastroIntestinal(){}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(nullable=true)
	public boolean getSemQueixas() {
		return semQueixas;
	}

	public void setSemQueixas(boolean semQueixas) {
		this.semQueixas = semQueixas;
	}

	@Column(nullable=true) 
	public boolean getPlano() {
		return plano;
	}

	public void setPlano(boolean plano) {
		this.plano = plano;
	}

	@Column(nullable=true) 
	public boolean getGloboso() {
		return globoso;
	}

	public void setGloboso(boolean globoso) {
		this.globoso = globoso;
	}

	@Column(nullable=true) 
	public boolean getSemigloboso() {
		return semigloboso;
	}

	public void setSemigloboso(boolean semigloboso) {
		this.semigloboso = semigloboso;
	}

	@Column(nullable=true) 
	public boolean getEscavado() {
		return escavado;
	}

	public void setEscavado(boolean escavado) {
		this.escavado = escavado;
	}

	@Column(nullable=true) 
	public String getAbdomenOutros() {
		return abdomenOutros;
	}

	public void setAbdomenOutros(String abdomenOutros) {
		this.abdomenOutros = abdomenOutros;
	}

	@Column(nullable=true) 
	public boolean getAnorexiaSim() {
		return anorexiaSim;
	}

	public void setAnorexiaSim(boolean anorexiaSim) {
		this.anorexiaSim = anorexiaSim;
	}

	@Column(nullable=true) 
	public boolean getAnorexiaNao() {
		return anorexiaNao;
	}

	public void setAnorexiaNao(boolean anorexiaNao) {
		this.anorexiaNao = anorexiaNao;
	}

	@Column(nullable=true)
	public boolean getAsciteSim() {
		return asciteSim;
	}

	public void setAsciteSim(boolean asciteSim) {
		this.asciteSim = asciteSim;
	}

	@Column(nullable=true) 
	public boolean getAsciteNao() {
		return asciteNao;
	}

	public void setAsciteNao(boolean asciteNao) {
		this.asciteNao = asciteNao;
	}

	@Column(nullable=true) 
	public boolean getColicasSim() {
		return colicasSim;
	}

	public void setColicasSim(boolean colicasSim) {
		this.colicasSim = colicasSim;
	}

	@Column(nullable=true) 
	public boolean getColicasNao() {
		return colicasNao;
	}

	public void setColicasNao(boolean colicasNao) {
		this.colicasNao = colicasNao;
	}

	@Column(nullable=true) 
	public boolean getConstipacaoSim() {
		return constipacaoSim;
	}

	public void setConstipacaoSim(boolean constipacaoSim) {
		this.constipacaoSim = constipacaoSim;
	}

	@Column(nullable=true) 
	public boolean getConstipacaoNao() {
		return constipacaoNao;
	}

	public void setConstipacaoNao(boolean constipacaoNao) {
		this.constipacaoNao = constipacaoNao;
	}

	@Column(nullable=true) 
	public boolean getDiarreiaSim() {
		return diarreiaSim;
	}

	public void setDiarreiaSim(boolean diarreiaSim) {
		this.diarreiaSim = diarreiaSim;
	}

	@Column(nullable=true) 
	public boolean getDiarreiaNao() {
		return diarreiaNao;
	}

	public void setDiarreiaNao(boolean diarreiaNao) {
		this.diarreiaNao = diarreiaNao;
	}

	@Column(nullable=true)
	public boolean getDisfagiaSim() {
		return disfagiaSim;
	}

	public void setDisfagiaSim(boolean disfagiaSim) {
		this.disfagiaSim = disfagiaSim;
	}

	@Column(nullable=true)
	public boolean getDisfagiaNao() {
		return disfagiaNao;
	}

	public void setDisfagiaNao(boolean disfagiaNao) {
		this.disfagiaNao = disfagiaNao;
	}

	@Column(nullable=true)
	public boolean getDispepsiaSim() {
		return dispepsiaSim;
	}

	public void setDispepsiaSim(boolean dispepsiaSim) {
		this.dispepsiaSim = dispepsiaSim;
	}

	@Column(nullable=true)
	public boolean getDispepsiaNao() {
		return dispepsiaNao;
	}

	public void setDispepsiaNao(boolean dispepsiaNao) {
		this.dispepsiaNao = dispepsiaNao;
	}

	@Column(nullable=true)
	public boolean getDistensaoAbdominalSim() {
		return distensaoAbdominalSim;
	}

	public void setDistensaoAbdominalSim(boolean distensaoAbdominalSim) {
		this.distensaoAbdominalSim = distensaoAbdominalSim;
	}

	@Column(nullable=true) 
	public boolean getDistensaoAbdominalNao() {
		return distensaoAbdominalNao;
	}

	public void setDistensaoAbdominalNao(boolean distensaoAbdominalNao) {
		this.distensaoAbdominalNao = distensaoAbdominalNao;
	}

	@Column(nullable=true)
	public boolean getEructacaoSim() {
		return eructacaoSim;
	}

	public void setEructacaoSim(boolean eructacaoSim) {
		this.eructacaoSim = eructacaoSim;
	}

	@Column(nullable=true) 
	public boolean getEructacaoNao() {
		return eructacaoNao;
	}

	public void setEructacaoNao(boolean eructacaoNao) {
		this.eructacaoNao = eructacaoNao;
	}

	@Column(nullable=true)
	public boolean getFlatulenciaSim() {
		return flatulenciaSim;
	}

	public void setFlatulenciaSim(boolean flatulenciaSim) {
		this.flatulenciaSim = flatulenciaSim;
	}

	@Column(nullable=true) 
	public boolean getFlatulenciaNao() {
		return flatulenciaNao;
	}

	public void setFlatulenciaNao(boolean flatulenciaNao) {
		this.flatulenciaNao = flatulenciaNao;
	}

	@Column(nullable=true)
	public boolean getGanhoPesoSim() {
		return ganhoPesoSim;
	}

	public void setGanhoPesoSim(boolean ganhoPesoSim) {
		this.ganhoPesoSim = ganhoPesoSim;
	}

	@Column(nullable=true) 
	public boolean getGanhoPesoNao() {
		return ganhoPesoNao;
	}

	public void setGanhoPesoNao(boolean ganhoPesoNao) {
		this.ganhoPesoNao = ganhoPesoNao;
	}

	@Column(nullable=true)
	public boolean getHalitoseSim() {
		return halitoseSim;
	}

	public void setHalitoseSim(boolean halitoseSim) {
		this.halitoseSim = halitoseSim;
	}

	@Column(nullable=true) 
	public boolean getHalitoseNao() {
		return halitoseNao;
	}

	public void setHalitoseNao(boolean halitoseNao) {
		this.halitoseNao = halitoseNao;
	}

	@Column(nullable=true)
	public boolean getHematemeseSim() {
		return hematemeseSim;
	}

	public void setHematemeseSim(boolean hematemeseSim) {
		this.hematemeseSim = hematemeseSim;
	}

	@Column(nullable=true) 
	public boolean getHematemeseNao() {
		return hematemeseNao;
	}

	public void setHematemeseNao(boolean hematemeseNao) {
		this.hematemeseNao = hematemeseNao;
	}

	@Column(nullable=true)
	public boolean getMelenaSim() {
		return melenaSim;
	}

	public void setMelenaSim(boolean melenaSim) {
		this.melenaSim = melenaSim;
	}

	@Column(nullable=true)
	public boolean getMelenaNao() {
		return melenaNao;
	}

	public void setMelenaNao(boolean melenaNao) {
		this.melenaNao = melenaNao;
	}

	@Column(nullable=true)
	public boolean getNauseasSim() {
		return nauseasSim;
	}

	public void setNauseasSim(boolean nauseasSim) {
		this.nauseasSim = nauseasSim;
	}

	@Column(nullable=true) 
	public boolean getNauseasNao() {
		return nauseasNao;
	}

	public void setNauseasNao(boolean nauseasNao) {
		this.nauseasNao = nauseasNao;
	}

	@Column(nullable=true) 
	public boolean getOdinofagiaSim() {
		return odinofagiaSim;
	}

	public void setOdinofagiaSim(boolean odinofagiaSim) {
		this.odinofagiaSim = odinofagiaSim;
	}

	@Column(nullable=true) 
	public boolean getOdinofagiaNao() {
		return odinofagiaNao;
	}

	public void setOdinofagiaNao(boolean odinofagiaNao) {
		this.odinofagiaNao = odinofagiaNao;
	}

	@Column(nullable=true) 
	public boolean getPerdaPesoSim() {
		return perdaPesoSim;
	}

	public void setPerdaPesoSim(boolean perdaPesoSim) {
		this.perdaPesoSim = perdaPesoSim;
	}

	@Column(nullable=true)
	public boolean getPerdaPesoNao() {
		return perdaPesoNao;
	}

	public void setPerdaPesoNao(boolean perdaPesoNao) {
		this.perdaPesoNao = perdaPesoNao;
	}

	@Column(nullable=true)
	public boolean getPiroseSim() {
		return piroseSim;
	}

	public void setPiroseSim(boolean piroseSim) {
		this.piroseSim = piroseSim;
	}

	@Column(nullable=true)
	public boolean getPiroseNao() {
		return piroseNao;
	}

	public void setPiroseNao(boolean piroseNao) {
		this.piroseNao = piroseNao;
	}

	@Column(nullable=true)
	public boolean getRefluxoSim() {
		return refluxoSim;
	}

	public void setRefluxoSim(boolean refluxoSim) {
		this.refluxoSim = refluxoSim;
	}

	@Column(nullable=true) 
	public boolean getRefluxoNao() {
		return refluxoNao;
	}

	public void setRefluxoNao(boolean refluxoNao) {
		this.refluxoNao = refluxoNao;
	}

	@Column(nullable=true) 
	public boolean getSialorreiaSim() {
		return sialorreiaSim;
	}

	public void setSialorreiaSim(boolean sialorreiaSim) {
		this.sialorreiaSim = sialorreiaSim;
	}

	@Column(nullable=true) 
	public boolean getSialorreiaNao() {
		return sialorreiaNao;
	}

	public void setSialorreiaNao(boolean sialorreiaNao) {
		this.sialorreiaNao = sialorreiaNao;
	}

	@Column(nullable=true)
	public boolean getSingultoSim() {
		return singultoSim;
	}

	public void setSingultoSim(boolean singultoSim) {
		this.singultoSim = singultoSim;
	}

	@Column(nullable=true)
	public boolean getSingultoNao() {
		return singultoNao;
	}

	public void setSingultoNao(boolean singultoNao) {
		this.singultoNao = singultoNao;
	}

	@Column(nullable=true)
	public boolean getVomitosSim() {
		return vomitosSim;
	}

	public void setVomitosSim(boolean vomitosSim) {
		this.vomitosSim = vomitosSim;
	}

	@Column(nullable=true) 
	public boolean getVomitosNao() {
		return vomitosNao;
	}

	public void setVomitosNao(boolean vomitosNao) {
		this.vomitosNao = vomitosNao;
	}

	@Column(nullable=true)
	public boolean getDorSim() {
		return dorSim;
	}

	public void setDorSim(boolean dorSim) {
		this.dorSim = dorSim;
	}

	@Column(nullable=true) 
	public boolean getDorNao() {
		return dorNao;
	}

	public void setDorNao(boolean dorNao) {
		this.dorNao = dorNao;
	}

	@Column(nullable=true)
	public String getDorOnde() {
		return dorOnde;
	}

	public void setDorOnde(String dorOnde) {
		this.dorOnde = dorOnde;
	}

	@Column(nullable=true)
	public String getOutros() {
		return outros;
	}

	public void setOutros(String outros) {
		this.outros = outros;
	}
}
