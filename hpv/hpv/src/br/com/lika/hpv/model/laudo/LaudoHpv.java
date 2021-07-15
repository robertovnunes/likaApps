package br.com.lika.hpv.model.laudo;

import br.com.lika.hpv.model.formulario.Formulario;
import br.com.lika.hpv.model.formulario.util.Data;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class LaudoHpv {

	@OneToOne(cascade = { javax.persistence.CascadeType.REFRESH,
			javax.persistence.CascadeType.MERGE }, fetch = FetchType.LAZY, optional = false)
	private Formulario formulario;

	@Id
	@GeneratedValue
	private Long id;
	private Date dataEntrega;
	private Date dataColeta;

	@Column(length = 30)
	private String tipoAmostraRaspadoCervicoUterino;

	@Column(length = 30)
	private String tipoAmostraSangueVenoso;

	@Column(length = 30)
	private String tipoAmostraSangueArterial;

	@Column(length = 30)
	private String tipoAmostraBiopsiaFormalina;

	@Column(length = 30)
	private String tipoAmostraBiopsiaEmblocadoParafina;

	@Column(length = 250)
	private String tipoAmostraOutros;
	private String adeqAmostSatisfatoriaAnaliseBiologiaMolecular;
	private String adeqAmostAspectoPurulento;
	private String adeqAmostAspectoSanguinolento;
	private String adeqAmostAspectoSanguinolentoPurulento;
	private String adeqAmostInsatisfatoriaAnaliseBiologiaMolecular;

	@Column(length = 250)
	private String adeqAmostOutros;

	@Column(length = 1000)
	private String resultado;

	
	public Formulario getFormulario() {
		return this.formulario;
	}

	public void setFormulario(Formulario formulario) {
		this.formulario = formulario;
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTipoAmostraRaspadoCervicoUterino() {
		return this.tipoAmostraRaspadoCervicoUterino;
	}

	public void setTipoAmostraRaspadoCervicoUterino(
			String tipoAmostraRaspadoCervicoUterino) {
		this.tipoAmostraRaspadoCervicoUterino = tipoAmostraRaspadoCervicoUterino;
	}

	public String getTipoAmostraSangueVenoso() {
		return this.tipoAmostraSangueVenoso;
	}

	public void setTipoAmostraSangueVenoso(String tipoAmostraSangueVenoso) {
		this.tipoAmostraSangueVenoso = tipoAmostraSangueVenoso;
	}

	public String getTipoAmostraSangueArterial() {
		return this.tipoAmostraSangueArterial;
	}

	public void setTipoAmostraSangueArterial(String tipoAmostraSangueArterial) {
		this.tipoAmostraSangueArterial = tipoAmostraSangueArterial;
	}

	public String getTipoAmostraBiopsiaFormalina() {
		return this.tipoAmostraBiopsiaFormalina;
	}

	public void setTipoAmostraBiopsiaFormalina(
			String tipoAmostraBiopsiaFormalina) {
		this.tipoAmostraBiopsiaFormalina = tipoAmostraBiopsiaFormalina;
	}

	public String getTipoAmostraBiopsiaEmblocadoParafina() {
		return this.tipoAmostraBiopsiaEmblocadoParafina;
	}

	public void setTipoAmostraBiopsiaEmblocadoParafina(
			String tipoAmostraBiopsiaEmblocadoParafina) {
		this.tipoAmostraBiopsiaEmblocadoParafina = tipoAmostraBiopsiaEmblocadoParafina;
	}

	public String getTipoAmostraOutros() {
		return this.tipoAmostraOutros;
	}

	public void setTipoAmostraOutros(String tipoAmostraOutros) {
		this.tipoAmostraOutros = tipoAmostraOutros;
	}

	public String getAdeqAmostSatisfatoriaAnaliseBiologiaMolecular() {
		return this.adeqAmostSatisfatoriaAnaliseBiologiaMolecular;
	}

	public void setAdeqAmostSatisfatoriaAnaliseBiologiaMolecular(
			String adeqAmostSatisfatoriaAnaliseBiologiaMolecular) {
		this.adeqAmostSatisfatoriaAnaliseBiologiaMolecular = adeqAmostSatisfatoriaAnaliseBiologiaMolecular;
	}

	public String getAdeqAmostAspectoPurulento() {
		return this.adeqAmostAspectoPurulento;
	}

	public void setAdeqAmostAspectoPurulento(String adeqAmostAspectoPurulento) {
		this.adeqAmostAspectoPurulento = adeqAmostAspectoPurulento;
	}

	public String getAdeqAmostAspectoSanguinolento() {
		return this.adeqAmostAspectoSanguinolento;
	}

	public void setAdeqAmostAspectoSanguinolento(
			String adeqAmostAspectoSanguinolento) {
		this.adeqAmostAspectoSanguinolento = adeqAmostAspectoSanguinolento;
	}

	public String getAdeqAmostAspectoSanguinolentoPurulento() {
		return this.adeqAmostAspectoSanguinolentoPurulento;
	}

	public void setAdeqAmostAspectoSanguinolentoPurulento(
			String adeqAmostAspectoSanguinolentoPurulento) {
		this.adeqAmostAspectoSanguinolentoPurulento = adeqAmostAspectoSanguinolentoPurulento;
	}

	public String getAdeqAmostInsatisfatoriaAnaliseBiologiaMolecular() {
		return this.adeqAmostInsatisfatoriaAnaliseBiologiaMolecular;
	}

	public void setAdeqAmostInsatisfatoriaAnaliseBiologiaMolecular(
			String adeqAmostInsatisfatoriaAnaliseBiologiaMolecular) {
		this.adeqAmostInsatisfatoriaAnaliseBiologiaMolecular = adeqAmostInsatisfatoriaAnaliseBiologiaMolecular;
	}

	public String getAdeqAmostOutros() {
		return this.adeqAmostOutros;
	}

	public void setAdeqAmostOutros(String adeqAmostOutros) {
		this.adeqAmostOutros = adeqAmostOutros;
	}

	public String getResultado() {
		return this.resultado;
	}

	public void setResultado(String resultado) {
		this.resultado = resultado;
	}

	public Date getDataEntrega() {
		Data data = new Data();
		if (this.dataEntrega != null) {
			data.setTime(this.dataEntrega.getTime());
			return data;
		}
		return null;
	}

	public void setDataEntrega(Date dataEntrega) {
		this.dataEntrega = dataEntrega;
	}

	public Date getDataColeta() {
		Data data = new Data();
		if (this.dataColeta != null) {
			data.setTime(this.dataColeta.getTime());
			return data;
		}
		return null;
	}

	public void setDataColeta(Date dataColeta) {
		this.dataColeta = dataColeta;
	}

}

/*
 * Location: D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name: br.com.lika.hpv.model.laudo.LaudoHpv JD-Core Version: 0.6.0
 */