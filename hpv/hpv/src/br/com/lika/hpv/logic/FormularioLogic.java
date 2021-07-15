package br.com.lika.hpv.logic;

import java.util.Date;
import java.util.List;

import org.vraptor.annotations.Component;
import org.vraptor.annotations.In;
import org.vraptor.annotations.InterceptedBy;
import org.vraptor.annotations.Out;
import org.vraptor.i18n.FixedMessage;
import org.vraptor.plugin.hibernate.Validate;
import org.vraptor.scope.ScopeType;
import org.vraptor.validator.ValidationErrors;

import br.com.lika.hpv.dao.DAOFactory;
import br.com.lika.hpv.interceptor.DAOInterceptor;
import br.com.lika.hpv.interceptor.PerfilDigitadorInterceptor;
import br.com.lika.hpv.model.formulario.Formulario;
import br.com.lika.hpv.model.formulario.HistoricoAlimentar;
import br.com.lika.hpv.model.formulario.HistoricoClinico;
import br.com.lika.hpv.model.formulario.HistoricoFamiliar;
import br.com.lika.hpv.model.formulario.HistoricoModificacoes;
import br.com.lika.hpv.model.formulario.HistoricoSexual;
import br.com.lika.hpv.model.formulario.InformacoesPessoais;
import br.com.lika.hpv.model.formulario.SituacaoSocioEconomicaDemografica;
import br.com.lika.hpv.model.formulario.Tabagismo;
import br.com.lika.hpv.model.formulario.util.Cancer;
import br.com.lika.hpv.model.formulario.util.Cirurgias;
import br.com.lika.hpv.model.formulario.util.Diabetes;
import br.com.lika.hpv.model.formulario.util.GrupoParticipante;
import br.com.lika.hpv.model.formulario.util.MalEstar;
import br.com.lika.hpv.model.formulario.util.MedicacaoMenorPausa;
import br.com.lika.hpv.model.formulario.util.MedicacaoUsoContinuo;
import br.com.lika.hpv.model.formulario.util.MetaisPesados;
import br.com.lika.hpv.model.formulario.util.ProdutosQuimicos;
import br.com.lika.hpv.model.formulario.util.Radiacoes;
import br.com.lika.hpv.model.formulario.util.Zona;
import br.com.lika.hpv.model.usuario.Usuario;

@Component("formulario")
@InterceptedBy({DAOInterceptor.class, PerfilDigitadorInterceptor.class})
public class FormularioLogic
{

	@In(scope=ScopeType.SESSION, required=true)
	protected Usuario usuarioDaSessao;
	protected final DAOFactory daoFactory;
	protected List<Formulario> formularios;

	@In(scope=ScopeType.REQUEST, required=false)
	@Out(scope=ScopeType.REQUEST)
	protected Formulario formulario;
	private InformacoesPessoais informacoesPessoais;
	private SituacaoSocioEconomicaDemografica situacaoSocioEconomicaDemografica;
	private HistoricoSexual historicoSexual;
	private List<String> gruposParticipantes;
	private List<String> zonas;
	private HistoricoClinico historicoClinico;
	private HistoricoFamiliar historicoFamiliar;
	private HistoricoAlimentar historicoAlimentar;
	private Tabagismo tabagismo;

	public FormularioLogic(DAOFactory factory)
	{
		this.daoFactory = factory;
	}

	public void formulario()
	{
	}

