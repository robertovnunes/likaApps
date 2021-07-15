package negocios;

import java.util.List;

import model.endereco.Residencia;
import model.fichainvestigativa.Conclusao;
import model.fichainvestigativa.DadosClinicosComplicacoes;
import model.fichainvestigativa.DadosGerais;
import model.fichainvestigativa.DadosLaboratoriais;
import model.fichainvestigativa.NotificacaoInvestigativa;
import model.fichainvestigativa.Paciente;
import model.sistema.Arquivo;
import model.sistema.CNES;
import dados.FabricaDAO;
import dados.basicas.ArquivoDAO;
import dados.basicas.CNESDAO;
import dados.basicas.ConclusaoDAO;
import dados.basicas.DadosClinicosDAO;
import dados.basicas.DadosGeraisDAO;
import dados.basicas.DadosLaboratoriaisDAO;
import dados.basicas.NotificacaoInvestigativaDAO;
import dados.basicas.PacienteDAO;
import dados.basicas.ResidenciaDAO;
import dados.hibernate.FabricaHibernateDAO;

public class NotificacaoInvestigativaNeg {
	
	private static NotificacaoInvestigativaNeg instancia;
	private FabricaDAO fabrica;
	
	private NotificacaoInvestigativaNeg() {
		fabrica = FabricaHibernateDAO.getInstancia();
	}
	
	public static NotificacaoInvestigativaNeg getInstancia(){
		if(NotificacaoInvestigativaNeg.instancia == null){
			NotificacaoInvestigativaNeg.instancia = new NotificacaoInvestigativaNeg();
		}
		return NotificacaoInvestigativaNeg.instancia;
	}
	
	
	public NotificacaoInvestigativa getNotificacaoInvestigativaPorID(Integer id){
		NotificacaoInvestigativaDAO dao = fabrica.getNotificacaoInvestigativaDAO();
		return dao.getPorId(id, true);
	}
	
	public NotificacaoInvestigativa inserirNotificacaoInvestigativa(NotificacaoInvestigativa notificacaoInvestigativa){
		notificacaoInvestigativa.setConclusao( persistirConclusao(new Conclusao()));
		notificacaoInvestigativa.setDadosClinicosComplicacoes(persistirDadosClinicosComplicacoes(new DadosClinicosComplicacoes()));
		notificacaoInvestigativa.setDadosGerais(persistirDadosGerais(new DadosGerais()));
		notificacaoInvestigativa.setDadosLaboratoriais(persistirDadosLaboratoriais(new DadosLaboratoriais()));
		
		Paciente paciente = new Paciente();
		paciente.setResidencia(persistirResidencia(new Residencia()));
		notificacaoInvestigativa.setPaciente(persistirPaciente(paciente));
		
		NotificacaoInvestigativaDAO dao = fabrica.getNotificacaoInvestigativaDAO();
		return dao.persistir(notificacaoInvestigativa);
	}
	
	public NotificacaoInvestigativa persistirNotificacaoInvestigativa(NotificacaoInvestigativa notificacaoInvestigativa){
		NotificacaoInvestigativaDAO dao = fabrica.getNotificacaoInvestigativaDAO();
		return dao.persistir(notificacaoInvestigativa);
	}
	
	public void removerFichaNotificacao(NotificacaoInvestigativa notificacao){
		
		
	/*	removerConclusao(notificacao.getConclusao());
		removerDadosClinicosComplicacoes(notificacao.getDadosClinicosComplicacoes());
		removerDadosGerais(notificacao.getDadosGerais());
		removerDadosLaboratoriais(notificacao.getDadosLaboratoriais());
		removerResidencia(notificacao.getPaciente().getResidencia());
		removerPaciente(notificacao.getPaciente());*/
		
		NotificacaoInvestigativaDAO dao = fabrica.getNotificacaoInvestigativaDAO();
		dao.remover(notificacao);
	}
	
