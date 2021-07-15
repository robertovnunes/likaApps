package dados.hibernate;

import org.hibernate.Session;

import dados.FabricaDAO;
import dados.basicas.AlunoDAO;
import dados.basicas.AtendimentoDAO;
import dados.basicas.EnderecoDAO;
import dados.basicas.EnfermeiroDAO;
import dados.basicas.ErroDAO;
import dados.basicas.PacienteDAO;
import dados.basicas.ProfessorDAO;
import dados.basicas.ProntuarioDAO;
import dados.basicas.UsuarioDAO;
import dados.basicas.atendimento.AdendoDAO;
import dados.basicas.atendimento.AdmissaoDAO;
import dados.basicas.atendimento.AltaDAO;
import dados.basicas.atendimento.AvaliacaoProfessorDAO;
import dados.basicas.atendimento.EvolucaoDAO;
import dados.basicas.atendimento.antecedentes.AntecedenteFamiliarDAO;
import dados.basicas.atendimento.antecedentes.AntecedentesDAO;
import dados.basicas.atendimento.antecedentes.AntecedentesFamiliaresDAO;
import dados.basicas.atendimento.antecedentes.AntecedentesPessoaisDAO;
import dados.basicas.atendimento.diagnosticointervencoes.CipeDAO;
import dados.basicas.atendimento.diagnosticointervencoes.DiagnosticoDAO;
import dados.basicas.atendimento.diagnosticointervencoes.IntervencoesDAO;
import dados.basicas.atendimento.diagnosticointervencoes.NicDAO;
import dados.basicas.atendimento.diagnosticointervencoes.NocDAO;
import dados.basicas.atendimento.diagnosticointervencoes.ResultadosDAO;
import dados.basicas.atendimento.examefisico.ExameAuditivoDAO;
import dados.basicas.atendimento.examefisico.ExameBocaDAO;
import dados.basicas.atendimento.examefisico.ExameCouroDAO;
import dados.basicas.atendimento.examefisico.ExameFisicoDAO;
import dados.basicas.atendimento.examefisico.ExameMamasDAO;
import dados.basicas.atendimento.examefisico.ExameNarizDAO;
import dados.basicas.atendimento.examefisico.ExameOlhosDAO;
import dados.basicas.atendimento.examefisico.ExamePadraoDAO;
import dados.basicas.atendimento.examefisico.ExamePelesAnexosDAO;
import dados.basicas.atendimento.examefisico.ExamePescocoDAO;
import dados.basicas.atendimento.examefisico.ExameSistCardiovascularDAO;
import dados.basicas.atendimento.examefisico.ExameSistGastroIntestinalDAO;
import dados.basicas.atendimento.examefisico.ExameSistGenitoUrinarioDAO;
import dados.basicas.atendimento.examefisico.ExameSistRespiratorioDAO;
import dados.basicas.atendimento.examemental.ExameMentalDAO;
import dados.basicas.atendimento.examemental.ExameMentalGeralDAO;
import dados.basicas.atendimento.examemental.ExameMentalMiniMentalDAO;
import dados.basicas.atendimento.necessidades.NecessidadesBasicasDAO;
import dados.basicas.atendimento.queixa.QueixaDAO;
import dados.hibernate.conteudo.AlunoHibernateDAO;
import dados.hibernate.conteudo.AtendimentoHibernateDAO;
import dados.hibernate.conteudo.EnderecoHibernateDAO;
import dados.hibernate.conteudo.EnfermeiroHibernateDAO;
import dados.hibernate.conteudo.ErroHibernateDAO;
import dados.hibernate.conteudo.PacienteHibernateDAO;
import dados.hibernate.conteudo.ProfessorHibernateDAO;
import dados.hibernate.conteudo.ProntuarioHibernateDAO;
import dados.hibernate.conteudo.UsuarioHibernateDAO;
import dados.hibernate.conteudo.atendimento.AdendoHibernateDAO;
import dados.hibernate.conteudo.atendimento.AdmissaoHibernateDAO;
import dados.hibernate.conteudo.atendimento.AltaHibernateDAO;
import dados.hibernate.conteudo.atendimento.AvaliacaoProfessorHibernateDAO;
import dados.hibernate.conteudo.atendimento.EvolucaoHibernateDAO;
import dados.hibernate.conteudo.atendimento.antecedentes.AntecedenteFamiliarHibernateDAO;
import dados.hibernate.conteudo.atendimento.antecedentes.AntecedentesFamiliaresHibernateDAO;
import dados.hibernate.conteudo.atendimento.antecedentes.AntecedentesHibernateDAO;
import dados.hibernate.conteudo.atendimento.antecedentes.AntecedentesPessoaisHibernateDAO;
import dados.hibernate.conteudo.atendimento.diagnosticointervencoes.CipeHibernateDAO;
import dados.hibernate.conteudo.atendimento.diagnosticointervencoes.DiagnosticoHibernateDAO;
import dados.hibernate.conteudo.atendimento.diagnosticointervencoes.IntervencoesHibernateDAO;
import dados.hibernate.conteudo.atendimento.diagnosticointervencoes.NicHibernateDAO;
import dados.hibernate.conteudo.atendimento.diagnosticointervencoes.NocHibernateDAO;
import dados.hibernate.conteudo.atendimento.diagnosticointervencoes.ResultadosHibernateDAO;
import dados.hibernate.conteudo.atendimento.examefisico.ExameAuditivoHibernateDAO;
import dados.hibernate.conteudo.atendimento.examefisico.ExameBocaHibernateDAO;
import dados.hibernate.conteudo.atendimento.examefisico.ExameCouroHibernateDAO;
import dados.hibernate.conteudo.atendimento.examefisico.ExameFisicoHibernateDAO;
import dados.hibernate.conteudo.atendimento.examefisico.ExameMamasHibernateDAO;
import dados.hibernate.conteudo.atendimento.examefisico.ExameNarizHibernateDAO;
import dados.hibernate.conteudo.atendimento.examefisico.ExameOlhosHibernateDAO;
import dados.hibernate.conteudo.atendimento.examefisico.ExamePadraoHibernateDAO;
import dados.hibernate.conteudo.atendimento.examefisico.ExamePelesAnexosHibernateDAO;
import dados.hibernate.conteudo.atendimento.examefisico.ExamePescocoHibernateDAO;
import dados.hibernate.conteudo.atendimento.examefisico.ExameSistCardiovascularHibernateDAO;
import dados.hibernate.conteudo.atendimento.examefisico.ExameSistGastroIntestinalHibernateDAO;
import dados.hibernate.conteudo.atendimento.examefisico.ExameSistGenitoUrinarioHibernateDAO;
import dados.hibernate.conteudo.atendimento.examefisico.ExameSistRespiratorioHibernateDAO;
import dados.hibernate.conteudo.atendimento.examemental.ExameMentalGeralHibernateDAO;
import dados.hibernate.conteudo.atendimento.examemental.ExameMentalHibernateDAO;
import dados.hibernate.conteudo.atendimento.examemental.ExameMentalMiniMentalHibernateDAO;
import dados.hibernate.conteudo.atendimento.necessidades.NecessidadesBasicasHibernateDAO;
import dados.hibernate.conteudo.atendimento.queixa.QueixaHibernateDAO;

