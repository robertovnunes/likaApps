package hpdd.excelimport;

import hpdd.doctor.Doctor;

import java.util.List;


public interface ExcelImportDAO {

	public boolean inserirCasoPaper(List<String> valoresRowPlanilha, String fileName, Doctor user);
}
