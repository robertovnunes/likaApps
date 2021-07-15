package hpdd.publication;

import hpdd.publication.Publication;
import hpdd.publication.PublicationDAO;
import hpdd.util.DAOFactory;

import java.util.List;

public class PublicationRN {
	private PublicationDAO publicationDAO;
	public PublicationRN(){
		this.publicationDAO = DAOFactory.createPublicationDAO();
	}
	public List<Publication> listFAQ(){
		return this.publicationDAO.listPub();
	}
	public Publication load(Integer publication){
		return this.publicationDAO.load(publication);
	}
	public void save(Publication publication){
		this.publicationDAO.save(publication);
	}
	public void delete(Publication publication){
		this.publicationDAO.delete(publication);
	}
}
