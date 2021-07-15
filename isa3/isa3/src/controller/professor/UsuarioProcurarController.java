package controller.professor;


import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;

import fachada.Fachada;
import model.usuario.Usuario;

@ManagedBean(name = "usuarioProcurarController")
@SessionScoped
public class UsuarioProcurarController {

    private Usuario Usuario;
    private DataModel<Usuario> listaUsuarios;

    public DataModel<Usuario> getListarUsuario() {
        List<Usuario> lista = Fachada.getInstancia().getTodosUsuarios();
        listaUsuarios = new ListDataModel<Usuario>(lista);
        return listaUsuarios;
    }

	public Usuario getUsuario() {
		return Usuario;
	}

	public void setUsuario(Usuario Usuario) {
		this.Usuario = Usuario;
	}

	 public void excluirUsuario(){
        try{
        	Usuario UsuarioTemp = (Usuario)(listaUsuarios.getRowData());
        	Fachada.getInstancia().removerUsuario(UsuarioTemp);
        	Fachada.getInstancia().atualizar();
        	FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Info", "Usuário Excluído com sucesso!"));
		}catch(Exception exception){
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, null, "O usuário selecionado não pode ser removido, pois está sendo utilizado por outra entidade!"));
		}
    }
	 
	
}
