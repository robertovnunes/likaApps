package managedBeans.admin;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import define.Define;
import fachada.Fachada;

/**
 * @author Jesus, Pedro e Onire
 *
 */
@ManagedBean(name="principalAdmin")
@SessionScoped
public class PrincipalAdminBean {

	Fachada fachada;
	private boolean mostrar = false;
	private String page = Define.URL_CONTEUDO_ADMIN_PRINCIPAL;

	public PrincipalAdminBean(){
		
		fachada = Fachada.getInstance();
	}
	
	public void apagarConteudo() {
		setPage(Define.URL_CONTEUDO_ADMIN_PRINCIPAL);
		mostrar = false;
	}
	
	public String getPage() {
		return page;
	}
	
	public boolean isMostrar() {
		return mostrar;
	}

	public void mostrarCadastrarCipe(){
		setPage(Define.URL_CONTEUDO_ADMIN_LISTA_CADASTRAR_CIPE);
		this.mostrar = true;
	}

	public void mostrarLerFeedbacks(){
		setPage(Define.URL_CONTEUDO_ADMIN_LISTA_FEEDACKS);
		this.mostrar = true;
	}
	
	public void setMostrar(boolean mostrar) {
		this.mostrar = mostrar;
	}

	public void setPage(String page) {
		this.page = page;
	}
}
