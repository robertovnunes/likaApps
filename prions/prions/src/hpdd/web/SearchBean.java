package hpdd.web;

import java.util.List;

import hpdd.auxiliar.AuxiliarRN;
import hpdd.auxiliar.ResultadoBusca;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean(name = "searchBean")
@SessionScoped
public class SearchBean {
	private ResultadoBusca selected = new ResultadoBusca();
	private List<ResultadoBusca> list = null;
	private List<ResultadoBusca> list2 = null;
	private List<ResultadoBusca> listSymptom = null;

	// private General gen = new General();
	// private Individual ind = new Individual();
	// private Residential res = new Residential();
	// private ClinData cli = new ClinData();
	// private Notification notif = new Notification();

	public List<ResultadoBusca> getList() {// tentei fazer union com HQL para
											// juntar Individual com
											// IndivdualPaper, mas HQL não
											// suporta UNION!
		
		AuxiliarRN auxiliarRN = new AuxiliarRN();
		System.out.println("ind.getAge(): " + selected.getAge());
		this.list = auxiliarRN.listBusca(selected.getAge(),
				selected.getCountry(), selected.getGender(),
				selected.getState());
		
		return list;
	}

	public List<ResultadoBusca> getList2() {// tentei fazer union com HQL para
		// juntar Individual com
		// IndivdualPaper, mas HQL não
		// suporta UNION!
		AuxiliarRN auxiliarRN = new AuxiliarRN();
		System.out.println("ind.getAge(): " + selected.getAge());
		this.list2 = auxiliarRN.listBusca2(selected.getAge(),
				selected.getCountry(), selected.getGender(),
				selected.getState());
		return list2;
	}

	public List<ResultadoBusca> getListSymptom() {// tentei fazer union com HQL
													// para
		// juntar Individual com
		// IndivdualPaper, mas HQL não
		// suporta UNION!
		AuxiliarRN auxiliarRN = new AuxiliarRN();
		System.out.println("ind.getAge(): " + selected.getAge());
		this.listSymptom = auxiliarRN.listBusca3(selected.getSymptom());
		return listSymptom;
	}

	public ResultadoBusca getSelected() {
		return selected;
	}

	public void setSelected(ResultadoBusca selected) {
		this.selected = selected;
	}

	/*
	 * public List<ResultadoBusca> getList() { AuxiliarRN auxiliarRN = new
	 * AuxiliarRN(); System.out.println("(SearchBean buscar())Country: " +
	 * gen.getCountry()); this.list = auxiliarRN.listBusca(gen.getCountry(),
	 * gen.getState(), gen.getCity(), ind.getAge(), ind.getGender(),
	 * ind.getEthnicGroup(), ind.getScholarity(), res.getZone(),
	 * cli.getProgDementia(), cli.getVisualDisorder(), cli.getMyoclonus(),
	 * cli.getCerebellarDisorders(), cli.getPersistentPainDys(), cli.getAtaxy(),
	 * cli.getPyramidalSigns(), cli.getExtrapyramidalSigns(),
	 * cli.getAkineticMutism(), cli.getPsychiatricDisorders(),
	 * cli.getSleepDisorders());
	 * System.out.println("(SearchBean buscar())Country: " + gen.getCountry());
	 * return list; }
	 */

}
