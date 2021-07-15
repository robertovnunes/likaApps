package hpdd.web;
import hpdd.individual.*;

import hpdd.web.util.ContextoUtil;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean(name = "individualBean")
@RequestScoped
public class IndividualBean {
	private Individual selected = new Individual();
	private List<Individual> list = null;
	private List<Individual> listSearchPublic = null;
	private List<Individual> listSearch = null;
	private Integer id;
	public String save(){
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		IndividualRN individualRN = new IndividualRN();
		this.selected.setNotification(individualRN.getNotification(contextoBean.getLoggedUser().getIduser()));
		individualRN.save(this.selected);
		this.selected = new Individual();
		this.list = null;
		return "individualCreated";
		
	}
	public void edit(){
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		IndividualRN individualRN = new IndividualRN();
		//System.out.println("Id indiv edit" + contextoBean.getLoggedUser().getIduser());
		this.selected.setNotification(individualRN.getNotificationToUPDATE(contextoBean.getLoggedUser().getIduser()));
		//System.out.println("Cod indiv edit => antes = " + this.selected.getNotification().getCodNotification());
		if (individualRN.find(this.selected.getNotification()
				.getCodNotification())) {
			individualRN.update(this.selected);
		} else individualRN.save(this.selected);
		//System.out.println("Cod indiv edit => depois = " + this.selected.getNotification().getCodNotification());
		this.selected = new Individual();
		this.list = null;
		
	}
	public void delete(){
		IndividualRN individualRN = new IndividualRN();
		individualRN.delete(this.selected);
		this.selected = new Individual();
		this.list = null;
		
	}
	public Individual getSelected() {
		return selected;
	}
	public void setSelected(Individual selected) {
		this.selected = selected;
	}
	public List<Individual> getList() {
		if(this.list == null) {
			ContextoBean contextoBean = ContextoUtil.getContextoBean();
			
			IndividualRN individualRN = new IndividualRN();
			this.list = individualRN.list(contextoBean.getLoggedUser().getIduser());
		}
		return this.list;
	}
	public List<Individual> getListSearchPublic() {
		if(this.listSearchPublic == null) {
			IndividualRN individualRN = new IndividualRN();
			this.listSearchPublic = individualRN.listSearchPublic(getId());
		}
		return this.listSearchPublic;
	}
	public List<Individual> getListSearch() {
		System.out.println("List individual");
		if(this.listSearch == null) {
			IndividualRN individualRN = new IndividualRN();
			this.listSearch = individualRN.listSearch();
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

