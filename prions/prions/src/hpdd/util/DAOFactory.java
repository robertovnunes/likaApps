package hpdd.util;

import hpdd.aspects.AspectsDAO;
import hpdd.aspects.AspectsDAOHibernate;
import hpdd.auxiliar.AuxiliarDAO;
import hpdd.auxiliar.AuxiliarDAOHibenate;
import hpdd.clinData.ClinDataDAO;
import hpdd.clinData.ClinDataDAOHibernate;
import hpdd.conclusion.ConclusionDAO;
import hpdd.conclusion.ConclusionDAOHibernate;
import hpdd.doctor.DoctorDAO;
import hpdd.doctor.DoctorDAOHibernate;
import hpdd.excelimport.ExcelImportDAO;
import hpdd.excelimport.ExcelImportDAOHibernate;
import hpdd.excelreport.ExcelReportDAO;
import hpdd.excelreport.ExcelReportDAOHibernate;
import hpdd.faq.FaqDAO;
import hpdd.faq.FaqDAOHibernate;
import hpdd.general.GeneralDAO;
import hpdd.general.GeneralDAOHibernate;
import hpdd.images.ImagesDAO;
import hpdd.images.ImagesDAOHibernate;
import hpdd.individual.IndividualDAO;
import hpdd.individual.IndividualDAOHibernate;
import hpdd.notification.NotificationDAO;
import hpdd.notification.NotificationDAOHibernate;
import hpdd.paper.PaperDAO;
import hpdd.paper.PaperDAOHibernate;
import hpdd.paper.SymptomDAO;
import hpdd.paper.SymptomDAOHibernate;
import hpdd.pictures.PicturesDAO;
import hpdd.pictures.PicturesDAOHibernate;
import hpdd.publication.PublicationDAO;
import hpdd.publication.PublicationDAOHibernate;
import hpdd.residential.ResidentialDAO;
import hpdd.residential.ResidentialDAOHibernate;
import hpdd.results.ResultsDAO;
import hpdd.results.ResultsDAOHibernate;
import hpdd.resume.ResumeDAO;
import hpdd.resume.ResumeDAOHibernate;
import hpdd.source.SourceDAO;
import hpdd.source.SourceDAOHibernate;
import hpdd.suspicion.SuspicionDAO;
import hpdd.suspicion.SuspicionDAOHibernate;

public class DAOFactory {
	public static DoctorDAO createUserDAO(){
		DoctorDAOHibernate userDAO = new DoctorDAOHibernate();
		userDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return userDAO;
	}
	public static NotificationDAO createNotificationDAO(){
		NotificationDAOHibernate notificationDAO = new NotificationDAOHibernate();
		notificationDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return notificationDAO;
	}
	public static GeneralDAO createGeneralDAO(){
		GeneralDAOHibernate generalDAO = new GeneralDAOHibernate();
		generalDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return generalDAO;
	}
	public static IndividualDAO createIndividualDAO(){
		IndividualDAOHibernate individiualDAO = new IndividualDAOHibernate();
		individiualDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return individiualDAO;
	}
	public static ResidentialDAO createResidentialDAO(){
		ResidentialDAOHibernate residentialDAO = new ResidentialDAOHibernate();
		residentialDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return residentialDAO;
	}
	public static SuspicionDAO createSuspicionDAO() {
		SuspicionDAOHibernate suspicionDAO = new SuspicionDAOHibernate();
		suspicionDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return suspicionDAO;
	}
	public static ClinDataDAO createClinDataDAO() {
		ClinDataDAOHibernate clinDataDAO = new ClinDataDAOHibernate();
		clinDataDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return clinDataDAO;
	}
	public static AspectsDAO createAspectsDAO() {
		AspectsDAOHibernate aspectsDAO = new AspectsDAOHibernate();
		aspectsDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return aspectsDAO;
	}
	public static ResultsDAO createResultsDAO() {
		ResultsDAOHibernate resultsDAO = new ResultsDAOHibernate();
		resultsDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return resultsDAO;
	}
	public static ConclusionDAO createConclusionDAO() {
		ConclusionDAOHibernate conclusionDAO = new ConclusionDAOHibernate();
		conclusionDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return conclusionDAO;
	}
	public static ResumeDAO createResumeDAO() {
		ResumeDAOHibernate resumeDAO = new ResumeDAOHibernate();
		resumeDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return resumeDAO;
	}

	public static SourceDAO createSourceDAO() {
		SourceDAOHibernate sourceDAO = new SourceDAOHibernate();
		sourceDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return sourceDAO;
	}
	public static PaperDAO createPaperDAO() {
		PaperDAOHibernate paperDAO = new PaperDAOHibernate();
		paperDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return paperDAO;
	}
	public static SymptomDAO createSymptomsDAO() {
		SymptomDAOHibernate symptomDAO = new SymptomDAOHibernate();
		symptomDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return symptomDAO;
	}
	public static AuxiliarDAO createAuxiliarDAO() {
		AuxiliarDAOHibenate auxiliarDAO = new AuxiliarDAOHibenate();
		auxiliarDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return auxiliarDAO;
	}
	public static FaqDAO createFaqDAO() {
		FaqDAOHibernate faqDAO = new FaqDAOHibernate();
		faqDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return faqDAO;
	}
	public static PublicationDAO createPublicationDAO() {
		PublicationDAOHibernate publicationDAO = new PublicationDAOHibernate();
		publicationDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return publicationDAO;
	}
	public static PicturesDAO createPicturesDAO() {
		PicturesDAOHibernate picturesDAO = new PicturesDAOHibernate();
		picturesDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return picturesDAO;
	}
	public static ImagesDAO createImagesDAO() {
		ImagesDAOHibernate imagesDAO = new ImagesDAOHibernate();
		imagesDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return imagesDAO;
	}
	public static ExcelReportDAO createExcelReportDAO() {
		ExcelReportDAOHibernate excelReportDAO = new ExcelReportDAOHibernate();
		excelReportDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return excelReportDAO;
	}
	public static ExcelImportDAO createExcelImportDAO() {
		ExcelImportDAOHibernate excelImportDAO = new ExcelImportDAOHibernate();
		excelImportDAO.setSession(HibernateUtil.getSessionFactory().getCurrentSession());
		return excelImportDAO;
	}
}
