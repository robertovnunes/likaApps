package hpdd.web;

import hpdd.publication.Publication;
import hpdd.publication.PublicationRN;
//import hpdd.web.util.ContextoUtil;

import java.util.Date;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
@ManagedBean(name = "publicationBean")
@RequestScoped
public class PublicationBean {
	private Publication selected = new Publication();
	java.util.Date dataEHora = new Date();
	java.sql.Timestamp date = new java.sql.Timestamp(dataEHora.getTime());
	private List<Publication> list = null;
	public String save(){
		System.out.println("Entrou save pub");
		//ContextoBean contextoBean = ContextoUtil.getContextoBean();
		PublicationRN publicationRN = new PublicationRN();
		this.selected.setDate(date);
		publicationRN.save(this.selected);
		this.selected = new Publication();
		this.list = null;
		return "publicationCreated";
		
	}
	public void edit(){
		//ContextoBean contextoBean = ContextoUtil.getContextoBean();
		PublicationRN publicationRN = new PublicationRN();
		publicationRN.save(this.selected);
		this.selected = new Publication();
		this.list = null;
		
	}
	public void delete(){
		PublicationRN publicationRN = new PublicationRN();
		publicationRN.delete(this.selected);
		this.selected = new Publication();
		this.list = null;
		
	}
	public Publication getSelected() {
		return selected;
	}
	public void setSelected(Publication selected) {
		this.selected = selected;
	}
	public List<Publication> getList() {
		if(this.list == null) {
			//ContextoBean contextoBean = ContextoUtil.getContextoBean();
			
			PublicationRN publicationRN = new PublicationRN();
			this.list = publicationRN.listFAQ();
		}
		return this.list;
	}
}
