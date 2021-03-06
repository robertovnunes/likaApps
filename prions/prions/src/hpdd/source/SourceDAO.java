package hpdd.source;

import hpdd.notification.Notification;

import java.util.List;

public interface SourceDAO {
	public void save(Source source);

	public void delete(Source source);

	public Source load(Integer source);

	public List<Source> list(Integer id);
	
	public Notification getNotification(Integer iduser);
	
	public List<Source> listSearch();

	public Notification getNotificationToUPDATE(Integer iduser);

	public boolean find(Integer codNotification);

	public void update(Source selected);

	public List<Source> listSearchPublic(Integer id);
}
