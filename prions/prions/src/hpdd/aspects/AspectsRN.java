package hpdd.aspects;

import hpdd.notification.Notification;
import hpdd.util.DAOFactory;

import java.util.List;

public class AspectsRN {
	private AspectsDAO aspectsDAO;

	public AspectsRN() {
		this.aspectsDAO = DAOFactory.createAspectsDAO();
	}

	public List<Aspects> list(Integer id) {
		return this.aspectsDAO.list(id);
	}

	public Aspects load(Integer aspects) {
		return this.aspectsDAO.load(aspects);
	}

	public void save(Aspects aspects) {
		this.aspectsDAO.save(aspects);
	}

	public void delete(Aspects aspects) {
		this.aspectsDAO.delete(aspects);
	}

	public Notification getNotification(Integer iduser) {
		return this.aspectsDAO.getNotification(iduser);
	}

	public Notification getNotificationToUPDATE(Integer iduser) {
		return this.aspectsDAO.getNotificationToUPDATE(iduser);
	}

	public boolean find(Integer codNotification) {
		return this.aspectsDAO.find(codNotification);
	}

	public void update(Aspects selected) {
		this.aspectsDAO.update(selected);
		
	}

	public List<Aspects> listSearchPublic(Integer id) {
		return this.aspectsDAO.listSearchPublic(id);
	}
}
