package hpdd.web;

import hpdd.excelimport.ExcelImportRN;
import hpdd.web.util.ContextoUtil;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.primefaces.event.FileUploadEvent;


@ManagedBean(name = "excelImportBean")
@RequestScoped
public class ExcelImportBean {
	
	private String message;
	
	
	public void fileUpload(FileUploadEvent uploadEvent) {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
	    FacesContext context = FacesContext.getCurrentInstance(); 

	    InputStream file;
	    HSSFWorkbook workbook = null;
	    
	    try {
	    	file = uploadEvent.getFile().getInputstream();
	    	 workbook = new HSSFWorkbook(file);
	    } catch (Exception e) {
	    	context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error reading file" + e, null));
			e.printStackTrace();
		} 
	    
	    
	    try {
	    	HSSFSheet sheet = workbook.getSheetAt(0);
		    Iterator<Row> rowIterator = sheet.iterator();
		    ExcelImportRN excelRN = new ExcelImportRN();
		     Row rowZero = rowIterator.next();
		     
		     if(verificarCabecalho(rowZero) == false){
		    	 context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error reading file. ", "Verify all collumns before send."));
		     }else{
		    	 String linhasProblema = "";
		    	 
		    	 while (rowIterator.hasNext()) {
		    		 Row row = rowIterator.next();
		    		 
		    		 List<String> arrayValores = new ArrayList<String>();

		    		 Iterator<Cell> cellIterator = row.cellIterator();
		    		 
		    		 while (cellIterator.hasNext()) {
					     Cell cell = cellIterator.next();
					     switch (cell.getCellType()) {
					     case Cell.CELL_TYPE_NUMERIC:
					     
						     if (HSSFDateUtil.isCellDateFormatted(cell) || HSSFDateUtil.isCellInternalDateFormatted(cell)) {
						    	arrayValores.add(cell.getDateCellValue()+"");
						     } else {
						    	 arrayValores.add(cell.getNumericCellValue() + "");
						     }
						     break;
					     case Cell.CELL_TYPE_STRING:
					    	 arrayValores.add(cell.getStringCellValue() + "");
					    	 break;
					     case Cell.CELL_TYPE_BLANK:
					    	 arrayValores.add("");
					    	 break;
					     case Cell.CELL_TYPE_ERROR:
					    	 arrayValores.add("");
					    	 break;
					     default:
					    	 arrayValores.add("");
					    	 break;
					     }
			     
		    		 }
		    		 
		    		 try{
		    			 if(linhasProblema.equals("")){
		    				 if(arrayValores.size() == 29){
		    					 boolean inserirOk = excelRN.inserirCasoPaper(arrayValores, uploadEvent.getFile().getFileName(), contextoBean.getLoggedUser());
		    					 if(inserirOk == false){
		    						 linhasProblema += "["+(row.getRowNum()+1) + "] ";	 
		    					 }
		    				 }else{
		    					 linhasProblema += "["+(row.getRowNum()+1) + "] ";
		    				 }
		    			 }
		    		 }catch(Exception e){
		    			 linhasProblema += "["+(row.getRowNum()+1) + "] ";
		    		 }
		    		 
		    		 
		    	 }
		    	 
		    	 if(linhasProblema.equals("")){
		    		 context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "File imported" , "Ok"));
		    	 }else{
		    		 context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "File NOT imported" , "Some rows need to be adjusted: "+linhasProblema));
		    	 }
		     }
		     
	    }catch(Exception e){
	    	context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error reading file. ", "Verify all collumns and rows before send."));
			e.printStackTrace();
	    }
	     
	    
	}

	private boolean verificarCabecalho(Row rowZero) {
		boolean verificarCabecalho = false;
		
		if(rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(0).getStringCellValue().trim().toUpperCase().equals("ID")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(1).getStringCellValue().trim().toUpperCase().equals("NOTIFICATION YEAR")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(2).getStringCellValue().trim().toUpperCase().equals("GENDER")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(3).getStringCellValue().trim().toUpperCase().equals("AGE")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(4).getStringCellValue().trim().toUpperCase().equals("COUNTRY")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(5).getStringCellValue().trim().toUpperCase().equals("CITY OF RESIDENCE")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(6).getStringCellValue().trim().toUpperCase().equals("STATE")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(7).getStringCellValue().trim().toUpperCase().equals("FIRST SYMPTOMS")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(8).getStringCellValue().trim().toUpperCase().equals("AGE AT FIRST SYMPTOMS")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(9).getStringCellValue().trim().toUpperCase().equals("OTHERS SYMPTOMS")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(10).getStringCellValue().trim().toUpperCase().equals("FAMILY HISTORY")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(11).getStringCellValue().trim().toUpperCase().equals("IATROGENIC EXPOSURE")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(12).getStringCellValue().trim().toUpperCase().equals("DIAGNOSTIC")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(13).getStringCellValue().trim().toUpperCase().equals("EEG")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(14).getStringCellValue().trim().toUpperCase().equals("MRT")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(15).getStringCellValue().trim().toUpperCase().equals("MRI")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(16).getStringCellValue().trim().toUpperCase().equals("14-3-3")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(17).getStringCellValue().trim().toUpperCase().equals("GENETIC")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(18).getStringCellValue().trim().toUpperCase().equals("MUTATION")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(19).getStringCellValue().trim().toUpperCase().equals("SILENT MUTATION")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(20).getStringCellValue().trim().toUpperCase().equals("CODON 129 (GÖ)")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(21).getStringCellValue().trim().toUpperCase().equals("CODON 129 (M)")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(22).getStringCellValue().trim().toUpperCase().equals("PRP-TYPE")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(23).getStringCellValue().trim().toUpperCase().equals("MOLECULAR SUBTYPE")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(24).getStringCellValue().trim().toUpperCase().equals("FIRST CLINICAL CLASSIFICATION")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(25).getStringCellValue().trim().toUpperCase().equals("SECOND CLINICAL CLASSIFICATION")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(26).getStringCellValue().trim().toUpperCase().equals("DISEASE DURATION")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(27).getStringCellValue().trim().toUpperCase().equals("DECEASED")
				 && rowZero.getCell(0).getCellType() == Cell.CELL_TYPE_STRING && rowZero.getCell(28).getStringCellValue().trim().toUpperCase().equals("NECROPSY")){
			 verificarCabecalho = true;
		 }
		return verificarCabecalho;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	
	
}
