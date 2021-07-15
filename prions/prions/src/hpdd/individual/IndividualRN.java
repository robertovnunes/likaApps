package hpdd.individual;

import java.util.List;

import hpdd.notification.Notification;
import hpdd.util.DAOFactory;

public class IndividualRN {
	private IndividualDAO individualDAO;

	public IndividualRN() {
		this.individualDAO = DAOFactory.createIndividualDAO();
	}

	public List<Individual> list(Integer id) {
		return this.individualDAO.list(id);
	}

	public List<Individual> listSearch() {
		return this.individualDAO.listSearch();
	}

	public Individual load(Integer individual) {
		return this.individualDAO.load(individual);
	}

	public void save(Individual individual) {
		this.individualDAO.save(individual);
	}

	public void update(Individual individual) {
		this.individualDAO.update(individual);
	}

	public void delete(Individual individual) {
		this.individualDAO.delete(individual);
	}

	public Notification getNotification(Integer iduser) {
		return this.individualDAO.getNotification(iduser);
	}

	public Notification getNotificationToUPDATE(Integer iduser) {
		return this.individualDAO.getNotificationToUPDATE(iduser);
	}

	public boolean find(Integer codNotification) {
		return this.individualDAO.find(codNotification);
	}
	
	
	//individual paper
	
	public List<IndividualPaper> listIndividualPaper(Integer id) {
		return this.individualDAO.listIndividualPaper(id);
	}

	public List<IndividualPaper> listSearchPaper() {
		return this.individualDAO.listSearchPaper();
	}

	public IndividualPaper loadIndividualPaper(Integer individualPaper) {
		return this.individualDAO.loadIndividualPaper(individualPaper);
	}

	public void save(IndividualPaper individualPaper) {
		this.individualDAO.save(individualPaper);
	}

	public void update(IndividualPaper individualPaper) {
		this.individualDAO.update(individualPaper);
	}

	public void delete(IndividualPaper individualPaper) {
		this.individualDAO.delete(individualPaper);
	}

	public void restore(Integer id) {
		this.individualDAO.restore(id);
		
	}

	public void activateIndPaper(Integer id) {
		this.individualDAO.activateIndPaper(id);
		
	}

	public List<Individual> listSearchPublic(Integer id) {
		return this.individualDAO.listSearchPublic(id);
	}
}
