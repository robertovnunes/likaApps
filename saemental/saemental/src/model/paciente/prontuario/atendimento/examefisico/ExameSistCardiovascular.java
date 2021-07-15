package model.paciente.prontuario.atendimento.examefisico;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="examefisico_ExameSistCardiovascular")
public class ExameSistCardiovascular implements Serializable{

	public int id;
	public boolean semQueixas;
	public boolean sonsBulhasMormofoneticas;
	public boolean sonsBulhasHiperfoneticas;
	public boolean sonsBulhasHipofoneticas;
	public boolean sonsComSopros;
	public boolean sonsSemSopros;
	public String sonsOutros;
	public boolean perfusaoRegular;
	public boolean perfusaoDiminuida;
	public String perfusaoOutros;
	public boolean dorConstricao;
	public boolean dorCompressao;
	public boolean dorQueimaxao;
	public boolean dorPeso;
	public boolean dorPontada;
	public String dorOutros;
	public boolean dorRetroesternal;
	public boolean dorOmbroEsquerdo;
	public boolean dorPescoco;
	public boolean dorFace;
	public boolean dorRegiaoInterescapular;
	public boolean dorEpigastrica;
	public String dorLocalOutros;
	public boolean geralPalpitacoes;
	public boolean geralSincope;
	public boolean geralEdemaMMII;
	public boolean geralEdemaMMSS;
	public boolean geralAnasarca;
	public boolean geralFormigamento;
	public boolean geralCaimbras;
	public boolean geralDor;
	public String geralLocal;
	public String geralOutros;
	
