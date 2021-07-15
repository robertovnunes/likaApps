package managedBeans.aluno.ambulatorio;

/**
 * @author Onire
 *
 */

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import model.Aluno;
import model.Ambulatorio;
import model.Curso;
import model.Usuario;
import fachada.Fachada;

@ManagedBean(name="ambulatorio")
@ViewScoped
public class AmbulatorioBean {
	private static Fachada fachada;

	private Ambulatorio ambulatorioAtual;
	private Curso cursoAtual;
	private List<String> equipamentosDisponiveis;
	private List<String> equipamentosSelecionados;
	private List<String> mobiliaDisponivel;
	private List<String> mobiliaSelecionada;
	private List<String> materialDisponivel;
	private List<String> materialSelecionado;
	private Usuario usuarioLogado;


	public AmbulatorioBean(){
		fachada = Fachada.getInstance();

		/**
		 * TODO: Me desculpe por esse codigo, mas infelizmente
		 * so encontrei isso quando meu tempo no projeto ja estava
		 * no fim. Voce pode colocar isso no Define ou no banco
		 * Boa sorte 
		 */
		
		mobiliaDisponivel = new ArrayList<String>();

		mobiliaDisponivel.add("Mesa e cadeira para o profissional");
		mobiliaDisponivel.add("Porta retrato");
		mobiliaDisponivel.add("Mesa clínica");
		mobiliaDisponivel.add("Armário para guardar os prontuários e receituários");
		mobiliaDisponivel.add("Computador e impressora");
		mobiliaDisponivel.add("Fogão");
		mobiliaDisponivel.add("Abajur");
		mobiliaDisponivel.add("Geladeira");
		mobiliaDisponivel.add("Televisão");
		mobiliaDisponivel.add("Aparelho de DVD/BLU-RAY");
		mobiliaDisponivel.add("Suporte para álcool gel/sabão líquido");
		mobiliaDisponivel.add("Lixeira para lixo comum");
		mobiliaDisponivel.add("Suporte para papel toalha");
		mobiliaDisponivel.add("Lixeira para lixo contaminado");

		equipamentosDisponiveis = new ArrayList<String>();

		equipamentosDisponiveis.add("Balança pediátrica");
		equipamentosDisponiveis.add("Régua antropométrica");
		equipamentosDisponiveis.add("Estetoscópio com duas peças torácicas (diafragma e campânula)");
		equipamentosDisponiveis.add("Esfigmomanômetro");
		equipamentosDisponiveis.add("Monitor cardíaco");
		equipamentosDisponiveis.add("Termômetro");
		equipamentosDisponiveis.add("Eletrocardiógrafo");
		equipamentosDisponiveis.add("Glicosímetro");
		equipamentosDisponiveis.add("Fita métrica");
		equipamentosDisponiveis.add("Lanterna");
		equipamentosDisponiveis.add("Otoscópio");
		equipamentosDisponiveis.add("Ventilador mecânico");

		materialDisponivel = new ArrayList<String>();

		materialDisponivel.add("Papel Toalha");
		materialDisponivel.add("Álcool 70%");
		materialDisponivel.add("Algodão");
		materialDisponivel.add("Papel ofício");
		materialDisponivel.add("Caneta");
		materialDisponivel.add("Lupa");
	}

	public void carregarAmbulatorio(Usuario u, Curso c){

		this.setUsuarioLogado(u);
		this.setCursoAtual(c);

		this.ambulatorioAtual = fachada.getAmbulatorioPorUsuarioCurso(this.usuarioLogado,this.cursoAtual);

		if(this.ambulatorioAtual != null){

			String mobilia = this.ambulatorioAtual.getMobilia();
			
			String auxiliar;

			StringTokenizer tokenizer = new StringTokenizer(mobilia, ";");

			auxiliar = "";
			mobiliaSelecionada = new ArrayList<String>();

			while(tokenizer.hasMoreTokens()){

				auxiliar = tokenizer.nextToken();

				if(mobiliaDisponivel.contains(auxiliar)){

					mobiliaSelecionada.add(mobiliaDisponivel.get(mobiliaDisponivel.lastIndexOf(auxiliar)));
				}

			}
			
			String equipamento = this.ambulatorioAtual.getEquipamento();

			tokenizer = new StringTokenizer(equipamento, ";");

			equipamentosSelecionados = new ArrayList<String>();

			while(tokenizer.hasMoreTokens()){

				auxiliar = tokenizer.nextToken();

				if(equipamentosDisponiveis.contains(auxiliar)){

					equipamentosSelecionados.add(equipamentosDisponiveis.get(equipamentosDisponiveis.lastIndexOf(auxiliar)));
				}
			}
			
			tokenizer = new StringTokenizer(equipamento, ";");

			materialSelecionado = new ArrayList<String>();

			while(tokenizer.hasMoreTokens()){

				auxiliar = tokenizer.nextToken();

				if(materialDisponivel.contains(auxiliar)){

					materialSelecionado.add(materialDisponivel.get(materialDisponivel.lastIndexOf(auxiliar)));
				}
			}
		}
	}

