package hpdd.residential;

import java.util.List;
import hpdd.notification.Notification;
import hpdd.util.DAOFactory;

public class ResidentialRN {
	private ResidentialDAO residentialDAO;
	public ResidentialRN() {
		this.residentialDAO = DAOFactory.createResidentialDAO();
	}
	public List<Residential> list(Integer id){
		return this.residentialDAO.list(id);
	}
	public Residential load(Integer residential){
		return this.residentialDAO.load(residential);
	}
	public void save(Residential residential){
		this.residentialDAO.save(residential);
	}
	public void delete(Residential residential){
		this.residentialDAO.delete(residential);
	}
	public Notification getNotification(Integer iduser) {
		return this.residentialDAO.getNotification(iduser);
	}
	public Notification getNotificationToUPDATE(Integer iduser) {
		return this.residentialDAO.getNotificationToUPDATE(iduser);
	}	

}
