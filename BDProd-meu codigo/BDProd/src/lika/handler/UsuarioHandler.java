/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.handler;

import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;

import lika.handler.AlunoHandler.TipoPesquisa;
import lika.model.Pesquisador;
import lika.model.Usuario;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * 
 * @author Marcio
 */
@Component("usuarioHandler")
@Scope("session")
public class UsuarioHandler {

	private String parametroConsulta = "";

	private Usuario novoUsuario = new Usuario();

	private Usuario usr;

	private List<Usuario> usuarios = new ArrayList<Usuario>();

	private NavigationHandler navigation;

	public NavigationHandler getNavigation() {
		return navigation;
	}

	public void setNavigation(NavigationHandler navigation) {
		this.navigation = navigation;
	}

	public Usuario getNovoUsuario() {
		return novoUsuario;
	}

	public void setNovoUsuario(Usuario novoUsuario) {
		this.novoUsuario = novoUsuario;
	}

	public List<Usuario> getUsuarios() {
		return usuarios;
	}

	public void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios;
	}

	public String getParametroConsulta() {
		return parametroConsulta;
	}

	public void setParametroConsulta(String parametroConsulta) {
		this.parametroConsulta = parametroConsulta;
	}

	public Usuario getUsr() {
		return usr;
	}

	public void setUsr(Usuario usr) {
		this.usr = usr;
	}

	public void listarPorNome() {
		this.usuarios = DaoHandler.getInstance().getUsuarioDao().listar(
				parametroConsulta, "Login");
	}

	public void consultar() {
		try {
			this.usuarios.clear();

			this.listarPorNome();

		} catch (Exception e) {
			FacesContext fc = FacesContext.getCurrentInstance();
			fc
					.addMessage(null, new FacesMessage(
							FacesMessage.SEVERITY_ERROR,
							"ERRO: ao tentar listar os Usuários "
									+ e.getMessage(), ""));
		}
	}

	public void carregarUsuario(ActionEvent event) {
		Integer id = (Integer) event.getComponent().getAttributes().get(
				"idUsuario");

		Usuario p = new Usuario();
		p.setIdUsuario(id);

		this.novoUsuario = DaoHandler.getInstance().getUsuarioDao().carregar(p);

		System.out.println();

	}

	public void novoUsuario(ActionEvent event) {
		this.novoUsuario = new Usuario();

	}

	public String salvarUsuario() {
		FacesContext fc = FacesContext.getCurrentInstance();
		try {

			this.verificarConfirmacaoSenha(this.navigation.isAdmin());

			DaoHandler.getInstance().getUsuarioDao().salvar(this.novoUsuario);

			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,
					"Usuário " + this.novoUsuario.getLogin()
							+ " salvo com sucesso!", ""));
		} catch (Exception e) {
			e.printStackTrace();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar salvar o Usuário " + e.getMessage(), ""));

			return this.navigation.editarUsuario();
		}

		return this.navigation.visualizarUsuario();
	}

	public String cancelar() {
		if (this.novoUsuario.getIdUsuario() == null) {
			return "pesquisarUsuario";
		} else {
			return null;
		}
	}

	public String refresh() {
		if (this.novoUsuario.getIdUsuario() != null) {
			DaoHandler.getInstance().getUsuarioDao().refresh(this.novoUsuario);

			return this.navigation.visualizarUsuario();
		} else {
			return this.navigation.inicioUsuario();
		}
	}

	private void verificarConfirmacaoSenha(boolean administrador)
			throws Exception {
		if (administrador) {
			if (this.novoUsuario.getIdUsuario() != null) {
				String senhaAntiga = DaoHandler.getInstance().getUsuarioDao()
						.getSenhaUsuario(this.novoUsuario);
				if (!this.novoUsuario.getSenhaAntiga().equals(senhaAntiga)) {
					throw new Exception(
							"Senha atual não confere com a sua Senha antiga");
				}
			}
			if (!this.novoUsuario.getConfirmacaoSenha().equals(
					this.novoUsuario.getSenha())) {
				throw new Exception(
						"Senha atual não confere com a Confirmação da Senha");
			}

		}

	}

	public void selecionarPesquisador(ActionEvent event) {
		Pesquisador p = (Pesquisador) event.getComponent().getAttributes().get(
				"pesquisador");

		this.novoUsuario.setPessoa(p);
	}

	public String removerPesquisador() {
		this.novoUsuario.setPessoa(null);
		return null;
	}

	public String acao() {
		this.novoUsuario.setPessoa(null);
		System.out.println(this.novoUsuario.getPerfil());
		return "editarUsuario";
	}

	public void deletar(ActionEvent event) {
		FacesContext fc = FacesContext.getCurrentInstance();
		try {

			Usuario p = (Usuario) event.getComponent().getAttributes().get(
					"usuario");

			Usuario user = new Usuario();
			user.setIdUsuario(p.getIdUsuario());

			user = DaoHandler.getInstance().getUsuarioDao().carregar(user);

			DaoHandler.getInstance().getUsuarioDao().excluir(user);

			this.usuarios.remove(p);

			fc.addMessage(null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, "Usuário "
							+ user.getLogin() + " removido com sucesso!", ""));
		} catch (Exception e) {
			e.printStackTrace();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar remover o Usuário " + e.getMessage(), ""));
		}

	}

}
