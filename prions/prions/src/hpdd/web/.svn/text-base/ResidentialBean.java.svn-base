package hpdd.web;
import hpdd.residential.*;
import hpdd.web.util.ContextoUtil;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean(name = "residentialBean")
@RequestScoped
public class ResidentialBean {
	private Residential selected = new Residential();
	private List<Residential> list = null;
	public String save(){
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		ResidentialRN residentialRN = new ResidentialRN();
		this.selected.setNotification(residentialRN.getNotification(contextoBean.getLoggedUser().getIduser()));
		residentialRN.save(this.selected);
		this.selected = new Residential();
		this.list = null;
		return "residentialCreated";
	}
	
	public void edit(){
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		ResidentialRN residentialRN = new ResidentialRN();
		this.selected.setNotification(residentialRN.getNotificationToUPDATE(contextoBean.getLoggedUser().getIduser()));
		residentialRN.save(this.selected);
		this.selected = new Residential();
		this.list = null;
		
	}
	
	public void delete(){
		ResidentialRN residentialRN = new ResidentialRN();
		residentialRN.delete(this.selected);
		this.selected = new Residential();
		this.list = null;
		
	}
	public Residential getSelected() {
		return selected;
	}
	public void setSelected(Residential selected) {
		this.selected = selected;
	}
	public List<Residential> getList() {
		if(this.list == null) {
			ContextoBean contextoBean = ContextoUtil.getContextoBean();
			
			ResidentialRN residentialRN = new ResidentialRN();
			this.list = residentialRN.list(contextoBean.getLoggedUser().getIduser());
		}
		return this.list;
	}
	
}
