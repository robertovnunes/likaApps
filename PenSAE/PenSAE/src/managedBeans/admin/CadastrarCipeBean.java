package managedBeans.admin;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import model.Cipe;
import define.Define;
import fachada.Fachada;

@ManagedBean(name="cadastrarCipe")
@ViewScoped
public class CadastrarCipeBean {
	
	private Cipe cipe;
	private Fachada fachada;
	private List<Cipe> listaCipe = new ArrayList<Cipe>();
	private int paginaAtual = Define.PAGINA_INICIAL;
	private int tamanhoPagina = Define.TAMANHO_PAGINA_DEFAULT;
	private int numeroTotalPaginas;
	
	public CadastrarCipeBean(){
		fachada = Fachada.getInstance();
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void carregarListaCipe(){
		List lista = fachada.listarCipe(paginaAtual, tamanhoPagina);
		numeroTotalPaginas = (int)lista.get(0);
		lista.remove(0);
		this.listaCipe = lista;
	}
	
	public boolean desabilitarAnterior(){
		boolean retorno =(this.paginaAtual <= 0);
		
		return retorno;
	}
	
	public boolean desabilitarSeguinte(){
		boolean retorno = (this.paginaAtual >= this.numeroTotalPaginas-1);
		
		return retorno;
	}
	
	public Cipe getCipe() {
		if(cipe == null){
			cipe = new Cipe();
		}
		
		return cipe;
	}
	
	public List<Cipe> getListaCipe() {
		return listaCipe;
	}
	
	/**
	 * @return the numeroTotalPaginas
	 */
	public int getNumeroTotalPaginas() {
		return numeroTotalPaginas;
	}
	
	/**
	 * @return the paginaAtual
	 */
	public int getPaginaAtual() {
		return (paginaAtual+1);
	}

	/**
	 * @return the tamanhoPagina
	 */
	public int getTamanhoPagina() {
		return tamanhoPagina;
	}



	public void inserirCipe(){
		fachada.salvarCipe(cipe);
		carregarListaCipe();
		cipe = new Cipe();
	}

	public void paginaAnterior(){
		if(this.paginaAtual > Define.PAGINA_INICIAL){
			this.paginaAtual -= 1;
			carregarListaCipe();
		}
	}

	public void paginaSeguinte(){
		
		if(this.paginaAtual < this.numeroTotalPaginas-1){
			this.paginaAtual += 1;
			carregarListaCipe();
		}
		
	}

	public void setCipe(Cipe cipe) {
		this.cipe = cipe;
	}

	public void setListaCipe(List<Cipe> listaCipe) {
		this.listaCipe = listaCipe;
	}

	/**
	 * @param numeroTotalPaginas the numeroTotalPaginas to set
	 */
	public void setNumeroTotalPaginas(int numeroTotalPaginas) {
		this.numeroTotalPaginas = numeroTotalPaginas;
	}

	/**
	 * @param paginaAtual the paginaAtual to set
	 */
	public void setPaginaAtual(int pagina) {
		this.paginaAtual = pagina;
	}

	/**
	 * @param tamanhoPagina the tamanhoPagina to set
	 */
	public void setTamanhoPagina(int tamanhoPagina) {
		this.tamanhoPagina = tamanhoPagina;
	}

}
