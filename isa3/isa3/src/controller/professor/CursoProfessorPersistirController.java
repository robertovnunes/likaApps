package controller.professor;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;

import fachada.Fachada;
import model.curso.Curso;
import model.sistema.Arquivo;
import model.usuario.Professor;

@ManagedBean(name = "cursoProfessorPersistirController")
@SessionScoped
public class CursoProfessorPersistirController {

    private Curso curso;
    private UploadedFile file;
    
    public CursoProfessorPersistirController(){
    	curso = new Curso();
    }
    
    public void handleFileUpload(FileUploadEvent event) {
    	try{
    		file = event.getFile();
    		
    		Arquivo arquivoTemp = new Arquivo();
    		arquivoTemp.setDadosArqv(file.getContents());
    		arquivoTemp.setExtensao(file.getContentType());
    		arquivoTemp.setNomeArqv(file.getFileName());
    		
    		arquivoTemp = Fachada.getInstancia().inserirArquivo(arquivoTemp);
    		if(curso != null && curso.getArquivos() == null){
    			curso.setArquivos(new ArrayList<Arquivo>());
    		}
    		curso.getArquivos().add(arquivoTemp);
    		
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Info", file.getFileName()+" upload do arquivo efetivado com sucesso!"));
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
    	}
    }
	
	
	public String prepararAdicionarCurso(){
		curso = new Curso();
		try {
			FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/professor/curso_persistir.xhtml");
		} catch (IOException e) {
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
		}
		return "cursoProfessorPersistirController";
	}
	
	public String prepararAlterarCurso(){
		try{
			FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/professor/curso_persistir.xhtml");
		}catch (Exception e) {
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
		}
		return "cursoProfessorPersistirController";
	}
	
	public String alterarCurso() {
		if(curso != null){
			try {
				List<Professor> listaTemp = Fachada.getInstancia().getProfessoresPorConsula("nome", curso.getProfessor().getNome());
				if(listaTemp != null && listaTemp.size() == 1){
					curso.setProfessor(listaTemp.get(0));
					Curso cursoTemp = Fachada.getInstancia().updateCurso(curso);
					setCurso(cursoTemp);
					FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Info", "Curso Alterado com sucesso!"));
					FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/professor/curso_visualizar.xhtml");
				}
			} catch (IOException e) {
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
			}
		}
		return "cursoProfessorVisualizarController";
	}
	
	public String adicionarCurso() {
		if(curso != null){
			try {
				List<Professor> listaTemp = Fachada.getInstancia().getProfessoresPorConsula("nome", curso.getProfessor().getNome());
				if(listaTemp != null && listaTemp.size() == 1){
					curso.setProfessor(listaTemp.get(0));
					Curso cursoTemp = Fachada.getInstancia().inserirCurso(curso);
					setCurso(cursoTemp);
					FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Curso Inserido com sucesso!"));
					FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/professor/curso_visualizar.xhtml");
				}
			} catch (Exception e) {
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
			}
			
		}
		return "cursoProfessorVisualizarController";
	}
	
	public String excluirArquivo(Arquivo arquivo){
		try {
			if(arquivo != null && arquivo.getId() != 0){
				curso.getArquivos().remove(arquivo);
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Arquivo removido com sucesso!"));
			}
		} catch (Exception e) {
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
		}
		return "cursoProfessorPersistirController";
	}
	
	public List<Professor> completeText(String query) {
		List<Professor> lista = null;
		lista = Fachada.getInstancia().getTodosProfessores();
        return lista;
    }

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	public UploadedFile getFile() {
		return file;
	}

	public void setFile(UploadedFile file) {
		this.file = file;
	}


}
