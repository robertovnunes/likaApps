package managedBeans.aluno.arco;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.event.ValueChangeEvent;

import model.AlunoEstudoCaso;
import model.Cipe;
import model.DiagnosticoAluno;
import model.IntervencaoAluno;
import model.MetaAluno;
import model.PontoChaveAluno;
import fachada.Fachada;

@ManagedBean(name = "planoCuidados")
@ViewScoped
public class PlanoCuidadosBean {

	private static Fachada fachada;

	private AlunoEstudoCaso alunoEstudoCaso;
	private String cipeDiagnostico;

	private String cipeIntervencao;
	/*
	 *  Estas duas variaveis foram criadas porque jsf estava dando 
	 *  problemas com a submissao do form
	 */
	private String descricaoDiagnostico;
	/*
	 * Campos para definição de diagnosticos
	 */
	private DiagnosticoAluno diagnostico = new DiagnosticoAluno();
	private List<Cipe> diagnosticosDisponiveis;
	private DiagnosticoAluno diagnosticoSelecionadoMeta;
	private List<DiagnosticoAluno> diagnosticosSelecionados;

	private boolean edicao = false;
	private boolean edicaoDiagnostico = false;
	private boolean edicaoMeta = false;
	/*
	 * Campos para definição de intervencoes
	 */
	private IntervencaoAluno intervencao = new IntervencaoAluno();

	private List<Cipe> intervencoesDisponiveis;
	private List<IntervencaoAluno> intervencoesSelecionadas;
	private MetaAluno meta;
	private MetaAluno metaSelecionadaIntervencao;
	/*
	 * Campos para definição de metas
	 */
	private List<MetaAluno> metasSelecionadas;

	private String metaString;
	private List<PontoChaveAluno> pontosChave;
	private PontoChaveAluno pontoSelecionado;

	public PlanoCuidadosBean() {
		fachada = Fachada.getInstance();
	}

	public void adicionarDiagnostico() {

		if (this.diagnosticosDisponiveis != null) {

			Iterator<Cipe> iterator = this.diagnosticosDisponiveis.iterator();
			boolean achou = false;

			while (iterator.hasNext() && !achou) {

				Cipe cipe = (Cipe) iterator.next();

				if (cipe.getTermo().equalsIgnoreCase(cipeDiagnostico)) {

					this.diagnostico.setCipe(cipe);
					achou = true;
				}
			}

			if (this.diagnosticosSelecionados == null) {

				this.diagnosticosSelecionados = new ArrayList<>();
			}

			diagnostico.setAlunoestudocaso(this.alunoEstudoCaso);
			diagnostico.setPontochavealuno(this.pontoSelecionado);

			fachada.salvarDiagnosticoAluno(diagnostico);

			this.diagnosticosSelecionados.add(diagnostico);
			this.diagnostico = new DiagnosticoAluno();
			this.cipeDiagnostico = "";
			this.edicaoDiagnostico = false;
		}
	}

	public void adicionarIntervencao(DiagnosticoAluno diagnostico,
			MetaAluno meta) {

		Set<MetaAluno> metas = diagnostico.getMetaalunos();

		Iterator<Cipe> iterator = this.intervencoesDisponiveis.iterator();

		boolean achou = false;

		while (iterator.hasNext() && !achou) {

			Cipe cipe = (Cipe) iterator.next();

			if (cipe.getTermo().equalsIgnoreCase(cipeIntervencao)) {

				this.intervencao.setCipe(cipe);
				achou = true;
			}
		}

		if (meta != null) {
			metas.remove(meta);
			this.meta = meta;
			Set<IntervencaoAluno> intervencoes = this.meta
					.getIntervencaoalunos();
			intervencoes.add(intervencao);
			metas.add(this.meta);
			this.diagnostico.setMetaalunos(metas);

			meta.setIntervencaoalunos(intervencoes);

		} else {
			Set<IntervencaoAluno> intervencoes = this.meta
					.getIntervencaoalunos();
			
			if(intervencoes == null){
				intervencoes = new HashSet<IntervencaoAluno>();
			}
			
			intervencoes.add(intervencao);
			this.meta.setIntervencaoalunos(intervencoes);
		}

		this.cipeIntervencao = "";
		this.intervencao = new IntervencaoAluno();
		this.diagnostico = diagnostico;

	}

