package managedBeans.aluno.arco;

import java.io.IOException;
import java.io.OutputStream;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletResponse;

import model.Arquivo;
import model.EstudoCaso;
import model.Usuario;

import org.richfaces.event.FileUploadEvent;
import org.richfaces.model.UploadedFile;

import define.Define;
import fachada.Fachada;

/**
 * @author Jesus
 *
 */
@ManagedBean(name="teorizacaoEstudo")
@ViewScoped
public class TeorizacaoEstudoBean {

	private static Fachada fachada;
	
	private Arquivo arquivo;
	private EstudoCaso estudoCaso;
	private Usuario usuario;
	
	public TeorizacaoEstudoBean(){
		
		fachada = Fachada.getInstance();
	}
	
	public void downloadArquivo(){
			
			FacesContext context = FacesContext.getCurrentInstance();
			ExternalContext externalContext = context.getExternalContext();
			HttpServletResponse response = (HttpServletResponse) externalContext.getResponse();
			
			response.reset();
			
			String nomeArquivo = this.arquivo.getNomeArquivo();
			
			if(nomeArquivo.endsWith(".pdf")){
				response.setContentType("application/pdf");
			}else if(nomeArquivo.endsWith(".docx")){
				response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
			}else{
				response.setContentType("application/msword");
			}
			
			response.setHeader("Content-disposition", "attachment; filename=" + this.arquivo.getNomeArquivo());
			
			try {
				OutputStream output = response.getOutputStream();
				output.write(this.arquivo.getArquivo());
				output.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			context.responseComplete();
		}
	
	public String getLink(){
		String retorno = "";
		
		if(this.arquivo != null){
			retorno = "Clique aqui para baixar o arquivo de referências já inserido (" + this.arquivo.getNomeArquivo() + ")";
		}
		
		return retorno;
	}
	
	public void getReferencias(Usuario u, EstudoCaso ec){
		this.estudoCaso = ec;
		this.usuario = u;
		if(this.usuario != null && this.estudoCaso != null){
			arquivo = fachada.getArquivoUsuarioEstudoCaso(usuario, estudoCaso);
		}
	}

	public void salvarReferencias(){
		fachada.salvarReferencias(arquivo, usuario, estudoCaso);
	}
	
public void uploadListener(FileUploadEvent evento){

	UploadedFile temp = evento.getUploadedFile();

	if(this.arquivo == null){
		this.arquivo = new Arquivo();
	}

	this.arquivo.setArquivo(temp.getData());
	this.arquivo.setNomeArquivo(Arquivo.adaptaString(temp.getName()));
	this.arquivo.setTipoArquivo(Define.ARQUIVO_TIPO_REFERENCIAS_ESTUDO_CASO);
	this.salvarReferencias();
}
}
