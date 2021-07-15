package hpdd.resume;

import hpdd.resume.Resume;
import hpdd.resume.ResumeDAO;
import hpdd.notification.Notification;
import hpdd.util.DAOFactory;

import java.util.List;

public class ResumeRN {
	private ResumeDAO resumeDAO;
	public ResumeRN(){
		this.resumeDAO = DAOFactory.createResumeDAO();
	}
	public List<Resume> list(Integer user){
		return this.resumeDAO.list(user);
	}
	public Resume load(Integer resume){
		return this.resumeDAO.load(resume);
	}
	public void save(Resume resume){
		this.resumeDAO.save(resume);
	}
	public void update(Resume resume){
		this.resumeDAO.update(resume);
	}
	public void delete(Resume resume){
		this.resumeDAO.delete(resume);
	}
	public Notification getNotification(Integer iduser) {
		return this.resumeDAO.getNotification(iduser);
	}
	public Notification getNotificationToUPDATE(Integer iduser) {
		return this.resumeDAO.getNotificationToUPDATE(iduser);
	}
}
