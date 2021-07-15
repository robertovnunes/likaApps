package managedBeans.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import model.Feedback;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

import fachada.Fachada;

@ManagedBean (name="lerFeedbacks")
@ViewScoped
public class LerFeedbacksBean {

	private File arquivoFeedbacks;
	private Fachada fachada;
	
	private List<Feedback> listaFeedbacks = new ArrayList<Feedback>();
	private HSSFSheet referencias;

	private HSSFWorkbook workbook;
	
	public LerFeedbacksBean(){
		this.fachada = Fachada.getInstance();
		this.workbook = new HSSFWorkbook();
		this.referencias = workbook.createSheet("teste");
	}
	
	public void carregarListaFeedback(){
		setListaFeedbacks(fachada.carregarListaFeedback());
		gerarArquivoReferencias();
	}

	public void downloadArquivoReferencia(){
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext externalContext = context.getExternalContext();
		HttpServletResponse response = (HttpServletResponse) externalContext.getResponse();

		response.reset();
		
		response.setHeader("Content-disposition", "attachment; filename=feedbacks.xls");
		
		try {
			
            ServletOutputStream out = response.getOutputStream(); 
            
            workbook.write(out);  
              
            out.flush();  
            out.close();  
            context.responseComplete();  
        } catch (IOException ex) {
            ex.printStackTrace();  
        }  

	}
	
	public void gerarArquivoReferencias(){
		
		int rowNum = 0;
		for (Iterator<Feedback> iterator = listaFeedbacks.iterator(); iterator.hasNext();) {
			Feedback typeFeedback = (Feedback) iterator.next();
			Row row = referencias.createRow(rowNum++);
			Cell cellNome = row.createCell(0);
			Cell cellRespostaUm = row.createCell(1);
			Cell cellRespostaDois = row.createCell(2);
			cellNome.setCellValue(typeFeedback.getAluno().getUsuario().getNome());
			cellRespostaUm.setCellValue(typeFeedback.getRespostaUm());
			cellRespostaDois.setCellValue(typeFeedback.getRespostaDois());
		}		
		
	}
	
	public File getArquivoFeedbacks(){
		return this.arquivoFeedbacks;
	}

	public List<Feedback> getListaFeedbacks() {
		return listaFeedbacks;
	}
	
	public void setArquivoFeedbacks(File arquivoFeedbacks){
		this.arquivoFeedbacks = arquivoFeedbacks;
	}
	
	public void setListaFeedbacks(List<Feedback> listaFeedbacks) {
		this.listaFeedbacks = listaFeedbacks;
	}
}
