package hpdd.resume;

import hpdd.resume.Resume;
import hpdd.notification.Notification;

import java.util.List;

public interface ResumeDAO {
	public void save(Resume resume);
	public void update(Resume resume);
	public void delete(Resume resume);
	public Resume load(Integer resume);
	public List<Resume> list(Integer id);
	public Notification getNotification(Integer iduser);
	public Notification getNotificationToUPDATE(Integer iduser);
}
