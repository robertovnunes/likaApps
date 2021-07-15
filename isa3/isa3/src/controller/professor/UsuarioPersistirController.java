package controller.professor;


import java.io.IOException;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import controller.WebServiceCep;
import fachada.Fachada;
import model.usuario.Administrador;
import model.usuario.Aluno;
import model.usuario.Professor;
import model.usuario.TipoUsuario;
import model.usuario.Usuario;

@ManagedBean(name = "usuarioPersistirController")
@SessionScoped
public class UsuarioPersistirController {

    private Usuario usuario;
    
    public UsuarioPersistirController(){
    	usuario = new Usuario();
    }

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public String prepararAdicionarUsuario(){
		usuario = new Usuario();
		try {
			FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/professor/usuario_persistir.xhtml");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "usuarioPersistir";
	}
	
	public String buscarCep(){
		
		try{
			String cep = usuario.getEndereco().getCep();
			if(cep != null && !cep.equals("")){
				cep = cep.replace(".", "");
				cep = cep.replace("-", "");
				WebServiceCep webServiceCep = WebServiceCep.searchCep(cep);
				usuario.getEndereco().setBairro(webServiceCep.getBairro());
				usuario.getEndereco().setEstado(webServiceCep.getUf());
				usuario.getEndereco().setCidade(webServiceCep.getCidade());
				usuario.getEndereco().setDescricao(webServiceCep.getLogradouroFull());
			}
			
		}catch(Exception ex){
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Info", "Algo de errado ocorreu. Tente novamente mais tarde!"));
		}
		
		return "cadastrarAluno";
	}

	public String prepararAlterarUsuario(Usuario usuario){
		if(usuario instanceof Aluno){
			usuario.setTipoUsuario(TipoUsuario.ALUNO);
		}else if(usuario instanceof Administrador){
			usuario.setTipoUsuario(TipoUsuario.ADMINISTRADOR);
		}else if(usuario instanceof Professor){
			usuario.setTipoUsuario(TipoUsuario.PROFESSOR);
		}
		this.usuario = usuario;
		return "usuarioPersistir";
	}
	
	public String alterarUsuario() {
		if(usuario != null){
			try {
				Fachada.getInstancia().updateUsuario(usuario);
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Info", "Usuário Alterado com sucesso!"));
				FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/professor/usuario_visualizar.xhtml");
			} catch (IOException e) {
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
			}
		}
		return "usuarioVisualiar";
	}
	
	public String adicionarUsuario() {
		if(usuario != null){
			try {
				List<Usuario> usuarios = Fachada.getInstancia().getUsuariosPorConsulta("login", usuario.getLogin());
				if(usuarios == null || usuarios.isEmpty()){
					if(usuario.getTipoUsuario() == TipoUsuario.ADMINISTRADOR){
						Administrador admin = new Administrador(usuario.getNome(),usuario.getCpf(), usuario.getEndereco(), usuario.getSenha(), usuario.getLogin(), usuario.getTelefone(), usuario.getSexo(), 0, usuario.getInstituicaoOrigem(), usuario.getEmail());
						Fachada.getInstancia().criarUsuarioAdministrador(admin);
						setUsuario(admin);
					}else if(usuario.getTipoUsuario() == TipoUsuario.PROFESSOR){
						Professor prof = new Professor(usuario.getNome(),usuario.getCpf(), usuario.getEndereco(), usuario.getSenha(), usuario.getLogin(), usuario.getTelefone(), usuario.getSexo(), 0, usuario.getInstituicaoOrigem(), usuario.getEmail());
						Fachada.getInstancia().criarUsuarioProfessor(prof);
						setUsuario(prof);
					}else if(usuario.getTipoUsuario() == TipoUsuario.ALUNO){
						Aluno aluno = new Aluno(usuario.getNome(),usuario.getCpf(), usuario.getEndereco(), usuario.getSenha(), usuario.getLogin(), usuario.getTelefone(), usuario.getSexo(), 0, usuario.getInstituicaoOrigem(), usuario.getEmail());
						Fachada.getInstancia().criarUsuarioAluno(aluno);
						setUsuario(aluno);
					}
					FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Usuário Inserido com sucesso!"));
					FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/professor/usuario_visualizar.xhtml");
				}else{
					FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Info", "Login informado já está cadastrado no sistema!"));
				}
				
			} catch (Exception e) {
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro ocorreu. Tente novamente mais tarde!"));
			}
			
		}
		return "usuarioVisualiar";
	}
	
}
