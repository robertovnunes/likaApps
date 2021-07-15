package dados.hibernate;

import org.hibernate.Session;

import dados.FabricaDAO;
import dados.basicas.ArquivoDAO;
import dados.basicas.BairroDAO;
import dados.basicas.CNESDAO;
import dados.basicas.CidadeDAO;
import dados.basicas.ConclusaoDAO;
import dados.basicas.DadosClinicosDAO;
import dados.basicas.DadosGeraisDAO;
import dados.basicas.DadosLaboratoriaisDAO;
import dados.basicas.ErroDAO;
import dados.basicas.LogradouroDAO;
import dados.basicas.NotificacaoInvestigativaDAO;
import dados.basicas.PacienteDAO;
import dados.basicas.PaisDAO;
import dados.basicas.ResidenciaDAO;
import dados.basicas.UFDAO;
import dados.basicas.UsuarioDAO;
import dados.hibernate.conteudo.ArquivoHibernateDAO;
import dados.hibernate.conteudo.BairroHibernateDAO;
import dados.hibernate.conteudo.CNESHibernateDAO;
import dados.hibernate.conteudo.CidadeHibernateDAO;
import dados.hibernate.conteudo.ConclusaoHibernateDAO;
import dados.hibernate.conteudo.DadosClinicosComplicacoesHibernateDAO;
import dados.hibernate.conteudo.DadosGeraisHibernateDAO;
import dados.hibernate.conteudo.DadosLaboratoriaisHibernateDAO;
import dados.hibernate.conteudo.ErroHibernateDAO;
import dados.hibernate.conteudo.LogradouroHibernateDAO;
import dados.hibernate.conteudo.NotificacaoInvestigativaHibernateDAO;
import dados.hibernate.conteudo.PacienteHibernateDAO;
import dados.hibernate.conteudo.PaisHibernateDAO;
import dados.hibernate.conteudo.ResidenciaHibernateDAO;
import dados.hibernate.conteudo.UFHibernateDAO;
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
            throw new RuntimeException("Não foi possível instanciar o DAO: " + daoClass, ex);
        }
	}
	
	protected Session getCurrentSession() {
        return HibernateUtil.getFabricaDeSessao().getCurrentSession();
    }
	
	@Override
	public ResidenciaDAO getEnderecoDAO() {
		return (ResidenciaDAO) this.instanciarDAO(ResidenciaHibernateDAO.class);
	}

	@Override
	public UsuarioDAO getUsuarioDAO() {
		return (UsuarioDAO) this.instanciarDAO(UsuarioHibernateDAO.class);
	}

	@Override
	public ErroDAO getErroDAO() {
		return (ErroDAO) this.instanciarDAO(ErroHibernateDAO.class);
	}
	
	@Override
	public BairroDAO getBairroDAO() {
		return (BairroDAO) this.instanciarDAO(BairroHibernateDAO.class);
	}
	
	@Override
	public CidadeDAO getCidadeDAO() {
		return (CidadeDAO) this.instanciarDAO(CidadeHibernateDAO.class);
	}
	
	@Override
	public LogradouroDAO getLogradouroDAO() {
		return (LogradouroDAO) this.instanciarDAO(LogradouroHibernateDAO.class);
	}
	
	@Override
	public PaisDAO getPaisDAO() {
		return (PaisDAO) this.instanciarDAO(PaisHibernateDAO.class);
	}
	
	@Override
	public ResidenciaDAO getResidenciaDAO() {
		return (ResidenciaDAO) this.instanciarDAO(ResidenciaHibernateDAO.class);
	}
	
	@Override
	public UFDAO getUFDAO() {
		return (UFDAO) this.instanciarDAO(UFHibernateDAO.class);
	}
	
	@Override
	public CNESDAO getCNESDAO() {
		return (CNESDAO) this.instanciarDAO(CNESHibernateDAO.class);
	}

	@Override
	public ArquivoDAO getArquivoDAO() {
		return (ArquivoDAO) this.instanciarDAO(ArquivoHibernateDAO.class);

	}

	@Override
	public NotificacaoInvestigativaDAO getNotificacaoInvestigativaDAO() {
		return (NotificacaoInvestigativaDAO) this.instanciarDAO(NotificacaoInvestigativaHibernateDAO.class);
	}

	@Override
	public DadosGeraisDAO getDadosGeraisDAO() {
		return (DadosGeraisDAO) this.instanciarDAO(DadosGeraisHibernateDAO.class);
	}

	@Override
	public ConclusaoDAO getConclusaoDAO() {
		return (ConclusaoDAO) this.instanciarDAO(ConclusaoHibernateDAO.class);
	}

	@Override
	public DadosLaboratoriaisDAO getDadosLaboratoriaisDAO() {
		return (DadosLaboratoriaisHibernateDAO) this.instanciarDAO(DadosLaboratoriaisHibernateDAO.class);
	}

	@Override
	public DadosClinicosDAO getDadosClinicosDAO() {
		return (DadosClinicosDAO) this.instanciarDAO(DadosClinicosComplicacoesHibernateDAO.class);
	}

	@Override
	public PacienteDAO getPacienteDAO() {
		return (PacienteDAO) this.instanciarDAO(PacienteHibernateDAO.class);
	}
		
}
