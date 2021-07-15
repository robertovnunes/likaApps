package hpdd.pictures;

import java.util.List;

import hpdd.notification.Notification;


public interface PicturesDAO {
	public void save(Pictures pictures);

	public Notification getNotification(Integer iduser);

	public Notification getNotificationToUPDATE(Integer iduser);

	List<Pictures> listPictures(Integer id);

	public void save(PicturesPaper picturesPaper);

	public List<Pictures> listPicturesPaper(Integer id);
}
