package hpdd.web;

import hpdd.resume.Resume;
import hpdd.resume.ResumeRN;
import hpdd.web.util.ContextoUtil;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean(name = "resumeBean")
@RequestScoped
public class ResumeBean {
	private Resume selected = new Resume();
	private List<Resume> list = null;
	
	public String save(){
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		ResumeRN resumeRN = new ResumeRN();
		this.selected.setNotification(resumeRN.getNotification(contextoBean.getLoggedUser().getIduser()));
		resumeRN.save(this.selected);
		this.selected = new Resume();
		this.list = null;
		return "resumeCreated";
		
		
	}
public void edit(){
		
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		ResumeRN resumeRN= new ResumeRN();
		this.selected.setNotification(resumeRN.getNotificationToUPDATE(contextoBean.getLoggedUser().getIduser()));
		resumeRN.update(this.selected);
		this.selected = new Resume();
		this.list = null;
		
	}
	public void delete(){
		ResumeRN resumeRN = new ResumeRN();
		resumeRN.delete(this.selected);
		this.selected = new Resume();
		this.list = null;
		
	}
	public Resume getSelected() {
		return selected;
	}
	public void setSelected(Resume selected) {
		this.selected = selected;
	}
	public List<Resume> getList() {
		if(this.list == null) {
			ContextoBean contextoBean = ContextoUtil.getContextoBean();
			
			ResumeRN resumeRN = new ResumeRN();
			this.list = resumeRN.list(contextoBean.getLoggedUser().getIduser());
		}
		return this.list;
	}
}
