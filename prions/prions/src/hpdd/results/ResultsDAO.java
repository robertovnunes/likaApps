package hpdd.results;

import hpdd.notification.Notification;

import java.util.List;

public interface ResultsDAO {
	public void save(Results results);

	public void delete(Results results);

	public Results load(Integer results);

	public List<Results> list(Integer id);

	public Notification getNotification(Integer iduser);

	public Notification getNotificationToUPDATE(Integer iduser);

	public boolean find(Integer codNotification);

	public void update(Results selected);

	public List<ResultsPaper> listResultsPaper(Integer id);

	public void save(ResultsPaper resultsPaper);

	public void delete(ResultsPaper resultsPaper);

	public void update(ResultsPaper selected);

	public ResultsPaper loadResultsPaper(Integer results);

	public List<ResultsPaper> showResultsPaper(Integer id);

	public ResultsPaper getResultsPaper(Integer id);

	public List<Results> listSearchPublic(Integer id);

	public List<ResultsPaper> showResultsPaperPublic(Integer id);
}
