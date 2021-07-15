package hpdd.images;

import hpdd.doctor.Doctor;
import hpdd.notification.Notification;
import hpdd.images.Images;
import hpdd.images.ImagesDAO;
import hpdd.util.DAOFactory;

import java.util.List;

public class ImagesRN {
	private ImagesDAO imagesDAO;
	public ImagesRN(){
		this.imagesDAO = DAOFactory.createImagesDAO();
	}
	public List<Images> list(Doctor user){
		return this.imagesDAO.list(user);
	}
	public Images load(Integer images){
		return this.imagesDAO.load(images);
	}
	public void save(Images images){
		this.imagesDAO.save(images);
	}
	public void delete(Images images){
		this.imagesDAO.delete(images);
	}
	public Notification getNotification(Integer iduser) {
		return this.imagesDAO.getNotification(iduser);
	}
}
