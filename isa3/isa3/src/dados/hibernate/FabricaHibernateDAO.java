package dados.hibernate;

import org.hibernate.Session;

import dados.FabricaDAO;
import dados.basicas.AdministradorDAO;
import dados.basicas.AlunoDAO;
import dados.basicas.ArcoMaguerezDAO;
import dados.basicas.ArquivoDAO;
import dados.basicas.AvaliacaoDAO;
import dados.basicas.AvaliacaoProfessorDAO;
import dados.basicas.CursoDAO;
import dados.basicas.DiagnosticoAlunoPlanejamentoDAO;
import dados.basicas.DiagnosticosImplementacoesDAO;
import dados.basicas.DiagnosticosResultadosDAO;
import dados.basicas.EnderecoDAO;
import dados.basicas.ErroDAO;
import dados.basicas.EstudoDeCasoDAO;
import dados.basicas.HyperLinkDAO;
import dados.basicas.ImplementacaoDAO;
import dados.basicas.MatriculaCursoAlunoDAO;
import dados.basicas.NandaDAO;
import dados.basicas.NicDAO;
import dados.basicas.NocDAO;
import dados.basicas.PlanejamentoDAO;
import dados.basicas.ProfessorDAO;
import dados.basicas.ResultadosEsperadosDAO;
import dados.basicas.UsuarioDAO;
import dados.hibernate.conteudo.AdministradorHibernateDAO;
import dados.hibernate.conteudo.AlunoHibernateDAO;
import dados.hibernate.conteudo.ArcoMaguerezHibernateDAO;
import dados.hibernate.conteudo.ArquivoHibernateDAO;
import dados.hibernate.conteudo.AvaliacaoHibernateDAO;
import dados.hibernate.conteudo.AvaliacaoProfessorHibernateDAO;
import dados.hibernate.conteudo.CursoHibernateDAO;
import dados.hibernate.conteudo.DiagnosticoAlunoPlanejamentoHibernateDAO;
import dados.hibernate.conteudo.DiagnosticosImplementacoesHibernateDAO;
import dados.hibernate.conteudo.DiagnosticosResultadosHibernateDAO;
import dados.hibernate.conteudo.EnderecoHibernateDAO;
import dados.hibernate.conteudo.ErroHibernateDAO;
import dados.hibernate.conteudo.EstudoDeCasoHibernateDAO;
import dados.hibernate.conteudo.HyperLinkHibernateDAO;
import dados.hibernate.conteudo.ImplementacaoHibernateDAO;
import dados.hibernate.conteudo.MatriculaAlunoCursoHibernateDAO;
import dados.hibernate.conteudo.NandaHibernateDAO;
import dados.hibernate.conteudo.NicHibernateDAO;
import dados.hibernate.conteudo.NocHibernateDAO;
import dados.hibernate.conteudo.PlanejamentoHibernateDAO;
import dados.hibernate.conteudo.ProfessorHibernateDAO;
import dados.hibernate.conteudo.ResultadosEsperadosHibernateDAO;
import dados.hibernate.conteudo.UsuarioHibernateDAO;

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
            throw new RuntimeException("N�o foi poss�vel instanciar o DAO: " + daoClass, ex);
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
	public AdministradorDAO getAdministradorDAO() {
		return (AdministradorDAO) this.instanciarDAO(AdministradorHibernateDAO.class);
	}
	
	@Override
	public ProfessorDAO getProfessorDAO() {
		return (ProfessorDAO) this.instanciarDAO(ProfessorHibernateDAO.class);
	}
	
	@Override
	public UsuarioDAO getUsuarioDAO() {
		return (UsuarioDAO) this.instanciarDAO(UsuarioHibernateDAO.class);
	}
	
	@Override
	public CursoDAO getCursoDAO() {
		return (CursoDAO) this.instanciarDAO(CursoHibernateDAO.class);
	}

	@Override
	public ErroDAO getErroDAO() {
		return (ErroDAO) this.instanciarDAO(ErroHibernateDAO.class);
	}

	@Override
	public MatriculaCursoAlunoDAO getMatriculaCursoAlunoDAO() {
		return (MatriculaCursoAlunoDAO) this.instanciarDAO(MatriculaAlunoCursoHibernateDAO.class);
	}

	@Override
	public ArquivoDAO getArquivoDAO() {
		return (ArquivoDAO) this.instanciarDAO(ArquivoHibernateDAO.class);
	}

	@Override
	public EstudoDeCasoDAO getEstudoDeCasoDAO() {
		return (EstudoDeCasoDAO) this.instanciarDAO(EstudoDeCasoHibernateDAO.class);
	}

	@Override
	public ArcoMaguerezDAO getArcoMaguerezDAO() {
		return (ArcoMaguerezDAO) this.instanciarDAO(ArcoMaguerezHibernateDAO.class);
	}

	@Override
	public PlanejamentoDAO getPlanejamentoDAO() {
		return (PlanejamentoDAO) this.instanciarDAO(PlanejamentoHibernateDAO.class);
	}

	@Override
	public ImplementacaoDAO getImplementacaoDAO() {
		return (ImplementacaoDAO) this.instanciarDAO(ImplementacaoHibernateDAO.class);
	}

	@Override
	public NandaDAO getNandaDAO() {
		return (NandaDAO) this.instanciarDAO(NandaHibernateDAO.class);
	}

	@Override
	public DiagnosticosImplementacoesDAO getDiagnosticosImplementacoesDAO() {
		return (DiagnosticosImplementacoesDAO) this.instanciarDAO(DiagnosticosImplementacoesHibernateDAO.class);
	}

	@Override
	public AvaliacaoDAO getAplicacaoDAO() {
		return (AvaliacaoDAO) this.instanciarDAO(AvaliacaoHibernateDAO.class);
	}

	@Override
	public ResultadosEsperadosDAO getHipotesesDeSolucaoDAO() {
		return (ResultadosEsperadosDAO) this.instanciarDAO(ResultadosEsperadosHibernateDAO.class);
	}
	
	@Override
	public AvaliacaoDAO getAvaliacaoDAO() {
		return (AvaliacaoDAO) this.instanciarDAO(AvaliacaoHibernateDAO.class);
	}
	
	@Override
	public AvaliacaoProfessorDAO getAvaliacaoProfessorDAO() {
		return (AvaliacaoProfessorDAO) this.instanciarDAO(AvaliacaoProfessorHibernateDAO.class);
	}

	@Override
	public ResultadosEsperadosDAO getResultadosEsperadosDAO() {
		return (ResultadosEsperadosDAO) this.instanciarDAO(ResultadosEsperadosHibernateDAO.class);
	}

	@Override
	public DiagnosticoAlunoPlanejamentoDAO getDiagnosticoAlunoPlanejamentoDAO() {
		return (DiagnosticoAlunoPlanejamentoDAO) this.instanciarDAO(DiagnosticoAlunoPlanejamentoHibernateDAO.class);
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
	public DiagnosticosResultadosDAO getDiagnosticosResultadosDAO() {
		return (DiagnosticosResultadosDAO) this.instanciarDAO(DiagnosticosResultadosHibernateDAO.class);
	}

	@Override
	public HyperLinkDAO getHyperLinkDAO() {
		return (HyperLinkDAO) this.instanciarDAO(HyperLinkHibernateDAO.class);
	}
		
}