	public void adicionarMeta() {

		int indice = this.diagnosticosSelecionados
				.lastIndexOf(this.diagnostico);

		Set<MetaAluno> metas = this.diagnostico.getMetaalunos();
		this.meta.setDescricao(this.metaString);
		metas.add(this.meta);
		this.diagnostico.setMetaalunos(metas);
		if (this.descricaoDiagnostico != null
				&& !this.descricaoDiagnostico.equalsIgnoreCase("")) {
			this.diagnostico.setDescricao(this.descricaoDiagnostico);
		}
		
		fachada.salvarDiagnosticoAluno(this.diagnostico);
		
		this.diagnosticosSelecionados.set(indice, diagnostico);

		this.diagnostico = null;
		this.metaString = "";
		this.meta = null;
		this.descricaoDiagnostico = "";
		this.edicaoMeta = false;
	}

	public void cancelarEditarDiagnostico() {

		if (this.diagnosticosSelecionados != null && edicaoDiagnostico) {

			this.diagnosticosSelecionados.add(this.diagnostico);
			this.edicaoDiagnostico = false;
			this.cipeDiagnostico = "";
		}
		this.diagnostico = null;
	}

	/*
	 * Codigo abaixo e para manipulacao dos diagnosticos do alunoEstudoCaso de
	 * caso
	 */

	public void cancelarEditarMeta() {

		if(this.edicaoMeta){
			Set<MetaAluno> metas = diagnostico.getMetaalunos();
			metas.add(this.meta);
			this.diagnostico.setMetaalunos(metas);

			int index = this.diagnosticosSelecionados.lastIndexOf(this.diagnostico);
			this.diagnostico.setDescricao(this.descricaoDiagnostico);
			this.diagnosticosSelecionados.set(index, this.diagnostico);

			this.descricaoDiagnostico = "";
		}

		this.diagnostico = null;
		this.meta = null;
		this.edicaoMeta = false;
	}

	public void carregarDiagnosticosInseridos() {

		this.diagnosticosSelecionados = fachada
				.listarDiagnosticoAlunoEstudoCaso(this.alunoEstudoCaso);
		this.pontosChave = fachada
				.listarPontoChaveAlunoPorAlunoEstudoCaso(this.alunoEstudoCaso);
	}

	public void editarDiagnostico(DiagnosticoAluno diagnostico) {

		this.diagnostico = diagnostico;
		this.cipeDiagnostico = this.diagnostico.getCipe().getTermo();

		if (this.diagnosticosSelecionados == null) {

			this.diagnosticosSelecionados = new ArrayList<>();
		}

		this.diagnosticosSelecionados.remove(diagnostico);
		this.edicaoDiagnostico = true;
		this.diagnosticosDisponiveis = new ArrayList<Cipe>();
		this.diagnosticosDisponiveis.add(this.diagnostico.getCipe());
	}

	public void editarIntervencao(DiagnosticoAluno diagnostico, MetaAluno meta,
			IntervencaoAluno intervencao) {

		this.intervencao = intervencao;
		this.cipeIntervencao = this.intervencao.getCipe().getTermo();

		if (this.intervencoesSelecionadas != null) {

			this.intervencoesSelecionadas.remove(intervencao);
		}
	}

	public void editarMeta(DiagnosticoAluno diagnostico, MetaAluno meta) {

		if (diagnostico.getMetaalunos().contains(meta)) {

			Set<MetaAluno> metas = diagnostico.getMetaalunos();
			metas.remove(meta);
			this.metaString = meta.getDescricao();
			diagnostico.setMetaalunos(metas);
			this.diagnostico = diagnostico;
			this.descricaoDiagnostico = this.diagnostico.getDescricao();
			this.meta = meta;
			this.edicaoMeta = true;
		}
	}

