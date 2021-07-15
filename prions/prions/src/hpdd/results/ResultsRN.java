package hpdd.results;

import hpdd.results.ResultsDAO;
import hpdd.notification.Notification;
import hpdd.util.DAOFactory;

import java.util.List;

public class ResultsRN {
	private ResultsDAO resultsDAO;

	public ResultsRN() {
		this.resultsDAO = DAOFactory.createResultsDAO();
	}

	public List<Results> list(Integer id) {
		return this.resultsDAO.list(id);
	}

	public Results load(Integer results) {
		return this.resultsDAO.load(results);
	}

	public void save(Results results) {
		this.resultsDAO.save(results);
	}

	public void delete(Results results) {
		this.resultsDAO.delete(results);
	}

	public Notification getNotification(Integer iduser) {
		return this.resultsDAO.getNotification(iduser);
	}

	public Notification getNotificationToUPDATE(Integer iduser) {
		return this.resultsDAO.getNotificationToUPDATE(iduser);
	}

	public boolean find(Integer codNotification) {
		return this.resultsDAO.find(codNotification);
	}

	public void update(Results selected) {
		this.resultsDAO.update(selected);
		
	}
	//results paper
	
	public List<ResultsPaper> listResultsPaper(Integer id) {
		return this.resultsDAO.listResultsPaper(id);
	}

	public ResultsPaper loadResultsPaper(Integer results) {
		return this.resultsDAO.loadResultsPaper(results);
	}

	public void save(ResultsPaper resultsPaper) {
		this.resultsDAO.save(resultsPaper);
	}

	public void delete(ResultsPaper resultsPaper) {
		this.resultsDAO.delete(resultsPaper);
	}


	public void update(ResultsPaper selected) {
		this.resultsDAO.update(selected);
		
	}

	public List<ResultsPaper> showResultsPaper(Integer id) {
		return this.resultsDAO.showResultsPaper(id);
	}

	public ResultsPaper getResultsPaper(Integer id) {
		return this.resultsDAO.getResultsPaper(id);
	}

	public List<Results> listSearchPublic(Integer id) {
		return this.resultsDAO.listSearchPublic(id);
	}

	public List<ResultsPaper> showResultsPaperPublic(Integer id) {
		return this.resultsDAO.showResultsPaperPublic(id);
	}

}
