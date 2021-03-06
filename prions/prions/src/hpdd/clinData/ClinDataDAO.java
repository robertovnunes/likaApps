package hpdd.clinData;

import hpdd.notification.Notification;

import java.util.List;

public interface ClinDataDAO {
	public void save(ClinData clinData);

	public void delete(ClinData clinData);

	public ClinData load(Integer clinData);

	public List<ClinData> list(Integer id);

	public Notification getNotification(Integer iduser);

	public Notification getNotificationToUPDATE(Integer iduser);

	public boolean find(Integer codNotification);

	public void update(ClinData clinData);

	public List<ClinData> listDataNotifSearch(Integer id);
}