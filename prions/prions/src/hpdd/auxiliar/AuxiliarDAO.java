package hpdd.auxiliar;


import java.util.List;

public interface AuxiliarDAO {
	
	public List<CasosPaises> listPaises();
	public List<CasosIdade> listIdade();
	public List<CasosGenero> listGenero();
	public List<CasosSintomas> listSintomas();
	public List<CasosGenero> listGeneroPaper();
	/*public List<ResultadoBusca> listBusca(String country, String state,
			String city, Integer age, String gender, String ethnicGroup,
			String educationalLevel, String zone,String progDementia, 
			String visualDisorder, String myoclonus, String cerebellarDisorders, 
			String persistentPainDys, String ataxy, String pyramidalSigns,
			String extrapyramidalSigns, String akineticMutism, String psychiatricDisorders,
			String sleepDisorders);*/
	public List<ResultadoBusca> listBusca(Integer age, String country,
			String gender, String state);
	public List<ResultadoBusca> listBusca2(Integer age, String country,
			String gender, String state);
	public List<ResultadoBusca> listBusca3(String symptom);
}
