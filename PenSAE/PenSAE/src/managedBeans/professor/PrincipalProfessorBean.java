package managedBeans.professor;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.event.ActionEvent;
import javax.faces.event.ComponentSystemEvent;

import model.Curso;
import model.Professor;
import model.Usuario;
import define.Define;
import fachada.Fachada;
/**
 * @author Jesus
 *
 */
@ManagedBean(name="principalProfessor")
@SessionScoped
public class PrincipalProfessorBean {

	private static Fachada fachada;

	private Curso cursoSelecionado;
	private boolean mostrar = true;
	private boolean mostrarFuncionalidades = false;
	private String page = Define.URL_CONTEUDO_PROFESSOR_LISTA_CURSOS;
	private String pageCriarEditarEstudo = Define.URL_CONTEUDO_PROFESSOR_CRIAR_EDITAR_ESTUDOS;

	private Professor professor;
	private Usuario usuarioLogado;
	public PrincipalProfessorBean(){

		fachada = Fachada.getInstance();
	}

	public void apagarConteudo() {
		page = "";
		mostrar = false;
	}

	public void apagarConteudo(ActionEvent e) {  
		this.apagarConteudo();
	}

	public void carregarProfessor(ComponentSystemEvent e){

		if(this.usuarioLogado != null){
			this.professor = fachada.getProfessorPorUsuario(this.usuarioLogado);
		}

	}

	public Curso getCursoSelecionado() {
		return cursoSelecionado;
	}

	public String getPage() {  
		return page;  
	}

	/**
	 * @return the pageCriarEditarEstudo
	 */
	public String getPageCriarEditarEstudo() {
		return pageCriarEditarEstudo;
	}  

	/**
	 * @return the professor
	 */
	public Professor getProfessor() {
		return professor;
	}  

	/**
	 * @param professor the curso to set
	 */
	public void getProfessor(Professor professor) {
		this.professor = professor;
	}

	/**
	 * @return the usuarioLogado
	 */
	public Usuario getUsuarioLogado() {
		return usuarioLogado;
	}

	public boolean isButtonSelecionarDisabled(Curso curso){
		return (cursoSelecionado != null && curso.getId() == cursoSelecionado.getId());
	}

	/**
	 * @return the mostrar
	 */
	public boolean isMostrar() {
		return mostrar;
	}
	
	public boolean isMostrarFuncionalidades() {
		return mostrarFuncionalidades;
	}
	
	public void mostrarAcompanhamentoEstudante(ActionEvent e) {  
		setPage(Define.URL_CONTEUDO_PROFESSOR_ACOMPANHAMENTO_ESTUDANTE);
		mostrar = true;
	}

	public void mostrarAcompanhamentoEstudoCaso(ActionEvent e) {  
		setPage(Define.URL_CONTEUDO_PROFESSOR_ACOMPANHAMENTO_ESTUDO_CASO);
		mostrar = true;
	}
	public void mostrarCriarEditarCurso(ActionEvent e) {  
		setPage(Define.URL_CONTEUDO_PROFESSOR_CRIAR_EDITAR_CURSOS);
		mostrar = true;
	}
	public void mostrarEditarCriarEstudo(ActionEvent e){
		setPage(Define.URL_CONTEUDO_PROFESSOR_CRIAR_EDITAR_ESTUDOS);
		mostrar = true;
	}
	
	public void mostrarGlossario(ActionEvent e) {  
		setPage(Define.URL_CONTEUDO_PROFESSOR_GLOSSARIO);
		mostrar = true;
	}

	public void mostrarListaCursos() {
		setPage(Define.URL_CONTEUDO_PROFESSOR_LISTA_CURSOS);
		mostrar = true;
	}

	public void mostrarListaCursos(ActionEvent e) {
		setPage(Define.URL_CONTEUDO_PROFESSOR_LISTA_CURSOS);
		mostrar = true;
	}

	public void mostrarListaCursos(boolean sucesso) {
		if(sucesso){
			setPage(Define.URL_CONTEUDO_PROFESSOR_LISTA_CURSOS);
			mostrar = true;
		}
	}

	public void mostrarListaEstudo() {  
		setPage(Define.URL_CONTEUDO_PROFESSOR_LISTA_ESTUDOS);
		mostrar = true;
	}
	
	public void mostrarListaEstudo(boolean controle) {
		
		//controle e um booleano retornado pelo metodo salvar do criarEditarEstudoBean 
		
		if(controle){
			setPage(Define.URL_CONTEUDO_PROFESSOR_LISTA_ESTUDOS);
			mostrar = true;
		}
	}

	public void resetarConteudo(ActionEvent e) {  
		mostrarListaCursos();
		setCursoSelecionado(null);
		setMostrarFuncionalidades(false);
	}

	public void setCursoSelecionado(Curso cursoSelecionado) {
		this.cursoSelecionado = cursoSelecionado;
		this.mostrarFuncionalidades = true;
	}

	/**
	 * @param mostrar the mostrar to set
	 */
	public void setMostrar(boolean mostrar) {
		this.mostrar = mostrar;
	}

	public void setMostrarFuncionalidades(boolean mostrarFuncionalidades) {
		this.mostrarFuncionalidades = mostrarFuncionalidades;
	}
	
	public void setPage(String page) {  
		this.page = page;  
	}

	/**
	 * @param pageCriarEditarEstudo the pageCriarEditarEstudo to set
	 */
	public void setPageCriarEditarEstudo(String pageCriarEditarEstudo) {
		this.pageCriarEditarEstudo = pageCriarEditarEstudo;
	}

	/**
	 * @param usuarioLogado the usuarioLogado to set
	 */
	public void setUsuarioLogado(Usuario usuarioLogado) {
		this.usuarioLogado = usuarioLogado;
	}

}