public class FabricaHibernateDAO extends FabricaDAO{
	
	public static FabricaHibernateDAO instancia;
	
	public static FabricaHibernateDAO getInstancia(){
		if(FabricaHibernateDAO.instancia == null){
			FabricaHibernateDAO.instancia = new FabricaHibernateDAO();
		}
		return FabricaHibernateDAO.instancia;
	}
	
	@SuppressWarnings("unchecked")
    private DAOGenericoHibernate instanciarDAO(Class daoClass) {
        try {
        	DAOGenericoHibernate dao = (DAOGenericoHibernate) daoClass.newInstance();
            dao.setSession(getCurrentSession());
            return dao;
        } catch (Exception ex) {
            throw new RuntimeException("Não foi possível instanciar o DAO: " + daoClass, ex);
        }
	}
	
	protected Session getCurrentSession() {
        return HibernateUtil.getFabricaDeSessao().getCurrentSession();
    }
	
	@Override
	public EnderecoDAO getEnderecoDAO() {
		return (EnderecoDAO) this.instanciarDAO(EnderecoHibernateDAO.class);
	}

	@Override
	public AlunoDAO getAlunoDAO() {
		return (AlunoDAO) this.instanciarDAO(AlunoHibernateDAO.class);
	}
	
	@Override
	public EnfermeiroDAO getEnfermeiroDAO() {
		return (EnfermeiroDAO) this.instanciarDAO(EnfermeiroHibernateDAO.class);
	}
	
