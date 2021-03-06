package hpdd.general;

import hpdd.notification.Notification;

import java.util.List;

public interface GeneralDAO {
	public void save(General general);
	
	public void update(General general);

	public void delete(General general);

	public General load(Integer general);

	public List<General> list(Integer id);

	public Notification getNotification(Integer iduser);

	public List<General> listFiltro(String country, String state, String city,
			Integer age, String gender, String ethnicGroup,
			String educationalLevel, String zone, String progDementia,
			String visualDisorder, String myoclonus,
			String cerebellarDisorders, String persistentPainDys, String ataxy,
			String pyramidalSigns, String extrapyramidalSigns,
			String akineticMutism, String psychiatricDisorders,
			String sleepDisorders);


	public List<General> listSearch();

	public Notification getNotificationToUPDATE(Integer iduser);

	public List<General> listSearchPublic(Integer id);
}
