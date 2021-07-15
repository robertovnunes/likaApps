package managedBeans;

import java.beans.Beans;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ComponentSystemEvent;
import javax.faces.event.ValueChangeEvent;

import model.Curso;
import model.Usuario;
import define.Define;
import fachada.Fachada;

/**
 * @author Jesus
 *
 */
@ManagedBean(name="cadastro")
@SessionScoped
public class CadastroBean extends Beans {


	private static Fachada fachada;
	private List<Curso> cursos;
	private Curso cursoSelecionado;
	private List<Curso> cursosSelecionados;
	private boolean mostrar = true;
	private boolean professor = false;
	private String senhaNovamente;

	private Usuario usuario;



	public CadastroBean() {

		this.cursoSelecionado = new Curso();
		fachada = Fachada.getInstance();
	}



	public void adicionarCurso(){

		if(this.cursoSelecionado != null && !this.cursoSelecionado.getNome().equalsIgnoreCase("")){
			
			if(this.cursosSelecionados == null){
				
				this.cursosSelecionados = new ArrayList<Curso>();
			}
		
			if(!this.cursosSelecionados.contains(this.cursoSelecionado)){
				
				this.cursosSelecionados.add(this.cursoSelecionado);
				
				if(this.cursos.size() > 1){
					
					this.cursos.remove(this.cursoSelecionado);
					
					this.cursoSelecionado = this.cursos.iterator().next();
					
				}
			}
			
		}
	}

	public String cadastro(){
		
		String outcome = "";

		try{
			if((!this.usuario.getLogin().equalsIgnoreCase("") && !this.usuario.getNome().equalsIgnoreCase("") && 
					!this.usuario.getSenha().equalsIgnoreCase("") && !this.senhaNovamente.equalsIgnoreCase("") &&
					!this.usuario.getEmail().equalsIgnoreCase("") && !this.usuario.getInstituicao().equalsIgnoreCase("")) && 
					(!this.professor && this.cursosSelecionados != null && (this.cursosSelecionados.size() > 0)
					|| this.professor)){
				
				if(this.usuario.getSenha().equalsIgnoreCase(this.senhaNovamente)){
					
					outcome = fachada.salvarUsuario(this.usuario, this.cursosSelecionados);
					
				}else{
					outcome = Define.OUTCOME_CADASTRO_INFO_FALHA;
				}

				if(outcome == Define.OUTCOME_CADASTRO_INFO_FALHA){

					FacesContext.getCurrentInstance().addMessage("form_cadastro", new FacesMessage(FacesMessage.SEVERITY_WARN,"", Define.CADASTRO_MENSAGEM_ERRO_CADASTRO_LOGIN));

				}else if(outcome == Define.OUTCOME_CADASTRO_BD_FALHA){

					FacesContext.getCurrentInstance().addMessage("form_cadastro", new FacesMessage(FacesMessage.SEVERITY_WARN,"", Define.MENSAGEM_ERRO_FALHA_BD));
				}

			}else{

				FacesContext.getCurrentInstance().addMessage("form_cadastro", new FacesMessage(FacesMessage.SEVERITY_WARN,"", Define.CADASTRO_MENSAGEM_ERRO_CADASTRO_INCOMPLETO)); 
				outcome = Define.OUTCOME_CADASTRO_INFO_FALHA;
			}

		}catch(Exception ex){

			outcome = Define.OUTCOME_CADASTRO_BD_FALHA;

		}

		return outcome;
	}



	public void carregarCursos(ComponentSystemEvent event){

		try{

			this.setCursos(fachada.listarTodosCursos());

		}catch(Exception e){

			e.printStackTrace();
		}
	}

	public void excluirCurso(Curso cursoRecebido){

		this.cursosSelecionados.remove(cursoRecebido);
		this.cursos.add(cursoRecebido);
	}



	/**
	 * @return the cursos
	 */
	public List<Curso> getCursos() {
		return cursos;
	}
	
	/**
	 * @return the cursoSelecionado
	 */
	public Curso getCursoSelecionado() {
		
		if(cursoSelecionado == null){
			cursoSelecionado = new Curso();
		}
		
		return cursoSelecionado;
	}
	
	public List<Curso> getCursosSelecionados() {
		return cursosSelecionados;
	}


	public boolean getProfessor() {
		return professor;
	}



	public String getSenhaNovamente() {
		return senhaNovamente;
	}

	/**
	 * @return the usuario
	 */
	public Usuario getUsuario() {
		
		if(this.usuario == null){
			this.usuario = new Usuario();
		}
		
		return usuario;
	}

	/**
	 * @return the mostrar
	 */
	public boolean isMostrar() {
		return mostrar;
	}



	/**
	 * @param cursos the cursos to set
	 */
	public void setCursos(List<Curso> cursos) {
		this.cursos = cursos;
	}
	/**
	 * @param cursoSelecionado the cursoSelecionado to set
	 */
	public void setCursoSelecionado(Curso cursoSelecionado) {
		this.cursoSelecionado = cursoSelecionado;
	}



	/**
	 * @param e indicating the value change
	 */
	public void setCursoSelecionado(ValueChangeEvent e) {

		Iterator<Curso> iterador = this.cursos.iterator();
		boolean achou = false;

		Curso temp = null;
		int id = Integer.parseInt((String)e.getNewValue());

		while(iterador.hasNext() && !achou){

			temp = iterador.next();
			if(temp.getId()== id){
				achou = true;
			}
		}

		this.cursoSelecionado = temp;
	}



	public void setCursosSelecionados(List<Curso> cursosSelecionados) {
		this.cursosSelecionados = cursosSelecionados;
	}



	/**
	 * @param mostrar the mostrar to set
	 */
	public void setMostrar(boolean mostrar) {
		this.mostrar = mostrar;
	}



	public void setProfessor() {
		this.professor = !this.professor;

		this.mostrar = !this.professor;
	}
	
	public void setProfessor(boolean professor) {
		this.professor = professor;
		
		if(this.professor){
			this.usuario.setPerfil(Define.PERFIL_PROFESSOR);
		}else{
			this.usuario.setPerfil(Define.PERFIL_ALUNO);
		}

		this.mostrar = !professor;
	}
	
	public void setProfessor(ValueChangeEvent e) {
		this.professor = (boolean) e.getNewValue();

		this.mostrar = !professor;
	}



	public void setSenhaNovamente(String senhaNovamente) {
		this.senhaNovamente = senhaNovamente;
	}



	/**
	 * @param usuario the usuario to set
	 */
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
}
