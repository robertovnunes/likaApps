package controller.professor;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;

import model.Nanda;
import model.curso.Curso;
import model.curso.EstudoDeCaso;
import model.sistema.Arquivo;

import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;

import fachada.Fachada;

@ManagedBean(name = "estudoDeCasoPersistirController")
@SessionScoped
public class EstudoDeCasoPersistirController {

    private EstudoDeCaso estudoDeCaso;
    private Curso curso;
    private UploadedFile file;
    private int tabIndex;
    private DataModel<Nanda> listaNandas;
    private Nanda nanda;
    
    public EstudoDeCasoPersistirController(){
    	estudoDeCaso = new EstudoDeCaso();
    	curso = new Curso();
    	nanda = new Nanda();
    }

    public DataModel<Nanda> getListarNandas() {
		List<Nanda> nandas = estudoDeCaso.getDiagnosticosSelecionadoProfessor();
        listaNandas = new ListDataModel<Nanda>(nandas);
        return listaNandas;
    }
    
    public void excluirNandaSelecionada(){
    	try{
    		Nanda nandaTemp = (Nanda)(listaNandas.getRowData());
    		estudoDeCaso.getDiagnosticosSelecionadoProfessor().remove(nandaTemp);
    		estudoDeCaso = Fachada.getInstancia().updateEstudoDeCaso(estudoDeCaso);
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Diagnóstico removido com sucesso!"));
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
    	}
    }
    
    public String adicionarDiagnosticoNanda(){
    	try{
    		List<Nanda> listaNandaTemp = Fachada.getInstancia().getNandaPorConsulta("termo", nanda.getTermo());
    		if(listaNandaTemp != null && listaNandaTemp.size() == 1){
    			nanda = listaNandaTemp.get(0);
    			estudoDeCaso.getDiagnosticosSelecionadoProfessor().add(nanda);
    			estudoDeCaso = Fachada.getInstancia().updateEstudoDeCaso(estudoDeCaso);
    	 		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Diagnóstico inserido com sucesso!"));
    		}
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
    	}
    	return "estudoDeCasoPersistir";
    }

	public EstudoDeCaso getEstudoDeCaso() {
		return estudoDeCaso;
	}

	public void setEstudoDeCaso(EstudoDeCaso estudoDeCaso) {
		this.estudoDeCaso = estudoDeCaso;
	}
	
	public List<Curso> completeText(String query) {
		List<Curso> lista = null;
		lista = Fachada.getInstancia().getTodosCursos();
        return lista;
    }
	
	public List<Nanda> completeTextNanda(String query) {
		List<Nanda> lista = null;
		lista = Fachada.getInstancia().getNandaPorTituloAutocomplete(query.toUpperCase().trim()+"%");
        return lista;
    }
	
	 public void handleFileUpload(FileUploadEvent event) {
	    	try{
	    		file = event.getFile();
	    		
	    		Arquivo arquivoTemp = new Arquivo();
	    		arquivoTemp.setDadosArqv(file.getContents());
	    		arquivoTemp.setExtensao(file.getContentType());
	    		arquivoTemp.setNomeArqv(file.getFileName());
	    		
	    		arquivoTemp = Fachada.getInstancia().inserirArquivo(arquivoTemp);
	    		if(estudoDeCaso != null && estudoDeCaso.getImagensAuxiliares() == null){
	    			estudoDeCaso.setImagensAuxiliares(new ArrayList<Arquivo>());
	    		}
	    		estudoDeCaso.getImagensAuxiliares().add(arquivoTemp);
	    		estudoDeCaso = Fachada.getInstancia().updateEstudoDeCaso(estudoDeCaso);
	    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Info", file.getFileName()+" upload do arquivo efetivado com sucesso!"));
	    	}catch(Exception ex){
	    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
	    	}
    }
	 
	 public void handleFileUploadImp(FileUploadEvent event) {
	    	try{
	    		file = event.getFile();
	    		
	    		Arquivo arquivoTemp = new Arquivo();
	    		arquivoTemp.setDadosArqv(file.getContents());
	    		arquivoTemp.setExtensao(file.getContentType());
	    		arquivoTemp.setNomeArqv(file.getFileName());
	    		
	    		arquivoTemp = Fachada.getInstancia().inserirArquivo(arquivoTemp);
	    		if(estudoDeCaso != null && estudoDeCaso.getImagensCaso() == null){
	    			estudoDeCaso.setImagensCaso(new ArrayList<Arquivo>());
	    		}
	    		estudoDeCaso.getImagensCaso().add(arquivoTemp);
	    		estudoDeCaso = Fachada.getInstancia().updateEstudoDeCaso(estudoDeCaso);
	    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Info", file.getFileName()+" upload do arquivo efetivado com sucesso!"));
	    	}catch(Exception ex){
	    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
	    	}
 }
	
	public String excluirArquivo(Arquivo arquivo){
		try {
			if(arquivo != null && arquivo.getId() != 0){
				estudoDeCaso.getImagensAuxiliares().remove(arquivo);
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Arquivo removido com sucesso!"));
				estudoDeCaso = Fachada.getInstancia().updateEstudoDeCaso(estudoDeCaso);
			}
		} catch (Exception e) {
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
		}
		return "estudoDeCasoPersistirController";
	}
	