	public void excluirDiagnostico(DiagnosticoAluno diagnostico) {

		if (this.diagnosticosSelecionados != null) {

			fachada.excluirDiagnosticoAluno(diagnostico);

			this.diagnosticosSelecionados.remove(diagnostico);
		}
	}

	public void excluirIntervencao(DiagnosticoAluno diagnostico,
			MetaAluno meta, IntervencaoAluno intervencao) {

		int indiceDiagnostico = this.diagnosticosSelecionados
				.lastIndexOf(diagnostico);
		Set<MetaAluno> metas = diagnostico.getMetaalunos();
		Set<IntervencaoAluno> intervencoes;
		if (meta != null) {
			metas.remove(meta);
			intervencoes = meta.getIntervencaoalunos();
			if (intervencoes != null) {

				intervencoes.remove(intervencao);
			}
			meta.setIntervencaoalunos(intervencoes);
			metas.add(meta);

		} else {
			metas.remove(this.meta);
			intervencoes = this.meta.getIntervencaoalunos();
			if (intervencoes != null) {

				intervencoes.remove(intervencao);
			}
			this.meta.setIntervencaoalunos(intervencoes);
			metas.add(this.meta);
		}
		
		fachada.excluirIntervencaoAluno(intervencao);

		this.intervencao = new IntervencaoAluno();
		diagnostico.setMetaalunos(metas);
		this.diagnosticosSelecionados.set(indiceDiagnostico, diagnostico);
	}

	public void excluirMeta(DiagnosticoAluno diagnostico, MetaAluno meta) {

		if (diagnostico.getMetaalunos().contains(meta)) {

			Set<MetaAluno> metas = diagnostico.getMetaalunos();
			metas.remove(meta);
			diagnostico.setMetaalunos(metas);
			
			fachada.excluirMetaAluno(meta);
		}
	}

	public String getCipeDiagnostico() {
		return cipeDiagnostico;
	}

	public String getCipeIntervencao() {

		if (cipeIntervencao == null) {
			cipeIntervencao = "";
		}

		return cipeIntervencao;
	}

	public DiagnosticoAluno getDiagnostico() {

		if (this.diagnostico == null) {

			this.diagnostico = new DiagnosticoAluno();
		}

		return diagnostico;
	}

	public List<Cipe> getDiagnosticosDisponiveis() {

		this.diagnosticosDisponiveis = fachada.listarTodaCipeEixoDiagnostico();

		return diagnosticosDisponiveis;
	}
	
	public List<Cipe> getDiagnosticosDisponiveis(String entrada) {

		this.diagnosticosDisponiveis = fachada
				.listarCipeEixoDiagnosticoPorNome(entrada);

		return diagnosticosDisponiveis;
	}

	/*
	 * Codigo abaixo e para manipulacao das metas do alunoEstudoCaso de caso
	 */

	public DiagnosticoAluno getDiagnosticoSelecionadoMeta() {
		return diagnosticoSelecionadoMeta;
	}

	public List<DiagnosticoAluno> getDiagnosticosSelecionados() {
		return diagnosticosSelecionados;
	}

	public IntervencaoAluno getIntervencao() {

		if (this.intervencao == null) {

			this.intervencao = new IntervencaoAluno();
		}

		return intervencao;
	}

	public List<Cipe> getIntervencoesDisponiveis() {

		return intervencoesDisponiveis;
	}

	public List<Cipe> getIntervencoesDisponiveis(String parametro) {

		this.intervencoesDisponiveis = fachada
				.listarCipeEixoIntervencaoPorNome(parametro);

		return intervencoesDisponiveis;
	}

	public List<IntervencaoAluno> getIntervencoesSelecionadas() {

		return intervencoesSelecionadas;
	}

	public MetaAluno getMeta() {

		if (this.meta == null) {

			this.meta = new MetaAluno();
		}

		return meta;
	}

	public MetaAluno getMetaSelecionadaIntervencao() {
		return metaSelecionadaIntervencao;
	}

	public List<MetaAluno> getMetasSelecionadas() {
		return metasSelecionadas;
	}

	public String getMetaString() {
		return metaString;
	}

