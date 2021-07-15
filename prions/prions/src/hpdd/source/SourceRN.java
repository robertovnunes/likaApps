package hpdd.source;

import java.util.List;

import hpdd.notification.Notification;
import hpdd.util.DAOFactory;

public class SourceRN {
	private SourceDAO sourceDAO;
	public SourceRN(){
		this.sourceDAO = DAOFactory.createSourceDAO();
	}
	public List<Source> list(Integer id){
		return this.sourceDAO.list(id);
	}
	public List<Source> listSearch(){
		return this.sourceDAO.listSearch();
	}
	public Source load(Integer source){
		return this.sourceDAO.load(source);
	}
	public void save(Source source){
		this.sourceDAO.save(source);
	}
	public void delete(Source source){
		this.sourceDAO.delete(source);
	}
	public Notification getNotification(Integer iduser) {
		return this.sourceDAO.getNotification(iduser);
	}
	
	
	public Notification getNotificationToUPDATE(Integer iduser) {
		return this.sourceDAO.getNotificationToUPDATE(iduser);
	}
	public boolean find(Integer codNotification) {
		return this.sourceDAO.find(codNotification);
	}
	public void update(Source selected) {
		this.sourceDAO.update(selected);
		
	}
	public List<Source> listSearchPublic(Integer id) {
		return this.sourceDAO.listSearchPublic(id);
	}
}
