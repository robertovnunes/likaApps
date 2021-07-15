package hpdd.residential;

import hpdd.notification.Notification;

import java.util.List;

public interface ResidentialDAO {
	public void save(Residential residential);
	public void delete(Residential residential);
	public Residential load(Integer integer);
	public List<Residential> list(Integer id);
	public Notification getNotification(Integer iduser);
	public Notification getNotificationToUPDATE(Integer iduser);
}