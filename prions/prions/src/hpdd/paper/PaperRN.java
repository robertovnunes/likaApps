package hpdd.paper;

import hpdd.individual.IndividualPaper;
import hpdd.notification.Notification;
import hpdd.paper.Paper;
import hpdd.paper.PaperDAO;
import hpdd.util.DAOFactory;

import java.util.List;

public class PaperRN {
	private PaperDAO paperDAO;

	public PaperRN() {
		this.paperDAO = DAOFactory.createPaperDAO();
	}

	public List<Paper> list(Integer id) {
		return this.paperDAO.list(id);
	}

	public Paper load(Integer paper) {
		return this.paperDAO.load(paper);
	}

	public void save(Paper paper) {
		this.paperDAO.save(paper);
	}

	public void delete(Paper paper) {
		this.paperDAO.delete(paper);
	}

	public Notification getNotification(Integer iduser) {
		return this.paperDAO.getNotification(iduser);
	}

	public Notification getNotificationToUPDATE(Integer iduser) {
		return this.paperDAO.getNotificationToUPDATE(iduser);
	}

	public Paper getPaper(Integer iduser) {
		return this.paperDAO.getPaper(iduser);
	}

	public List<Paper> listaPaperNotif(Integer id) {
		return this.paperDAO.listaPaperNotif(id);
	}

	public void update(Paper selected) {
		this.paperDAO.update(selected);

	}

	public void restore(Integer id) {
		this.paperDAO.restore(id);
	}

	public IndividualPaper getIndividualPaper(Integer iduser) {
		return this.paperDAO.getIndividualPaper(iduser);
	}

	public List<IndividualPaper> listaIndividualPaperNotif(Integer iduser) {
		return this.paperDAO.listaIndividualPaperNotif(iduser);
	}

	public List<IndividualPaper> listauniqueIndividualPaper(
			Integer iduser) {
		return this.paperDAO.listaUniqueIndividualPaper(iduser);
	}

	public IndividualPaper getIndividualPaperToUpdate(Integer iduser) {
		return this.paperDAO.getIndividualPaper(iduser);
	}

	public List<IndividualPaper> listauniqueIndividualPaperSearch(Integer id) {
		return this.paperDAO.listaUniqueIndividualPaperSearch(id);
	}

}
