package managedBeans.aluno.arco;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import model.AlunoEstudoCaso;
import model.EstudoCaso;
import model.Usuario;
import define.Define;
import fachada.Fachada;

/**
 * @author Jesus
 *
 */
@ManagedBean(name="arcoPrincipal")
@ViewScoped
public class arcoPrincipalBean {

	private AlunoEstudoCaso alunoEstudoCaso;
	private Fachada fachada;
	private int indiceTabSelecionada = 0;
	private String paginaObservacao = Define.URL_CONTEUDO_ALUNO_OBSERVACAO;
	private String paginaPlanoCuidados = Define.URL_CONTEUDO_ALUNO_PLANO_CUIDADOS;
	private String paginaTeorizacao = Define.URL_CONTEUDO_ALUNO_TEORIZACAO;

	private String selectedTab;

	private List<String> tabs = new ArrayList<String>();

	public arcoPrincipalBean() {

		this.fachada = Fachada.getInstance(); 

		tabs.add("observacao");
		tabs.add("teorizacao");
		tabs.add("plano");
		selectedTab = tabs.get(indiceTabSelecionada);

	}

	public boolean apagarConteudo() {  

		boolean retorno = true;

		this.indiceTabSelecionada = 0;
		this.selectedTab = tabs.get(indiceTabSelecionada);

		return retorno;
	}

	public boolean desabilitarFaseObservacao(){

		boolean retorno = this.alunoEstudoCaso.getFaseAtual() < Define.FASE_ARCO_OBSERVACAO;

		return retorno;
	}
	
	public boolean desabilitarFasePlano(){

		boolean retorno = this.alunoEstudoCaso.getFaseAtual() < Define.FASE_ARCO_PLANO;

		return retorno;
	}

	public boolean desabilitarFaseTeorizacao(){

		boolean retorno = this.alunoEstudoCaso.getFaseAtual() < Define.FASE_ARCO_TEORIZACAO;

		return retorno;
	}

	public boolean desabilitarFuncionalidadesFaseObservacao(){

		boolean retorno = this.alunoEstudoCaso.getFaseAtual() > Define.FASE_ARCO_OBSERVACAO;

		return retorno;
	}
	
	public boolean desabilitarFuncionalidadesFasePlano(){

		boolean retorno = this.alunoEstudoCaso.getFaseAtual() > Define.FASE_ARCO_PLANO;

		return retorno;
	}

	public boolean desabilitarFuncionalidadesFaseTeorizacao(){

		boolean retorno = this.alunoEstudoCaso.getFaseAtual() > Define.FASE_ARCO_TEORIZACAO;

		return retorno;
	}

	public void finalizarFaseAtual(){
		this.alunoEstudoCaso.setFaseAtual(this.alunoEstudoCaso.getFaseAtual()+1);
		this.alunoEstudoCaso = fachada.salvarAlunoEstudoCaso(this.alunoEstudoCaso);
	}

	public AlunoEstudoCaso getAlunoEstudoCaso() {
		return alunoEstudoCaso;
	}

	public String getPaginaObservacao() {
		return paginaObservacao;
	}

	/**
	 * @return the paginaPlanoCuidados
	 */
	public String getPaginaPlanoCuidados() {
		return paginaPlanoCuidados;
	}

	public String getPaginaTeorizacao() {
		return paginaTeorizacao;
	}

	public String getSelectedTab() {
		return selectedTab;
	}

	public boolean habilitarBotaoAvancar(){

		return !(this.indiceTabSelecionada < this.alunoEstudoCaso.getFaseAtual());
	}

	public boolean habilitarBotaoFinalizarFase(){

		return !(this.indiceTabSelecionada == this.alunoEstudoCaso.getFaseAtual());
	}

	public boolean habilitarBotaoVoltar(){

		return !(this.indiceTabSelecionada > this.alunoEstudoCaso.getFaseAtual());
	}

	//Se nao estiver na ultima tab entao ainda pode avancar
	public boolean isRenderedAvancar(){

		boolean retorno = indiceTabSelecionada < Define.FASE_ARCO_PLANO;

		return retorno;
	}

	//Se nao estiver na primeira tab entao ja pode voltar
	public boolean isRenderedVoltar(){

		boolean retorno = indiceTabSelecionada > Define.FASE_ARCO_OBSERVACAO;

		return retorno;
	}


	public void setAlunoEstudoCaso(AlunoEstudoCaso alunoEstudoCaso) {

		this.alunoEstudoCaso = alunoEstudoCaso;
	}

	public void setAlunoEstudoCaso(Usuario usuarioLogado, EstudoCaso estudoSelecionado) {

		this.alunoEstudoCaso = fachada.getAlunoEstudoCasoPorUsuarioEstudoCaso(usuarioLogado, estudoSelecionado);

		if(this.alunoEstudoCaso.getFaseAtual() <= Define.FASE_ARCO_PLANO){
			this.indiceTabSelecionada = this.alunoEstudoCaso.getFaseAtual();
			this.selectedTab = tabs.get(this.indiceTabSelecionada);
		}
	}

	public void setPaginaObservacao(String paginaObservacao) {
		this.paginaObservacao = paginaObservacao;
	}

	/**
	 * @param paginaPlanoCuidados the paginaPlanoCuidados to set
	 */
	public void setPaginaPlanoCuidados(String paginaPlanoCuidados) {
		this.paginaPlanoCuidados = paginaPlanoCuidados;
	}

	public void setPaginaTeorizacao(String paginaTeorizacao) {
		this.paginaTeorizacao = paginaTeorizacao;
	}

	public void setSelectedTab(String selectedTab) {
		this.selectedTab = selectedTab;

		this.indiceTabSelecionada = tabs.lastIndexOf(this.selectedTab);
	}

	public void tabAnterior(){

		if(indiceTabSelecionada > Define.FASE_ARCO_OBSERVACAO){

			indiceTabSelecionada -= 1;
		}

		setSelectedTab(tabs.get(indiceTabSelecionada));
	}

	public void tabProxima(){

		if(indiceTabSelecionada < Define.FASE_ARCO_PLANO){

			indiceTabSelecionada += 1;
		}

		setSelectedTab(tabs.get(indiceTabSelecionada));
	}
}
