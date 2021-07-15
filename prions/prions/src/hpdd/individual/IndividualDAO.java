package hpdd.individual;

import hpdd.notification.Notification;

import java.util.List;

public interface IndividualDAO {
	// individual ficha
	public void save(Individual individual);

	public void delete(Individual individual);

	public Individual load(Integer individual);

	public List<Individual> list(Integer id);

	public List<Individual> listSearch();

	public Notification getNotification(Integer iduser);

	public Notification getNotificationToUPDATE(Integer iduser);

	public void update(Individual individual);

	public boolean find(Integer codNotification);

	// individual paper
	public void save(IndividualPaper individualPaper);

	public void delete(IndividualPaper individualPaper);

	public IndividualPaper loadIndividualPaper(Integer individual);

	public List<IndividualPaper> listIndividualPaper(Integer id);

	public List<IndividualPaper> listSearchPaper();

	public void update(IndividualPaper individualPaper);

	public void restore(Integer id);

	public void activateIndPaper(Integer id);

	public List<Individual> listSearchPublic(Integer id);

}
