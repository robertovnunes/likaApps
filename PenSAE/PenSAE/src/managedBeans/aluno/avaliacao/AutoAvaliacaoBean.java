package managedBeans.aluno.avaliacao;

import java.util.Date;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import model.Aluno;
import model.Curso;
import model.Feedback;
import model.Usuario;
import fachada.Fachada;

@ManagedBean (name="autoAvaliacao")
@ViewScoped
public class AutoAvaliacaoBean {
	private Curso cursoSelecionado;
	private Fachada fachada;
	private Feedback feedback;
	
	private String respostaPerguntaDois;
	private String respostaPerguntaUm;
	private Usuario usuarioLogado;
	
	public AutoAvaliacaoBean(){
		fachada = Fachada.getInstance();
	}
	
	public Curso getCursoSelecionado() {
		return cursoSelecionado;
	}
	public Feedback getFeedback() {
		return feedback;
	}
	
	public String getRespostaPerguntaDois() {
		return respostaPerguntaDois;
	}
	
	public String getRespostaPerguntaUm() {
		return respostaPerguntaUm;
	}
	public Usuario getUsuarioLogado() {
		return usuarioLogado;
	}
	public void salvarFeedback(Usuario usuarioRecebido, Curso cursoRecebido){
		
		if(this.usuarioLogado == null || this.cursoSelecionado == null){
			this.setUsuarioCurso(usuarioRecebido, cursoRecebido);
		}
		
		Aluno atual = this.usuarioLogado.getAlunos().iterator().next();
		
		if(this.feedback == null){
			feedback = new Feedback(atual,cursoSelecionado,respostaPerguntaUm,respostaPerguntaDois, new Date());
			
			
		}else{
			feedback.setRespostaUm(respostaPerguntaUm);
			feedback.setRespostaDois(respostaPerguntaDois);
		}
		fachada.salvarFeedback(feedback);
		this.feedback = fachada.getFeebackUsuarioCurso(usuarioRecebido, cursoRecebido);
	}
	public void setCursoSelecionado(Curso cursoSelecionado) {
		this.cursoSelecionado = cursoSelecionado;
	}

	public void setFeedback(Feedback feedback) {
		this.feedback = feedback;
	}

	public void setRespostaPerguntaDois(String respostaPerguntaDois) {
		this.respostaPerguntaDois = respostaPerguntaDois;
	}
	
	public void setRespostaPerguntaUm(String respostaPerguntaUm) {
		this.respostaPerguntaUm = respostaPerguntaUm;
	}

	public void setUsuarioCurso(Usuario usuarioLogado, Curso cursoRecebido) {
		
		this.usuarioLogado = usuarioLogado;
		this.cursoSelecionado = cursoRecebido;
		
		if(this.feedback == null){
			
			this.feedback = fachada.getFeebackUsuarioCurso(usuarioLogado, cursoSelecionado);
		}
		if(this.feedback != null){
			
			this.respostaPerguntaUm = this.feedback.getRespostaUm();
			this.respostaPerguntaDois = this.feedback.getRespostaDois();
		}
		
	}

	public void setUsuarioLogado(Usuario usuarioLogado, Curso cursoRecebido) {
		
		this.usuarioLogado = usuarioLogado;
		
	}

}
