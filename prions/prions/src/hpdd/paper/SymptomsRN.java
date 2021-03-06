package hpdd.paper;

import hpdd.notification.Notification;
import hpdd.paper.SymptomDAO;
import hpdd.paper.Symptoms;
import hpdd.util.DAOFactory;

import java.util.List;

public class SymptomsRN {
	private SymptomDAO symptomDAO;
	public SymptomsRN() {
		this.symptomDAO = DAOFactory.createSymptomsDAO();
	}
	public List<Symptoms> list(Integer id){
		return this.symptomDAO.list(id);
	}
	public Symptoms load(Integer symptom){
		return this.symptomDAO.load(symptom);
	}
	public void save(Symptoms symptom){
		this.symptomDAO.save(symptom);
	}
	public void deleteSym(Symptoms symptom){
		this.symptomDAO.deleteSym(symptom);
	}
	public Notification getNotification(Integer iduser) {
		return this.symptomDAO.getNotification(iduser);
	}
	public Notification getNotificationToUPDATE(Integer iduser) {
		return this.symptomDAO.getNotificationToUPDATE(iduser);
	}
	public List<Symptoms> listaSymptomsNotif(Integer id) {
		return this.symptomDAO.listaSymptomsNotif(id);
	}
	public List<Symptoms> listFirstSym(Integer id) {
		return this.symptomDAO.listFirstSym(id);
	}
	public List<Symptoms> listSymNotifSearch(Integer id) {
		return this.symptomDAO.listSymNotifSearch(id);
	}
		

}
