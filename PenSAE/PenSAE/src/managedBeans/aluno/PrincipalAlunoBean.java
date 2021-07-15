package managedBeans.aluno;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.event.ActionEvent;

import model.Curso;
import model.EstudoCaso;
import model.Usuario;
import define.Define;
import fachada.Fachada;

/**
 * @author Jesus
 *
 */
@ManagedBean(name="principalAluno")
@SessionScoped
public class PrincipalAlunoBean {

	private static Fachada fachada;
	private Curso cursoSelecionado;
	private List<EstudoCaso> estudos;

	private EstudoCaso estudoSelecionado;
	private boolean mostrar = true;
	private boolean mostrarFuncionalidades = false;

	private String page = Define.URL_CONTEUDO_ALUNO_LISTA_CURSOS_ALUNO;
	private Usuario usuarioLogado;

	public PrincipalAlunoBean(){

		fachada = Fachada.getInstance();
	}

	public void apagarConteudo() {
		
		if(this.cursoSelecionado == null){
			
			this.mostrarListaCursosAluno();
			
		}else{
			this.mostrarInformacoesCurso();
		}
	}

	public void apagarConteudo(ActionEvent e) {

		this.apagarConteudo();
	}

	public void apagarConteudo(boolean funcionou) {

		if(funcionou){

			this.apagarConteudo();
		}
	}

	public Curso getCursoSelecionado() {
		return cursoSelecionado;
	}

	/**
	 * @return the estudos
	 */
	public List<EstudoCaso> getEstudos() {

		this.listarEstudosCaso();

		return estudos;
	}

	/**
	 * @return the estudoSelecionado
	 */
	public EstudoCaso getEstudoSelecionado() {
		return estudoSelecionado;
	}

	/**
	 * @return the page
	 */
	public String getPage() {
		return page;
	}

	public String getProfessorResponsavel(int cursoId){
		return fachada.getProfessorResponsavel(cursoId);		
	}

	/**
	 * @return the usuarioLogado
	 */
	public Usuario getUsuarioLogado() {
		return usuarioLogado;
	}

	/**
	 * @return the mostrar
	 */
	public boolean isMostrar() {
		return mostrar;
	}

	public boolean isMostrarFuncionalidades() {
		
		this.mostrarFuncionalidades = (this.cursoSelecionado != null);
		
		return mostrarFuncionalidades;
	}

	public List<EstudoCaso> listarEstudosCaso(){

		if(this.usuarioLogado != null && this.cursoSelecionado != null){

			this.estudos = fachada.listarEstudosCasoPorUsuarioCurso(this.usuarioLogado, this.cursoSelecionado);

		}
		return this.estudos;
	}
	
	public void mostrarAmbulatorio(){
		setPage(Define.URL_CONTEUDO_ALUNO_AMBULATORIO);
		mostrar = true;
	}
	
	public void mostrarAutoAvaliacao(){
		setPage(Define.URL_CONTEUDO_ALUNO_AVALIACAO);
		mostrar = true;
	}

	public void mostrarCasoEstudoArcoPrincipal(EstudoCaso ec) {

		this.setEstudoSelecionado(ec);

		setPage(Define.URL_CONTEUDO_ALUNO_ARCO_PRINCIPAL);
		mostrar = true;
	}

	public void mostrarCasoEstudoObservacao(ActionEvent e) {  
		setPage(Define.URL_CONTEUDO_ALUNO_OBSERVACAO);
		mostrar = true;
	}

	public void mostrarCasoEstudoTeorizacao(ActionEvent e) {  
		setPage(Define.URL_CONTEUDO_ALUNO_TEORIZACAO);
		mostrar = true;
	}

	public void mostrarGlossario(ActionEvent e) {  
		setPage(Define.URL_CONTEUDO_ALUNO_GLOSSARIO);
		mostrar = true;
	}
	
	public void mostrarInformacoesCurso() {  
		setPage(Define.URL_CONTEUDO_ALUNO_INFORMACOES_CURSO_ALUNO);
		mostrar = true;
	}

	public void mostrarListaCursosAluno() {  
		setPage(Define.URL_CONTEUDO_ALUNO_LISTA_CURSOS_ALUNO);
		mostrar = true;
	}

	public void mostrarListaCursosAluno(ActionEvent e) {  
		setPage(Define.URL_CONTEUDO_ALUNO_LISTA_CURSOS_ALUNO);
		mostrar = true;
	}

	public void mostrarPerfilAluno() {  
		setPage(Define.URL_CONTEUDO_ALUNO_MODIFICA_CADASTRO);
		mostrar = true;
	}

	public void mostrarPerfilAluno(ActionEvent e) {  
		setPage(Define.URL_CONTEUDO_ALUNO_MODIFICA_CADASTRO);
		mostrar = true;
	}
	
	public void mostrarPrincipalAvaliacao(ActionEvent e) {  
		setPage(Define.URL_CONTEUDO_ALUNO_PRINCIPAL_AVALIACAO);
		mostrar = true;
	}

	public void resetarConteudo(ActionEvent e) {  
		mostrarListaCursosAluno();
		this.cursoSelecionado = null;
		this.estudoSelecionado = null;
		this.estudos = null;
		this.usuarioLogado = null;
	}

	public void setCursoSelecionado(Curso cursoSelecionado) {
		this.cursoSelecionado = cursoSelecionado;
		
		this.listarEstudosCaso();
		
		this.mostrarInformacoesCurso();
	}

	/**
	 * @param estudos the estudos to set
	 */
	public void setEstudos(List<EstudoCaso> estudos) {
		this.estudos = estudos;
	}

	/**
	 * @param estudoSelecionado the estudoSelecionado to set
	 */
	public void setEstudoSelecionado(EstudoCaso estudoSelecionado) {
		this.estudoSelecionado = estudoSelecionado;
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

	/**
	 * @param page the page to set
	 */
	public void setPage(String page) {
		this.page = page;
	}

	/**
	 * @param usuarioLogado the usuarioLogado to set
	 */
	public void setUsuarioLogado(Usuario usuarioLogado) {
		this.usuarioLogado = usuarioLogado;
	}
}
