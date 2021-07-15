package hpdd.web;

import hpdd.excelreport.ExcelReportRN;
import hpdd.web.util.ContextoUtil;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

@ManagedBean(name = "excelReportBean")
@RequestScoped
public class ExcelReportBean {
	
	
	private Date dateFrom;
	private Date dateTo;
	private String country;
	private String gender;

	
	public void download(){
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		
		String hoje = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
		String fileName = "attachment; filename=\"excelReport_"+hoje+".xls\"";
		HttpServletResponse response = (HttpServletResponse) ContextoUtil.external.getResponse();
		response.reset(); // Some JSF component library or some Filter might have set some headers in the buffer beforehand. We want to get rid of them, else it may collide.
	    response.setContentType("application/vnd.ms-excel"); // Check http://www.iana.org/assignments/media-types for all types. Use if necessary ServletContext#getMimeType() for auto-detection based on filename.
	    response.setHeader("Content-disposition", fileName); // The Save As popup magic is done here. You can give it any filename you want, this only won't work in MSIE, it will use current request URL as filename instead.


	    try {
	    	
	    	 
	    	 ExcelReportRN excelRN = new ExcelReportRN();
	    	 
             List<Object[]> resultadoList = excelRN.listarResultado(this.dateFrom, this.dateTo, country, gender);

             HSSFWorkbook wb = new HSSFWorkbook();
             HSSFSheet sheet = wb.createSheet("Excel Sheet");
             HSSFRow rowhead = sheet.createRow((short) 0);
             
             
             rowhead.createCell((short) 0).setCellValue("ID");
             rowhead.createCell((short) 1).setCellValue("Notification Year");
             rowhead.createCell((short) 2).setCellValue("Gender");
             rowhead.createCell((short) 3).setCellValue("Age");
             rowhead.createCell((short) 4).setCellValue("Country");
             rowhead.createCell((short) 5).setCellValue("City of Residence");
             rowhead.createCell((short) 6).setCellValue("State");
             rowhead.createCell((short) 7).setCellValue("First Symptoms");
             rowhead.createCell((short) 8).setCellValue("Age at First Symptoms");
             rowhead.createCell((short) 9).setCellValue("Others Symptoms");
             rowhead.createCell((short) 10).setCellValue("Family history");
             rowhead.createCell((short) 11).setCellValue("Iatrogenic exposure");
             rowhead.createCell((short) 12).setCellValue("Diagnostic");
             rowhead.createCell((short) 13).setCellValue("EEG");
             rowhead.createCell((short) 14).setCellValue("MRT");
             rowhead.createCell((short) 15).setCellValue("MRI");
             rowhead.createCell((short) 16).setCellValue("14-3-3");
             rowhead.createCell((short) 17).setCellValue("Genetic");
             rowhead.createCell((short) 18).setCellValue("Mutation");
             rowhead.createCell((short) 19).setCellValue("Silent Mutation");
             rowhead.createCell((short) 20).setCellValue("Codon 129 (GÖ)");
             rowhead.createCell((short) 21).setCellValue("Codon 129 (M)");
             rowhead.createCell((short) 22).setCellValue("PrP-Type");
             rowhead.createCell((short) 23).setCellValue("Molecular Subtype");
             rowhead.createCell((short) 24).setCellValue("First Clinical Classification");
             rowhead.createCell((short) 25).setCellValue("Second Clinical Classification");
             rowhead.createCell((short) 26).setCellValue("Disease Duration");
             rowhead.createCell((short) 27).setCellValue("Deceased");
             rowhead.createCell((short) 28).setCellValue("Necropsy");
             
             /*
             rowhead.createCell((short) 29).setCellValue("result_genetic");
             rowhead.createCell((short) 30).setCellValue("result_immunohistochemistry");
             rowhead.createCell((short) 31).setCellValue("result_necropsy");
             rowhead.createCell((short) 32).setCellValue("subtype_codon");
             rowhead.createCell((short) 33).setCellValue("tau_protein");
             rowhead.createCell((short) 34).setCellValue("cod_respap");
             rowhead.createCell((short) 35).setCellValue("others");
             rowhead.createCell((short) 36).setCellValue("id");
             rowhead.createCell((short) 37).setCellValue("closure_date");
             rowhead.createCell((short) 38).setCellValue("criteria");
             rowhead.createCell((short) 39).setCellValue("death_date");
             rowhead.createCell((short) 40).setCellValue("evol_case");
             rowhead.createCell((short) 41).setCellValue("final_diag");
             rowhead.createCell((short) 42).setCellValue("cod_conpap");
             rowhead.createCell((short) 43).setCellValue("other");
            */
             int index = 1;
             for (Object[] object : resultadoList) {
				
                     HSSFRow row = sheet.createRow((short) index);
                     row.createCell((short) 0).setCellValue(""+object[0]);
                     row.createCell((short) 1).setCellValue(""+object[1]);
                     row.createCell((short) 2).setCellValue(""+object[2]);
                     row.createCell((short) 3).setCellValue(""+object[3]);
                     row.createCell((short) 4).setCellValue(""+object[4]);
                     row.createCell((short) 5).setCellValue(""+object[5]);
                     row.createCell((short) 6).setCellValue(""+object[6]);
                     row.createCell((short) 7).setCellValue(""+object[7]);
                     row.createCell((short) 8).setCellValue(""+object[8]);
                     row.createCell((short) 9).setCellValue(""+object[9]);
                     row.createCell((short) 10).setCellValue(""+object[10]);
                     row.createCell((short) 11).setCellValue(""+object[11]);
                     row.createCell((short) 12).setCellValue(""+object[12]);
                     row.createCell((short) 13).setCellValue(""+object[13]);
                     row.createCell((short) 14).setCellValue(""+object[14]);
                     row.createCell((short) 15).setCellValue(""+object[15]);
                     row.createCell((short) 16).setCellValue(""+object[16]);
                     row.createCell((short) 17).setCellValue(""+object[17]);
                     row.createCell((short) 18).setCellValue(""+object[18]);
                     row.createCell((short) 19).setCellValue(""+object[19]);
                     row.createCell((short) 20).setCellValue(""+object[20]);
                     row.createCell((short) 21).setCellValue(""+object[21]);
                     row.createCell((short) 22).setCellValue(""+object[22]);
                     row.createCell((short) 23).setCellValue(""+object[23]);
                     row.createCell((short) 24).setCellValue(""+object[24]);
                     row.createCell((short) 25).setCellValue(""+object[25]);
                     row.createCell((short) 26).setCellValue(""+object[26]);
                     row.createCell((short) 27).setCellValue(""+object[27]);
                     row.createCell((short) 28).setCellValue(""+object[28]);
                    /* row.createCell((short) 29).setCellValue(""+object[29]);
                     row.createCell((short) 30).setCellValue(""+object[30]);
                     row.createCell((short) 31).setCellValue(""+object[31]);
                     row.createCell((short) 32).setCellValue(""+object[32]);
                     row.createCell((short) 33).setCellValue(""+object[33]);
                     row.createCell((short) 34).setCellValue(""+object[34]);
                     row.createCell((short) 35).setCellValue(""+object[35]);
                     row.createCell((short) 36).setCellValue(""+object[36]);
                     row.createCell((short) 37).setCellValue(""+object[37]);
                     row.createCell((short) 38).setCellValue(""+object[38]);
                     row.createCell((short) 39).setCellValue(""+object[39]);
                     row.createCell((short) 40).setCellValue(""+object[40]);
                     row.createCell((short) 41).setCellValue(""+object[41]);
                     row.createCell((short) 42).setCellValue(""+object[42]);
                     row.createCell((short) 43).setCellValue(""+object[43]);
                     */
                     index++;
             }
             
             wb.write(response.getOutputStream());
             System.out.println("Data is saved in excel file.");
	    } catch (Exception e) {
			e.printStackTrace();
		} finally {
//	        close(output);
//	        close(input);
	    }

	    ContextoUtil.context.responseComplete(); 
	}


	public Date getDateFrom() {
		return dateFrom;
	}


	public void setDateFrom(Date dateFrom) {
		this.dateFrom = dateFrom;
	}


	public Date getDateTo() {
		return dateTo;
	}


	public void setDateTo(Date dateTo) {
		this.dateTo = dateTo;
	}


	public String getCountry() {
		return country;
	}


	public void setCountry(String country) {
		this.country = country;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}
	
}