	@Override
	public ProfessorDAO getProfessorDAO() {
		return (ProfessorDAO) this.instanciarDAO(ProfessorHibernateDAO.class);
	}
	
	@Override
	public ProntuarioDAO getProntuarioDAO() {
		return (ProntuarioDAO) this.instanciarDAO(ProntuarioHibernateDAO.class);
	}
	
	@Override
	public UsuarioDAO getUsuarioDAO() {
		return (UsuarioDAO) this.instanciarDAO(UsuarioHibernateDAO.class);
	}

	@Override
	public PacienteDAO getPacienteDAO() {
		return (PacienteDAO) this.instanciarDAO(PacienteHibernateDAO.class);
	}

	@Override
	public AtendimentoDAO getAtendimentoDAO() {
		return (AtendimentoDAO) this.instanciarDAO(AtendimentoHibernateDAO.class);
	}

	@Override
	public AdmissaoDAO getAdmissaoDAO() {
		return (AdmissaoDAO) this.instanciarDAO(AdmissaoHibernateDAO.class);
	}

	@Override
	public QueixaDAO getQueixaDAO() {
		return (QueixaDAO) this.instanciarDAO(QueixaHibernateDAO.class);
	}

	@Override
	public AntecedenteFamiliarDAO getAntecedenteFamiliarDAO() {
		return (AntecedenteFamiliarDAO) this.instanciarDAO(AntecedenteFamiliarHibernateDAO.class);
	}

	@Override
	public AntecedentesFamiliaresDAO getAntecedentesFamiliaresDAO() {
		return (AntecedentesFamiliaresDAO) this.instanciarDAO(AntecedentesFamiliaresHibernateDAO.class);
	}

	@Override
	public AntecedentesPessoaisDAO getAntecedentesPessoaisDAO() {
		return (AntecedentesPessoaisDAO) this.instanciarDAO(AntecedentesPessoaisHibernateDAO.class);
	}
	
	@Override
	public AntecedentesDAO getAntecedentesDAO() {
		return (AntecedentesDAO) this.instanciarDAO(AntecedentesHibernateDAO.class);
	}

	@Override
	public EvolucaoDAO getEvolucaoDAO() {
		return (EvolucaoDAO) this.instanciarDAO(EvolucaoHibernateDAO.class);
	}

	@Override
	public NecessidadesBasicasDAO getNecessidadesBasicasDAO() {
		return (NecessidadesBasicasDAO) this.instanciarDAO(NecessidadesBasicasHibernateDAO.class);
	}

	@Override
	public ExameAuditivoDAO getExameAuditivoDAO() {
		return (ExameAuditivoDAO) this.instanciarDAO(ExameAuditivoHibernateDAO.class);
	}

	@Override
	public ExameBocaDAO getExameBocaDAO() {
		return (ExameBocaDAO) this.instanciarDAO(ExameBocaHibernateDAO.class);
	}

	@Override
	public ExameCouroDAO getExameCouroDAO() {
		return (ExameCouroDAO) this.instanciarDAO(ExameCouroHibernateDAO.class);
	}

	@Override
	public ExameFisicoDAO getExameFisicoDAO() {
		return (ExameFisicoDAO) this.instanciarDAO(ExameFisicoHibernateDAO.class);
	}

	@Override
	public ExameMamasDAO getExameMamasDAO() {
		return (ExameMamasDAO) this.instanciarDAO(ExameMamasHibernateDAO.class);
	}

	@Override
	public ExameMentalDAO getExameMentalDAO() {
		return (ExameMentalDAO) this.instanciarDAO(ExameMentalHibernateDAO.class);
	}

