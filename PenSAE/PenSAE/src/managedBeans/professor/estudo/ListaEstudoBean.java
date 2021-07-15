package managedBeans.professor.estudo;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import model.Curso;
import model.EstudoCaso;
import model.Usuario;
import fachada.Fachada;

/**
 * @author Jesus, Onirê
 *
 */
@ManagedBean(name="listaEstudo")
@ViewScoped
public class ListaEstudoBean {

	private static Fachada fachada;
	private List<EstudoCaso> estudos;
	private int grauDificuldade;
	private String habilitado;
	private byte[] imagem;
	private String objetivosGerais;
	private String periodo;
	private String tituloEstudo;
	private Usuario usuarioLogado;
	private Curso cursoSelecionado;

	/**
	 * @return the cursoSelecionado
	 */
	public Curso getCursoSelecionado() {
		return cursoSelecionado;
	}


	/**
	 * @param cursoSelecionado the cursoSelecionado to set
	 */
	public void setCursoSelecionado(Curso cursoSelecionado) {
		this.cursoSelecionado = cursoSelecionado;
	}


	public ListaEstudoBean(){

		fachada = Fachada.getInstance();
	}


	public void carregarEstudos(Usuario u, Curso c){  

		this.setUsuarioLogado(u);
		this.setCursoSelecionado(c);
		if(this.usuarioLogado != null && this.cursoSelecionado != null){
			this.estudos = fachada.listarEstudosCasoPorUsuarioCurso(this.usuarioLogado, cursoSelecionado);
		}
	}

	public void excluirCaso(EstudoCaso estudo){
		fachada.excluirEstudoCaso(estudo);
	}

	/*
	 * return estudos
	 */
	public List<EstudoCaso> getEstudos() {
		return estudos;
	}
	
	public int getGrauDificuldade() {
		return this.grauDificuldade;
	}

	public String getGrauDificuldadeString(int grauDificuldadeRecebido){
		String retorno = "";
		
		if(grauDificuldadeRecebido == 1){
			
			retorno = "Baixo";
			
		}else if(grauDificuldadeRecebido == 2){
			
			retorno = "Médio";
			
		}else{
			retorno = "Alto";
		}
		
		return retorno;
	}
	
	public String getHabilitado() {
		return habilitado;
	}

	public byte[] getImagem() {
		return imagem;
	}

	public String getObjetivosGerais() {
		return objetivosGerais;
	}

	public String getPeriodo() {
		return periodo;
	}

	/**
	 * @return the tituloCurso
	 */
	public String getTituloEstudo() {
		return tituloEstudo;
	}

	/**
	 * @return the usuarioLogado
	 */
	public Usuario getUsuarioLogado() {
		return usuarioLogado;
	}
	
	public String imgHabilitar(boolean bloqueado){
		if(bloqueado == false){
			return "/resources/icones/disable-icon.png";
		}else{
			return "/resources/icones/enable-icon.png"; 
		}
	}

	public void mudarHabilitar(EstudoCaso estudo){
		fachada.habilitarDesabilitarEstudoCaso(estudo);
	}

	public void setEstudos(List<EstudoCaso> estudos) {
		this.estudos = estudos;
	}

	public void setGrauDificuldade(int grauDificuldade) {
		this.grauDificuldade = grauDificuldade;
	}
	
	public void setHabilitado(String habilitado) {
		this.habilitado = habilitado;
	}

	public void setImagem(byte[] imagem) {
		this.imagem = imagem;
	}

	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}
	
	/**
	 * @param tituloEstudo the tituloEstudo to set
	 */
	public void setTituloCurso(String tituloEstudo) {
		this.tituloEstudo = tituloEstudo;
	}
	
	/**
	 * @param usuarioLogado the usuarioLogado to set
	 */
	public void setUsuarioLogado(Usuario usuarioLogado) {
		this.usuarioLogado = usuarioLogado;
	}
}