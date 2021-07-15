package hpdd.conclusion;

import hpdd.notification.Notification;
import java.util.List;

public interface ConclusionDAO {
	public void save(Conclusion conclusion);

	public void delete(Conclusion conclusion);

	public Conclusion load(Integer conclusion);

	public List<Conclusion> list(Integer id);

	public Notification getNotification(Integer iduser);

	public Notification getNotificationToUPDATE(Integer iduser);

	public boolean find(Integer codNotification);

	public void update(Conclusion selected);

	public List<ConclusionPaper> showConclusionPaper(Integer id);

	public void update(ConclusionPaper selected);

	public void delete(ConclusionPaper conclusionPaper);

	public void save(ConclusionPaper conclusionPaper);

	public ConclusionPaper loadConclusionPaper(Integer conclusion);

	public List<ConclusionPaper> listConclusionPaper(Integer id);

	public ConclusionPaper getConclusionPaper(Integer id);

	public List<Conclusion> listSearchPublic(Integer id);

	public List<ConclusionPaper> listConclusionPaperPublic(Integer id);
}
