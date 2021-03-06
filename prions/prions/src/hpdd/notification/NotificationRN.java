package hpdd.notification;

import java.util.Date;
import java.util.List;

//import hpdd.auxiliar.NotificationCode;
import hpdd.doctor.Doctor;
import hpdd.util.DAOFactory;

public class NotificationRN {
	private NotificationDAO notificationDAO;
	public NotificationRN(){
		this.notificationDAO = DAOFactory.createNotificationDAO();
	}
	public List<Notification> list(Doctor user){
		return this.notificationDAO.list(user);
	}
	//public List<Notification> list(Integer user){
	//public List<NotificationCode> list(Integer user){
		//return this.notificationDAO.list(user);
	//}
	public Notification load(Integer patient){
		return this.notificationDAO.load(patient);
	}
	public void save(Notification notification){
		notification.setCreationDate(new Date());
		this.notificationDAO.save(notification);
	}
	public void delete(Notification notification){
		this.notificationDAO.delete(notification);
	}
	public void restore(Integer id) {
		this.notificationDAO.restore(id);
	}
	public void restoreSearch() {
		this.notificationDAO.restoreSearch();
		
	}
	public void change(Integer id) {
		this.notificationDAO.change(id);
	}
	public void keep(Integer iduser) {
		this.notificationDAO.keep(iduser);
		
	}
	
	public List<Notification> list2(Integer iduser) {
		return this.notificationDAO.list2(iduser);
	}
	public List<Notification> listUniqueSearch(Integer idSearch) {
		return this.notificationDAO.listUniqueSearch(idSearch);
	}
	public List<Notification> listNotifSearch(Integer id) {
		return this.notificationDAO.listNotifSearch(id);
	}
}