	public Ambulatorio getAmbulatorioAtual() {
		return ambulatorioAtual;
	}

	public Curso getCursoAtual() {
		return cursoAtual;
	}

	public List<String> getEquipamentosDisponiveis() {
		return equipamentosDisponiveis;
	}

	public List<String> getEquipamentosSelecionados() {
		return equipamentosSelecionados;
	}

	/**
	 * @return the materialDisponivel
	 */
	public List<String> getMaterialDisponivel() {
		return materialDisponivel;
	}

	/**
	 * @return the materialSelecionado
	 */
	public List<String> getMaterialSelecionado() {
		return materialSelecionado;
	}

	public List<String> getMobiliaDisponivel() {
		return mobiliaDisponivel;
	}

	public List<String> getMobiliaSelecionada() {
		return mobiliaSelecionada;
	}

	public Usuario getUsuarioLogado() {
		return usuarioLogado;
	}

	@SuppressWarnings("rawtypes")
	public void salvarAmbulatorio(){
		String mobilia = "";
		String equipamento = "";
		Aluno alunoAtual = new Aluno();
		for (Iterator iteratorMobilia = mobiliaSelecionada.iterator(); iteratorMobilia.hasNext();) {
			String mobiliaAuxiliar = (String) iteratorMobilia.next();
			mobilia += mobiliaAuxiliar + ";";
		}
		for (Iterator iteratorEquipamento = equipamentosSelecionados.iterator(); iteratorEquipamento.hasNext();) {
			String equipamentoAuxiliar = (String) iteratorEquipamento.next();
			equipamento += equipamentoAuxiliar + ";";
		}
		
		for (Iterator iteratorMaterial = materialSelecionado.iterator(); iteratorMaterial.hasNext();) {
			String equipamentoAuxiliar = (String) iteratorMaterial.next();
			equipamento += equipamentoAuxiliar + ";";
		}
		
		for (Iterator iterator = usuarioLogado.getAlunos().iterator(); iterator.hasNext();) {
			alunoAtual = (Aluno) iterator.next();
		}

		if(this.ambulatorioAtual == null){
			this.ambulatorioAtual = new Ambulatorio();
			this.ambulatorioAtual.setAluno(alunoAtual);
			this.ambulatorioAtual.setCurso(this.cursoAtual);
		}

		this.ambulatorioAtual.setEquipamento(equipamento);
		this.ambulatorioAtual.setMobilia(mobilia);

		fachada.salvarAmbulatorio(ambulatorioAtual);
	}

	public void setAmbulatorioAtual(Ambulatorio ambulatorioAtual) {
		this.ambulatorioAtual = ambulatorioAtual;
	}

	public void setCursoAtual(Curso cursoAtual) {
		this.cursoAtual = cursoAtual;
	}

	public void setEquipamentosDisponiveis(List<String> equipamentosDisponiveis) {
		this.equipamentosDisponiveis = equipamentosDisponiveis;
	}

	public void setEquipamentosSelecionados(List<String> equipamentosSelecionados) {
		this.equipamentosSelecionados = equipamentosSelecionados;
	}

	/**
	 * @param materialDisponivel the materialDisponivel to set
	 */
	public void setMaterialDisponivel(List<String> materialDisponivel) {
		this.materialDisponivel = materialDisponivel;
	}

	/**
	 * @param materialSelecionado the materialSelecionado to set
	 */
	public void setMaterialSelecionado(List<String> materialSelecionada) {
		this.materialSelecionado = materialSelecionada;
	}

	public void setMobiliaDisponivel(List<String> mobiliaDisponivel) {
		this.mobiliaDisponivel = mobiliaDisponivel;
	}

	public void setMobiliaSelecionada(List<String> mobiliaSelecionada) {
		this.mobiliaSelecionada = mobiliaSelecionada;
	}

	public void setUsuarioLogado(Usuario usuarioLogado) {
		this.usuarioLogado = usuarioLogado;
	}

}
