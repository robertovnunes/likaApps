package hpdd.excelreport;

import java.util.Date;
import java.util.List;

import hpdd.util.DAOFactory;

public class ExcelReportRN {

	private ExcelReportDAO excelReportDAO;

	public ExcelReportRN() {
		this.excelReportDAO = DAOFactory.createExcelReportDAO();
	}

	public List<Object[]> listarResultado(Date datefrom, Date dateto,
			String country, String gender) {
		return this.excelReportDAO.listarResultado(datefrom, dateto, country, gender);
	}

}
