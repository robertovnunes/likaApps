package hpdd.auxiliar;

import java.util.List;

import hpdd.util.DAOFactory;

public class AuxiliarRN {
	private AuxiliarDAO auxiliarDAO;
	public AuxiliarRN(){
		this.auxiliarDAO = DAOFactory.createAuxiliarDAO();
	}
	public List<CasosPaises> listPaises(){
		return this.auxiliarDAO.listPaises();
	}
	public List<CasosIdade> listIdade(){
		return this.auxiliarDAO.listIdade();
	}
	public List<CasosGenero> listGenero() {
		return this.auxiliarDAO.listGenero();
	}
	public List<CasosSintomas> listSintomas() {
		return this.auxiliarDAO.listSintomas();
	}
	public List<CasosGenero> listGeneroPaper() {
		return this.auxiliarDAO.listGeneroPaper();
	}
/*	public List<ResultadoBusca> listBusca(String country, String state,
			String city, Integer age, String gender, String ethnicGroup,
			String educationalLevel, String zone,String progDementia, 
			String visualDisorder, String myoclonus, String cerebellarDisorders, 
			String persistentPainDys, String ataxy, String pyramidalSigns,
			String extrapyramidalSigns, String akineticMutism, String psychiatricDisorders,
			String sleepDisorders) {
		return this.auxiliarDAO.listBusca(country, state, city, age, gender, ethnicGroup, educationalLevel, zone, progDementia, 
				visualDisorder, myoclonus, cerebellarDisorders, persistentPainDys, ataxy, pyramidalSigns, extrapyramidalSigns, akineticMutism, psychiatricDisorders,
				sleepDisorders);
	}*/
	public List<ResultadoBusca> listBusca2(Integer age, String country,
			String gender, String state) {
		return this.auxiliarDAO.listBusca2(age, country, gender, state);
	}
	
	public List<ResultadoBusca> listBusca(Integer age, String country,
			String gender, String state) {
		return this.auxiliarDAO.listBusca(age, country, gender, state);
	
	}
	public List<ResultadoBusca> listBusca3(String symptom) {
		return this.auxiliarDAO.listBusca3(symptom);
	}
	
}
