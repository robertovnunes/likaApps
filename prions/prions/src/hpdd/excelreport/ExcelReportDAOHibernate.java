package hpdd.excelreport;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;

public class ExcelReportDAOHibernate implements ExcelReportDAO{

	private Session session;

	public void setSession(Session session) {
		this.session = session;
	}

	
	@Override
	public List<Object[]> listarResultado(Date datefrom, Date dateto,
			String country, String gender) {
		
		String where = " where 1 = 1 ";
		
		if(datefrom != null){
			where += " and paper.paper_date >= '"+new SimpleDateFormat("yyyy-MM-dd").format(datefrom)+"'";
		}
		if(dateto != null){
			where += " and paper.paper_date <= '"+new SimpleDateFormat("yyyy-MM-dd").format(dateto)+"'";
		}
		if(country != null && !country.equals("")){
			where += " and paper.country = '"+country+"'";
		}
		if(gender != null && !gender.equals("")){
			where += " and indp.gender = '"+gender+"'";
		}
		
		SQLQuery q = session.createSQLQuery("select   "+
				"	paper.cod_paper, "+
				"	paper.paper_date,indp.gender, indp.age, indp.country, indp.cityResidence,	indp.state,"+
				"	(  select GROUP_CONCAT(fsym.symptom, '#', IFNULL(fsym.sym_date,'NULL') order by fsym.id SEPARATOR ', ')  from symptoms fsym  where fsym.cod_symindpaper = indp.id  and fsym.type = 'first'  group by fsym.cod_symindpaper  )   as 'First Symptoms',"+
				"	(  select MIN(age_first_sym) from symptoms afsym  where afsym.cod_symindpaper = indp.id  and afsym.type = 'first'  group by afsym.cod_symindpaper  )   as 'Age at First Symptom	', "+
				"	(  select GROUP_CONCAT(sym.symptom, '#', IFNULL(sym.period,'NULL') order by sym.id SEPARATOR ', ')  from symptoms sym  where sym.cod_symindpaper = indp.id  and sym.type = 'final'  group by sym.cod_symindpaper  )   as 'Others Symptoms',    "+
				"	indp.family_history , indp.iatrogenic_exposure , 	con.final_diag , res.EEG , res.mrt  , res.mri  , res.prot14_3  , res.genetic  , res.mutation  , res.silent_mutation  , res.129_codon_go , res.129_codon , "+
				"	res.prp_type  , res.molecular_subtype , sus.suspect , sus.second_suspect , res.disease_duration , res.deceased , res.necropsy "+
				" from paper paper  "+
				"	inner join individualpaper as indp on indp.cod_indpap = paper.cod_paper  "+
				"	left join resultspaper as res on res.cod_respap = indp.id  "+
				"	left join conclusionpaper as con on con.cod_conpap = indp.id"+
				"	left join suspicion as sus on sus.cod_suspap = indp.id"+
				where+
				" group by paper.cod_paper  order by paper.cod_paper desc;");
	
		List<Object[]> retorno =null;
		
		return q.list();
	}
	
	@Override
	public List<Object[]> searchSymptomsPaper(String cod_symindpaper) {
		
		
		SQLQuery q = session.createSQLQuery("select sym.cod_symindpaper, GROUP_CONCAT(sym.symptom, '#', IFNULL(sym.period,'NULL') order by sym.id SEPARATOR ', ') " +
				"from symptoms sym where sym.cod_symindpaper = "+cod_symindpaper+"  and sym.type = 'final' " +
				"group by sym.cod_symindpaper");
		 
		return q.list();
	}


	@Override
	public List<Object[]> searchFirstSymptomsPaper(String cod_symindpaper) {
		SQLQuery q = session.createSQLQuery("select fsym.cod_symindpaper, GROUP_CONCAT(fsym.symptom, '#', IFNULL(fsym.sym_date,'NULL') order by fsym.id SEPARATOR ', ') " +
				"from symptoms fsym where fsym.cod_symindpaper = "+cod_symindpaper+"  and fsym.type = 'first' " +
				"group by fsym.cod_symindpaper");
		 
		return q.list();
	}

	
}
