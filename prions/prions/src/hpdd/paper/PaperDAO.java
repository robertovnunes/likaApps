package hpdd.paper;

import hpdd.paper.Paper;
import hpdd.individual.IndividualPaper;
import hpdd.notification.Notification;

import java.util.List;

public interface PaperDAO {
	public void save(Paper paper);
	public void delete(Paper paper);
	public Paper load(Integer paper);
	public List<Paper> list(Integer id);
	public List<Paper> listSearch();
	public Notification getNotification(Integer iduser);
	public Notification getNotificationToUPDATE(Integer iduser);
	public List<Paper> listaPaperNotif(Integer id);
	public void update(Paper selected);
	public void restore(Integer id);
	public Paper getPaper(Integer iduser);
	public IndividualPaper getIndividualPaper(Integer iduser);
	public IndividualPaper getIndividualPaperToUpdate(Integer iduser);
	public List<IndividualPaper> listaIndividualPaperNotif(Integer iduser);
	public List<IndividualPaper> listaUniqueIndividualPaper(Integer iduser);
	public List<IndividualPaper> listaUniqueIndividualPaperSearch(Integer id);
}
