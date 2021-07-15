package hpdd.notification;
//import hpdd.auxiliar.NotificationCode;
import hpdd.doctor.*;

import java.util.List;

public interface NotificationDAO {
	public void save(Notification patient);
	public void delete(Notification patient);
	public Notification load(Integer patient);
	public void restore(Integer id);
	public void restoreSearch();
	public void change(Integer id);
	public void keep(Integer iduser);
	public List<Notification> list(Doctor user);
	public List<Notification> list2(Integer iduser);
	public List<Notification> listUniqueSearch(Integer idSearch);
	public List<Notification> listNotifSearch(Integer id);
}