	public void formulario1(Formulario formulario)
	{
		this.zonas = Zona.getListaZonas();
		this.gruposParticipantes = GrupoParticipante.getGruposParticipantes();
		if ((formulario != null) && (formulario.getId() != null))
			this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId()));
		else
			this.formulario = formulario; 
	}

	@Validate(params={"formulario"})
	public void addFormulario1(Formulario formulario, HistoricoModificacoes historico) {
		formulario.setDataCadastro(new Date());
		this.daoFactory.beginTransaction();
		historico.setFormulario(formulario);
		historico.setDataModificacao(new Date());
		historico.setUsuario(usuarioDaSessao);
		historico.setEtapa(1);
		formulario.getModificacoes().add(historico);
		this.daoFactory.getFormularioDAO().adiciona(formulario);
		this.daoFactory.commit();
		this.formulario = formulario;
	}

	public void validateAddFormulario1(ValidationErrors erros, Formulario formulario)
	{
		if (formulario.getData() == null)
			erros.add(new FixedMessage("formulario.data", "O campo de data não pode ficar vazio!", "data"));
	}

	public void formulario2(Formulario formulario)
	{
		this.gruposParticipantes = GrupoParticipante.getGruposParticipantes();
		if ((formulario != null) && (formulario.getId() != null)) {
			this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId()));
			this.informacoesPessoais = this.formulario.getInformacoesPessoais();
		}
	}

	@Validate(params={"informacoesPessoais"})
	public void addFormulario2(InformacoesPessoais informacoesPessoais, HistoricoModificacoes historico) {
		this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(informacoesPessoais.getFormulario().getId()));
		if (this.formulario.getInformacoesPessoais() != null) {
			informacoesPessoais.setId(this.formulario.getInformacoesPessoais().getId());
		}

		this.daoFactory.getSession().clear();

		this.daoFactory.beginTransaction();
		historico.setDataModificacao(new Date());
		historico.setUsuario(usuarioDaSessao);
		historico.setFormulario(formulario);
		historico.setEtapa(2);
		daoFactory.getHistoricoModificacoesDAO().adiciona(historico);

		this.daoFactory.getInformacoesPessoaisDAO().atualiza(informacoesPessoais);
		this.daoFactory.commit();
		this.formulario = informacoesPessoais.getFormulario();
	}

	public void validateAddFormulario2(ValidationErrors erros, InformacoesPessoais informacoesPessoais) {
		if ((informacoesPessoais.getFormulario() == null) || (informacoesPessoais.getFormulario().getId() == null))
			erros.add(new FixedMessage("informacoesPessoais.formulario.id", "Formulário principal inacessível.\nTente clicar em 'Formulário/Listar' e procure se o formulário existe.", "informacoesPessoais.formulario.id"));
	}

	public void formulario3(Formulario formulario)
	{
		if ((formulario != null) && (formulario.getId() != null)) {
			this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId()));
			this.situacaoSocioEconomicaDemografica = this.formulario.getSituacaoSocioEconomicaDemografica();
		}
	}

	public void addFormulario3(SituacaoSocioEconomicaDemografica situacaoSocioEconomicaDemografica, HistoricoModificacoes historico) {
		this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(situacaoSocioEconomicaDemografica.getFormulario().getId()));
		if ((this.formulario.getSituacaoSocioEconomicaDemografica() != null) && (this.formulario.getSituacaoSocioEconomicaDemografica().getId() != null)) {
			situacaoSocioEconomicaDemografica.setId(this.formulario.getSituacaoSocioEconomicaDemografica().getId());
		}
		this.daoFactory.getSession().clear();

		this.daoFactory.beginTransaction();

		historico.setDataModificacao(new Date());
		historico.setUsuario(usuarioDaSessao);
		historico.setFormulario(formulario);
		historico.setEtapa(3);
		daoFactory.getHistoricoModificacoesDAO().adiciona(historico);

		this.daoFactory.getSituacaoSocioEconomicaDemograficaDAO().adiciona(situacaoSocioEconomicaDemografica);

		if ((situacaoSocioEconomicaDemografica.getJaTeveContatoProdutoQuimico() != null) && (situacaoSocioEconomicaDemografica.getJaTeveContatoProdutoQuimico().equalsIgnoreCase("sim"))) {
			ProdutosQuimicos p = situacaoSocioEconomicaDemografica.getProdutosQuimicos();
			if (p != null) {
				p.setSituacaoSocioEconomicaDemografica(situacaoSocioEconomicaDemografica);
				this.daoFactory.getProdutosQuimicosDAO().atualiza(p);
			}
		} else {
			this.daoFactory.getProdutosQuimicosDAO().removerProdutosQuimicosDeSituacaoSocioEconomicaDemografica(situacaoSocioEconomicaDemografica.getId());
		}

		if ((situacaoSocioEconomicaDemografica.getJaTeveContatoMetaisPesados() != null) && (situacaoSocioEconomicaDemografica.getJaTeveContatoMetaisPesados().equalsIgnoreCase("sim"))) {
			MetaisPesados m = situacaoSocioEconomicaDemografica.getMetaisPesados();
			if (m != null) {
				m.setSituacaoSocioEconomicaDemografica(situacaoSocioEconomicaDemografica);
				this.daoFactory.getMetaisPesadosDAO().atualiza(m);
			}
		} else {
			this.daoFactory.getMetaisPesadosDAO().removerMetaisPesadosDeSituacaoSocioEconomicaDemografica(situacaoSocioEconomicaDemografica.getId());
		}

		if ((situacaoSocioEconomicaDemografica.getJaTeveContatoRadiacao() != null) && (situacaoSocioEconomicaDemografica.getJaTeveContatoRadiacao().equalsIgnoreCase("sim"))) {
			Radiacoes r = situacaoSocioEconomicaDemografica.getRadiacoes();
			if (r != null) {
				r.setSituacaoSocioEconomicaDemografica(situacaoSocioEconomicaDemografica);
				this.daoFactory.getRadiacoesDAO().atualiza(r);
			}
		} else {
			this.daoFactory.getRadiacoesDAO().removerRadiacoesDeSituacaoSocioEconomicaDemografica(situacaoSocioEconomicaDemografica.getId());
		}

		this.daoFactory.commit();

		this.formulario = situacaoSocioEconomicaDemografica.getFormulario();
	}

	public void validateAddFormulario3(ValidationErrors erros, SituacaoSocioEconomicaDemografica situacaoSocioEconomicaDemografica) {
		if ((situacaoSocioEconomicaDemografica.getFormulario() == null) || (situacaoSocioEconomicaDemografica.getFormulario().getId() == null))
			erros.add(new FixedMessage("situacaoSocioEconomicaDemografica.formulario.id", "Formulário principal inacessível.\nTente clicar em 'Formulário/Listar' e procure se o formulário existe.", "situacaoSocioEconomicaDemografica.formulario.id"));
	}

	public void formulario4(Formulario formulario)
	{
		if ((formulario != null) && (formulario.getId() != null)) {
			this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId()));
			this.historicoSexual = this.formulario.getHistoricoSexual();
		}
	}

	@Validate(params={"historicoSexual"})
	public void addFormulario4(HistoricoSexual historicoSexual, HistoricoModificacoes historico) {
		this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(historicoSexual.getFormulario().getId()));
		if ((this.formulario.getHistoricoSexual() != null) && (this.formulario.getHistoricoSexual().getId() != null)) {
			historicoSexual.setId(this.formulario.getHistoricoSexual().getId());
		}
		this.daoFactory.getSession().clear();

		this.daoFactory.beginTransaction();
		historico.setDataModificacao(new Date());
		historico.setUsuario(usuarioDaSessao);
		historico.setFormulario(formulario);
		historico.setEtapa(4);

		daoFactory.getHistoricoModificacoesDAO().adiciona(historico);     
		this.daoFactory.getHistoricoSexualDAO().atualiza(historicoSexual);

		this.daoFactory.commit();
		this.formulario = historicoSexual.getFormulario();
	}

	public void validateAddFormulario4(ValidationErrors erros, HistoricoSexual historicoSexual) {
		if ((historicoSexual.getFormulario() == null) || (historicoSexual.getFormulario().getId() == null))
			erros.add(new FixedMessage("historicoSexual.formulario.id", "Formulário principal inacessível.\nTente clicar em 'Formulário/Listar' e procure se o formulário existe.", "historicoSexual.formulario.id"));
	}

	public void formulario5(Formulario formulario)
	{
		if ((formulario != null) && (formulario.getId() != null)) {
			this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId()));
			this.historicoClinico = this.formulario.getHistoricoClinico();
		}
	}

	public void addFormulario5(HistoricoClinico historicoClinico, HistoricoModificacoes historico) {
		this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(historicoClinico.getFormulario().getId()));
		if ((this.formulario.getHistoricoClinico() != null) && (this.formulario.getHistoricoClinico().getId() != null)) {
			historicoClinico.setId(this.formulario.getHistoricoClinico().getId());
		}
		this.daoFactory.getSession().clear();

		this.daoFactory.beginTransaction();

		historico.setDataModificacao(new Date());
		historico.setUsuario(usuarioDaSessao);
		historico.setFormulario(formulario);
		historico.setEtapa(5);
		daoFactory.getHistoricoModificacoesDAO().adiciona(historico);

		this.daoFactory.getHistoricoClinicoDAO().atualiza(historicoClinico);

		if ((historicoClinico.getAlguemDisseCancer() != null) && (historicoClinico.getAlguemDisseCancer().equalsIgnoreCase("sim"))) {
			Cancer cancer = historicoClinico.getCancer();
			if (cancer != null) {
				cancer.setHistoricoClinico(historicoClinico);
				this.daoFactory.getCancerDAO().atualiza(cancer);
			}
		} else {
			this.daoFactory.getCancerDAO().removerCancerHistoricoClinico(historicoClinico);
		}

		if ((historicoClinico.getJaFezCirurgia() != null) && (historicoClinico.getJaFezCirurgia().equalsIgnoreCase("sim"))) {
			Cirurgias cirurgias = historicoClinico.getCirurgias();
			if (cirurgias != null) {
				cirurgias.setHistoricoClinico(historicoClinico);
				this.daoFactory.getCirurgiasDAO().atualiza(cirurgias);
			}
		} else {
			this.daoFactory.getCirurgiasDAO().removerCirurgiasHistoricoClinico(historicoClinico);
		}

		if ((historicoClinico.getAlguemDisseDiabetes() != null) && (historicoClinico.getAlguemDisseDiabetes().equalsIgnoreCase("sim"))) {
			Diabetes diabetes = historicoClinico.getDiabetes();
			if (diabetes != null) {
				diabetes.setHistoricoClinico(historicoClinico);
				this.daoFactory.getDiabetesDAO().atualiza(diabetes);
			}
		} else {
			this.daoFactory.getDiabetesDAO().removerDiabetesHistoricoClinico(historicoClinico);
		}

		if ((historicoClinico.getAlgumMalEstar() != null) && (historicoClinico.getAlgumMalEstar().equalsIgnoreCase("sim"))) {
			MalEstar malEstar = historicoClinico.getMalEstar();
			if (malEstar != null) {
				malEstar.setHistoricoClinico(historicoClinico);
				this.daoFactory.getMalEstarDAO().atualiza(malEstar);
			}
		} else {
			this.daoFactory.getMalEstarDAO().removerMalEstarHistoricoClinico(historicoClinico);
		}

		System.out.println(historicoClinico.getUsaMedicacaoMenorPausa() + "/////////*****************************************");
		if ((historicoClinico.getUsaMedicacaoMenorPausa() != null) && (historicoClinico.getUsaMedicacaoMenorPausa().equalsIgnoreCase("sim"))) {
			MedicacaoMenorPausa medicacaoMenorPausa = historicoClinico.getMedicacaoMenorPausa();
			if (medicacaoMenorPausa != null) {
				medicacaoMenorPausa.setHistoricoClinico(historicoClinico);
				this.daoFactory.getMedicacaoMenorPausaDAO().atualiza(medicacaoMenorPausa);
			}
		}
		else {
			this.daoFactory.getSession().createSQLQuery("delete from MedicacaoMenorPausa where historicoClinico_id = " + historicoClinico.getId()).executeUpdate();
		}

		if ((historicoClinico.getUsaMedicacaoUsoContinuo() != null) && (historicoClinico.getUsaMedicacaoUsoContinuo().equalsIgnoreCase("sim"))) {
			this.daoFactory.getSession().createSQLQuery("delete from MedicacaoUsoContinuo where historicoClinico_id = " + historicoClinico.getId()).executeUpdate();
			List<MedicacaoUsoContinuo> list = historicoClinico.getMedicacoesUsoContinuo();
			for (MedicacaoUsoContinuo m : list) {
				m.setHistoricoClinico(historicoClinico);
				this.daoFactory.getMedicacaoUsoContinuoDAO().atualiza(m);
			}
		} else {
			this.daoFactory.getSession().createSQLQuery("delete from MedicacaoUsoContinuo where historicoClinico_id = " + historicoClinico.getId()).executeUpdate();
		}

		this.daoFactory.commit();

		this.daoFactory.getSession().clear();
		this.formulario = historicoClinico.getFormulario();



	}

	public void validateAddFormulario5(ValidationErrors erros, HistoricoClinico historicoClinico) {
		if ((historicoClinico.getFormulario() == null) || (historicoClinico.getFormulario().getId() == null))
			erros.add(new FixedMessage("historicoClinico.formulario.id", "Formulário principal inacessível.\nTente clicar em 'Formulário/Listar' e procure se o formulário existe.", "historicoClinico.formulario.id"));
	}

	public void formulario6(Formulario formulario)
	{
		if ((formulario != null) && (formulario.getId() != null)) {
			this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId()));
			this.historicoFamiliar = this.formulario.getHistoricoFamiliar();
		}
	}

	public void addFormulario6(HistoricoFamiliar historicoFamiliar, HistoricoModificacoes historico)
	{
		this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(historicoFamiliar.getFormulario().getId()));
		if ((this.formulario.getHistoricoFamiliar() != null) && (this.formulario.getHistoricoFamiliar().getId() != null)) {
			historicoFamiliar.setId(this.formulario.getHistoricoFamiliar().getId());
		}
		this.daoFactory.getSession().clear();

		this.daoFactory.beginTransaction();

		historico.setDataModificacao(new Date());
		historico.setUsuario(usuarioDaSessao);
		historico.setFormulario(formulario);
		historico.setEtapa(6);
		daoFactory.getHistoricoModificacoesDAO().adiciona(historico);



		this.daoFactory.getHistoricoFamiliarDAO().atualiza(historicoFamiliar);

		if ((historicoFamiliar.getAlgumParenteCancer() != null) && (historicoFamiliar.getAlgumParenteCancer().equalsIgnoreCase("sim"))) {
			historicoFamiliar.getParenteCancer().setHistoricoFamiliar(historicoFamiliar);
			this.daoFactory.getParenteCancerDAO().atualiza(historicoFamiliar.getParenteCancer()); } else {
				this.daoFactory.getParenteCancerDAO().removerParenteCancerHistoricoFamiliar(historicoFamiliar);
			}
		if ((historicoFamiliar.getAlgumParenteDoencaCronica() != null) && (historicoFamiliar.getAlgumParenteDoencaCronica().equalsIgnoreCase("sim"))) {
			historicoFamiliar.getParenteDoencaCronica().setHistoricoFamiliar(historicoFamiliar);
			this.daoFactory.getParenteDoencaCronicaDAO().atualiza(historicoFamiliar.getParenteDoencaCronica()); } else {
				this.daoFactory.getParenteDoencaCronicaDAO().removerParenteDoencaCronicaHistoricoFamiliar(historicoFamiliar);
			}

		this.daoFactory.commit();

		this.formulario = historicoFamiliar.getFormulario();
	}

	public void validateAddFormulario6(ValidationErrors erros, HistoricoFamiliar historicoFamiliar) {
		if ((historicoFamiliar.getFormulario() == null) || (historicoFamiliar.getFormulario().getId() == null))
			erros.add(new FixedMessage("historicoFamiliar.formulario.id", "Formulário principal inacessível.\nTente clicar em 'Formulário/Listar' e procure se o formulário existe.", "historicoFamiliar.formulario.id"));
	}

	public void formulario8(Formulario formulario)
	{
		if ((formulario != null) && (formulario.getId() != null)) {
			this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId()));
			this.historicoAlimentar = this.formulario.getHistoricoAlimentar();
		}
	}

	public void addFormulario8(HistoricoAlimentar historicoAlimentar, HistoricoModificacoes historico) {
		this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(historicoAlimentar.getFormulario().getId()));
		if ((this.formulario.getHistoricoAlimentar() != null) && (this.formulario.getHistoricoAlimentar().getId() != null)) {
			historicoAlimentar.setId(this.formulario.getHistoricoAlimentar().getId());
		}
		this.daoFactory.getSession().clear();

		this.daoFactory.beginTransaction();

		historico.setDataModificacao(new Date());
		historico.setUsuario(usuarioDaSessao);
		historico.setFormulario(formulario);
		historico.setEtapa(8);
		daoFactory.getHistoricoModificacoesDAO().adiciona(historico);


		this.daoFactory.getHistoricoAlimentarDAO().atualiza(historicoAlimentar);

		if ((historicoAlimentar.getConsomeBebidasAlcoolicas() != null) && (historicoAlimentar.getConsomeBebidasAlcoolicas().equalsIgnoreCase("sim"))) {
			historicoAlimentar.getConsumoBebidaAlcoolica().setHistoricoAlimentar(historicoAlimentar);
			this.daoFactory.getConsumoBebidaAlcoolicaDAO().atualiza(historicoAlimentar.getConsumoBebidaAlcoolica()); } else {
				this.daoFactory.getSession().createSQLQuery("delete from ConsumoBebidaAlcoolica where historicoAlimentar_id = " + historicoAlimentar.getId()).executeUpdate();
			}
		if ((historicoAlimentar.getConsomeBrotoSamambaia() != null) && (historicoAlimentar.getConsomeBrotoSamambaia().equalsIgnoreCase("sim"))) {
			historicoAlimentar.getConsumoBrotoSamambaia().setHistoricoAlimentar(historicoAlimentar);
			this.daoFactory.getConsumoBrotoSamambaiaDAO().atualiza(historicoAlimentar.getConsumoBrotoSamambaia()); } else {
				this.daoFactory.getSession().createSQLQuery("delete from ConsumoBrotoSamambaia where historicoAlimentar_id = " + historicoAlimentar.getId()).executeUpdate();
			}
		if ((historicoAlimentar.getUsaFogaoLenha() != null) && (historicoAlimentar.getUsaFogaoLenha().equalsIgnoreCase("sim"))) {
			historicoAlimentar.getFogao().setHistoricoAlimentar(historicoAlimentar);
			this.daoFactory.getFogaoDAO().atualiza(historicoAlimentar.getFogao()); } else {
				this.daoFactory.getSession().createSQLQuery("delete from Fogao where historicoAlimentar_id = " + historicoAlimentar.getId()).executeUpdate();
			}
		if ((historicoAlimentar.getConsomeFrango() != null) && (historicoAlimentar.getConsomeFrango().equalsIgnoreCase("sim"))) {
			historicoAlimentar.getFrango().setHistoricoAlimentar(historicoAlimentar);
			this.daoFactory.getFrangoDAO().atualiza(historicoAlimentar.getFrango()); } else {
				this.daoFactory.getSession().createSQLQuery("delete from Frango where historicoAlimentar_id = " + historicoAlimentar.getId()).executeUpdate();
			}
		if ((historicoAlimentar.getConsomeCarneVermelha() != null) && (historicoAlimentar.getConsomeCarneVermelha().equalsIgnoreCase("sim"))) {
			historicoAlimentar.getCarneVermelha().setHistoricoAlimentar(historicoAlimentar);
			this.daoFactory.getCarneVermelhaDAO().atualiza(historicoAlimentar.getCarneVermelha()); } else {
				this.daoFactory.getSession().createSQLQuery("delete from CarneVermelha where historicoAlimentar_id = " + historicoAlimentar.getId()).executeUpdate();
			}
		this.daoFactory.commit();
		this.formulario = historicoAlimentar.getFormulario();
	}

	public void validateAddFormulario8(ValidationErrors erros, HistoricoAlimentar historicoAlimentar) {
		if ((historicoAlimentar.getFormulario() == null) || (historicoAlimentar.getFormulario().getId() == null))
			erros.add(new FixedMessage("historicoAlimentar.formulario.id", "Formulário principal inacessível.\nTente clicar em 'Formulário/Listar' e procure se o formulário existe.", "historicoAlimentar.formulario.id"));
	}

	public void formulario7(Formulario formulario)
	{
		if ((formulario != null) && (formulario.getId() != null)) {
			this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId()));
			this.tabagismo = this.formulario.getTabagismo();
		}
	}

	public void addFormulario7(Tabagismo tabagismo, HistoricoModificacoes historico) {
		this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(tabagismo.getFormulario().getId()));
		boolean atualizar = false;
		if ((this.formulario.getTabagismo() != null) && (this.formulario.getTabagismo().getId() != null)) {
			tabagismo.setId(this.formulario.getTabagismo().getId());
			tabagismo.setFumo(this.formulario.getTabagismo().getFumo());
			atualizar  = true;
		}
		this.daoFactory.getSession().clear();

		this.daoFactory.beginTransaction();

		historico.setDataModificacao(new Date());
		historico.setUsuario(usuarioDaSessao);
		historico.setFormulario(formulario);
		historico.setEtapa(7);
		daoFactory.getHistoricoModificacoesDAO().adiciona(historico);


		this.daoFactory.getTabagismoDAO().atualiza(tabagismo);

		if ((tabagismo.getFuma().equalsIgnoreCase("sim")) || (tabagismo.getFuma().equalsIgnoreCase("ja fumei"))) {
			tabagismo.getFumo().setTabagismo(tabagismo);
			if(atualizar)
				this.daoFactory.getFumoDAO().somenteAtualizar(tabagismo.getFumo()); 
			else
				this.daoFactory.getFumoDAO().atualiza(tabagismo.getFumo());
		} else {
			this.daoFactory.getSession().createSQLQuery("delete from Fumo where tabagismo_id = " + tabagismo.getId()).executeUpdate();
		}

		this.daoFactory.commit();
		this.formulario = tabagismo.getFormulario();
	}

	public void validateAddFormulario7(ValidationErrors erros, Tabagismo tabagismo) {
		if ((tabagismo.getFormulario() == null) || (tabagismo.getFormulario().getId() == null))
			erros.add(new FixedMessage("tabagismo.formulario.id", "Formulário principal inacessível.\nTente clicar em 'Formulário/Listar' e procure se o formulário existe.", "tabagismo.formulario.id"));
	}

	public void formulario9(Formulario formulario)
	{
		if ((formulario != null) && (formulario.getId() != null))
			this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId()));
	}

	public void addFormulario9(Formulario formulario, HistoricoModificacoes historico)
	{
		Formulario temp = (Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId());

		temp.setQntsDiasSemanaCaminhada(formulario.getQntsDiasSemanaCaminhada());
		temp.setQntsDiasSemanaisPraticaEstasAtividades(formulario.getQntsDiasSemanaisPraticaEstasAtividades());
		temp.setPraticaAtividadesModeradas(formulario.getPraticaAtividadesModeradas());

		this.daoFactory.beginTransaction();

		historico.setFormulario(temp);
		historico.setDataModificacao(new Date());
		historico.setUsuario(this.daoFactory.getUsuarioDAO().procura(historico.getUser()));
		historico.setEtapa(9);
		temp.getModificacoes().add(historico);

		this.daoFactory.getFormularioDAO().atualiza(temp);
		this.daoFactory.commit();

		this.formulario = formulario;
	}

	public void validateAddFormulario9(ValidationErrors erros, Formulario formulario) {
		if (formulario.getId() == null)
			erros.add(new FixedMessage("id", "Formulário inválido! Por favor, cadastre os dados de identificação do formulário primeiro.", "formulario.id"));
	}

	public void formulario10(Formulario formulario)
	{
		if ((formulario != null) && (formulario.getId() != null))
			this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId()));
	}

	public void addFormulario10(Formulario formulario, HistoricoModificacoes historico)
	{
		Formulario temp = (Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId());
		temp.setEstadoAtencaoEntrevistado(formulario.getEstadoAtencaoEntrevistado());
		temp.setCompreensaoEntrevistado(formulario.getCompreensaoEntrevistado());
		temp.setDataEntrevista(formulario.getDataEntrevista());
		temp.setNomeEntrevistador(formulario.getNomeEntrevistador());

		this.daoFactory.beginTransaction();
		historico.setFormulario(temp);
		historico.setDataModificacao(new Date());
		historico.setUsuario(usuarioDaSessao);
		historico.setEtapa(10);
		temp.getModificacoes().add(historico);
		this.daoFactory.getFormularioDAO().atualiza(temp);
		this.daoFactory.commit();
		this.formulario = temp;
	}

	public void validateAddFormulario10(ValidationErrors erros, Formulario formulario) {
		if (formulario.getId() == null)
			erros.add(new FixedMessage("id", "Formulário inválido! Por favor, cadastre os dados de identificação do formulário primeiro.", "formulario.id"));
	}

	public void fimCadastroFormulario(Formulario formulario)
	{
		this.formulario = formulario;
	}

	public void formularioAnexos(Formulario formulario)
	{
		if ((formulario != null) && (formulario.getId() != null))
			this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId()));
	}

	public void formularioAmostras(Formulario formulario)
	{
		if ((formulario != null) && (formulario.getId() != null))
			this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId()));
	}

	public void gerarLaudoCitopatologico(Formulario formulario)
	{
		if ((formulario != null) && (formulario.getId() != null))
			this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId()));
	}

	public void addFormulario(Formulario form)
	{
		this.daoFactory.beginTransaction();
		this.daoFactory.getFormularioDAO().adiciona(form);
		this.daoFactory.commit();
	}

	public void listarProcurar() {
		this.formularios = this.daoFactory.getFormularioDAO().listaTudo();
	}

	public void remover(Formulario formulario)
	{
		if (formulario.getId() != null) {
			this.daoFactory.beginTransaction();
			HistoricoClinico h = new HistoricoClinico();
			h = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId())).getHistoricoClinico();

			if ((h != null) && (h.getId() != null)) {
				Long id = h.getId();
				this.daoFactory.getSession().createSQLQuery("delete from MedicacaoUsoContinuo where historicoClinico_id = " + id).executeUpdate();
				this.daoFactory.getSession().createSQLQuery("delete from Cancer where historicoClinico_id = " + id).executeUpdate();
			}
			this.daoFactory.getFormularioDAO().remover(formulario.getId());
			this.daoFactory.commit();
		}
	}

	public Usuario getUsuarioDaSessao()
	{
		return this.usuarioDaSessao;
	}

	public List<Formulario> getFormularios() {
		return this.formularios;
	}

	public void setFormularios(List<Formulario> formularios) {
		this.formularios = formularios;
	}

	public Formulario getFormulario() {
		return this.formulario;
	}

	public void setFormulario(Formulario formulario) {
		this.formulario = formulario;
	}

	public List<String> getGruposParticipantes() {
		return this.gruposParticipantes;
	}

	public void setGruposParticipantes(List<String> gruposParticipantes) {
		this.gruposParticipantes = gruposParticipantes;
	}

	public List<String> getZonas() {
		return this.zonas;
	}

	public void setZonas(List<String> zonas) {
		this.zonas = zonas;
	}

	public DAOFactory getDaoFactory() {
		return this.daoFactory;
	}

	public void setUsuarioDaSessao(Usuario usuarioDaSessao) {
		this.usuarioDaSessao = usuarioDaSessao;
	}

	public InformacoesPessoais getInformacoesPessoais() {
		return this.informacoesPessoais;
	}

	public void setInformacoesPessoais(InformacoesPessoais informacoesPessoais) {
		this.informacoesPessoais = informacoesPessoais;
	}

	public SituacaoSocioEconomicaDemografica getSituacaoSocioEconomicaDemografica() {
		return this.situacaoSocioEconomicaDemografica;
	}

	public void setSituacaoSocioEconomicaDemografica(SituacaoSocioEconomicaDemografica situacaoSocioEconomicaDemografica)
	{
		this.situacaoSocioEconomicaDemografica = situacaoSocioEconomicaDemografica;
	}

	public HistoricoSexual getHistoricoSexual() {
		return this.historicoSexual;
	}

	public void setHistoricoSexual(HistoricoSexual historicoSexual) {
		this.historicoSexual = historicoSexual;
	}

	public HistoricoClinico getHistoricoClinico() {
		return this.historicoClinico;
	}

	public void setHistoricoClinico(HistoricoClinico historicoClinico) {
		this.historicoClinico = historicoClinico;
	}

	public HistoricoFamiliar getHistoricoFamiliar() {
		return this.historicoFamiliar;
	}

	public void setHistoricoFamiliar(HistoricoFamiliar historicoFamiliar) {
		this.historicoFamiliar = historicoFamiliar;
	}

	public HistoricoAlimentar getHistoricoAlimentar() {
		return this.historicoAlimentar;
	}

	public void setHistoricoAlimentar(HistoricoAlimentar historicoAlimentar) {
		this.historicoAlimentar = historicoAlimentar;
	}

	public Tabagismo getTabagismo() {
		return this.tabagismo;
	}

	public void setTabagismo(Tabagismo tabagismo) {
		this.tabagismo = tabagismo;
	}
}
