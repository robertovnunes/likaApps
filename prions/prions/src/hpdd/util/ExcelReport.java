package hpdd.util;

import java.io.FileOutputStream;
import java.util.ArrayList;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;

public class ExcelReport {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		 try {
			 
			 SessionFactory sf = HibernateUtil.getSessionFactory();
			
			 SQLQuery q = sf.getCurrentSession().createSQLQuery("select * from doctor");
             ArrayList<Object[]> resultadoList = (ArrayList<Object[]>) q.list();

             HSSFWorkbook wb = new HSSFWorkbook();
             HSSFSheet sheet = wb.createSheet("Excel Sheet");
             HSSFRow rowhead = sheet.createRow((short) 0);
             
             rowhead.createCell((short) 0).setCellValue("ID");
             rowhead.createCell((short) 1).setCellValue("Name");
             rowhead.createCell((short) 2).setCellValue("Occupation");
             rowhead.createCell((short) 3).setCellValue("Institute");
             rowhead.createCell((short) 4).setCellValue("Document");

             int index = 1;
             for (Object[] object : resultadoList) {
				
                     HSSFRow row = sheet.createRow((short) index);
                     row.createCell((short) 0).setCellValue(""+object[0]);
                     row.createCell((short) 1).setCellValue(""+object[1]);
                     row.createCell((short) 2).setCellValue(""+object[2]);
                     row.createCell((short) 3).setCellValue(""+object[3]);
                     row.createCell((short) 4).setCellValue(""+object[4]);
                     index++;
             }
             FileOutputStream fileOut = new FileOutputStream("c:\\excelFile.xls");
             wb.write(fileOut);
             fileOut.close();
             System.out.println("Data is saved in excel file.");
     } catch (Exception e) {
     }
	}

}