	public List<PontoChaveAluno> getPontosChave() {
		return pontosChave;
	}

	public PontoChaveAluno getPontoSelecionado() {
		return pontoSelecionado;
	}

	public boolean isEdicao() {
		return edicao;
	}

	public void limparCampos() {

		setDiagnosticosSelecionados(new ArrayList<DiagnosticoAluno>());

		setDiagnostico(new DiagnosticoAluno());
		setMeta(new MetaAluno());
		setIntervencao(new IntervencaoAluno());

		this.alunoEstudoCaso = null;
	}

	/*
	 * Codigo abaixo e para manipulacao das intervencoes do alunoEstudoCaso de
	 * caso
	 */

	public void prepararAdicionarMeta(DiagnosticoAluno diagnostico) {

		this.descricaoDiagnostico = diagnostico.getDescricao();
		this.diagnostico = diagnostico;
	}

	public void setAlunoEstudoCaso(AlunoEstudoCaso alunoEstudoCaso) {

		this.alunoEstudoCaso = alunoEstudoCaso;

		if (this.alunoEstudoCaso != null) {
			this.carregarDiagnosticosInseridos();
		}
	}

	public void setCipeDiagnostico(String cipeDiagnostico) {
		this.cipeDiagnostico = cipeDiagnostico;
	}

	public void setCipeIntervencao(String cipeIntervencao) {
		this.cipeIntervencao = cipeIntervencao;
	}

	public void setDiagnostico(DiagnosticoAluno diagnostico) {
		this.diagnostico = diagnostico;
	}

	public void setDiagnosticosDisponiveis(List<Cipe> diagnosticosDisponiveis) {
		this.diagnosticosDisponiveis = diagnosticosDisponiveis;
	}

	public void setDiagnosticoSelecionadoMeta(
			DiagnosticoAluno diagnosticoSelecionadoMeta) {
		this.diagnosticoSelecionadoMeta = diagnosticoSelecionadoMeta;
	}

	public void setDiagnosticoSelecionadoMeta(ValueChangeEvent e) {

		boolean achou = false;

		String descricao = (String) e.getNewValue();

		for (Iterator<DiagnosticoAluno> iterator = this.diagnosticosSelecionados
				.iterator(); (iterator.hasNext() && !achou);) {

			DiagnosticoAluno diagnostico = (DiagnosticoAluno) iterator.next();

			if (diagnostico.getDescricao().equalsIgnoreCase(descricao)) {

				this.diagnosticoSelecionadoMeta = diagnostico;
			}
		}
	}

	public void setDiagnosticosSelecionados(
			List<DiagnosticoAluno> diagnosticosSelecionados) {
		this.diagnosticosSelecionados = diagnosticosSelecionados;
	}

	public void setEdicao(boolean edicao) {
		this.edicao = edicao;
	}

	public void setIntervencao(IntervencaoAluno intervencao) {
		this.intervencao = intervencao;
	}

	public void setIntervencoesDisponiveis(List<Cipe> intervencoesDisponiveis) {
		this.intervencoesDisponiveis = intervencoesDisponiveis;
	}

	public void setIntervencoesSelecionadas(
			List<IntervencaoAluno> intervencoesSelecionadas) {
		this.intervencoesSelecionadas = intervencoesSelecionadas;
	}

	public void setMeta(MetaAluno metas) {
		this.meta = metas;
	}

	public void setMetaSelecionadaIntervencao(
			MetaAluno metaSelecionadaIntervencao) {
		this.metaSelecionadaIntervencao = metaSelecionadaIntervencao;
	}

	public void setMetasSelecionadas(List<MetaAluno> metasSelecionadas) {
		this.metasSelecionadas = metasSelecionadas;
	}

	public void setMetaString(String metaString) {
		this.metaString = metaString;
	}

	public void setPontosChave(List<PontoChaveAluno> pontosChave) {
		this.pontosChave = pontosChave;
	}

	public void setPontoSelecionado(PontoChaveAluno pontoSelecionado) {
		this.pontoSelecionado = pontoSelecionado;
	}
}