	public String excluirArquivoImp(Arquivo arquivo){
		try {
			if(arquivo != null && arquivo.getId() != 0){
				estudoDeCaso.getImagensCaso().remove(arquivo);
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Arquivo removido com sucesso!"));
				estudoDeCaso = Fachada.getInstancia().updateEstudoDeCaso(estudoDeCaso);
			}
		} catch (Exception e) {
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
		}
		return "estudoDeCasoPersistirController";
	}
	
	
	public String prepararAdicionarEstudoDeCaso(){
		estudoDeCaso = new EstudoDeCaso();
    	curso = new Curso();
    	nanda = new Nanda();
    	setTabIndex(0);
		try {
			FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/professor/estudodecaso_persistir.xhtml");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "estudoDeCasoPersistir";
	}
	
	public String prepararAlterarEstudoDeCaso(EstudoDeCaso estudoDeCaso){
		try{
			this.estudoDeCaso = estudoDeCaso;
			nanda = new Nanda();
			this.curso = Fachada.getInstancia().getCursoDoEstudoDeCaso(estudoDeCaso);
			setTabIndex(2);
			FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/professor/estudodecaso_persistir.xhtml");
		}catch(Exception ex){
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
		}
		return "estudoDeCasoPersistir";
	}
	
	public String alterarEstudoDeCaso() {
		if(estudoDeCaso != null){
			try {
				String texto = estudoDeCaso.getDescricao();
				int indeceInicio = texto.indexOf("<a href=");
				
				while(indeceInicio != -1){
					int indiceFim = texto.indexOf(">", indeceInicio);
					
					String tagAncora = texto.substring(indeceInicio, indiceFim+1);
					String url = tagAncora.split("\"")[1];
					
					String textoNovo = texto.replace(tagAncora, "<a target=\"popup\" onclick=\"window.open('"+url+"','name','width=600,height=600')\">");
					estudoDeCaso.setDescricao(textoNovo);
					
					texto = estudoDeCaso.getDescricao();
					indeceInicio = texto.indexOf("<a href=");
				}
				
				Fachada.getInstancia().updateEstudoDeCaso(estudoDeCaso);
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Info", "Estudo de Caso  Alterado com sucesso!"));
			} catch (Exception e) {
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
			}
		}
		return "estudoDeCasoVisualiar";
	}
	
	public String adicionarEstudoDeCaso() {
		if(estudoDeCaso != null){
			try {
					estudoDeCaso = Fachada.getInstancia().cadastrarEstudoDeCaso(estudoDeCaso);
					String titulo = curso.getTitulo();
					titulo = titulo.replace("CR", "");
					String[] tituloList = titulo.split("-");
					String idCurso = tituloList[0];
					curso = Fachada.getInstancia().getCursoPorId(Integer.parseInt(idCurso));
					curso.getEstudosDeCaso().add(estudoDeCaso);
					curso = Fachada.getInstancia().updateCurso(curso);
					FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Estudo de Caso Inserido com sucesso!"));
					setTabIndex(1);
					FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/professor/estudodecaso_persistir.xhtml");
			} catch (Exception e) {
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
			}
			
		}
		return "estudoDeCasoVisualiar";
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

	public int getTabIndex() {
		return tabIndex;
	}

	public void setTabIndex(int tabIndex) {
		this.tabIndex = tabIndex;
	}

	public Nanda getNanda() {
		return nanda;
	}

	public void setNanda(Nanda nanda) {
		this.nanda = nanda;
	}
	
	public static void main(String[] args) {
		String texto = "Lorem ipsum dolor sia mente <a target=\"popup\" onclick=\"window.open('http://localhost:8083/isa/mostrarTelaHyperLink.do?method=mostrarTelaHyperLink&amp;idHyperLink=1','name','width=600,height=600')\"><u>comprimento de 49cm</u></a>, sendo o <a target=\"popup\" onclick=\"window.open('http://localhost:8083/isa/mostrarTelaHyperLink.do?method=mostrarTelaHyperLink&amp;idHyperLink=1','name','width=600,height=600')\"><u>índice de Apgar</u></a> 9/10. Mãe e filho receberam alta 24hs após o nascimento. &nbsp; A segunda gestação também transcorreu bem até o terceiro trimestre, quando tiveram início dores no Membro Inferior Esquerdo (MIE) e um prurido generalizado. A dor no MIE, após exame de ultrassom, foi tratada com risco de <a target=\"popup\" onclick=\"window.open('http://localhost:8083/isa/mostrarTelaHyperLink.do?method=mostrarTelaHyperLink&amp;idHyperLink=1','name','width=600,height=600')\"><u>trombose venosa profunda</u></a>, sendo prescrito anticoagulação por via subcutânea com heparina não fracionada. O prurido generalizado, após investigação, foi diagnóstico como colestase, a partir de exame laboratorial de enzimas <a href=\"http://www.iconesbr.net/iconesbr/2009/05/8325/8325_256x256.png\">hepáticas</a>";
		int a = texto.indexOf("<a href=");
		int b = texto.indexOf(">", a);
		System.out.println(a);
		System.out.println(b);
		String temp = texto.substring(a, b+1);
		String url = temp.split("\"")[1];
		
		System.out.println(temp);
		System.out.println(url);
		
		String textoNovo = texto.replace(temp, "<a target=\"popup\" onclick=\"window.open('"+url+"','name','width=600,height=600')\">");
		System.out.println(textoNovo);
	}
	
}
