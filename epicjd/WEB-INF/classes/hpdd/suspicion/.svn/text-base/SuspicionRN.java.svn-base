package hpdd.suspicion;

import hpdd.notification.Notification;
import hpdd.util.DAOFactory;

import java.util.List;

public class SuspicionRN {
	private SuspicionDAO suspicionDAO;
	public SuspicionRN(){
		this.suspicionDAO = DAOFactory.createSuspicionDAO();
	}
	public List<Suspicion> list(Integer id){
		return this.suspicionDAO.list(id);
	}
	public Suspicion load(Integer suspicion){
		return this.suspicionDAO.load(suspicion);
	}
	public void save(Suspicion suspicion){
		this.suspicionDAO.save(suspicion);
	}
	public void update(Suspicion suspicion) {
		this.suspicionDAO.update(suspicion);
	}
	public void delete(Suspicion suspicion){
		this.suspicionDAO.delete(suspicion);
	}
	public Notification getNotification(Integer iduser) {
		return this.suspicionDAO.getNotification(iduser);
	}
	public Notification getNotificationToUPDATE(Integer iduser) {
		return this.suspicionDAO.getNotificationToUPDATE(iduser);
	}
	public boolean find(Integer codNotification) {
		return this.suspicionDAO.find(codNotification);
	}
	

}
