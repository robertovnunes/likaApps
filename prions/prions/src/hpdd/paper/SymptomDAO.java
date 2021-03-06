package hpdd.paper;

import hpdd.notification.Notification;

import java.util.List;

public interface SymptomDAO {

		public void save(Symptoms symptoms);
		public void deleteSym(Symptoms symptoms);
		public Symptoms load(Integer symptoms);
		public List<Symptoms> list(Integer id);
		public List<Symptoms> listSearch();
		public Notification getNotification(Integer iduser);
		public Notification getNotificationToUPDATE(Integer iduser);
		public List<Symptoms> listaSymptomsNotif(Integer id);
		public List<Symptoms> listFirstSym(Integer codNotif);
		public List<Symptoms> listSymNotifSearch(Integer id);
	
}
