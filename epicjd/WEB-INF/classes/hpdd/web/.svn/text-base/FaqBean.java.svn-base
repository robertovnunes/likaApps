package hpdd.web;

import hpdd.faq.Faq;
import hpdd.faq.FaqRN;
//import hpdd.web.util.ContextoUtil;

import java.util.Date;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
@ManagedBean(name = "faqBean")
@RequestScoped
public class FaqBean {
	private Faq selected = new Faq();
	java.util.Date dataEHora = new Date();
	java.sql.Timestamp date = new java.sql.Timestamp(dataEHora.getTime());
	private List<Faq> list = null;
	public String save(){
		//ContextoBean contextoBean = ContextoUtil.getContextoBean();
		FaqRN faqRN = new FaqRN();
		this.selected.setDate(date);
		faqRN.save(this.selected);
		this.selected = new Faq();
		this.list = null;
		return "faqCreated";
		
	}
	public void edit(){
		//ContextoBean contextoBean = ContextoUtil.getContextoBean();
		FaqRN faqRN = new FaqRN();
		faqRN.save(this.selected);
		this.selected = new Faq();
		this.list = null;
		
	}
	public void delete(){
		FaqRN faqRN = new FaqRN();
		faqRN.delete(this.selected);
		this.selected = new Faq();
		this.list = null;
		
	}
	public Faq getSelected() {
		return selected;
	}
	public void setSelected(Faq selected) {
		this.selected = selected;
	}
	public List<Faq> getList() {
		if(this.list == null) {
			//ContextoBean contextoBean = ContextoUtil.getContextoBean();
			
			FaqRN faqRN = new FaqRN();
			this.list = faqRN.listFAQ();
		}
		return this.list;
	}
}
