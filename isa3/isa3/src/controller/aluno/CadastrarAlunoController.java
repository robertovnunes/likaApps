package controller.aluno;

import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import org.primefaces.context.RequestContext;

import controller.WebServiceCep;
import fachada.Fachada;
import model.usuario.Aluno;
import model.usuario.Usuario;

@ManagedBean(name = "cadastrarAlunoController")
@SessionScoped
public class CadastrarAlunoController {

	public Aluno aluno;

	public Aluno getAluno() {
		return aluno;
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}
	
	public String adicionarAluno(){
		
		try{
			String login = aluno.getLogin();
			List<Usuario> usuarios = Fachada.getInstancia().getUsuariosPorConsulta("login", login);
			if(usuarios == null || usuarios.isEmpty()){
				Fachada.getInstancia().criarUsuarioAluno(aluno);
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Info", "Aluno cadastrado com sucesso!"));
				RequestContext.getCurrentInstance().execute("window.scrollTo(0,0);");
			}else{
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Info", "Login informado já está cadastrado no sistema!"));
			}
			
		}catch(Exception ex){
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Info", "Algo de errado ocorreu. Tente novamente mais tarde!"));
		}
		
		return "cadastrarAluno";
	}
	
	public String prepararAdicionarAluno(){
		try {
			setAluno(new Aluno());
			FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/public/cadastrar_aluno.xhtml");
		} catch (Exception e) {
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Info", "Algo de errado ocorreu. Tente novamente mais tarde!"));
		}
		return "cadastrarAluno";
	}

	public String prepararAlterarAluno(){
		
		try{
			HttpSession sessao = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
    		Aluno alunoTemp = (Aluno) sessao.getAttribute("usuarioLogado");
			setAluno(alunoTemp);
			FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/public/cadastrar_aluno.xhtml");
		}catch(Exception ex){
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Info", "Algo de errado ocorreu. Tente novamente mais tarde!"));
		}
		
		return "cadastrarAluno";
	}
	
	public String buscarCep(){
		
		try{
			String cep = aluno.getEndereco().getCep();
			if(cep != null && !cep.equals("")){
				cep = cep.replace(".", "");
				cep = cep.replace("-", "");
				WebServiceCep webServiceCep = WebServiceCep.searchCep(cep);
				aluno.getEndereco().setBairro(webServiceCep.getBairro());
				aluno.getEndereco().setEstado(webServiceCep.getUf());
				aluno.getEndereco().setCidade(webServiceCep.getCidade());
				aluno.getEndereco().setDescricao(webServiceCep.getLogradouroFull());
			}
			
		}catch(Exception ex){
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Info", "Algo de errado ocorreu. Tente novamente mais tarde!"));
		}
		
		return "cadastrarAluno";
	}
	
	public String alterarAluno(){
		
		try{
			if(aluno != null && aluno.getId() != 0){
				Fachada.getInstancia().updateAluno(aluno);
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Info", "Aluno alterado com sucesso!"));
				RequestContext.getCurrentInstance().execute("window.scrollTo(0,0);");
			}
		}catch(Exception ex){
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Info", "Algo de errado ocorreu. Tente novamente mais tarde!"));
		}
		
		return "cadastrarAluno";
	}
	
	
}
