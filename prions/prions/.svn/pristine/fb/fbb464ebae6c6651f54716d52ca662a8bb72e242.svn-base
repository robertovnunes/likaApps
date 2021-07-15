package hpdd.web;

import hpdd.auxiliar.AuxiliarRN;
import hpdd.auxiliar.CasosGenero;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

import org.primefaces.model.chart.PieChartModel;

@SuppressWarnings("serial")
@ManagedBean(name = "casosGeneroBean")
@RequestScoped
public class CasosGeneroBean implements Serializable {

	private PieChartModel modeloGenero;

	public CasosGeneroBean() {
		criarModeloGraficoGenero();
	}
	
	public PieChartModel getModeloGenero() {
		return modeloGenero;
	}

	public void setModeloGenero(PieChartModel modeloGenero) {
		this.modeloGenero = modeloGenero;
	}

	private void criarModeloGraficoGenero() {
		modeloGenero = new PieChartModel();
		List<CasosGenero> listaCasosGenero = new ArrayList<CasosGenero>();
		//List<CasosGenero> listaCasosGeneroPaper = new ArrayList<CasosGenero>();
		AuxiliarRN auxiliarRN = new AuxiliarRN();
		listaCasosGenero = auxiliarRN.listGenero();
		//listaCasosGeneroPaper = auxiliarRN.listGeneroPaper();
		//System.out.println(listaCasosGenero.get(1).genero);
		//System.out.println(listaCasosGenero.get(1).numCasos);
		//System.out.println(listaCasosGeneroPaper.get(1).genero);
		//System.out.println(listaCasosGeneroPaper.get(1).numCasos);
		for (CasosGenero casosGenero : listaCasosGenero) {
			modeloGenero.set(casosGenero.getGenero(),casosGenero.getNumCasos());
			
		}
		
		
		//modeloGenero.set(listaCasosGenero.get(1).genero+listaCasosGeneroPaper.get(1).genero,listaCasosGenero.get(1).numCasos+listaCasosGeneroPaper.get(1).numCasos);
		
	}
	

}
