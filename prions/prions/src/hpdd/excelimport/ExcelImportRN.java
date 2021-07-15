package hpdd.excelimport;

import hpdd.doctor.Doctor;
import hpdd.util.DAOFactory;

import java.util.List;

public class ExcelImportRN {

	private ExcelImportDAO excelImportDAO;

	public ExcelImportRN() {
		this.excelImportDAO = DAOFactory.createExcelImportDAO();
	}

	public boolean inserirCasoPaper(List<String> valoresRowPlanilha, String fileName, Doctor user)  {
		return this.excelImportDAO.inserirCasoPaper(valoresRowPlanilha, fileName, user);
	}

}
