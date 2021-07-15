package hpdd.excelimport;

import hpdd.conclusion.ConclusionPaper;
import hpdd.conclusion.ConclusionRN;
import hpdd.doctor.Doctor;
import hpdd.individual.IndividualPaper;
import hpdd.individual.IndividualRN;
import hpdd.notification.Notification;
import hpdd.notification.NotificationRN;
import hpdd.paper.Paper;
import hpdd.paper.PaperRN;
import hpdd.paper.Symptoms;
import hpdd.paper.SymptomsRN;
import hpdd.results.ResultsPaper;
import hpdd.results.ResultsRN;
import hpdd.suspicion.Suspicion;
import hpdd.suspicion.SuspicionRN;
import hpdd.web.util.DataUtil;

import java.util.List;

import org.hibernate.Session;

public class ExcelImportDAOHibernate implements ExcelImportDAO{

	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}

	@Override
	public boolean inserirCasoPaper(List<String> valoresRowPlanilha, String fileName, Doctor user) {
		boolean retorno = false;
		
		try{
			Paper paperNew = new Paper();
			paperNew.setAtivo(true);
			paperNew.setTitle(fileName);
			
			paperNew.setPaperDate(DataUtil.transformaStringToDate(valoresRowPlanilha.get(1)));
			
			Notification notification = new Notification();
			notification.setAtivo(true);
			notification.setUser(user);
			notification.setCreationDate(DataUtil.transformaStringToDate(valoresRowPlanilha.get(1)));
			notification.setStatus("Completed");
			notification.setType("Paper");
			paperNew.setNotification(notification);
	
			NotificationRN notfRN = new NotificationRN();
			notfRN.save(notification);
			PaperRN papRN = new PaperRN();
			papRN.save(paperNew);
			
			IndividualPaper indp = new IndividualPaper();
			indp.setPaper(paperNew);
			
			indp.setGender(valoresRowPlanilha.get(2));
			
			if(valoresRowPlanilha.get(3) != null && !valoresRowPlanilha.get(3).equals("")){
				if(valoresRowPlanilha.get(3).contains(".")){
					String age = valoresRowPlanilha.get(3).substring(0, valoresRowPlanilha.get(3).indexOf("."));
					indp.setAge(Integer.parseInt(age));
				}else{
					indp.setAge(Integer.parseInt(valoresRowPlanilha.get(3)));
				}
			}
			indp.setCountry(valoresRowPlanilha.get(4));
			indp.setCityResidence(valoresRowPlanilha.get(5));
			indp.setState(valoresRowPlanilha.get(6));	
			indp.setFamilyHistory(valoresRowPlanilha.get(10));
			indp.setIatrogenic_exposure(valoresRowPlanilha.get(11));
			
			IndividualRN indpRN = new IndividualRN();
			indpRN.save(indp);

			ConclusionPaper conclusion = new ConclusionPaper();
			conclusion.setIndividualPaper(indp);
			conclusion.setFinalDiag(valoresRowPlanilha.get(12));
			ConclusionRN conRN = new ConclusionRN();
			conRN.save(conclusion);
			
			ResultsPaper resultPaper = new ResultsPaper();
			resultPaper.setIndividualPaper(indp);
			resultPaper.setEEG(valoresRowPlanilha.get(13));
			resultPaper.setMRT(valoresRowPlanilha.get(14));
			resultPaper.setMRI(valoresRowPlanilha.get(15));
			resultPaper.setProt14_3(valoresRowPlanilha.get(16));
			resultPaper.setGenetic(valoresRowPlanilha.get(17));
			resultPaper.setMutation(valoresRowPlanilha.get(18));
			resultPaper.setSilent_mutation(valoresRowPlanilha.get(19));
			resultPaper.setCodon_go(valoresRowPlanilha.get(20));
			resultPaper.setCodon(valoresRowPlanilha.get(21));
			resultPaper.setPrp_type(valoresRowPlanilha.get(22));
			resultPaper.setMolecular_subtype(valoresRowPlanilha.get(23));
			resultPaper.setDisease_duration(valoresRowPlanilha.get(26));
			resultPaper.setDeceased(valoresRowPlanilha.get(27));
			resultPaper.setNecropsy(valoresRowPlanilha.get(28));
			ResultsRN resRN = new ResultsRN();
			resRN.save(resultPaper);
			
			Suspicion suspicion = new Suspicion();
			suspicion.setIndividualPaper(indp);
			suspicion.setSuspect(valoresRowPlanilha.get(24));
			suspicion.setSecond_suspect(valoresRowPlanilha.get(25));
			SuspicionRN susRN = new SuspicionRN();
			susRN.save(suspicion);
			
			Symptoms firstSymptoms = new Symptoms();
			firstSymptoms.setIndividualPaper(indp);
			firstSymptoms.setType("first");
			firstSymptoms.setSymptom(valoresRowPlanilha.get(7));
			firstSymptoms.setAgeFirstSym(valoresRowPlanilha.get(8));
			
			Symptoms othersSymptoms = new Symptoms();
			othersSymptoms.setIndividualPaper(indp);
			othersSymptoms.setType("final");
			othersSymptoms.setSymptom(valoresRowPlanilha.get(9));
			
			SymptomsRN symRN = new SymptomsRN();
			symRN.save(firstSymptoms);
			symRN.save(othersSymptoms);
			
			retorno = true;
		}catch(Exception ex){
			retorno = false;
			ex.printStackTrace();
			session.getTransaction().rollback();
			
		}
		
		return retorno;
	}

	
	
}
