package hpdd.conclusion;

import hpdd.conclusion.Conclusion;
import hpdd.conclusion.ConclusionDAO;
import hpdd.notification.Notification;
import hpdd.conclusion.ConclusionPaper;
import hpdd.util.DAOFactory;

import java.util.List;

public class ConclusionRN {
	private ConclusionDAO conclusionDAO;

	public ConclusionRN() {
		this.conclusionDAO = DAOFactory.createConclusionDAO();
	}

	public List<Conclusion> list(Integer id) {
		return this.conclusionDAO.list(id);
	}

	public Conclusion load(Integer conclusion) {
		return this.conclusionDAO.load(conclusion);
	}

	public void save(Conclusion conclusion) {
		this.conclusionDAO.save(conclusion);
	}

	public void delete(Conclusion conclusion) {
		this.conclusionDAO.delete(conclusion);
	}

	public Notification getNotification(Integer iduser) {
		return this.conclusionDAO.getNotification(iduser);
	}

	public Notification getNotificationToUPDATE(Integer iduser) {
		return this.conclusionDAO.getNotificationToUPDATE(iduser);
	}

	public boolean find(Integer codNotification) {
		return this.conclusionDAO.find(codNotification);
	}

	public void update(Conclusion selected) {
		this.conclusionDAO.update(selected);
		
	}
	
	//conclusion paper
	
		public List<ConclusionPaper> listConclusionPaper(Integer id) {
		return this.conclusionDAO.listConclusionPaper(id);
		}

		public ConclusionPaper loadConclusionPaper(Integer conclusion) {
			return this.conclusionDAO.loadConclusionPaper(conclusion);
		}

		public void save(ConclusionPaper conclusionPaper) {
			this.conclusionDAO.save(conclusionPaper);
		}

		public void delete(ConclusionPaper conclusionPaper) {
			this.conclusionDAO.delete(conclusionPaper);
		}


		public void update(ConclusionPaper selected) {
			this.conclusionDAO.update(selected);
			
		}

		public List<ConclusionPaper> showConclusionPaper(Integer id) {
			return this.conclusionDAO.showConclusionPaper(id);
		}

		public ConclusionPaper getConclusionPaper(Integer id) {
			return this.conclusionDAO.getConclusionPaper(id);
		}

		public List<Conclusion> listSearchPublic(Integer id) {
			return this.conclusionDAO.listSearchPublic(id);
		}

		public List<ConclusionPaper> listConclusionPaperPublic(Integer id) {
			return this.conclusionDAO.listConclusionPaperPublic(id);
		}
}
