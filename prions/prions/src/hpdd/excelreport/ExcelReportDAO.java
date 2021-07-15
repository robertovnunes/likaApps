package hpdd.excelreport;

import java.util.Date;
import java.util.List;

public interface ExcelReportDAO {

	public List<Object[]> listarResultado(Date datefrom, Date dateto, String country, String gender);
	public List<Object[]> searchSymptomsPaper(String cod_symindpaper) ;
	public List<Object[]> searchFirstSymptomsPaper(String cod_symindpaper) ;
}
