package managedBeans.aluno.glossario;

/**
 * @author Jesus
 *
 */

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import model.Curso;
import model.EstudoCaso;
import model.Glossario;
import model.Usuario;
import fachada.Fachada;

@ManagedBean(name="glossarioPrincipalAluno")
@ViewScoped
public class GlossarioPrincipalAlunoBean {

	private static Fachada fachada;

	private List<Glossario> glossarioDisponivel;
	private Glossario glossario;
	private EstudoCaso estudoSelecionado;
	private List<EstudoCaso> listaEstudoCaso = new ArrayList<EstudoCaso>();

	private Usuario usuarioLogado;
	private Curso cursoSelecionado;

	public GlossarioPrincipalAlunoBean(){
		fachada = Fachada.getInstance();
	}

	public void carregarListaEstudo(Usuario u, Curso c){

		this.usuarioLogado = u;
		this.cursoSelecionado = c;

		setListaEstudoCaso(fachada.listarEstudosCasoPorUsuarioCurso(usuarioLogado, cursoSelecionado));
	}

	public void carregarGlossario(){

		if(this.estudoSelecionado != null){
			setGlossarioDisponivel(fachada.carregarListaGlossario(this.estudoSelecionado));
		}
	}

	/**
	 * @return the glossario
	 */
	public Glossario getGlossario() {

		if(this.glossario == null){
			this.glossario = new Glossario();
		}

		return glossario;
	}

	/**
	 * @return the glossarioDisponivel
	 */
	public List<Glossario> getGlossarioDisponivel() {
		return glossarioDisponivel;
	}

	public void inserirGlossario(){

		this.glossario.setUsuario(usuarioLogado);
		
		this.glossario.setEstudocaso(estudoSelecionado);

		fachada.salvarGlossario(this.glossario);

		this.carregarGlossario();
	}

	/**
	 * @param glossario the glossario to set
	 */
	public void setGlossario(Glossario glossario) {
		this.glossario = glossario;
	}

	/**
	 * @param glossarioDisponivel the glossarioDisponivel to set
	 */
	public void setGlossarioDisponivel(List<Glossario> glossarioDisponivel) {
		this.glossarioDisponivel = glossarioDisponivel;
	}

	/**
	 * @return the estudoSelecionado
	 */
	public EstudoCaso getEstudoSelecionado() {
		return estudoSelecionado;
	}

	/**
	 * @param estudoSelecionado the estudoSelecionado to set
	 */
	public void setEstudoSelecionado(EstudoCaso estudoSelecionado) {
		this.estudoSelecionado = estudoSelecionado;
	}

	/**
	 * @return the listaEstudoCaso
	 */
	public List<EstudoCaso> getListaEstudoCaso() {
		return listaEstudoCaso;
	}

	/**
	 * @param listaEstudoCaso the listaEstudoCaso to set
	 */
	public void setListaEstudoCaso(List<EstudoCaso> listaEstudoCaso) {
		this.listaEstudoCaso = listaEstudoCaso;
	}

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
}
