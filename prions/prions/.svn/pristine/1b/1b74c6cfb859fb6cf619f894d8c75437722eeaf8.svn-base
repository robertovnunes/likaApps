package hpdd.web;

import hpdd.auxiliar.AuxiliarRN;
import hpdd.auxiliar.CasosPaises;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

import org.primefaces.model.chart.PieChartModel;

@SuppressWarnings("serial")
@ManagedBean(name = "casosPaisesBean")
@RequestScoped
public class CasosPaisesBean implements Serializable {

	private PieChartModel modeloPais;

	public CasosPaisesBean() {
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
		List<CasosPaises> listaCasos = new ArrayList<CasosPaises>();
		AuxiliarRN auxiliarRN = new AuxiliarRN();
		listaCasos = auxiliarRN.listPaises();
		System.out.println("Num casos paper" + listaCasos.get(3).getNumCasos());
		for (CasosPaises casosPaises : listaCasos) {
			modeloPais.set(casosPaises.getPais(),casosPaises.getNumCasos());
			
		}
	}
	

}

