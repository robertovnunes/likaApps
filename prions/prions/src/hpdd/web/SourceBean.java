package hpdd.web;
import hpdd.source.Source;
import hpdd.source.SourceRN;

import hpdd.web.util.ContextoUtil;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean(name = "sourceBean")
@RequestScoped
public class SourceBean {
	private Source selected = new Source();
	private List<Source> list = null;
	private List<Source> listSearchPublic = null;
	private List<Source> listSearch = null;
	private Integer id;
	public String save(){
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		SourceRN sourceRN = new SourceRN();
		this.selected.setNotification(sourceRN.getNotification(contextoBean.getLoggedUser().getIduser()));
		sourceRN.save(this.selected);
		this.selected = new Source();
		this.list = null;
		return "sourceCreated";
		
	}
	public void edit(){
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		SourceRN sourceRN = new SourceRN();
		//System.out.println("Id indiv edit" + contextoBean.getLoggedUser().getIduser());
		this.selected.setNotification(sourceRN.getNotificationToUPDATE(contextoBean.getLoggedUser().getIduser()));
		//System.out.println("Cod indiv edit => antes = " + this.selected.getNotification().getCodNotification());
		if (sourceRN.find(this.selected.getNotification()
				.getCodNotification())) {
			sourceRN.update(this.selected);
		} else sourceRN.save(this.selected);
		//System.out.println("Cod indiv edit => depois = " + this.selected.getNotification().getCodNotification());
		this.selected = new Source();
		this.list = null;
		
	}
	public void delete(){
		SourceRN sourceRN = new SourceRN();
		sourceRN.delete(this.selected);
		this.selected = new Source();
		this.list = null;
		
	}
	public Source getSelected() {
		return selected;
	}
	public void setSelected(Source selected) {
		this.selected = selected;
	}
	public List<Source> getList() {
		if(this.list == null) {
			ContextoBean contextoBean = ContextoUtil.getContextoBean();
			
			SourceRN sourceRN = new SourceRN();
			this.list = sourceRN.list(contextoBean.getLoggedUser().getIduser());
		}
		return this.list;
	}
	
	public List<Source> getListSearchPublic() {
		if(this.listSearchPublic == null) {
			SourceRN sourceRN = new SourceRN();
			this.listSearchPublic = sourceRN.listSearchPublic(getId());
		}
		return this.listSearchPublic;
	}
	public List<Source> getListSearch() {
		System.out.println("List source");
		if(this.listSearch == null) {
			SourceRN sourceRN = new SourceRN();
			this.listSearch = sourceRN.listSearch();
		}
		return this.listSearch;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
}

