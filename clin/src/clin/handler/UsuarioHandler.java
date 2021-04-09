package clin.handler;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;
import clin.dao.UsuarioDaoImpl;
import clin.model.Usuario;

public class UsuarioHandler {

	private Usuario usuario;

	private UsuarioDaoImpl usuarioDao;

	private boolean logado = false;
	
	private Integer idUsuario = 0;
	
	public UsuarioHandler() {
		this.usuario = new Usuario();
	}

	public boolean isLogado() {
		return logado;
	}

	public void setLogado(boolean logado) {
		this.logado = logado;
	}

	public UsuarioDaoImpl getUsuarioDao() {
		return usuarioDao;
	}

	public void setUsuarioDao(UsuarioDaoImpl usuarioDao) {
		this.usuarioDao = usuarioDao;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String sair() {

		FacesContext fc = FacesContext.getCurrentInstance();

		HttpSession session = (HttpSession) fc.getExternalContext().getSession(
				false);
		session.invalidate();
		return "sucesso";
	}

	public String login() {
		//this.usuario.setNome("MARCIOOOO");
		Usuario usr = usuarioDao.autenticarUsuario(usuario);
		if(usr != null && usr.getIdUsuario() != null){
			this.setUsuario(usr);
			this.setIdUsuario(this.usuario.getIdUsuario());
			System.out.println(this.usuario.getIdUsuario());
			this.logado = true;
			return "sucesso";
		}else{
			return "falha";
		
		}
		
		
		
	}

	public void setIdUsuario(Integer idUsuario) {
		this.idUsuario = idUsuario;
	}

	public Integer getIdUsuario() {
		return idUsuario;
	}

}
