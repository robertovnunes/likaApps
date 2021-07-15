package hpdd.general;

import java.util.List;

import hpdd.notification.Notification;
import hpdd.util.DAOFactory;

public class GeneralRN {
	private GeneralDAO generalDAO;
	public GeneralRN(){
		this.generalDAO = DAOFactory.createGeneralDAO();
	}
	public List<General> list(Integer id){
		return this.generalDAO.list(id);
	}
	public List<General> listSearch(){
		return this.generalDAO.listSearch();
	}
	public General load(Integer general){
		return this.generalDAO.load(general);
	}
	public void save(General general){
		this.generalDAO.save(general);
	}
	public void update(General general){
		this.generalDAO.update(general);
	}
	
	public void delete(General general){
		this.generalDAO.delete(general);
	}
	public Notification getNotification(Integer iduser) {
		return this.generalDAO.getNotification(iduser);
	}
	public List<General> listFiltro(String country, String state,
			String city, Integer age, String gender, String ethnicGroup,
			String educationalLevel, String zone, String progDementia, 
			String visualDisorder, String myoclonus, String cerebellarDisorders, 
			String persistentPainDys, String ataxy, String pyramidalSigns,
			String extrapyramidalSigns, String akineticMutism, String psychiatricDisorders,
			String sleepDisorders) {
		return this.generalDAO.listFiltro(country, state, city, age, gender, ethnicGroup, educationalLevel, zone, progDementia, 
				visualDisorder, myoclonus, cerebellarDisorders, persistentPainDys, ataxy, pyramidalSigns, extrapyramidalSigns, akineticMutism, psychiatricDisorders,
				sleepDisorders);
	}
	
	public Notification getNotificationToUPDATE(Integer iduser) {
		return this.generalDAO.getNotificationToUPDATE(iduser);
	}
	public List<General> listSearchPublic(Integer id) {
		return this.generalDAO.listSearchPublic(id);
	}
}
