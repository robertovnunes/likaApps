package hpdd.web;

import hpdd.auxiliar.AuxiliarRN;
import hpdd.auxiliar.CasosIdade;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

import org.primefaces.model.chart.PieChartModel;

@SuppressWarnings("serial")
@ManagedBean(name = "casosIdadeBean")
@RequestScoped
public class CasosIdadeBean implements Serializable {

	private PieChartModel modeloIdade;

	public CasosIdadeBean() {
		criarModeloGraficoIdade();
	}
	
	public PieChartModel getModeloIdade() {
		return modeloIdade;
	}

	public void setModeloIdade(PieChartModel modeloIdade) {
		this.modeloIdade = modeloIdade;
	}

	private void criarModeloGraficoIdade() {
		modeloIdade = new PieChartModel();
		List<CasosIdade> listaCasosIdade = new ArrayList<CasosIdade>();
		AuxiliarRN auxiliarRN = new AuxiliarRN();
		listaCasosIdade = auxiliarRN.listIdade();
		for (CasosIdade casosIdade : listaCasosIdade) {
			modeloIdade.set(casosIdade.getIdade(),casosIdade.getNumCasos());
			
		}
	}
	

}
