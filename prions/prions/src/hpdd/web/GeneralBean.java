package hpdd.web;

import java.util.List;

import hpdd.general.General;
import hpdd.general.GeneralRN;
import hpdd.notification.*;
import hpdd.web.util.ContextoUtil;


import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean(name = "generalBean")
@RequestScoped
public class GeneralBean {
	private General selected = new General();
	private Notification notif = new Notification();
	private List<General> list = null;
	private List<General> listSearch = null;
	private List<General> listSearchPublic = null;
	private Integer id;
	
	public String save(){
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		NotificationRN notificationRN = new NotificationRN();
		notificationRN.restore(contextoBean.getLoggedUser().getIduser());
		this.notif.setUser(contextoBean.getLoggedUser());
		this.notif.setCodNotification(null);
		this.notif.setStatus("Incomplete");
		this.notif.setType("Form");
		this.notif.setAtivo(true);
		notificationRN.save(this.notif);
		this.notif = new Notification();
		this.selected.setNotification(null);
		GeneralRN generalRN = new GeneralRN();
		this.selected.setNotification(generalRN.getNotificationToUPDATE(contextoBean.getLoggedUser().getIduser()));
		generalRN.save(this.selected);
		this.selected = new General();
		this.list = null;
		return "generalCreated";
		
		
	}
	public void edit(){
		
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		GeneralRN generalRN= new GeneralRN();
		this.selected.setNotification(generalRN.getNotificationToUPDATE(contextoBean.getLoggedUser().getIduser()));
		generalRN.update(this.selected);
		this.selected = new General();
		this.list = null;
		
	}
	public void delete(){
		GeneralRN generalRN = new GeneralRN();
		generalRN.delete(this.selected);
		this.selected = new General();
		this.list = null;
		
	}
	public General getSelected() {
		return selected;
	}
	public void setSelected(General selected) {
		this.selected = selected;
	}
	public List<General> getList() {
		if(this.list == null) {
			ContextoBean contextoBean = ContextoUtil.getContextoBean();
			GeneralRN generalRN = new GeneralRN();
			this.list = generalRN.list(contextoBean.getLoggedUser().getIduser());
		}
		return this.list;
	}
	public List<General> getListSearch() {
		if(this.listSearch == null) {
			GeneralRN generalRN = new GeneralRN();
			this.listSearch = generalRN.listSearch();
		}
		return this.listSearch;
	}
	public List<General> getListSearchPublic() {
		if(this.listSearchPublic == null) {
			GeneralRN generalRN = new GeneralRN();
			this.listSearchPublic = generalRN.listSearchPublic(getId());
		}
		return listSearchPublic;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
}
