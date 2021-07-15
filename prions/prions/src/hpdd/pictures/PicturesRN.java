package hpdd.pictures;

import java.util.List;

import hpdd.notification.Notification;
import hpdd.util.DAOFactory;

public class PicturesRN {
	private PicturesDAO picturesDAO;
	
	public PicturesRN() {
		this.picturesDAO = DAOFactory.createPicturesDAO();
	}
	
	public void save(Pictures pictures) {
		this.picturesDAO.save(pictures);
	}
	
	public List<Pictures> listPictures(Integer id) {
		return this.picturesDAO.listPictures(id);
	}
	
	public Notification getNotification(Integer iduser) {
		return this.picturesDAO.getNotification(iduser);
	}

	public Notification getNotificationToUPDATE(Integer iduser) {
		return this.picturesDAO.getNotificationToUPDATE(iduser);
	}
	//pictures paper
	
	
	public void save(PicturesPaper picturesPaper) {
		this.picturesDAO.save(picturesPaper);
	}
	
	public List<Pictures> listPicturesPaper(Integer id) {
		return this.picturesDAO.listPicturesPaper(id);
	}

}
