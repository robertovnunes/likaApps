package hpdd.web;

import hpdd.auxiliar.AuxiliarRN;
import hpdd.auxiliar.CasosSintomas;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

import org.primefaces.model.chart.PieChartModel;

@SuppressWarnings("serial")
@ManagedBean(name = "casosSintomasBean")
@RequestScoped
public class CasosSintomasBean implements Serializable {

	private PieChartModel modeloPais;

	public CasosSintomasBean() {
		criarModeloGraficoPais();
	}

	public PieChartModel getModeloPais() {
		return modeloPais;
	}

	public void setModeloPais(PieChartModel modeloPais) {
		this.modeloPais = modeloPais;
	}
	
	private void criarModeloGraficoPais() {
		modeloPais = new PieChartModel();
		List<CasosSintomas> listaCasos = new ArrayList<CasosSintomas>();
		AuxiliarRN auxiliarRN = new AuxiliarRN();
		listaCasos = auxiliarRN.listSintomas();
		for (CasosSintomas casosSintomas : listaCasos) {
			modeloPais.set(casosSintomas.getPais(),casosSintomas.getNumCasos());
			
		}
	}
	

}