	public List<NotificacaoInvestigativa> getTodasNotificacaoInvestigativa(){
		NotificacaoInvestigativaDAO dao = fabrica.getNotificacaoInvestigativaDAO();
		return dao.getTodos();
	}
	
	public List<NotificacaoInvestigativa> getNotificacaoInvestigativaPorFiltro(String tipo, String valor){
		NotificacaoInvestigativaDAO dao = fabrica.getNotificacaoInvestigativaDAO();
		return dao.getNotificacaoInvestigativaPorConsulta(tipo, valor);
	}
	
	public Conclusao persistirConclusao(Conclusao conclusao){
		ConclusaoDAO dao = fabrica.getConclusaoDAO();
		return dao.persistir(conclusao);
	}
	
	public DadosGerais persistirDadosGerais(DadosGerais dadosGerais){
		DadosGeraisDAO dao = fabrica.getDadosGeraisDAO();
		return dao.persistir(dadosGerais);
	}
	
	public DadosClinicosComplicacoes persistirDadosClinicosComplicacoes(DadosClinicosComplicacoes dadosClinicosComplicacoes){
		DadosClinicosDAO dao = fabrica.getDadosClinicosDAO();
		return dao.persistir(dadosClinicosComplicacoes);
	}
	
	public DadosLaboratoriais persistirDadosLaboratoriais(DadosLaboratoriais dadosLaboratoriais){
		DadosLaboratoriaisDAO dao = fabrica.getDadosLaboratoriaisDAO();
		return dao.persistir(dadosLaboratoriais);
	}
	
	public Paciente persistirPaciente(Paciente paciente){
		PacienteDAO dao = fabrica.getPacienteDAO();
		return dao.persistir(paciente);
	}
	
	public Residencia persistirResidencia(Residencia residencia){
		ResidenciaDAO dao = fabrica.getResidenciaDAO();
		return dao.persistir(residencia);
	}
	
	public void removerConclusao(Conclusao conclusao){
		ConclusaoDAO dao = fabrica.getConclusaoDAO();
		dao.remover(conclusao);
	}
	
	public void removerDadosGerais(DadosGerais dadosGerais){
		DadosGeraisDAO dao = fabrica.getDadosGeraisDAO();
		dao.remover(dadosGerais);
	}
	
	public void removerDadosClinicosComplicacoes(DadosClinicosComplicacoes dadosClinicosComplicacoes){
		DadosClinicosDAO dao = fabrica.getDadosClinicosDAO();
		dao.remover(dadosClinicosComplicacoes);
	}
	
	public void removerDadosLaboratoriais(DadosLaboratoriais dadosLaboratoriais){
		DadosLaboratoriaisDAO dao = fabrica.getDadosLaboratoriaisDAO();
		dao.remover(dadosLaboratoriais);
	}
	
	public void removerPaciente(Paciente paciente){
		PacienteDAO dao = fabrica.getPacienteDAO();
		dao.remover(paciente);
	}
	
	public void removerResidencia(Residencia residencia){
		ResidenciaDAO dao = fabrica.getResidenciaDAO();
		dao.remover(residencia);
	}

	public CNES buscarUnidadeSaudePorIDCNES(String idCens){
		CNESDAO dao = fabrica.getCNESDAO();
		return dao.getPorIDCNES(idCens);
	}
	
	public Arquivo inserirArquivo(Arquivo arquivo){
		ArquivoDAO dao = fabrica.getArquivoDAO();
		return dao.persistir(arquivo);
	}
	
	public List<NotificacaoInvestigativa> pesquisarNotificacaoInvestigativa(String cep,	String pais, String estado,	String cidade, 	String bairro,	String dataInicial,	String dataFinal,	String autocomplete, String classico, String complicacoes,	String fhd,	String scd,	String descartado){
		NotificacaoInvestigativaDAO dao = fabrica.getNotificacaoInvestigativaDAO();
		return dao.pesquisarNotificacaoInvestigativa(cep, pais, estado, cidade, bairro, dataInicial, dataFinal, autocomplete, classico, complicacoes, fhd, scd, descartado);
	}
	
	
}
