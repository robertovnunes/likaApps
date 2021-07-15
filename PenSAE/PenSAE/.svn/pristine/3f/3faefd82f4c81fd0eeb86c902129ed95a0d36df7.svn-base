/**
 * 
 */
package managedBeans.aluno.avaliacao;

import java.util.Iterator;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import model.AlunoEstudoCaso;
import model.Avaliacao;
import model.Usuario;
import define.Define;
import fachada.Fachada;

/**
 * @author Jesus e Onire
 *
 */
@ManagedBean(name="principalAvaliacao")
@ViewScoped
public class PrincipalAvaliacaoBean {

	public static final String[] fasesArcoMarguerez = {"Observação da Realidade","Teorização", 
		"Hipóteses de Solução"};
	private AlunoEstudoCaso alunoEstudoCasoAtual;
	private List<AlunoEstudoCaso> alunosEstudoCasos;
	private Avaliacao avaliacaoAtual; 
	
	private Fachada fachada;

	public PrincipalAvaliacaoBean() {

		fachada = Fachada.getInstance();

	}

	@SuppressWarnings("rawtypes")
	public void carregarAvaliacao(){
		for (Iterator iterator = alunoEstudoCasoAtual.getAvaliacaos().iterator(); iterator.hasNext();) {
			this.avaliacaoAtual = (Avaliacao) iterator.next();
		}
	}

	public String faseAtualEstudoCaso(int numero){
		String retorno = "";
		
		if(numero == Define.FASE_ARCO_OBSERVACAO){
			
			retorno = Define.STRING_FASE_ARCO_OBSERVACAO;
			
		}else if(numero == Define.FASE_ARCO_TEORIZACAO){
			
			retorno = Define.STRING_FASE_ARCO_TEORIZACAO;
			
		}else if(numero >= Define.FASE_ARCO_PLANO){
			
			retorno = Define.STRING_FASE_ARCO_HIPOTESES_SOLUCAO;
			
		}
		
		return retorno;
	}
	
	public AlunoEstudoCaso getAlunoEstudoCasoAtual() {
		return alunoEstudoCasoAtual;
	}
	
	public List<AlunoEstudoCaso> getAlunosEstudoCasos() {
		return alunosEstudoCasos;
	}
	
	public Avaliacao getAvaliacaoAtual() {
		return avaliacaoAtual;
	}
	
	public int getFaseObservacao(){
		return Define.FASE_ARCO_OBSERVACAO;
	}
	
	public int getFasePlano(){
		return Define.FASE_ARCO_PLANO;
	}
	
	public int getFaseTeorizacao(){
		return Define.FASE_ARCO_TEORIZACAO;
	}
	
	public String imgFinalizado(int numero, int faseAtual){
		if(numero > faseAtual){
			return "/resources/icones/disable-icon.png";
		}else if(numero == faseAtual){
			return "/resources/icones/study-icon.png";
		}else{
			return "/resources/icones/enable-icon.png"; 
		}
	}
	
	public void setAlunoEstudoCasoAtual(AlunoEstudoCaso alunoEstudoCasoAtual) {
		this.alunoEstudoCasoAtual = alunoEstudoCasoAtual;
		carregarAvaliacao();
	}
	
	public void setAlunosEstudoCasos(List<AlunoEstudoCaso> alunosEstudoCasos) {
		this.alunosEstudoCasos = alunosEstudoCasos;
	}

	public void setAlunosEstudoCasos(Usuario usuarioLogado) {

		this.alunosEstudoCasos = fachada.listarAlunoEstudoCaso(usuarioLogado);
	}

	public void setAvaliacaoAtual(Avaliacao avaliacaoAtual) {
		this.avaliacaoAtual = avaliacaoAtual;
	}

	public String statusAtualEstudoCaso(int numero){
		String retorno = Define.ESTUDO_CASO_STATUS_NAO_FINALIZADO;
		
		if(numero > Define.FASE_ARCO_PLANO){
			
			retorno = Define.ESTUDO_CASO_STATUS_FINALIZADO;
			
		}else if (numero < Define.FASE_ARCO_OBSERVACAO){
			
			retorno = Define.ESTUDO_CASO_STATUS_NAO_INICIADO;
		}
		
		return retorno;
	}

	public String StatusFase(int numero, int faseAtual){
		String retorno = "";
		
		if(numero < faseAtual){
			
			retorno = Define.STRING_STATUS_FASE_ESTUDO_CASO_STATUS_FINALIZADO;
			
		}else if(numero == faseAtual){
			
			retorno = Define.STRING_STATUS_FASE_ESTUDO_CASO_STATUS_EM_ANDAMENTO;
			
		}else if(numero > faseAtual){
			
			retorno = Define.STRING_STATUS_FASE_ESTUDO_CASO_STATUS_NAO_INICIADO;
			
		}
		
		return retorno;
	}

}
