package controller.professor;


import java.io.IOException;
import java.util.ArrayList;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import model.curso.matricula.arcomaguerez.HyperLink;
import model.sistema.Arquivo;

import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;

import fachada.Fachada;

@ManagedBean(name = "hyperLinkPersistirController")
@SessionScoped
public class HyperLinkPersistirController {

    private HyperLink hyperLink;
    private UploadedFile file;
    
    public HyperLinkPersistirController(){
    	hyperLink = new HyperLink();
    }

    public void handleFileUpload(FileUploadEvent event) {
    	try{
    		file = event.getFile();
    		
    		Arquivo arquivoTemp = new Arquivo();
    		arquivoTemp.setDadosArqv(file.getContents());
    		arquivoTemp.setExtensao(file.getContentType());
    		arquivoTemp.setNomeArqv(file.getFileName());
    		
    		arquivoTemp = Fachada.getInstancia().inserirArquivo(arquivoTemp);
    		if(hyperLink != null && hyperLink.getImagens() == null){
    			hyperLink.setImagens(new ArrayList<Arquivo>());
    		}
    		hyperLink.getImagens().add(arquivoTemp);
    		if(hyperLink.getId() != 0){
    			hyperLink = Fachada.getInstancia().updateHyperLink(hyperLink);
    		}
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "", file.getFileName()+" upload do arquivo efetivado com sucesso!"));
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
    	}
    }
    
    public String excluirArquivo(Arquivo arquivo){
		try {
			if(arquivo != null && arquivo.getId() != 0){
				hyperLink.getImagens().remove(arquivo);
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Arquivo removido com sucesso!"));
				hyperLink = Fachada.getInstancia().updateHyperLink(hyperLink);
			}
		} catch (Exception e) {
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
		}
		return "hyperLinkPersistir";
	}
    
    public void handleFileUploadDoc(FileUploadEvent event) {
    	try{
    		file = event.getFile();
    		
    		Arquivo arquivoTemp = new Arquivo();
    		arquivoTemp.setDadosArqv(file.getContents());
    		arquivoTemp.setExtensao(file.getContentType());
    		arquivoTemp.setNomeArqv(file.getFileName());
    		
    		arquivoTemp = Fachada.getInstancia().inserirArquivo(arquivoTemp);
    		if(hyperLink != null && hyperLink.getDocumentos() == null){
    			hyperLink.setDocumentos(new ArrayList<Arquivo>());
    		}
    		hyperLink.getDocumentos().add(arquivoTemp);
    		if(hyperLink.getId() != 0){
    			hyperLink = Fachada.getInstancia().updateHyperLink(hyperLink);
    		}
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "", file.getFileName()+" upload do arquivo efetivado com sucesso!"));
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
    	}
    }
    
    public String excluirArquivoDoc(Arquivo arquivo){
		try {
			if(arquivo != null && arquivo.getId() != 0){
				hyperLink.getDocumentos().remove(arquivo);
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Arquivo removido com sucesso!"));
				hyperLink = Fachada.getInstancia().updateHyperLink(hyperLink);
			}
		} catch (Exception e) {
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
		}
		return "hyperLinkPersistir";
	}
    
	public HyperLink getHyperLink() {
		return hyperLink;
	}

	public void setHyperLink(HyperLink hyperLink) {
		this.hyperLink = hyperLink;
	}
	
	public String prepararAdicionarHyperLink(){
		hyperLink = new HyperLink();
		try {
			FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/professor/hyperlink_persistir.xhtml");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "hyperLinkPersistir";
	}
	
	public String prepararAlterarHyperLink(HyperLink hyperLink){
		try {
			setHyperLink(hyperLink);
			FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/professor/hyperlink_persistir.xhtml");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "hyperLinkPersistir";
	}
	
	public String alterarHyperLink() {
		if(hyperLink != null){
			try {
				Fachada.getInstancia().updateHyperLink(hyperLink);
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Info", "HyperLink Alterado com sucesso!"));
				FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/professor/hyperlink_visualizar.xhtml");
			} catch (IOException e) {
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
			}
		}
		return "hyperLinkVisualiar";
	}
	
	public String adicionarHyperLink() {
		if(hyperLink != null){
			try {
				hyperLink = Fachada.getInstancia().inserirHyperLink(hyperLink);
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Usuário Inserido com sucesso!"));
				FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/professor/hyperlink_visualizar.xhtml");
			} catch (Exception e) {
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
			}
			
		}
		return "hyperLinkVisualiar";
	}
	
}