	public ExameSistCardiovascular(){}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="semQueixas", nullable=true)
	public boolean getSemQueixas() {
		return semQueixas;
	}

	public void setSemQueixas(boolean semQueixas) {
		this.semQueixas = semQueixas;
	}

	@Column(name="sonsBulhasMormofoneticas", nullable=true)
	public boolean getSonsBulhasMormofoneticas() {
		return sonsBulhasMormofoneticas;
	}

	public void setSonsBulhasMormofoneticas(boolean sonsBulhasMormofoneticas) {
		this.sonsBulhasMormofoneticas = sonsBulhasMormofoneticas;
	}

	@Column(name="sonsBulhasHiperfoneticas", nullable=true)
	public boolean getSonsBulhasHiperfoneticas() {
		return sonsBulhasHiperfoneticas;
	}

	public void setSonsBulhasHiperfoneticas(boolean sonsBulhasHiperfoneticas) {
		this.sonsBulhasHiperfoneticas = sonsBulhasHiperfoneticas;
	}

	@Column(name="sonsBulhasHipofoneticas", nullable=true)
	public boolean getSonsBulhasHipofoneticas() {
		return sonsBulhasHipofoneticas;
	}

	public void setSonsBulhasHipofoneticas(boolean sonsBulhasHipofoneticas) {
		this.sonsBulhasHipofoneticas = sonsBulhasHipofoneticas;
	}

	@Column(name="sonsComSopros", nullable=true)
	public boolean getSonsComSopros() {
		return sonsComSopros;
	}

	public void setSonsComSopros(boolean sonsComSopros) {
		this.sonsComSopros = sonsComSopros;
	}

	@Column(name="sonsSemSopros", nullable=true)
	public boolean getSonsSemSopros() {
		return sonsSemSopros;
	}

	public void setSonsSemSopros(boolean sonsSemSopros) {
		this.sonsSemSopros = sonsSemSopros;
	}

	@Column(name="sonsOutros", nullable=true)
	public String getSonsOutros() {
		return sonsOutros;
	}

	public void setSonsOutros(String sonsOutros) {
		this.sonsOutros = sonsOutros;
	}
	
	@Column(name="perfusaoRegular", nullable=true)
	public boolean getPerfusaoRegular() {
		return perfusaoRegular;
	}

	public void setPerfusaoRegular(boolean perfusaoRegular) {
		this.perfusaoRegular = perfusaoRegular;
	}

	@Column(name="perfusaoDiminuida", nullable=true)
	public boolean getPerfusaoDiminuida() {
		return perfusaoDiminuida;
	}

	public void setPerfusaoDiminuida(boolean perfusaoDiminuida) {
		this.perfusaoDiminuida = perfusaoDiminuida;
	}
	
	@Column(name="perfusaoOutros", nullable=true)
	public String getPerfusaoOutros() {
		return perfusaoOutros;
	}

	public void setPerfusaoOutros(String perfusaoOutros) {
		this.perfusaoOutros = perfusaoOutros;
	}

	@Column(name="dorConstricao", nullable=true)
	public boolean getDorConstricao() {
		return dorConstricao;
	}

	public void setDorConstricao(boolean dorConstricao) {
		this.dorConstricao = dorConstricao;
	}

	@Column(name="dorCompressao", nullable=true)
	public boolean getDorCompressao() {
		return dorCompressao;
	}

	public void setDorCompressao(boolean dorCompressao) {
		this.dorCompressao = dorCompressao;
	}

	@Column(name="dorQueimaxao", nullable=true)
	public boolean getDorQueimaxao() {
		return dorQueimaxao;
	}

	public void setDorQueimaxao(boolean dorQueimaxao) {
		this.dorQueimaxao = dorQueimaxao;
	}

	@Column(name="dorPeso", nullable=true)
	public boolean getDorPeso() {
		return dorPeso;
	}

	public void setDorPeso(boolean dorPeso) {
		this.dorPeso = dorPeso;
	}

	@Column(name="dorPontada", nullable=true)
	public boolean getDorPontada() {
		return dorPontada;
	}

	public void setDorPontada(boolean dorPontada) {
		this.dorPontada = dorPontada;
	}

	@Column(name="dorOutros", nullable=true)
	public String getDorOutros() {
		return dorOutros;
	}

	public void setDorOutros(String dorOutros) {
		this.dorOutros = dorOutros;
	}

	@Column(name="dorRetroesternal", nullable=true)
	public boolean getDorRetroesternal() {
		return dorRetroesternal;
	}

	public void setDorRetroesternal(boolean dorRetroesternal) {
		this.dorRetroesternal = dorRetroesternal;
	}

	@Column(name="dorOmbroEsquerdo", nullable=true)
	public boolean getDorOmbroEsquerdo() {
		return dorOmbroEsquerdo;
	}

	public void setDorOmbroEsquerdo(boolean dorOmbroEsquerdo) {
		this.dorOmbroEsquerdo = dorOmbroEsquerdo;
	}

	@Column(name="dorPescoco", nullable=true)
	public boolean getDorPescoco() {
		return dorPescoco;
	}

	public void setDorPescoco(boolean dorPescoco) {
		this.dorPescoco = dorPescoco;
	}

	@Column(name="dorFace", nullable=true)
	public boolean getDorFace() {
		return dorFace;
	}

	public void setDorFace(boolean dorFace) {
		this.dorFace = dorFace;
	}

	@Column(name="dorRegiaoInterescapular", nullable=true)
	public boolean getDorRegiaoInterescapular() {
		return dorRegiaoInterescapular;
	}

	public void setDorRegiaoInterescapular(boolean dorRegiaoInterescapular) {
		this.dorRegiaoInterescapular = dorRegiaoInterescapular;
	}

	@Column(name="dorEpigastrica", nullable=true)
	public boolean getDorEpigastrica() {
		return dorEpigastrica;
	}

	public void setDorEpigastrica(boolean dorEpigastrica) {
		this.dorEpigastrica = dorEpigastrica;
	}

	@Column(name="dorLocalOutros", nullable=true)
	public String getDorLocalOutros() {
		return dorLocalOutros;
	}

	public void setDorLocalOutros(String dorLocalOutros) {
		this.dorLocalOutros = dorLocalOutros;
	}

	@Column(name="geralPalpitacoes", nullable=true)
	public boolean getGeralPalpitacoes() {
		return geralPalpitacoes;
	}

	public void setGeralPalpitacoes(boolean geralPalpitacoes) {
		this.geralPalpitacoes = geralPalpitacoes;
	}

	@Column(name="geralSincope", nullable=true)
	public boolean getGeralSincope() {
		return geralSincope;
	}

	public void setGeralSincope(boolean geralSincope) {
		this.geralSincope = geralSincope;
	}

	@Column(name="geralEdemaMMII", nullable=true)
	public boolean getGeralEdemaMMII() {
		return geralEdemaMMII;
	}

	public void setGeralEdemaMMII(boolean geralEdemaMMII) {
		this.geralEdemaMMII = geralEdemaMMII;
	}

	@Column(name="geralEdemaMMSS", nullable=true)
	public boolean getGeralEdemaMMSS() {
		return geralEdemaMMSS;
	}

	public void setGeralEdemaMMSS(boolean geralEdemaMMSS) {
		this.geralEdemaMMSS = geralEdemaMMSS;
	}

	@Column(name="geralAnasarca", nullable=true)
	public boolean getGeralAnasarca() {
		return geralAnasarca;
	}

	public void setGeralAnasarca(boolean geralAnasarca) {
		this.geralAnasarca = geralAnasarca;
	}

	@Column(name="geralFormigamento", nullable=true)
	public boolean getGeralFormigamento() {
		return geralFormigamento;
	}

	public void setGeralFormigamento(boolean geralFormigamento) {
		this.geralFormigamento = geralFormigamento;
	}

	@Column(name="geralCaimbras", nullable=true)
	public boolean getGeralCaimbras() {
		return geralCaimbras;
	}

	public void setGeralCaimbras(boolean geralCaimbras) {
		this.geralCaimbras = geralCaimbras;
	}

	@Column(name="geralDor", nullable=true)
	public boolean getGeralDor() {
		return geralDor;
	}

	public void setGeralDor(boolean geralDor) {
		this.geralDor = geralDor;
	}

	@Column(name="geralLocal", nullable=true)
	public String getGeralLocal() {
		return geralLocal;
	}

	public void setGeralLocal(String geralLocal) {
		this.geralLocal = geralLocal;
	}

	@Column(name="geralOutros", nullable=true)
	public String getGeralOutros() {
		return geralOutros;
	}

	public void setGeralOutros(String geralOutros) {
		this.geralOutros = geralOutros;
	}
}