	@Override
	public ExameMentalGeralDAO getExameMentalGeralDAO() {
		return (ExameMentalGeralDAO) this.instanciarDAO(ExameMentalGeralHibernateDAO.class);
	}

	@Override
	public ExameMentalMiniMentalDAO getExameMentalMiniMentalDAO() {
		return (ExameMentalMiniMentalDAO) this.instanciarDAO(ExameMentalMiniMentalHibernateDAO.class);
	}

	@Override
	public ExameNarizDAO getExameNarizDAO() {
		return (ExameNarizDAO) this.instanciarDAO(ExameNarizHibernateDAO.class);
	}

	@Override
	public ExameOlhosDAO getExameOlhosDAO() {
		return (ExameOlhosDAO) this.instanciarDAO(ExameOlhosHibernateDAO.class);
	}

	@Override
	public ExamePadraoDAO getExamePadraoDAO() {
		return (ExamePadraoDAO) this.instanciarDAO(ExamePadraoHibernateDAO.class);
	}

	@Override
	public ExamePelesAnexosDAO getExamePelesAnexosDAO() {
		return (ExamePelesAnexosDAO) this.instanciarDAO(ExamePelesAnexosHibernateDAO.class);
	}

	@Override
	public ExamePescocoDAO getExamePescocoDAO() {
		return (ExamePescocoDAO) this.instanciarDAO(ExamePescocoHibernateDAO.class);
	}

	@Override
	public ExameSistCardiovascularDAO getExameSistCardiovascularDAO() {
		return (ExameSistCardiovascularDAO) this.instanciarDAO(ExameSistCardiovascularHibernateDAO.class);
	}

	@Override
	public ExameSistGastroIntestinalDAO getExameSistGastroIntestinalDAO() {
		return (ExameSistGastroIntestinalDAO) this.instanciarDAO(ExameSistGastroIntestinalHibernateDAO.class);
	}

	@Override
	public ExameSistGenitoUrinarioDAO getExameSistGenitoUrinarioDAO() {
		return (ExameSistGenitoUrinarioDAO) this.instanciarDAO(ExameSistGenitoUrinarioHibernateDAO.class);
	}

	@Override
	public ExameSistRespiratorioDAO getExameSistRespiratorioDAO() {
		return (ExameSistRespiratorioDAO) this.instanciarDAO(ExameSistRespiratorioHibernateDAO.class);
	}

	@Override
	public CipeDAO getCipeDAO() {
		return (CipeDAO) this.instanciarDAO(CipeHibernateDAO.class);
	}

	@Override
	public NicDAO getNicDAO() {
		return (NicDAO) this.instanciarDAO(NicHibernateDAO.class);
	}

	@Override
	public NocDAO getNocDAO() {
		return (NocDAO) this.instanciarDAO(NocHibernateDAO.class);
	}

	@Override
	public DiagnosticoDAO getDiagnosticoDAO() {
		return (DiagnosticoDAO) this.instanciarDAO(DiagnosticoHibernateDAO.class);
	}

	@Override
	public IntervencoesDAO getIntervencoesDAO() {
		return (IntervencoesDAO) this.instanciarDAO(IntervencoesHibernateDAO.class);
	}

	@Override
	public ResultadosDAO getResultadosDAO() {
		return (ResultadosDAO) this.instanciarDAO(ResultadosHibernateDAO.class);
	}

	@Override
	public AltaDAO getAltaDAO() {
		return (AltaDAO) this.instanciarDAO(AltaHibernateDAO.class);
	}

	@Override
	public AdendoDAO getAdendoDAO() {
		return (AdendoDAO) this.instanciarDAO(AdendoHibernateDAO.class);
	}

	@Override
	public AvaliacaoProfessorDAO getAvaliacaoProfessorDAO() {
		return (AvaliacaoProfessorDAO) this.instanciarDAO(AvaliacaoProfessorHibernateDAO.class);
	}
	
	@Override
	public ErroDAO getErroDAO() {
		return (ErroDAO) this.instanciarDAO(ErroHibernateDAO.class);
	}
		
}
