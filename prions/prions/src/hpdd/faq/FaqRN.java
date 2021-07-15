package hpdd.faq;

import hpdd.util.DAOFactory;

import java.util.List;

public class FaqRN {
	private FaqDAO faqDAO;
	public FaqRN(){
		this.faqDAO = DAOFactory.createFaqDAO();
	}
	public List<Faq> listFAQ(){
		return this.faqDAO.listFAQ();
	}
	public Faq load(Integer faq){
		return this.faqDAO.load(faq);
	}
	public void save(Faq faq){
		this.faqDAO.save(faq);
	}
	public void delete(Faq faq){
		this.faqDAO.delete(faq);
	}
}
