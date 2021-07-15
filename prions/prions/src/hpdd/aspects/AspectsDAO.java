package hpdd.aspects;

import hpdd.notification.Notification;

import java.util.List;

public interface AspectsDAO {
	public void save(Aspects aspects);

	public void delete(Aspects aspects);

	public Aspects load(Integer aspects);

	public List<Aspects> list(Integer id);

	public Notification getNotification(Integer iduser);

	public Notification getNotificationToUPDATE(Integer iduser);

	public boolean find(Integer codNotification);

	public void update(Aspects selected);

	public List<Aspects> listSearchPublic(Integer id);
}
